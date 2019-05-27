/*
 * 编译测试命令：
 * vim test.c
 * vim main.c
 * gcc -shared -fPIC -o libmyshare.so test.c
 * gcc -o main.out main.c ./libmyshare.so
 * ./main.out
 * gcc -o mainso.out main.c -L. -lmyshare
 * ./mainso.out
 * export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
 * ./mainso.out
 * ldd mainso.out
 * ldd main.out
 * */
#include <stdio.h>
extern int add(int,int);
extern int sub(int,int);

int main(int argc, const char *argv[])
{
    int a = 10, b = 20;
    printf("add = %d\n", add(a,b));
    printf("sub = %d\n", sub(a,b));
    return 0;
}
