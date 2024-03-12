.text

.globl coro_ctx_swap
coro_ctx_swap:
// TODO
//根据函数原型coro_ctx_swap(context*, context*)
//我们约定和ucontext一样，前面为保存当前context的指针，后面为要运行的context
//于是%rdi里将会保存用来保存当前context的指针，%rsi里保存要执行的协程的context

//先考虑把当前栈和寄存器进行保存
//现在的寄存器值均为当前运行中协程的寄存器值

leaq 8(%rsp), %rax       //将当前栈的实际栈顶地址保存到(借用的)%rax里,由于%rsp的指向处已经有了一个返回地址，故+8

//先提取用来保存当前上下文的context，存在%rdi里
//考虑到栈的填充是从大地址向小地址填充的，而数组的下标增大方向相反，所以我们应当倒着填充数组
//数组共14个元素，%rdi指向首地址，所以（%rdi）+14*8即为数组的底地址，将它载入到%rsp里使得栈的位置变到数组上
leaq 112(%rdi), %rsp

//然后依据我们定义的数组结构一个一个push进去就行
pushq %rax              //我们已经将%rax的地址改为当前协程栈的栈顶，所以直接regs[rsp] = %rax
pushq %rbx              //依照数组顺序依次push
pushq %rcx
pushq %rdx
                        //正如上面所说，%rax= 8（%rsp） = 实际栈顶地址，而原栈顶才保存了返回地址
pushq -8(%rax)          //把-8（%rax）放入regs[ret addr]里面
pushq %rsi
pushq %rdi
pushq %rbp
pushq %r8
pushq %r9
pushq %r12
pushq %r13
pushq %r14
pushq %r15

//考虑伪造一个上下文，让cpu感觉自己进入到了func里面
//我们构建的context存储在%rsi里面
//%rsi存储的依旧是数组的首地址，恰好就在低地址，pop时可以依次把整个数组依次pop出来

movq %rsi, %rsp  //将栈转移到数组
//根据数组的结构把数组的寄存器值一个一个pop到当前寄存器里就行
popq %r15
popq %r14
popq %r13
popq %r12
popq %r9
popq %r8
popq %rbp
popq %rdi     
popq %rsi         
popq %rax        //regs[ret addr]存到%rax里，准备ret之后跳到
popq %rdx
popq %rcx
popq %rbx
popq %rsp        //将当前栈转移到保存的栈
   
pushq %rax       //把返回地址压入栈，准备ret
xorq %rax, %rax  //将%rax清零,毕竟是借的
ret              //ret，将跳到准备运行的协程函数，此时的栈和寄存器都已经伪造好了
