#pragma once //编译头文件

#include <ucontext.h>

#include <cassert>

namespace coro {//namespace coro 定义

class coroutine;
using func_t = void (*)(void*);  //通用函数指针，返回值为void，参数为void*

coroutine* create(func_t func, void* args);//创建协程，参数为函数名和函数参数
void release(coroutine* co);
int resume(coroutine* co, int param = 0);
int yield(int ret = 0);

struct coroutine {
    bool started = false;           //判断协程是否已经启动
    bool end = false;               //func_wrap控制

    func_t coro_func = nullptr;     //协程所用函数
    void* args = nullptr;           //协程参数
    // TODO: add member variables you need

    int idx;                        //协程id
    char* stack = nullptr;        //栈
    int data;                       //保存参数

    ucontext_t ctx = {0};           // 协程上下文

    coroutine(func_t func, void* args) : coro_func(func), args(args) {//列表载入函数名称和args
        /* TODO */
        stack = new char[1024 * 1024];
        ctx.uc_stack.ss_sp = stack; // 初始化ucontext
        ctx.uc_stack.ss_size = 1024 * 1024;
        ctx.uc_stack.ss_flags = 0;
    }

    ~coroutine() {
        /* TODO */
        delete []stack;
    }
};

class coroutine_env {
private:
    // TODO: add member variables you need
    int runid = -1;                  //运行中的协程id,初始为main的id
    int conums = 0;                  //已有的协程数量
    coroutine* costore[16];     //存放协程的库
    coroutine* main_co;         //主协程

public:
    coroutine_env() {//构造函数提前构建好main的协程
        // TODO: implement your code here
        main_co = new coroutine(nullptr, nullptr);
        main_co->idx = -1;
        main_co->ctx.uc_link = nullptr;
    }

    coroutine* get_coro(int idx) {
        // TODO: implement your code here
        if (idx == -2)   //参数为-2时返回主协程，并将runid改为-1
        {
            runid = -1;
            return main_co;
        }
        else if (idx != -1)  //参数为某个idx时将runid改为idx并返回该idx的协程
            runid = idx;
        coroutine *co = costore[runid]; //参数为-1时返回运行中的协程
        return co;
    }

    void push(coroutine* co) {
        // TODO: implement your code here
        co->idx = conums;
        runid = conums;
        costore[conums] = co;
        conums++;
    }

    void pop() {
        // TODO: implement your code here
        conums--;
        costore[conums] = nullptr;
        }
};

}  // namespace coro