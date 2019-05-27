#include <stdio.h>
int main(int argc, const char *argv[])
{
    char input[30] = { "This is a test message.\n" };
    char output[30];
    int length = 25;
    //asm volatile (
    //__asm__  /*__volatile__*/ (
    __asm__  __volatile__ (
        "cld \n\t"
        "rep movsb"
        :       //输出参数
        : "S"(input), "D"(output), "c"(length) //输入参数
    );
    printf("复制的output串:%s", output);
    return 0;
}
