#include "run.h"

void run(environment* env)
{
    while (env->status == 1)
    {
        output(env, 0);
        fetch(env);
        output(env, 1);
        decode(env);
        output(env, 2);
        execute(env);
        output(env, 3);
        memory(env);
        output(env, 4);
        writeback(env);
        output(env, 5);
        UpdatePC(env);
        output(env, 6);
    }
}

//functions

void fetch(environment* env)
{
    char curr[20] = {'\0'};
    int PC = env->PC;
    if (PC >= 0 && PC < 502)// 取指令，利用env里的PC获取并保存在curr里,可能读不到指令
        strncpy(curr, &env->memory[PC * 2], 20);
    else
        exception(env, ADR);            //读不到指令就设置异常 地址错误
    
    //instru example:   0x08d: 747700000000000000
    //Line Index               0123456789abcd

    //load icode and ifun
    int icode = ChartoInt(curr[0]);
    int ifunc = ChartoInt(curr[1]);

    if (icode > ITESTQ || icode < IHALT) // 判断icode
        exception(env, INS); // 可能是无效指令，设置异常 INS
    else
        env->curr.icode = icode;             //载入

    switch (icode)                          //根据icode判断ifunc有效性
    {                                       //可能是无效指令，设置异常 INS
    case IOPQ:
        if (ifunc > OPsMax || ifunc < 0)
            exception(env, INS);
        break;
    case IJXX:
        if (ifunc > JxxMax || ifunc < 0)
            exception(env, INS);
        break;
    case IRRMOVQ:
        if (ifunc > MovMax || ifunc < 0)
            exception(env, INS);
        break;
    default:
        if (ifunc)
            exception(env, INS);
        break;
    }

    env->curr.ifunc = ifunc;     //载入

    // load rA,rB,valC
    env->curr.rA = RNONE;
    env->curr.rB = RNONE;
    env->curr.valC = -1;
    env->curr.rawvalCA = 0;
    env->curr.rawvalCB = 0;
    env->curr.hasvalC = 0;
    switch (icode)
    {
    case IRRMOVQ:
    case IOPQ:
    case ICMPQ:
    case ITESTQ:
        env->curr.rA = ChartoInt(curr[2]);
        env->curr.rB = ChartoInt(curr[3]);
        break;
    case IIRMOVQ:
        env->curr.rB = ChartoInt(curr[3]);
        env->curr.valC = StringtoLL(&curr[4]);
        env->curr.hasvalC = 1;
        env->curr.rawvalCA = getrawvalC(&curr[4]);
        env->curr.rawvalCB = getrawvalC(&curr[12]);
        break;
    case IRMMOVQ:
    case IMRMOVQ:
        env->curr.rA = ChartoInt(curr[2]);
        env->curr.rB = ChartoInt(curr[3]);
        env->curr.valC = StringtoLL(&curr[4]);
        env->curr.hasvalC = 1;
        env->curr.rawvalCA = getrawvalC(&curr[4]);
        env->curr.rawvalCB = getrawvalC(&curr[12]);
        break;
    case IJXX:
    case ICALL:
        env->curr.valC = StringtoLL(&curr[2]);
        env->curr.hasvalC = 1;
        env->curr.rawvalCA = getrawvalC(&curr[2]);
        env->curr.rawvalCB = getrawvalC(&curr[10]);
        break;
    case IPUSHQ:
    case IPOPQ:
    case IINSQ:
    case IDECQ:
        env->curr.rA = ChartoInt(curr[2]);
        break;
    default://IHALT,INOP,IRET
        break;
    }

    //load valP
    switch (icode)
    {
    case INOP:
    case IRET:
        env->valP = env->PC + 1;
        break;
    case IRRMOVQ:
    case IOPQ:
    case IPUSHQ:
    case IPOPQ:
    case IINSQ:
    case IDECQ:
    case ICMPQ:
    case ITESTQ:
        env->valP = env->PC + 2;
        break;
    case IIRMOVQ:
    case IRMMOVQ:
    case IMRMOVQ:
        env->valP = env->PC + 10;
        break;
    case IJXX:
    case ICALL:
        env->valP = env->PC + 9;
        break;

    default:    //HALT
        break;
    }
}

