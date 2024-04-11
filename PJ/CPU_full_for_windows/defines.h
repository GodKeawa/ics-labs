#ifndef DEFINES
#define DEFINES

//common define
#define OPsMax 14
#define JxxMax 6
#define MovMax 6 


// register define
#define RRAX 0
#define RRCX 1
#define RRDX 2
#define RRBX 3
#define RRSP 4
#define RRBP 5
#define RRSI 6
#define RRDI 7
#define RR8 8
#define RR9 9
#define RR10 10
#define RR11 11
#define RR12 12
#define RR13 13
#define RR14 14
#define RNONE 15

// instructions define
#define IHALT 0
#define INOP 1
#define IRRMOVQ 2
#define IIRMOVQ 3
#define IRMMOVQ 4
#define IMRMOVQ 5
#define IOPQ 6
#define IJXX 7
#define ICALL 8
#define IRET 9
#define IPUSHQ 0xa
#define IPOPQ 0xb
//expand instructions
#define IINSQ 0xc
#define IDECQ 0xd
#define ICMPQ 0xe
#define ITESTQ 0xf

//status define
#define AOK 1
#define HLT 2
#define ADR 3
#define INS 4

//ops define
#define ALUADD 0
#define ALUSUB 1
#define ALUAND 2
#define ALUXOR 3
//expand ops
#define ALUOR 4
#define ALUSHL 5
#define ALUSHR 6
#define ALUSAR 7
#define ALUMULQ 8
#define ALUDIVQ 9
#define ALUREMQ 10
#define ALUMODQ 11
#define ALUMINQ 12
#define ALUMAXQ 13

//jump define/cmovq define 
#define JMP 0
#define JLE 1
#define JL 2
#define JE 3
#define JNE 4
#define JGE 5
#define JG 6

#endif
