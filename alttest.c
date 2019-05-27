/* regtest2.c - An example of using placehold. */
#include <stdio.h>
int main(int argc, const char *argv[])
{
    int data1 = 10;
    int data2 = 20;
    asm volatile (
        "imull %[value1], %[value2] \n\t"
        : [value2]"=r"(data2)
        : [value1]"r"(data1), "0"(data2)
    );
    printf("[alttest]The result is %d\n", data2);
    return 0;
}
