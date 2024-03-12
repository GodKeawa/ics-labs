#include <cassert>
#include <iostream>

#define CO_BEGIN /* TODO */ \
    switch (label)          \
    {                       \
        case 0:;            //switch开始

#define CO_END /* TODO */ \
    label = -1;           \
    default:;             \
    }                       //switch结束

#define CO_YIELD(...) /* TODO */ \
    label = __LINE__;            \
    return __VA_ARGS__;          \
    case __LINE__:;

//将label设为-1后返回需要返回的值，下一次进入switch就退出了
#define CO_RETURN(...) /* TODO */ \
    label = -1;                   \
    return __VA_ARGS__;

struct coroutine_base {
    /* TODO */
    int label = 0;          //在base里记录label作为switch的参数
};

class fib : public coroutine_base {
private:
    /* TODO */
    int a, b;               //必须在外面定义，不然会让编译器犯难

public:
    // TODO: update below code when you implement
    // CO_BEGIN/CO_END/CO_YIELD/CO_RETURN
    int operator()() {
        CO_BEGIN
        a = 0, b = 1;
        while (true)
        {
            CO_YIELD(a) 
            int tmp = a;           
            a = b;
            b = tmp + b;
        }
        CO_END                             
        return -1;
    }
};

int main() {
    int ans[] = {0, 1, 1, 2, 3, 5, 8, 13, 21, 34};
    fib foo;
    for (int i = 0; i < 10; i++)
        assert(foo() == ans[i]);
    std::cout << "libco_v3 test passed!" << std::endl;
}
