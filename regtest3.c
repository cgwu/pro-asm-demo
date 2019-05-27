/* regtest2.c - An example of using placehold. */
#include <stdio.h>
int main(int argc, const char *argv[])
{
    int data1 = 10;
    int data2 = 20;
    asm volatile (
        "imull %1, %0 \n\t"
        : "=r"(data2)
        : "r"(data1), "0"(data2)
    );
    printf("The result is = %d\n", data2);
    return 0;
}
