#include "coro.h"

namespace coro {

static coroutine_env g_coro_env;

coroutine* create(func_t func, void* args) {
    // TODO: implement your code here
    coroutine* co = new coroutine(func, args); 
    return co;
}

void release(coroutine* co) {
    // TODO: implement your code here
    delete co;
}

static void func_wrap(coroutine* co) { //协程启动入口
    if (co->coro_func) {
        co->coro_func(co->args);//调用函数
    }
    co->end = true;             //如果没有被挂起就会回到这里，让end = true
    yield(-1);                  //返回main
}

int resume(coroutine* co, int param) { 
    // TODO: implement your code here
    coroutine *main = g_coro_env.get_coro(-2);      //提取主协程（runid=-1）
    co->data = param;                                //将resunme参数保存到resume的协程的data里
                               
    if (co->started == false)                       //初次运行协程
    {
        getcontext(&co->ctx);                        //先初始化ctx
        co->started = true;                          //表示已经启动过了
        co->ctx.uc_link = &main->ctx;                //设置uc_link为main
        makecontext(&co->ctx, (void (*)(void))func_wrap, 1, co);  //makecontext并准备swap
    }
    g_coro_env.push(co); 
    swapcontext(&main->ctx, &co->ctx);               //如果是恢复运行过的协程直接swap即可，
    return main->data;                              //返回main的data（这里data都没有初始化，因为没有好的初始值）
}

int yield(int ret) {
    // TODO: implement your code here
    coroutine *C = g_coro_env.get_coro(-1);         //获取正在运行的协程指针，不改变runid
    coroutine *main = g_coro_env.get_coro(-2);      //获取main协程，并将runid改为-1
    main->data = ret;                               //保存yield参数到main的data里
    g_coro_env.pop();                               //把正在运行的协程弹出
    if (ret != -1)                                  //如果参数是-1就直接return，uc_link会返回main         
        swapcontext(&C->ctx,&main->ctx);            //如果参数正常就保存协程运行状态并返回main
    return C->data;                                 //返回挂起协程保存的参数
}

}  // namespace coro