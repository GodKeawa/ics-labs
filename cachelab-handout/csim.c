#include "cachelab.h"
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "csim.h"
#include <getopt.h>

// print usage info
void usage()
{
    printf("Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n");
    printf("Options:\n");
    printf("  -h         Print this help message.\n");
    printf("  -v         Optional verbose flag.\n");
    printf("  -s <num>   Number of set index bits.\n");
    printf("  -E <num>   Number of lines per set.\n");
    printf("  -b <num>   Number of block offset bits.\n");
    printf("  -t <file>  Trace file.\n");
    printf("\n");
    printf("Examples:\n");
    printf("  linux>  ./csim -s 4 -E 1 -b 4 -t traces/yi.trace\n");
    printf("  linux>  ./csim -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");
    exit(1);
}

// parse command line and get the parameters
void parseline(int argc, char **argv)
{
    int opt;
    int num = 0;
    while ((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1)
    {
        switch (opt)
        {
        case 'h': // help
            usage();
            break;
        case 'v': // whether verbose
            verbose = 1;
            break;
        case 's': // set
            num = atoi(optarg);
            if (num == 0 && optarg[0] != '0')
            {
                printf("./csim: Missing required command line argument\n");
                usage();
            }
            numSet = num; // numset saved  set
            break;
        case 'E': // cache line 数
            num = atoi(optarg);
            if (num == 0 && optarg[0] != '0')
            {
                printf("./csim: Missing required command line argument\n");
                usage();
            }
            associativity = num; // associativity saved   cache line 数
            break;
        case 'b': // cache line 大小
            num = atoi(optarg);
            if (num == 0 && optarg[0] != '0')
            {
                printf("./csim: Missing required command line argument\n");
                usage();
            }
            blockSize = num; // blockSize saved cache line 大小
            break;
        case 't':                     // file path
            strcpy(filePath, optarg); // filePath saved
            break;
        case ':': // others
            printf("./csim: Missing required command line argument\n");
            usage();
            break;
        case '?':
            usage();
            break;
        default:
            printf("getopt error");
            exit(1);
            break;
        }
    }
}

typedef struct cache_line   
{
    int valid; // 有效位
    int tag;   // 标记位
    int time;  // 访问时间
} Cache_line;

Cache_line **cache = NULL;

int main(int argc, char *argv[])
{
    parseline(argc, argv); //初始化数值
    Simulate();
    printSummary(hits, misses, evictions);
    return 0;
}


//函数实现

void cache_init()       //初始化cache
{

    cache = (Cache_line **)malloc(8UL * numSet);
    for (int i = 0; i < numSet; i++)
    {
        cache[i] = (Cache_line *)malloc(12UL * associativity);
        for (int j = 0; j < associativity; j++)
        {
            cache[i][j].valid = 0; // 初始化
            cache[i][j].tag = -1;
            cache[i][j].time = 0;
        }
    }
}

void cache_free()       //释放内存
{
    for (int i = 0; i < numSet; i++)
        free(cache[i]);
    free(cache);
}

int get_index(int s, int tag)   //找某一组中指定tag的行
{
    for (int i = 0; i < associativity; i++)
        if (cache[s][i].valid && cache[s][i].tag == tag)
            return i;           //找到就返回index
    return -1;                  //没找到就返回-1
}

void update_time(int s, int index)
{
    for (int i = 0; i < associativity; i++) //全组加1
        cache[s][i].time++;
    cache[s][index].time = 0;               //自己置零
}

void try_eviction(int s, int tag)    //来这里就说明已经miss了
{
    int max_index = 0;
    int max_time = 0;
    for (int i = 0; i < associativity; i++)
    {
        if (!cache[s][i].valid)//看看有没有空行
        {
            cache[s][i].valid = 1;  //如果有就填充空行
            cache[s][i].tag = tag;  
            update_time(s, i);      //更新time
            return;                 //返回
        }
    }

    evictions++;            //如果没有空行就得替换，eviction
    if (verbose)
        printf(" eviction");

    for (int k = 0; k < associativity; k++) //查找最大time的index
    {
        if (max_time < cache[s][k].time)    
        {
            max_time = cache[s][k].time;
            max_index = k;
        }
    }

    cache[s][max_index].tag = tag;          //覆写最大time的行           
    update_time(s, max_index);              //更新time
}

void update_all(int s, int tag)
{
    int index = get_index(s, tag);  //先看看cache里有没有
    if (index == -1)                //if 没有
    {
        misses++;                   //miss了
        if (verbose)
            printf(" miss");
        try_eviction(s, tag);       //得看看要不要替换某一行
        return;
    }                               //if 有
    hits++;                         //hit了
    if (verbose)
        printf(" hit");      
    update_time(s, index);          //更新time
}

void get_trace()
{
    FILE *file;
    file = fopen(filePath, "r");//读取文件
    if (file == NULL)           //没读到就退出
        exit(-1);

    char operation;
    unsigned address;
    int size;
    //循环获取指令
    while (fscanf(file, " %c %x,%d", &operation, &address, &size) > 0)//恰好读不到I 
    {
        if (verbose) //输出
            printf("%c %x,%d", operation, address, size);   //size只用来输出

        //获取s，和tag
        int s = (address / blockSize) % numSet;   
        int tag = address / (numSet * blockSize);

        switch (operation)//进入update_all
        {
        case 'M':   // 一次存储一次加载
            update_all(s, tag);
            update_all(s, tag);
            break;
        case 'L':   //加载
            update_all(s, tag);
            break;
        case 'S':   //存储
            update_all(s, tag);
            break;
        }

        if (verbose) //输出
            printf("\n");
    }
    fclose(file);
}

void Simulate()
{
    cache_init();
    get_trace();
    cache_free();
}
