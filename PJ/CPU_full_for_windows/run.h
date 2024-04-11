#include <iostream>
#include <cstring>
#include "defines.h"
#include "structs.h"
#include "toolkit.h"

void run(environment *env);     //外层循环，通过env.status判断是否结束循环

void fetch(environment *env);   //fetch阶段模拟

void decode(environment *env);  //decode阶段模拟

void execute(environment *env); //execute阶段模拟和下属函数
long long ALU(int icode, int ifunc, long long valB, long long valA);
void SetCC(environment *env);
bool Cond(conditioncode CC, int ifunc);

void memory(environment *env);  //memory阶段模拟

void writeback(environment *env);   //writeback阶段模拟

void UpdatePC(environment *env);    //updatePC阶段模拟

void output(environment *env, int phase);      //状态输出函数
void exception(environment *env, int status);   //异常处理函数
