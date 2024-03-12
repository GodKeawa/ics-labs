/* 
 * CS:APP Data Lab 
 * 
 * <彭堃-22307110109  godke>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting if the shift amount
     is less than 0 or greater than 31.


EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implement floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants. You can use any arithmetic,
logical, or comparison operations on int or unsigned data.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operations (integer, logical,
     or comparison) that you are allowed to use for your implementation
     of the function.  The max operator count is checked by dlc.
     Note that assignment ('=') is not counted; you may use as many of
     these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
#include "bits.h"

//P1
/* 
 * tconst - return a constant value 0xFFFFFFE0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 2
 *   Rating: 1
 */
int tconst(void) {
  /*明显应当先忽略最后的0，取0xfffffffe,在二进制中为前面全是1，最后一个0，
  即1的反码，最后左移4位得到最后的0*/
  return ~1 << 4;
}

//P2
/* 
 * bitNand - return ~(x&y) using only ~ and | 
 *   Example: bitNand(4, 5) = -5, bitNand(3, 11) = -4
 *   Legal ops: ~ |
 *   Max ops: 6
 *   Rating: 2
 */
int bitNand(int x, int y) {
  /*先取与运算再取反码可以得到运算列表[1 1 -> 0,0 0 -> 1,1 0 -> 1,0 1 -> 1]，
  可用的或运算为[1 1 -> 1,0 0 -> 0,1 0 -> 1,0 1 -> 1]，
  只需改变两输入相同时的结果，故应将两数同时取反*/
  return ~x | ~y;
}

//P3
/*
 * ezOverflow - determine if the addition of two signed positive numbers overflows,
 *      and return 1 if overflowing happens and 0 otherwise
 *   You can assume 0 <= x, 0 <= y
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int ezOverflow(int x,int y) {
  /*由于x,y为正数，溢出后首位符号位由0变为1，我希望能仅凭符号位得到输出，故使用右移位，
  但右移位运算补充的是符号位，只能归于-1和0，考虑到直接加1并取反会出现溢出，故取0的反码，即全是1并与结果进行异或运算，
  当符号位为1时得到0，并通过移位得到0，再逻辑取反*/
  return !(~0 ^ (x + y) >> 31);
}

//P4
/* 
 * fastModulo - return x%(2^y)
 *   You can assume 0 <= x, 1 <= y <= 31
 *   Example: fastModulo(0x1234567,0xA) = 0x167
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 3
 */
int fastModulo(int x,int y) {
  /*2^y的特征是仅第y+1位为1，故x%(2^y)后剩下x的前y位，考虑前y位保持，后所以位化为0，
  可考虑构造一个数，前y位为1，其他全为0，取&即可，易构造数((1<<y)+~0)*/
  return x & ((1 << y) + ~0);
}

//P5
/*
 * findDifference - return a mask that marks the different bits of y compared to x
 *   Example: findDifference(12, 10) = findDifference(10, 12) = 6
 *   Legal ops: ~ & |
 *   Max ops: 9
 *   Rating: 3
 */
int findDifference(int x,int y) {
  /*找不同的逻辑类似于异或算法，需要让两个输入相同时得到0，不同时得到1，
  容易发现两数不同或相同时，两数取&和|的结果总是不同，相同时是1，1，不同时是0，1，
  对取&的结果逻辑取反，得到0，1和1，1，再取&*/
  return ~(x & y) & (x | y);
}

//P6
/*
 * absVal - return the absolute value of x
 *   Examples: absVal(-10) = 10
 *			   absVal(5) = 5
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 4
 */
int absVal(int x) {
  /*输出绝对值要求负数要取反加1，而正数不能被改变，关键在于一条函数中正负数的差异化处理，
  优先考虑正负数的特征位，取x>>31即可分别得到0与-1，又已知取反操作可以等效于和-1取异或，恰好和0取异或不改变值，
  最后考虑到负数需要加1，而正数不可加1，仍需利用x>>31,采用取反加逻辑取反即可得到方案
  如果0x80000000也要取绝对值的话感觉也不是不行，但是这个解已经6个ops了，多设一个变量也大差不差，估计不好解决*/
  return (x ^ (x >> 31)) + !~(x >> 31);
}

