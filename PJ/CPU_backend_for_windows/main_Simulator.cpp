#include "structs.h"
#include "make_memory.h"
#include "run.h"
#include <stdlib.h>

environment* env = nullptr;     //全局环境

int main()
{
    // prepare env
    env = (environment *)calloc(1, sizeof(environment));
    env->status = 1;
    env->CC.ZF = 1;
    
    // make memory
    memset(env->memory, '0', sizeof(env->memory));
    make_memory(env->memory);

    // run
    run(env);

    //free memory
    free(env);
    
    return 0;
}