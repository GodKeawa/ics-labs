#include "coroutine.h"

#include <cstring>

namespace coro {

static coroutine_env g_coro_env;

extern "C" {
extern void coro_ctx_swap(context*, context*) asm("coro_ctx_swap");
};
coroutine* create(func_t coro_func, void* arg, const coroutine_attr* attr) {
    coroutine_attr at;
    if (attr != nullptr) {
        at = *attr;
    }

    // TODO: implement your code here
    coroutine *co = new coroutine;
    co->arg = arg;
    co->coro_func = coro_func;
    
    if (at.sstack)
    {
        co->isshare_stack = true;                   //设置为共享栈
        co->stack = at.sstack->get_stackmem();      
    }        
    else
        co->stack = new stack_mem(at.stack_size);   //独享栈大小将attr结构里的初值
    
    co->ctx.ss_sp = co->stack->s_rsp;               //将ctx里的指针指向栈区
    co->ctx.ss_size = co->stack->stack_size;
    return co;
}

void release(coroutine* co) {
    // TODO: implement your code here
    delete co;
}

void save_stack(coroutine* co) {//保存协程栈到另外的堆
    // TODO: implement your code here
    int len = co->stack->s_rbp - co->s_rsp;   //使用提前生成的rbp地址减去动态获得的栈顶
    if (co->saved_rsp)                        //先看一下有没有保存记录
    {
        free(co->saved_rsp);                  //有就删掉
        co->saved_rsp = nullptr;              //改成空指针，方便后期判断删除
    }
    co->saved_rsp = (char *)malloc(len);      //开空间
    co->save_size = len;                      //记录栈大小

    memcpy(co->saved_rsp, co->s_rsp, len);    //保存栈
}

void swap(coroutine* curr, coroutine* pending) {
    // TODO: implement your code here
    char dummy;                                 //获取当前协程栈顶并保存，在yield时会保存有效值
    curr->s_rsp = &dummy;   
    if (!pending->isshare_stack)                //如果将要运行的协程非共享栈，那肯定是正常保存和运行的
    {
        g_coro_env.curr_owner = nullptr;        //空置环境记录
        g_coro_env.past_owner = nullptr;
    }
    else
    {
        g_coro_env.curr_owner = pending;                    //保存环境信息——当前所有者
        coroutine *owner_co = pending->stack->owner_co;     //取出上一个栈所有者，可能没有
        pending->stack->owner_co = pending;                 //修改栈的所有者

        g_coro_env.past_owner = owner_co;                   //保存环境信息——上一个所有者
        if (owner_co && owner_co != pending)                //如果上一个所有者存在且与本次的协程不同
            save_stack(owner_co);                           //保存上一个所有者的栈   
    }
    coro_ctx_swap(&(curr->ctx), &(pending->ctx));
    
    //在上一个协程yield或再次启动某个协程时将返回到这里
    //视情况还原当前协程的栈
    
    //如果是切回独享栈函数如main，那么两个owner被设置为nullptr，不用还原，如果切回的协程仍然持有这个共享栈，那么也不用还原
    if (g_coro_env.curr_owner && g_coro_env.past_owner && g_coro_env.curr_owner != g_coro_env.past_owner)
        memcpy(g_coro_env.curr_owner->s_rsp, g_coro_env.curr_owner->saved_rsp, g_coro_env.curr_owner->save_size);
}

static void func_wrap(coroutine* co) {//熟悉的函数入口
    if (co->coro_func) {
        co->coro_func(co->arg);
    }
    co->end = true;
    yield(-1);
}

int resume(coroutine* co, int param) {
    // TODO: implement your code here
    coroutine *runC = g_coro_env.get_coro(-1);
    co->data = param;
    if (co->started == false)
    {
        co->started = true;
        ctx_make(&co->ctx, (void (*)(void*))func_wrap, (const void*)co);
    }
    g_coro_env.push(co);
    swap(runC, co);
    return runC->data;
}

int yield(int ret) {
    // TODO: implement your code here
    coroutine *runC = g_coro_env.get_coro(-1);  //获取运行中的协程
    coroutine *retC = g_coro_env.get_coro(-2);  //获取要返回到的协程，这时runid和retid已经更新完毕
    retC->data = ret;
    g_coro_env.pop();
    swap(runC, retC);

    return runC->data;
}

}  // namespace coro