//P7
/*
 * secondLowBit - return a mask that marks the position of the second least significant 1 bit.
 *   Examples: secondLowBit(0x00000110) = 0x00000100
 *			       secondLowBit(0xFEDC1A80) = 0x00000200
 *             secondLowBit(0)  = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 4
 */
int secondLowBit(int x) {
  /*考虑到需求是寻找1的位置，在仅使用位运算时，显然需要使其产生变化再通过比较取出，直接加到它变化明显不可取，
  可以先将x取反码，问题转化为寻找0的位置，可以发现加1就会使第一个0变为1，取二者的异或结果即可得到从第一个1处开始均为1的一个数，
  再取二者的|运算即可消去第一个1的影响，回退一位防溢出，再做一次操作即可得到从第二个1处开始均为1的一个数，加1即可*/
  //重复使用变量较多，考虑多步进行
  int ret,y;

  y = ~x;                 //找1变找0
  ret = (y + 1) ^ y;      //生成一个反映第一个1的位置的序列
  y = y | ret;            //消除第一个0（1）
  
  y = y>>1;               //这一步很重要，防止y+1溢出，且第一个1被抹去过了，右移一位不会影响到第二个1
  
  ret = (y + 1) ^ y;      //同理
  ret = ret + 1;          //由于之前右移了1位，这里进一位刚刚好
  
  return (ret);
}

//P8
/*
 * byteSwap - swaps the nth byte and the mth byte
 *  Examples: byteSwap(0x12345678, 1, 3) = 0x56341278
 *            byteSwap(0xDEADBEEF, 0, 2) = 0xDEEFBEAD
 *  You may assume that 0 <= n <= 3, 0 <= m <= 3
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 20
 *  Rating: 5
 */
int byteSwap(int x, int n, int m) {
  /*通过位运算实现位置交换必然要使用移位操作，但是正负数右移位后产生的数不同（0和1），
  这是十分令人厌恶的，所以应当单独取出要交换的byte作为信息，故考虑移位并用255（0xff）处理
  得到单一byte的信息后即可通过异或消去原码中的byte并通过或运算补上需求的byte*/
  int byter,singlebytem,singlebyten,n_move,m_move;
  byter = 255;            //用来取出单独的byte
  
  n_move = n << 3;        //左移3位就是乘8，即移动n个byte
  m_move = m << 3;
  
  singlebyten = (x >> n_move) & byter;  //把要交换的byte取出
  singlebytem = (x >> m_move) & byter;
  
  x = x ^ (singlebyten << n_move);      //消去原byte
  x = x ^ (singlebytem << m_move);
  
  x = x | (singlebyten << m_move);      //补上应有的byte
  x = x | (singlebytem << n_move);
  
  return x;
}

//P9
/* 
 * byteCheck - Returns the number of bytes that are not equal to 0
 *   Examples: byteCheck(0xFE0A4100) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 5
 */
int byteCheck(int x) {
  /*判断有几个bytes不等于0等价于判断有几个bytes为0，一个int中仅有4个byte，同P8考虑取出每个byte并判断，
  对于单个byte，其实取两次!就可以得到结果*/
  int ret,singlebyte3,singlebyte2,singlebyte1,singlebyte0;

  singlebyte3 = (x >> 24) << 24; //这里用了新的取byte方法，其实不如P8的方法，貌似是两道题隔了一天，脑子卡住了
  x = x ^ singlebyte3;
  singlebyte2 = (x >> 16) << 16;
  x = x ^ singlebyte2;
  singlebyte1 = (x >> 8) << 8;
  singlebyte0 = x ^ singlebyte1;

  ret = !(!singlebyte3) + !(!singlebyte2) + !(!singlebyte1) + !(!singlebyte0);

  return ret;
}

//P10
/* 
 * fractions - return floor(x*7/16), for 0 <= x <= (1 << 28), x is an integer 
 *   Example: fractions(20) = 8
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 5
 */
int fractions(int x) {
  /*位运算的乘除法可以通过移位实现，但是只能乘或除2的倍数，故考虑将7拆解为4+2+1，移位相加后再移位实现除以16，
  移位进行的除法恰好是向下取整,给出的x范围可以保证先乘不溢出*/
  return ((x << 2) + (x << 1) + x) >> 4;
}

//P11
/* 
 * biggerOrEqual - if x >= y  then return 1, else return 0 
 *   Example: biggerOrEqual(4,5) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 6
 */
