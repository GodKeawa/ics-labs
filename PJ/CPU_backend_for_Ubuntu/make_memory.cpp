#include "make_memory.h"

//instru example:  0x08d: 747700000000000000
//                 0123456789abcd
void make_memory(char *memory)
{
    std::string MemLine;
    while (std::getline(std::cin, MemLine)) // 从stdin读数据并解析保存
    {
        if (MemLine[0] != '0' || MemLine[1] != 'x' || MemLine[5] != ':' || MemLine[6] != ' ' || MemLine[7] == ' ')          //除去非指令行
            continue;

        getLine(MemLine, memory);
    }
}

void getLine(std::string MemLine, char *memory)
{
    int addr = 0;
    addr += ChartoLL(MemLine[2]) << 8;
    addr += ChartoLL(MemLine[3]) << 4;
    addr += ChartoLL(MemLine[4]);

    int len = 0;
    while (MemLine[len + 7] != ' ')
        len++;
    
    strncpy(&(memory[addr << 1]), &MemLine.data()[7], len);
}