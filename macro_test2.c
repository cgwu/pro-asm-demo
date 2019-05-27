/* jmp_test.c - An example of using jumps in inline assembly.*/
#include <stdio.h>
#define GREATER(a,b, result) ({ \
    asm( \
        "cmp %1, %2 \n\t"   \
        "jge 0f \n\t"       \
        "movl %1, %0 \n\t"  \
        "jmp 1f \n"         \
        "0:\n\t"            \
        "movl %2, %0\n"     \
        "1:"                \
        : "=r"(result)      \
        : "r"(a), "r"(b)    \
    ); })

int main(int argc, const char *argv[])
{
    int a = 50;
    int b = 40;
    int result;
    GREATER(a,b,result);
    printf("a=%d,b=%d, The larger value is %d\n", a, b,  result);
    return 0;
}