int biggerOrEqual(int x, int y) {
  /*比较大小的第一想法自然是相减，即化为x-y>=0,不妨假设x-y=t,显然t>=0时符号位为0，输出1，t<0时符号位为1，输出0，
  通过变换容易解决,其中-y可以变为~y+1,又考虑到换为相减有溢出的风险，故应当引入x,y的特征进行矫正
  使用chara进行处理，ret1和ret2由chara控制，使得只有其中一个可能为1*/
  int xyminus,chara,ret,ret1,ret2;

  xyminus = !((x + ~y + 1) >> 31);        //xy相减的特征
  chara = (x >> 31) ^ (y >> 31);          //xy正负性的特征，同号为0，异号为-1（0xffffffff）
  
  ret1 = (chara & (x >> 31)) ^ chara;     //ret1控制溢出时的输出，x,y异号时有溢出风险,x正则ret1=1，x负则为0，xy同号不会溢出，总为0
  ret1 = !(!ret1);
  
  ret2 = (!chara) & xyminus;              //ret2控制相减的特征，只有二者同号即不溢出时才有输出，大于为1，小于为0
  
  ret = ret1 + ret2;                      //ret = ret1 + ret2 在通过分类分析后可以得出正确性
  
  return ret;
}


//P12
/*
 * hdOverflow - determine if the addition of two signed 32-bit integers overflows,
 *      and return 1 if overflowing happens and 0 otherwise
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 6
 */
int hdOverflow(int x,int y) {
  /*不过是多了一个负数相加溢出，这一条的处理在P11就已经有了基本处理思路，同样使用chara进行分类，
  显然只有两负或两正才可能溢出，通过溢出后的符号位特征进行处理即可解决*/
  int ans,chara,x_,y_,ans_,xandy,ret;
  ans = x + y;
  
  x_ = x >> 31;
  y_ = y >> 31;
  ans_ = ans >> 31;
  
  chara = !(x_ ^ y_);  
  xandy = x_ & y_;
  
  ret = (xandy ^ ans_) & chara; //等价于P11的方法，这样说P11被我写得比P12还难
  
  ret = !(!ret);

  return ret;
}

//P13
/* 
 * overflowCalc - given binary representations of three 32-bit positive numbers and add them together, 
 *      return the binary representation of the part where bits are higher than 32.
 *   Examples: overflowCalc(0xffffffff,0xffffffff,0xffffffff) = 2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 30
 *   Rating: 7
 */
int overflowCalc(int x, int y, int z) {
  /*要把溢出的部分保存并表示出来，必然要让溢出在后几个byte以相同的方式发生，很容易想到把最前面的（第1个）byte取出来，放在后面加，
  同时将后3个byte的溢出部分加进去，再取出溢出部分就行(同样使用255取出第一个byte)*/
  int singlebyte_x,singlebyte_y,singlebyte_z,backbyte_x,backbyte_y,backbyte_z,ret;

  singlebyte_x = (x >> 24) & 255;             //取出第一个byte
  backbyte_x = x ^ (singlebyte_x << 24);      //消去第一个byte
  singlebyte_y = (y >> 24) & 255;             //x,y,z同理
  backbyte_y = y ^ (singlebyte_y << 24);
  singlebyte_z = (z >> 24) & 255;
  backbyte_z = z ^ (singlebyte_z << 24);

  ret = (backbyte_x + backbyte_y + backbyte_z) >> 24; //取出溢出到第一个byte的数

  ret = (ret + singlebyte_x + singlebyte_y + singlebyte_z) >> 8; //取出溢出

  return ret;
}

//P14
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 8
 */
int logicalShift(int x, int n) {
  /*主要难点在于要让移位后的补充位为0，可以考虑如何将前n位变为0,参照前面的方法考虑使用01111111...111,
  需求得到任意个0，应当考虑使用10000...000的反码，与x>>n取与运算即可*/
  int helper, ret;

  helper = 1 << 31;                 //构造需求的序列
  helper = ~((helper >> n)<<1);

  ret = (x >> n) & helper;          //直接删掉前面的n个1

  return ret;                       //这个居然max ops：20
}

//P15
/* 
 * partialFill - given l, h, fill all even digits within the [l, h] interval with 1 (subscripts starting from 0)
 *   Can assume that 0 <= l <= 15, 16 <= h <= 31
 *   Examples: partialFill(13,16) = 0x00014000
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 8
 */
