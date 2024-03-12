/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded.
 */

char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    if (M == 48 && N == 48)
    {
        for (int i = 0; i < N; i += 12)
            for (int j = 0; j < M; j += 12)
                for (int k = i; k < i + 12; k++)
                {
                    int a_0 = A[k][j];
                    int a_1 = A[k][j + 1];
                    int a_2 = A[k][j + 2];
                    int a_3 = A[k][j + 3];
                    int a_4 = A[k][j + 4];
                    int a_5 = A[k][j + 5];
                    int a_6 = A[k][j + 6];
                    int a_7 = A[k][j + 7];
                    int a_8 = A[k][j + 8];
                    int a_9 = A[k][j + 9];
                    int a_10 = A[k][j + 10];
                    int a_11 = A[k][j + 11];
                    B[j][k] = a_0;
                    B[j + 1][k] = a_1;
                    B[j + 2][k] = a_2;
                    B[j + 3][k] = a_3;
                    B[j + 4][k] = a_4;
                    B[j + 5][k] = a_5;
                    B[j + 6][k] = a_6;
                    B[j + 7][k] = a_7;
                    B[j + 8][k] = a_8;
                    B[j + 9][k] = a_9;
                    B[j + 10][k] = a_10;
                    B[j + 11][k] = a_11;
                }
    }
    if (M == 96 && N == 96)
    {
        int a_0, a_1, a_2, a_3, a_4, a_5, a_6, a_7, a_8, a_9, a_10, a_11;
        for (int i = 0; i < N; i += 12)
        {
            for (int j = 0; j < M; j += 12)
            {
                for (int k = i; k < i + 6; k++)
                {
                    // 得到A的第1,2块
                    a_0 = A[k][j + 0];
                    a_1 = A[k][j + 1];
                    a_2 = A[k][j + 2];
                    a_3 = A[k][j + 3];
                    a_4 = A[k][j + 4];
                    a_5 = A[k][j + 5];
                    a_6 = A[k][j + 6];
                    a_7 = A[k][j + 7];
                    a_8 = A[k][j + 8];
                    a_9 = A[k][j + 9];
                    a_10 = A[k][j + 10];
                    a_11 = A[k][j + 11];
                    // 复制给B的第1,2块
                    B[j + 0][k] = a_0;
                    B[j + 1][k] = a_1;
                    B[j + 2][k] = a_2;
                    B[j + 3][k] = a_3;
                    B[j + 4][k] = a_4;
                    B[j + 5][k] = a_5;
                    B[j + 0][k + 6] = a_6;
                    B[j + 1][k + 6] = a_7;
                    B[j + 2][k + 6] = a_8;
                    B[j + 3][k + 6] = a_9;
                    B[j + 4][k + 6] = a_10;
                    B[j + 5][k + 6] = a_11;
                }
                for (int k = j; k < j + 6; k++)
                {
                    // 得到B的第2块
                    a_0 = B[k][i + 6];
                    a_1 = B[k][i + 7];
                    a_2 = B[k][i + 8];
                    a_3 = B[k][i + 9];
                    a_4 = B[k][i + 10];
                    a_5 = B[k][i + 11];
                    // 得到A的第3块
                    a_6 = A[i + 6][k];
                    a_7 = A[i + 7][k];
                    a_8 = A[i + 8][k];
                    a_9 = A[i + 9][k];
                    a_10 = A[i + 10][k];
                    a_11 = A[i + 11][k];
                    // 复制给B的第2块
                    B[k][i + 6] = a_6;
                    B[k][i + 7] = a_7;
                    B[k][i + 8] = a_8;
                    B[k][i + 9] = a_9;
                    B[k][i + 10] = a_10;
                    B[k][i + 11] = a_11;
                    // B原来的第2块移动到第3块
                    B[k + 6][i + 0] = a_0;
                    B[k + 6][i + 1] = a_1;
                    B[k + 6][i + 2] = a_2;
                    B[k + 6][i + 3] = a_3;
                    B[k + 6][i + 4] = a_4;
                    B[k + 6][i + 5] = a_5;
                }
                for (int k = i + 6; k < i + 12; k++)
                {
                    // 处理第4块
                    a_6 = A[k][j + 6];
                    a_7 = A[k][j + 7];
                    a_8 = A[k][j + 8];
                    a_9 = A[k][j + 9];
                    a_10 = A[k][j + 10];
                    a_11 = A[k][j + 11];
                    B[j + 6][k] = a_6;
                    B[j + 7][k] = a_7;
                    B[j + 8][k] = a_8;
                    B[j + 9][k] = a_9;
                    B[j + 10][k] = a_10;
                    B[j + 11][k] = a_11;
                }
            }
        }
    }
    if (M == 93 && N == 99)
    {
        for (int i = 0; i < N; i += 24)
            for (int j = 0; j < M; j += 24)
                for (int k = i; k < i + 24 && k < N; k++)
                    for (int s = j; s < j + 24 && s < M; s++)
                        B[s][k] = A[k][s];
    }
}

/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */

/*
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; j++)
        {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }
}
char Test1_desc[] = "Test 1";
void Test1(int M, int N, int A[N][M], int B[M][N])
{
    for (int i = 0; i < N; i += 12)                //简单12x12分块
        for (int j = 0; j < M; j += 12)
            for (int k = i; k < i + 12 && k < N; k++)
                for (int s = j; s < j + 12 && s < M; s++)
                    B[s][k] = A[k][s];
}

char Test2_desc[] = "Test 2";
void Test2(int M, int N, int A[N][M], int B[M][N])
{
    for (int i = 0; i < N; i += 12)               //12x12分块
        for (int j = 0; j < M; j += 12)
            for (int k = i; k < i + 12; k++)      //优化对角线块的处理
            {                       
                int a_0 = A[k][j];
                int a_1 = A[k][j + 1];
                int a_2 = A[k][j + 2];
                int a_3 = A[k][j + 3];
                int a_4 = A[k][j + 4];
                int a_5 = A[k][j + 5];
                int a_6 = A[k][j + 6];
                int a_7 = A[k][j + 7];
                int a_8 = A[k][j + 8];
                int a_9 = A[k][j + 9];
                int a_10 = A[k][j + 10];
                int a_11 = A[k][j + 11];
                B[j][k] = a_0;
                B[j + 1][k] = a_1;
                B[j + 2][k] = a_2;
                B[j + 3][k] = a_3;
                B[j + 4][k] = a_4;
                B[j + 5][k] = a_5;
                B[j + 6][k] = a_6;
                B[j + 7][k] = a_7;
                B[j + 8][k] = a_8;
                B[j + 9][k] = a_9;
                B[j + 10][k] = a_10;
                B[j + 11][k] = a_11;
            }
}

char Test3_desc[] = "Test 3";
void Test3(int M, int N, int A[N][M], int B[M][N])
{
    int a_0, a_1, a_2, a_3, a_4, a_5, a_6, a_7, a_8, a_9, a_10, a_11;
    for (int i = 0; i < N; i += 12)
    {
        for (int j = 0; j < M; j += 12)
        {
            for (int k = i; k < i + 6; k++)
            {
                // 得到A的第1,2块
                a_0 = A[k][j + 0];
                a_1 = A[k][j + 1];
                a_2 = A[k][j + 2];
                a_3 = A[k][j + 3];
                a_4 = A[k][j + 4];
                a_5 = A[k][j + 5];
                a_6 = A[k][j + 6];
                a_7 = A[k][j + 7];
                a_8 = A[k][j + 8];
                a_9 = A[k][j + 9];
                a_10 = A[k][j + 10];
                a_11 = A[k][j + 11];
                // 复制给B的第1,2块
                B[j + 0][k] = a_0;
                B[j + 1][k] = a_1;
                B[j + 2][k] = a_2;
                B[j + 3][k] = a_3;
                B[j + 4][k] = a_4;
                B[j + 5][k] = a_5;
                B[j + 0][k + 6] = a_6;
                B[j + 1][k + 6] = a_7;
                B[j + 2][k + 6] = a_8;
                B[j + 3][k + 6] = a_9;
                B[j + 4][k + 6] = a_10;
                B[j + 5][k + 6] = a_11;
            }
            for (int k = j; k < j + 6; k++)//逐行进行
            {
                // 得到B的第2块
                a_0 = B[k][i + 6];
                a_1 = B[k][i + 7];
                a_2 = B[k][i + 8];
                a_3 = B[k][i + 9];
                a_4 = B[k][i + 10];
                a_5 = B[k][i + 11];
                // 得到A的第3块
                a_6 = A[i + 6][k];
                a_7 = A[i + 7][k];
                a_8 = A[i + 8][k];
                a_9 = A[i + 9][k];
                a_10 = A[i + 10][k];
                a_11 = A[i + 11][k];
                // 复制给B的第2块
                B[k][i + 6] = a_6;
                B[k][i + 7] = a_7;
                B[k][i + 8] = a_8;
                B[k][i + 9] = a_9;
                B[k][i + 10] = a_10;
                B[k][i + 11] = a_11;
                // B原来的第2块移动到第3块
                B[k + 6][i + 0] = a_0;
                B[k + 6][i + 1] = a_1;
                B[k + 6][i + 2] = a_2;
                B[k + 6][i + 3] = a_3;
                B[k + 6][i + 4] = a_4;
                B[k + 6][i + 5] = a_5;
            }
            for (int k = i + 6; k < i + 12; k++)
            {
                // 处理第4块
                a_6 = A[k][j + 6];
                a_7 = A[k][j + 7];
                a_8 = A[k][j + 8];
                a_9 = A[k][j + 9];
                a_10 = A[k][j + 10];
                a_11 = A[k][j + 11];
                B[j + 6][k] = a_6;
                B[j + 7][k] = a_7;
                B[j + 8][k] = a_8;
                B[j + 9][k] = a_9;
                B[j + 10][k] = a_10;
                B[j + 11][k] = a_11;
            }
        }
    }
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc);

    /* Register any additional transpose functions */
    // registerTransFunction(trans, trans_desc);

    registerTransFunction(Test1, Test1_desc);
    registerTransFunction(Test2, Test2_desc);
    registerTransFunction(Test3, Test3_desc);
}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++)
    {
        for (j = 0; j < M; ++j)
        {
            if (A[i][j] != B[j][i])
            {
                return 0;
            }
        }
    }
    return 1;
}