void decode(environment* env)
{
    if (env->curr.rA < 0 || env->curr.rA > 15)
        exception(env, INS);
    if (env->curr.rB < 0 || env->curr.rB > 15)
        exception(env, INS);

    switch (env->curr.icode)
    {
    case IRRMOVQ:   // move RA to RB ->read RA
    case IINSQ:     //increase RA ->read RA
    case IDECQ:     //decrease RA ->read RA
        env->valA = env->regs[env->curr.rA];
        break;
    case IRMMOVQ:   //move RA to Addr(RB) ->read RA,RB
    case IOPQ:      //op RA RB ->read RA,RB
    case ICMPQ:     //cmp RA RB ->read RA,RB
    case ITESTQ:    //test RA RB ->read RA,RB
        env->valA = env->regs[env->curr.rA];
        env->valB = env->regs[env->curr.rB];
        break;
    case IMRMOVQ:   //move Addr(RB) to RA ->read RB
        env->valB = env->regs[env->curr.rB];
        break;
    case ICALL:     //call dest(R(rsp))  ->read R(rsp) to RB
        env->valB = env->regs[RRSP];
        break;
    case IRET:      //need RRSP and (RRSP + 8)
    case IPOPQ:     //pop rA ->need RRSP and (RRSP + 8)
        env->valA = env->regs[RRSP];
        env->valB = env->regs[RRSP];
        break;
    case IPUSHQ:    //push rA ->read RA, need RRSP
        env->valA = env->regs[env->curr.rA];
        env->valB = env->regs[RRSP];
        break;
    default:        //HALT,NOP,IRMOVQ,JXX
        break;
    }
}

void execute(environment* env)
{
    switch (env->curr.icode)
    {
    case IHALT:
        exception(env, HLT);
    case IRRMOVQ://CMOVXX
        if (env->curr.ifunc)
            env->Cnd = Cond(env->CC, env->curr.ifunc);
        else
            env->Cnd = true;
        env->valE = ALU(env->curr.icode, env->curr.ifunc, env->valB, env->valA);
        break;
    case IIRMOVQ:
        env->valE = ALU(env->curr.icode, env->curr.ifunc, env->valB, env->curr.valC);
        break;
    case IRMMOVQ:
    case IMRMOVQ:
        env->valE = ALU(env->curr.icode, env->curr.ifunc, env->valB, env->curr.valC);
        break;
    case IJXX:
        env->Cnd = Cond(env->CC, env->curr.ifunc);
        break;
    case IOPQ:
        switch (env->curr.ifunc)
        {
        case ALUDIVQ:
        case ALUREMQ:
        case ALUMODQ:
            if (env->valA == 0)
                exception(env, INS);
        }
        if (env->status == 1)
        {
            env->valE = ALU(env->curr.icode, env->curr.ifunc, env->valB, env->valA);
            SetCC(env);
        }
        break;
    case ICALL:
    case IPUSHQ:
    case IRET:
    case IPOPQ:
        env->valE = ALU(env->curr.icode, env->curr.ifunc, env->valB, env->valA);
        break;
    case IINSQ:
    case IDECQ:
    case ICMPQ:
    case ITESTQ:
        env->valE = ALU(env->curr.icode, env->curr.ifunc, env->valB, env->valA);
        SetCC(env);
        break;
    default: // NOP
        break;
    }
}

