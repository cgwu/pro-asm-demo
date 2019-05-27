#include <stdio.h>
int main(int argc, const char *argv[])
{
    int dividend = 20;
    //int dividend = 1285;
    int divisor = 5;
    int result;
    asm(
        "divb %2 \n\t"
        //"divw %2 \n\t"
        "movl %%eax, %0"
        : "=m"(result)
        : "a"(dividend), "m"(divisor)
    );
    printf("The result is %d\n", result);
    return 0;
}
