#include <stdio.h>
int main(int argc, const char *argv[])
{
    int data1 = 10;
    int data2 = 20;
    int result;

    asm(
        "imull %%edx, %%ecx \n\t"
        "movl %%ecx, %%eax"
        : "=a"(result)
        : "d"(data1), "c"(data2)
       );
    printf("data1=%d, data2=%d, result=%d\n",data1, data2, result);
    return 0;
}
