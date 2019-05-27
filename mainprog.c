/*
 * gcc -o mainprog.out mainprog.c asmfunc.s
 * */
#include <stdio.h>
int main(int argc, const char *argv[])
{
    printf("This is a test.\n");
    asmfunc();

    printf("This is an another test.\n");
    asmfunc();

    return 0;
}