long long ALU(int icode, int ifunc, long long valB, long long valA)
{
    switch (icode)
    {
    case IRRMOVQ:
    case IIRMOVQ:
        return valA;
    case IRMMOVQ:
    case IMRMOVQ:
        return valB + valA;
    case ICALL:
    case IPUSHQ:
        return valB - 8;
    case IRET:
    case IPOPQ:
        return valB + 8;
    case IINSQ:
        return valA + 1;
    case IDECQ:
        return valA - 1;
    case ICMPQ:
        return valB - valA;
    case ITESTQ:
        return valB & valA;
    default: // IOPQ
        break;
    }

    switch (ifunc)
    {
    case ALUADD:
        return valB + valA;
    case ALUSUB:
        return valB - valA;
    case ALUAND:
        return valB & valA;
    case ALUXOR:
        return valB ^ valA;
    case ALUOR:
        return valB | valA;
    case ALUSHL:
        return valB << valA;
    case ALUSHR:
        return (valB >> valA) & (0xffffffffffffffff >> valA);
    case ALUSAR:
        return valB >> valA;
    case ALUMULQ:
        return valB * valA;
    case ALUDIVQ:
        return valB / valA;
    case ALUREMQ:
        return (valB - (valB / valA) * valA);
    case ALUMODQ:
        if ((valA > 0 && valB < 0) || (valA < 0 && valB > 0))
            return -(valB - (valB / valA) * valA);
        return (valB - (valB / valA) * valA);
    case ALUMINQ:
        return (valB < valA ? valB : valA);
    case ALUMAXQ:
        return (valB > valA ? valB : valA); 
    }

    return 0xbaadf00d;
}

void SetCC(environment* env)
{
    if (env->valE == 0)
        env->CC.ZF = 1;
    else
        env->CC.ZF = 0;

    if (env->valE < 0)
        env->CC.SF = 1;
    else
        env->CC.SF = 0;

    switch (env->curr.icode)
    {
    case IINSQ:
        if (env->valE < 0 && env->valA > 0)
            env->CC.OF = 1;
        return;
    case IDECQ:
        if (env->valE > 0 && env->valA < 0)
            env->CC.OF = 1;
        return;
    case ICMPQ:
        if (env->valA > 0 && env->valB < 0 && env->valE > 0)
            env->CC.OF = 1;
        if (env->valA < 0 && env->valB > 0 && env->valE < 0)
            env->CC.OF = 1;
        else
            env->CC.OF = 0;
        return;
    case ITESTQ:
        env->CC.OF = 0;
        return;
    default: // IOPQ
        break;
    }

    switch (env->curr.ifunc)
    {
    case ALUADD:
        if (env->valA > 0 && env->valB > 0 && env->valE < 0)
            env->CC.OF = 1;
        if (env->valA < 0 && env->valB < 0 && env->valE > 0)
            env->CC.OF = 1;
        else
            env->CC.OF = 0;
        break;
    case ALUSUB:
        if (env->valA > 0 && env->valB < 0 && env->valE > 0)
            env->CC.OF = 1;
        if (env->valA < 0 && env->valB > 0 && env->valE < 0)
            env->CC.OF = 1;
        else
            env->CC.OF = 0;
        break;
    default:
        env->CC.OF = 0;
        break;
    }
}

bool Cond(conditioncode CC, int ifunc)
{
    switch (ifunc)
    {
    case JMP:
        return true;
    case JLE:
        return (CC.SF ^ CC.OF) | CC.ZF;
    case JL:
        return (CC.SF ^ CC.OF);
    case JE:
        return CC.ZF;
    case JNE:
        return !CC.ZF;
    case JGE:
        return !(CC.SF ^ CC.OF);
    case JG:
        return !(CC.SF ^ CC.OF) & !CC.ZF;
    }

    return false;
}

void memory(environment* env)
{
    switch (env->curr.icode)
    {
    case IRMMOVQ:
    case IPUSHQ:
    case ICALL:
        if (env->valE < 0 || env->valE > 512)
        {
            exception(env, ADR);
            return;
        }
    }
    
    char str[16] = {'\0'};
    switch (env->curr.icode)
    {
    case IRMMOVQ:
    case IPUSHQ:
        LLtoString(str, env->valA);
        strncpy(&env->memory[2 * env->valE], str, 16);
        break;
    case IMRMOVQ:
        env->valM = StringtoLL(&env->memory[2 * env->valE]);
        break;
    case ICALL:
        LLtoString(str, env->valP);
        strncpy(&env->memory[2 * env->valE], str, 16);
        break;
    case IRET:
        env->valM = StringtoLL(&env->memory[2 * env->valA]);
        break;
    case IPOPQ:
        env->valM = StringtoLL(&env->memory[2 * env->valA]);
    default: // HALT,NOP,RRMOVQ,IRMOVQ,OPQ,JXX,INSQ,DECQ,CMPQ,TESTQ
        break;
    }
}

