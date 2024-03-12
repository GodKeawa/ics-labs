#ifndef STRUCT
#define STRUCT

struct instruction  //指令结构，由fetch函数获取
{
    int icode;
    int ifunc;
    int rA;
    int rB;
    long long valC;
};

struct conditioncode
{
    bool ZF;
    bool SF;
    bool OF;
};

struct environment
{
    char memory[1024];          //memory
    long long regs[15];         //registers
    conditioncode CC;           
    int PC;                     //程序计数器
    int status;                 //程序状态码

    instruction curr;    //当前指令和指令下的运行变量
    long long valA;
    long long valB;
    long long valE;
    long long valM;
    int valP;
    bool Cnd;
};

#endif