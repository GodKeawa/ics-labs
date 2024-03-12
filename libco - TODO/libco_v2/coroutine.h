#pragma once

#include <cassert>
#include <cstdlib>

#include "coro_ctx.h"

namespace coro {

struct coroutine;
struct coroutine_attr;

coroutine *create(func_t coro_func, void *arg, const coroutine_attr *attr = nullptr);
void release(coroutine *co);

int resume(coroutine *co, int param = 0);
int yield(int ret = 0);

struct stack_mem {
    int stack_size = 0;  // 栈的大小
    // TODO: add member variables you need
    char *s_rbp;    //栈底 = s_rsp + stack_size
    char *s_rsp;    //栈顶
    coroutine *owner_co = nullptr;    //栈的主人

    stack_mem(size_t size) : stack_size(size) {//载入stack_size
        // TODO: implement your code here
        s_rsp = (char*)malloc(stack_size);  //rsp指向低地址，正好承接malloc的地址
        s_rbp = s_rsp + stack_size;         //计算栈底，为后续获取动态栈做准备
    }

    ~stack_mem() {
        // TODO: implement your code here
        if (s_rsp)                          // 释放栈空间
        {    
            free(s_rsp);       
            s_rsp = nullptr; 
        }
    }
};

struct share_stack {
    // TODO: add member variables you need
    int count = 0;                              //共享栈数量
    int stack_size = 0;                         //共享栈大小
    stack_mem **stack_array = nullptr;          //共享栈库

    share_stack(int count, size_t stack_size) //初始化count和size
        : count(count), stack_size(stack_size) {
        // TODO: implement your code here
        stack_array = (stack_mem **)malloc(sizeof(stack_mem **));   //先给库开个地址空间
        for (int i = 0; i < count;i++)                              //给库里的每个栈开空间
            stack_array[i] = new stack_mem(stack_size);
    }

    ~share_stack() {
        // TODO: implement your code here
        delete[] stack_array;               //直接delete数组
        free(stack_array);                  //释放array
    }

    stack_mem *get_stackmem() {
        // TODO: implement your code here
        static int s_count = 0;        //简单处理，轮着提供(函数没有参数，没有外界信息)
        s_count = s_count++ % count;        
        return stack_array[s_count];
    }
};

struct coroutine {
    bool started = false;
    bool end = false;

    func_t coro_func = nullptr;
    void *arg = nullptr;

    // TODO: add member variables you need
    int idx;            //协程id
    int data;           //用来保存参数
    stack_mem *stack;   //栈

    bool isshare_stack = false;     //是否共享栈
    char* s_rsp = nullptr;          //为共享栈提供一个动态栈顶定位
	char* saved_rsp = nullptr;      //当共享栈被占用时的等效于独享栈保存
    unsigned int save_size;

    context ctx = {0};

    ~coroutine() {
        // TODO: implement your code here
        if (!isshare_stack)         //共享栈在share_stack里删
            delete stack;
        if (saved_rsp)              //删除外置保存的栈
        {                       
            free(saved_rsp);
            saved_rsp = nullptr;
        }
    }   
};

struct coroutine_attr {
    int stack_size = 2 * 1024;
    share_stack *sstack = nullptr;
};

class coroutine_env {
private:
    // TODO: add member variables you need
    int runid = -1;     //运行中协程的id
    int retid = -1;     // 要返回到的协程id
    int conums = 0;     //协程数量，用于设定idx，这次我们会把main_co压入栈
    coroutine *main_co;
    coroutine *costore[16];
public:
    // TODO: add member variables you need
    coroutine *past_owner = nullptr;         //用来保存当前环境共享栈的持有者记录
    coroutine *curr_owner = nullptr;

public:
    coroutine_env() {
        // TODO: implement your code here
        main_co = create(nullptr, nullptr, nullptr);  //main函数用独享栈
        push(main_co);
    }

    coroutine *get_coro(int idx) {
        // TODO: implement your code here
        if (idx == -2)                  //参数为-2时返回要返回到的协程
            runid = retid;              //并更新runid
        else if (idx == -1)             //参数为-1时返回运行中的协程
            return costore[conums - 1];
        coroutine *co = costore[runid]; //参数为-2时的返回
        retid = runid - 1;              //更新retid
        return co;
    }

    void pop() {
        // TODO: implement your code here
        conums--;
        costore[conums] = nullptr;
    }

    void push(coroutine *co) {
        // TODO: implement your code here
        co->idx = conums;           //给push进来的协程编号
        costore[conums] = co;       //存入栈
        runid = conums;             //每次压入栈的协程就是下一步要运行的协程（除了main）
        retid = conums - 1;         //返回上一个协程，main会导致retid = -1，但我们不会把main协程yield了
        conums++;
    }
};

}  // namespace coro
