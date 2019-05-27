/* regtest2.c - An example of using placehold. */
#include <stdio.h>
int main(int argc, const char *argv[])
{
    int data1 = 10;
    int data2 = 20;
    int result;
    asm volatile (
        "imull %1, %2 \n\t"
        "movl %2, %0"
        : "=r"(result)
        : "r"(data1), "r"(data2)
        : "%ecx", "%edx", "%eax"
    );
    printf("[bad]The result is %d\n", result);
    return 0;
}
