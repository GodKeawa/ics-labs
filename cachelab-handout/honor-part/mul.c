/*
 * mul.c - Matrix multiply C = A * B
 *
 * Each multiply function must have a prototype of the form:
 * void mul(int M, int N, int A[N][M], int B[M][N], int C[N][N]);
 *
 * A multiply function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"

int is_mul(int M, int N, int A[N][M], int B[M][N], int C[N][N]);

/*
 * multiply_submit - This is the solution multiply function that you
 *     will be graded on for Part B of the assignmNt. Do not change
 *     the description string "multiply submission", as the driver
 *     searches for that string to idNtify the multiply function to
 *     be graded.
 */

char mul_submit_desc[] = "multiply submission";
void mul_submit(int M, int N, int A[N][M], int B[M][N], int C[N][N])
{
    int a[8];           //A分块行暂存
    int c[8] = {0};     //C分块行暂存

    for (int i = 0; i < N; i++)     //初始化C
        for (int j = 0; j < N; j++)
            C[i][j] = 0;
    
    for (int column = 0; column < N; column += 8)   //B矩阵列分块遍历
    {
        for (int row = 0; row < N; row += 8)        //B矩阵行分块遍历
        {
            //用column和row定位一个B分块
            for (int i = 0; i < N; i++)             //列遍历->这是对A和C的列遍历，因为我们一次读一行(8个)
            {
                for (int k = row; k < row + 8; k++) 
                {
                    a[k - row] = A[i][k];           //定位A分块并载入一行
                }
                for (int j = column; j < column + 8; j++)
                {
                    c[j - column] = C[i][j];        //定位C分块并载入一行原始值
                }
                for (int j = column; j < column + 8; j++)   //遍历每一个c暂存并确定B分块的行序号
                {
                    for (int k = row; k < row + 8; k++)     //定位B分块的单列并遍历单列和对应a暂存的相乘
                    {
                        c[j - column] += a[k - row] * B[k][j];  //加上得到的值
                    }
                }
                for (int j = column; j < column + 8; j++)
                {
                    C[i][j] = c[j - column];        //定位C并写入一行
                }
            }
        }
    }
}

/*
 * mul - A simple multiply function, not optimized for the cache.
 */
char mul_desc[] = "multiply submission";
void mul(int M, int N, int A[N][M], int B[M][N], int C[N][N])
{
    int i, j, k, tmp;
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            tmp = 0;
            for (k = 0; k < M; k++)
            {
                tmp += A[i][k] * B[k][j];
            }
            C[i][j] = tmp;
        }
    }
}

char mymul_desc[] = "mul";

char test1_desc[] = "test1";
void test1(int M, int N, int A[N][M], int B[M][N], int C[N][N])
{
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            C[i][j] = 0;
    for (int i = 0; i < M; i++) // 简单换个顺序
        for (int k = 0; k < M; k++)
            for (int j = 0; j < N; j++)
                C[i][j] += A[i][k] * B[k][j];
}

char test2_desc[] = "test2";
void test2(int M, int N, int A[N][M], int B[M][N], int C[N][N])
{
    int a[8] = {0};             //保存A
    int c[8] = {0};             //保存C
    for (int t = 0; t < N; t++) //每一行
    {
        for (int s = 0; s < N; s += 8)  //共4列
        {
            for (int r = 0; r < N; r += 8)  //行列分块
            {
                for (int i = 0; i < 8; i++) //保存A的分块的一行
                    a[i] = A[t][i + r];
                for (int j = 0; j < 8; j++) //与B相乘加到C的暂存区里
                    for (int k = 0; k < 8; k++)
                        c[k] += a[j] * B[j + r][k + s];
            }
            for (int l = 0; l < 8; l++) //载入到C里
            {
                C[t][l + s] = c[l];
                c[l] = 0;
            }
        }
    }
}

char bijk_desc[] = "bijk";
void bijk(int M, int N, int A[N][M], int B[M][N], int C[N][N]) {
  int i, j, k, kk, jj;
  int sum;

  for (i = 0; i < N; i++)
    for (j = 0; j < N; j++)
      C[i][j] = 0;

  for (kk = 0; kk < N; kk += 8) {
    for (jj = 0; jj < N; jj += 8) {
      for (i = 0; i < N; i++) {
        for (j = jj; j < jj + 8; j++) {
          sum = C[i][j];
          for (k = kk; k < kk + 8; k++) {
            sum += A[i][k] * B[k][j];
          }
          C[i][j] = sum;
        }
      }
    }
  }
}

/*
 * registerFunctions - This function registers your multiply
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experimNt with differNt
 *     multiply strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerMulFunction(mul_submit, mul_submit_desc);

    /* Register any additional multiply functions */
    // registerMulFunction(mul, mul_desc);
    registerMulFunction(mul, mymul_desc);
    registerMulFunction(test1, test1_desc);
    registerMulFunction(test2, test2_desc);
    registerMulFunction(bijk, bijk_desc);
}

/*
 * is_multiply - This helper function checks if C is the multiply of
 *     A and B. You can check the correctness of your multiply by calling
 *     it before returning from the multiply function.
 */
int is_mul(int M, int N, int A[N][M], int B[M][N], int C[N][N])
{
    int i, j, k;
    int num = 0;
    for (i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            num = 0;
            for (k = 0; k < M; k++)
            {
                num += A[i][k] * B[k][j];
            }
            if (num != C[i][j])
            {
                return 0;
            }
        }
    }
    return 1;
}