int partialFill(int l, int h) {
  /*填充数字明显很难通过简单的位运算实现，不妨更改思路为保留一定区间内的数字，首先构造原始码（0101）*8，
  可用01010101（85）为开端，通过移位构造原始码，
  对于区间筛选，我依旧希望得到一段仅[l,h]区间内为1，其他为0的辅助码，可以通过将1或2移位减一的方法得到从l或h位开始为1的码，
  二者取异或即可得到目标码，其与原始码取与运算即可得到结果*/
  int l_line, h_line, helpline,line85,line,ret;
  
  l_line = (1 << l) + ~0;       //构造辅助码 ：仅[l,h]区间内为1
  h_line = (2 << h) + ~0;
  helpline = l_line ^ h_line;
  
  line85 = 85;                  //构造辅助码：偶数位为1
  line = line85 | (line85 << 8);
  line = line | (line << 16);
  
  ret = line & helpline;
  
  return ret;
}

//P16
/* 
 * float_abs - Return bit-level equivalent of expression |f| (absolute value of f) for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 20
 *   Rating: 3
 */
unsigned float_abs(unsigned uf) {
  /*根据IEEE floating-point representation，浮点数的正负由符号位直接控制，故在不处理NaN时只要反转符号位即可，
  而NaN的特征是exp位均为1，frac位不等于0，可以尝试直接判定NaN，
  由于此处的小数实际上用unsigned int表示，故考虑构造unsigned int 0b0111111110000000000000000000000000，
  将之与uf取与运算来获得exp段的特征，再使用unsigned int 0b000000000111111111111111111111111来获取frac段的特征
  最后取绝对值只要将首位稳定变成0即可*/
  if ((uf & 0x7f800000) > 0x7f700000 && (uf & 0x007fffff) > 0)  //直接判断是否为NaN
  {
    return uf;
  }else{
    return (uf & 0x7fffffff);                                  //负数直接删掉符号位,对正数没效果
  }
}                                                              //这个居然也max ops：20

//P17
/* 
 * float_cmp - Return 1 if uf1 > uf2, and 0 otherwise.
 *   Both of the arguments are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When any of the arguments is NaN, return 0.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 40
 *   Rating: 5
 */
unsigned float_cmp(unsigned uf1, unsigned uf2) {
  /*先检测是否为NaN，再比分类大小即可,只考虑输出1的情况*/
  int expuf1, expuf2, fracuf1, fracuf2, stateuf1, stateuf2,bigger,smaller;
  unsigned int signuf1, signuf2;

  expuf1 = uf1 & 0x7f800000;      //全取出来了                        
  expuf2 = uf2 & 0x7f800000;
  fracuf1 = uf1 & 0x007fffff;
  fracuf2 = uf2 & 0x007fffff;
  signuf1 = uf1 & 0x80000000;
  signuf2 = uf2 & 0x80000000;
  
  stateuf1 = expuf1 > 0x7f700000 && fracuf1 > 0;  //判断NaN，同P16
  stateuf2 = expuf2 > 0x7f700000 && fracuf2 > 0;

  
  bigger = (expuf1 > expuf2) || (expuf1 == expuf2 && fracuf1 > fracuf2);    //判断大小，逻辑很简单
  smaller = (expuf1 < expuf2) || (expuf1 == expuf2 && fracuf1 < fracuf2);

  if (stateuf1 || stateuf2 || (uf1 == uf2))    //NaN，顺便解决相等
    return 0;
  else                                        //下面的分类嵌套有点头大，而且超时了，在我这12s才能过，算是能用
  {
    if (signuf1 == 0)
    {
      if (signuf2 == 0)
      {
        if (bigger) //分类1：均为正数
          return 1;
      }
      else//signuf2 !=0
      {
          if ((uf1<<1) || (uf2 <<1)) //分类2：uf1为正，uf2为负，只有二者均为0时会输出0
            return 1;
      }
    }
    else//signuf1 != 0
    {
    if (signuf2 != 0)
    {
      if (smaller) //分类3：均为负数
        return 1;
    }
    }
  }
  return 0; //其余均输出0
}

//P18
/* 
 * float_pow2 - Return bit-level equivalent of expression f*(2^n) for
 *   floating point argument f and integer argument n.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   You can assume 0 <= n <= 255
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 50
 *   Rating: 6
 */
