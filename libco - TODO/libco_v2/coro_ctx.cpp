#include "coro_ctx.h"

#include <cstdint>
#include <cstring>

namespace coro {

void ctx_make(context* ctx, func_t coro_func, const void* arg) {
    // TODO: implement your code here
    char *sp = ctx->ss_sp + ctx->ss_size - 8;    //算出栈顶地址，减8预留一个指针的空间
    sp = (char*)((unsigned long)sp & -16LL);    //把sp按16字节对齐（这里就是把后4位归零了）
    memset(ctx->regs, 0, sizeof(ctx->regs));    //将寄存器数组初始化为0
    void** ret_addr = (void**)(sp);             //向sp指向的地址写入返回地址，即要运行的函数地址
    *ret_addr = (void*)coro_func;

    ctx->regs[13] = sp;                         //%rsp指向栈顶
    ctx->regs[9] = (char*)coro_func;            //存返回地址
    ctx->regs[7] = (char *)arg;                 //%rdi存第一个入参

}

}  // namespace coro
