#include <iostream>
#include <cstring>
#include "toolkit.h"
#include "defines.h"
#include "structs.h"

void make_memory(char *memory);     //循环读取每一行
void getLine(std::string MemLine, char *memory);    //将一行写入memory