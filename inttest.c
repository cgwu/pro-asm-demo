// gcc inttest.c square.s
#include <stdio.h>

extern int square(int);

int main(int argc, const char *argv[])
{
    int i = 2;
    int j = square(i);
    printf("The square of %d is %d\n", i,j);

    j = square(10);
    printf("The square of 10 is %d\n",j);
    return 0;
}