unsigned float_pow2(unsigned uf,int n) {
  /*考虑到IEEE floating-point representation中有多个case且一定情况下会产生case间的转换，故考虑对exp部分进行分类，
  首先排除输出原值的情况，
  考虑exp==0，这时frac就是小数位，但乘2达到最大值后会溢出一个1，这个1恰好可以作为exp部分的第一个1，之后便转为exp！=0的情况
  exp！=0时乘2只加大exp本身，exp达到11111111后转为case3，乘二将失去意义,返回正负无穷即可(这个要看一看每行的注释)*/

  unsigned int exp,noexp,frac,nofrac,sign,ret;

  exp = uf & 0x7f800000;
  frac = uf & 0x007fffff;
  nofrac = uf ^ frac;
  
  //排除输出原值
  if (uf == 0 || uf == 0x80000000 || exp == 0x7f800000 || n == 0 || ((uf & 0x7f800000) > 0x7f700000 && (uf & 0x007fffff) > 0))
    return uf;  
  
  //处理exp=0
  if (exp == 0x0)            //先想办法把exp=0的情况处理了
  {
    while (!(frac>>23) && n)  //要么溢出一个1，要么n归0停止
    {
      frac = frac << 1;       //乘2然后n-1
      n--;
    }
    uf = nofrac | frac;       //更新等价的uf和特征量
    exp = uf & 0x7f800000;
    frac = frac ^ exp;
    nofrac = uf ^ frac;     
  }
  
  noexp = uf ^ exp;           //取出要用的特征量
  sign = nofrac ^ exp;
  
  //处理exp !=0，同时保证对exp=0不产生作用
  if (((exp >>23) + n) >= 255) //大到达到无穷的情况
  {
    exp = 0x7f800000;
    ret = sign | exp;
  }
  else
  {
    exp = exp + (n << 23);    //接下来的n只作用在exp上，如果之前n就归0了也没有影响
    ret = noexp | exp;
  }
  
  return ret;

}

//P19
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 40
 *   Rating: 7
 */
unsigned float_i2f(int x) {
  /*将整数x转化为float后可能出现精度损失，但无论如何总是保存最前面的有效位并控制进位（控制进位是关键）来填充frac，
  可以发现int转化后的数总是适用于M = 1+frac的情况（产生特例0），故考虑先取出exp，再取出frac，均使用while进行，
  对于x为负数的情况直接将其转化为正数（产生特例0x80000000）,对于frac等于0的情况加以调控（可恶的0x800000）
  这个也要看一看每行的注释*/
  unsigned int sign, exp, frac, ux, ux_copy,flag1,flag2,overnum,round,ret;
  int overflow;
  sign = 0x0;            //默认符号为正
  exp = 0x3f800000;      //bias
  overflow = -23;        //frac的最大位数
  round = 0;             //默认进位为0

  if (x == 0)            //排除特例
    return 0;
  if (x == 0x80000000)
    return 0xcf000000;

  if (x >> 31)          //负转正
  {
    sign = 0x80000000;
    x = -x; 
  }

  ux = x;               //存几个复制
  ux_copy = ux;

  while (x >> 1)        //开始移位并增加exp，同时将移位次数反映到overflow上，记录溢出的位数
  {                     //这里已经得出最终的exp
    x = x >> 1;
    exp += 0x00800000;
    overflow++;
  }

  if (ux > 0x800000)          //生成frac，超过23位的要删掉，少于23位的要移位补0
  {                           //以0x800000为界，保证大于的一定要右移，小于的可能要左移，同时让0x800000漏过去
    while (ux >= 0x1000000)
    {
      ux = ux >> 1;
    }
  }
  else
  {
    while (ux < 0x800000)   //这里又故意让0x800000漏过去，其他的正常移位
    {
      ux = ux << 1;
    }
  }

  frac = ux - 0x800000;     //删掉隐含的1，恰好让0x800000归0

  if (overflow > 0)         //overflow即溢出位数，检测是否溢出
  {
    flag2 = ux_copy & (1 << overflow);                //取出溢出位前的一位，即保留的最后一位
    overnum = ux_copy & ((1 << overflow--) - 1);      //取出溢出的数
    flag1 = 1 << overflow;                            //用来做比较
    if (overnum > flag1 || (overnum == flag1 && flag2))     //根据浮点数的进位方法得到条件
    {
      round = 1;                                            //进位改为1
    }
  }

  ret = sign + exp + frac + round;                          //全加起来
  return ret;

}

