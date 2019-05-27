#include <stdio.h>
int main(int argc, const char *argv[])
{
    int data1 = 10;
    int result = 20;

    __asm__ __volatile__ (
        "movl %1, %%eax \n\t"
        "addl %%eax, %0"
        : "=r"(result)      // outputs
        : "r"(data1), "0"(result)   // inputs
        : "%eax"    // changed register.
    );
    printf("The result is %d\n", result);
    return 0;
}

