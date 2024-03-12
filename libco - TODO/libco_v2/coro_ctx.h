#pragma once

#include <stdlib.h>

namespace coro {

using func_t = void (*)(void *);

struct context {//构建上下文结构,命名仿照ucontext                      
    // TODO: add member variables you need
    void *regs[14];     //寄存器
    size_t ss_size;      //栈大小
    char *ss_sp;        //当前栈顶位置
};

void ctx_make(context *ctx, func_t coro_func, const void *arg);

}  // namespace coro

//regs[0]: r15
//regs[1]: r14 
//regs[2]: r13 
//regs[3]: r12 
//regs[4]: r9  
//regs[5]: r8  
//regs[6]: rbp 
//regs[7]: rdi 
//regs[8]: rsi 
//regs[9]: ret addr
//regs[10]: rdx
//regs[11]: rcx
//regs[12]: rbx
//regs[13]: rsp