#ifdef NOT_SUPPOSED_TO_BE_DEFINED
#   __          __  _                          
#   \ \        / / | |                         
#    \ \  /\  / /__| | ___ ___  _ __ ___   ___ 
#     \ \/  \/ / _ \ |/ __/ _ \| '_ ' _ \ / _ \
#      \  /\  /  __/ | (_| (_) | | | | | |  __/
#       \/  \/ \___|_|\___\___/|_| |_| |_|\___|
#                                              

#  ██╗  ██╗ ██████╗ ███╗   ██╗ ██████╗ ██████╗     ██████╗  █████╗ ██████╗ ████████╗
#  ██║  ██║██╔═══██╗████╗  ██║██╔═══██╗██╔══██╗    ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝
#  ███████║██║   ██║██╔██╗ ██║██║   ██║██████╔╝    ██████╔╝███████║██████╔╝   ██║   
#  ██╔══██║██║   ██║██║╚██╗██║██║   ██║██╔══██╗    ██╔═══╝ ██╔══██║██╔══██╗   ██║   
#  ██║  ██║╚██████╔╝██║ ╚████║╚██████╔╝██║  ██║    ██║     ██║  ██║██║  ██║   ██║   
#  ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝    ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
#                                                                                   
#endif

//P20
/*
 * oddParity - return the odd parity bit of x, that is, 
 *      when the number of 1s in the binary representation of x is even, then the return 1, otherwise return 0.
 *   Examples:oddParity(5) = 1, oddParity(7) = 0
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 56
 *   Challenge: You will get 1 extra point if you use less than or equal to 34 ops
 *   Rating: 2
 */
int oddParity(int x) {
  /*对于奇偶判断，容易想到寻求一种运算，使得它对某个数执行一次时改变这个数的值，执行两次时不改变，
  可以发现1和0的或运算对1而言便是这样一种运算，每次取x的最前一位对1做异或，完成后x<<1,
  有奇数个1时1变为0，有偶数个1时1仍是1，但是这样需要32次取异或，效率不高，
  故考虑取一定偶数长度的1序列，将其与x的前面一段做或运算，可以发现将x的每个值与序列运算后序列的奇偶性与x相同
  假设序列长x，那么下降到序列的奇偶性需要32/x次运算，序列的奇偶性可以使用x次运算也可以继续下降到更短的序列，
  这里假设只进行一次下降，需要32/x + x次运算，不妨取x=8（恰好是255的极限）,可以得到较低的运算数*/

  int lowerx,llowerx,flag;

  lowerx = 0xff;                  //下降到8位序列
  lowerx = lowerx ^ x;
  lowerx = lowerx ^ (x >> 8);
  lowerx = lowerx ^ (x >> 16);
  lowerx = lowerx ^ (x >> 24);

  llowerx = 0x3;                  //下降到2位序列
  llowerx = llowerx ^ lowerx;
  llowerx = llowerx ^ (lowerx >> 2);
  llowerx = llowerx ^ (lowerx >> 4);
  llowerx = llowerx ^ (lowerx >> 6);

  flag = (llowerx & 0x1) ^ ((llowerx & 0x2) >> 1);      //判定

  return !flag;
}

//P21
/*
 * bitReverse - Reverse bits in an 32-bit integer
 *   Examples: bitReverse(0x80000004) = 0x20000001
 *             bitReverse(0x7FFFFFFF) = 0xFFFFFFFE
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 56
 *   Challenge: You will get 1 extra point if you use less than or equal to 34 ops
 *   Rating: 2
 */