void writeback(environment* env)
{
    switch (env->curr.icode)
    {
    case IRRMOVQ://CMOVXX
        if (env->Cnd)
            env->regs[env->curr.rB] = env->valE;
        break;
    case IIRMOVQ:
    case IOPQ:
        env->regs[env->curr.rB] = env->valE;
        break;
    case IMRMOVQ:
        env->regs[env->curr.rA] = env->valM;
        break;
    case ICALL:
    case IRET:
        env->regs[RRSP] = env->valE;
        break;
    case IPOPQ:
        env->regs[RRSP] = env->valE;
        env->regs[env->curr.rA] = env->valM;
        break;
    case IPUSHQ:
        env->regs[RRSP] = env->valE;
        break;
    case IINSQ:
    case IDECQ:
        env->regs[env->curr.rA] = env->valE;
    default: // HALT,NOP,RMMOVQ,JXX,CMPQ,TESTQ
        break;
    }
}

void UpdatePC(environment* env)
{
    if (env->status != 1)
        return;
    switch (env->curr.icode)
    {
    case IJXX:
        if (env->Cnd)
            env->PC = env->curr.valC;
        else
            env->PC = env->valP;
        break;
    case ICALL:
        env->PC = env->curr.valC;
        break;
    case IRET:
        env->PC = env->valM;
        break;
    default:
        env->PC = env->valP;
        break;
    }
}

void output(environment* env, int phase)
{
    printf("- PC: %d\n", env->PC);
    printf("  PHASE: %d\n",phase);

    puts("  REG:");
    printf("    rax: %lld\n", env->regs[RRAX]);
    printf("    rcx: %lld\n", env->regs[RRCX]);
    printf("    rdx: %lld\n", env->regs[RRDX]);
    printf("    rbx: %lld\n", env->regs[RRBX]);
    printf("    rsp: %lld\n", env->regs[RRSP]);
    printf("    rbp: %lld\n", env->regs[RRBP]);
    printf("    rsi: %lld\n", env->regs[RRSI]);
    printf("    rdi: %lld\n", env->regs[RRDI]);
    printf("    r8: %lld\n", env->regs[RR8]);
    printf("    r9: %lld\n", env->regs[RR9]);
    printf("    r10: %lld\n", env->regs[RR10]);
    printf("    r11: %lld\n", env->regs[RR11]);
    printf("    r12: %lld\n", env->regs[RR12]);
    printf("    r13: %lld\n", env->regs[RR13]);
    printf("    r14: %lld\n", env->regs[RR14]);

    puts("  MEM:");
    for (int i = 0; i < 1024; i += 16)
    {
        long long temp = StringtoLL(&env->memory[i]);
        if (temp)
            printf("    %d: %lld\n", i / 2, temp);
    }

    puts("  CC:");
    printf("    ZF: %d\n    SF: %d\n    OF: %d\n", env->CC.ZF, env->CC.SF, env->CC.OF);

    printf("  STAT: %d\n", env->status);
    puts("  INSTRU:");
    printf("    icode: %d\n", env->curr.icode);
    printf("    ifunc: %d\n", env->curr.ifunc);
    printf("    rA: %d\n", env->curr.rA);
    printf("    rB: %d\n", env->curr.rB);
    printf("    valC: %lld\n", env->curr.valC);
    printf("    hasvalC: %d\n", env->curr.hasvalC);
    printf("    rawvalCA: %lld\n", env->curr.rawvalCA);
    printf("    rawvalCB: %lld\n", env->curr.rawvalCB);

    puts("  ENV:");
    printf("    valA: %lld\n", env->valA);
    printf("    valB: %lld\n", env->valB);
    printf("    valP: %d\n", env->valP);
    printf("    valE: %lld\n", env->valE);
    printf("    valM: %lld\n", env->valM);
    printf("    Cnd: %d\n", env->Cnd);
    
}

void exception(environment* env, int status)
{ 
    switch (status)
    {
    case HLT:
        env->status = HLT;
        break;
    case ADR: 
        env->status = ADR;
        break;
    case INS:
        env->status = INS;
        break;
    }
}