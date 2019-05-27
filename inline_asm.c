#include <stdio.h>
//https://www.cnblogs.com/feng-qi/articles/3055761.html
/*
 限定符的意义:
 "m"、"v"、"o" 内存单元
 "r" 任何寄存器
 "q" 寄存器eax、ebx、ecx、edx之一
 "i"、"h" 直接操作数
 "E"和"F" 浮点数
 "g" 任意
 "a"、"b"、"c"、"d" 分别表示寄存器eax、ebx、ecx和edx
 "S"和"D" 寄存器esi、edi
 "I" 常数（0至31）
 * */
int main()
{
    int a = 10, b = 0;
    __asm__ __volatile__ (
            "movl %1, %%eax;\n\r"
            "movl %%eax, %0;"
            :"=r"(b)    /*outputs*/
            :"r"(a)     /*inputs*/
            :"%eax"     /*registers-modified*/
            );
    printf("Result: a=%d, b=%d\n",a,b);
}