int bitReverse(int x) {
  /*在不作ops数量限制的情况下，这是十分简单的，毕竟我们只要取出第x位再放到第（32-x）位上就行
  但在运算符受限的条件下，我希望像P21一样将问题下降到一个更短的序列中，
  容易发现整体翻转后，前后16bits数据交换了位置，所以如果我们将前后16bits先交换，
  问题就转化成了两个16bits序列的翻转问题，如此可以继续向下简化问题直到解决,
  使用固定的算法得到提取bits的辅助码并使用固定算法交换位置*/
  int half,halfx,quater,quaterx,eight,eightx,sixteen,sixteenx,final,finalx;

  //优化辅助码生成（这个想的时间更长，毕竟交换位置总是需要那么多运算符的，根本省不了）
  half = 0xff + (0xff << 8);
  quater = 0xff + (0xff << 16);
  eight = quater ^ (quater << 4);
  sixteen = eight ^ (eight << 2);
  final = sixteen ^ (sixteen << 1);

  //half = (1 << 16) + ~0;
  halfx = x & half;                               //下降到两个16位
  x = (x >> 16) + (halfx << 16);

  /*quater = half >> 8;
  quater = (quater << 16) + quater;*/
  quaterx = x & quater;                           //下降到4个8位
  x = ((x >> 8) & quater) + (quaterx << 8);

  /*eight = (quater >> 4) & quater;
  eight = (eight << 8) + eight;*/
  eightx = x & eight;                             //下降到8个4位
  x = ((x >> 4) & eight) + (eightx << 4);

  /*sixteen = (eight >> 2) & eight;
  sixteen = (sixteen << 4) + sixteen;*/
  sixteenx = x & sixteen;                         //下降到16个2位
  x = ((x >> 2) & sixteen) + (sixteenx << 2);

  /*final = (sixteen >> 1) & sixteen;
  final = (final << 2) + final;*/
  finalx = x & final;                             //finally
  x = ((x >> 1) & final) + (finalx << 1);

  return x;
}

//P22
/*
 * mod7 - calculate x mod 7 without using %.
 *   Example: mod7(99) = 1
 *            mod7(-101) = -3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 100
 *   Challenge: You will get 2 extra point if you use less than or equal to 56 ops
 *   Rating: 2
 */
int mod7(int x) {
  /*考虑取模运算结果的循环性，可以发现每3位生成一个0~6的余数，且除了7（0b111）以外余数就等于这3位的值，
  负数取模的结果等于负数的相反数取模的结果的相反数，故只要解决正数取模即可，正数共31位有效数字，
  容易进一步推导出这31位正数的余数就等于它切割成11个3位数（补2个0）的余数的和mod7（类比整数能被3整除），
  这意味着如果我们取出3的倍数位长度的值并与被取出后的数加起来得到一个新的值，这个新的值的余数与原来的数相同，
  也即我们又可以将问题下降到更小的序列中，并多次下降直到只剩3位,
  考虑能使用的int，我决定每次取出6位,取出4次，最后剩下一个7位数，全部相加后可能达到9位甚至10位，
  下一次取3位下降,在数次之后必然得到一个0~7的数字，取反后得到-1~-8，其中7,-7，-8错误,写一个算法处理7和6即可得到结果
  （每次下降的方式和次数可调）
  
  这个相当于数学层面上的一个引理，最开始是想到3的倍数的判断，也就是很长的数字能否整除3可以下降到每位数字之和
  能否整除3，在二进制里面只要是全是1的数应该都可以这样处理，像0b11，0b111，0b1111等*/

  int chara,partx,delete7,delete6,optimizer1,optimizer2;

  chara = x >> 31;              //负转正
  x = x ^ chara;

  partx = x & 0x3f;             //第一次下降
  x = partx + (x >> 6);
  partx = x & 0x3f;
  x = partx + (x >> 6);
  partx = x & 0x3f;
  x = partx + (x >> 6);
  partx = x & 0x3f;
  x = partx + (x >> 6);

  partx = x & 0x7;              //第二次下降
  x = partx + (x >> 3);
  partx = x & 0x7;
  x = partx + (x >> 3);
  partx = x & 0x7;
  x = partx + (x >> 3);

  optimizer1 = ((x & 0x4) >> 2) & ((x & 0x2) >> 1);     //优化器
  optimizer2 = x & 0x1;

  // delete7 = ((x & 0x4) >> 2) & ((x & 0x2) >> 1) & (x & 0x1);
  delete7 = optimizer1 & optimizer2;                           //删除7和6的方法基本一致，就是判断然后处理
  delete7 = delete7 + (delete7 << 1) + (delete7 << 2);
  x = x ^ delete7;

  x = x ^ chara;                                        //转回来

  //delete6 = ((x & 0x4) >> 2) & ((x & 0x2) >> 1) & !(x & 0x1) & chara;
  delete6 = optimizer1 & !optimizer2 & chara;                //原本没写& chara，debug了半天，正负数的7都要处理，6只处理负的
  delete6 = delete6 + (delete6 << 1) + (delete6 << 2);
  x = x + (0x7 & delete6);

  return x;
}
