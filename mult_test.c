// gcc mult_test.c greater.s
#include <stdio.h>
int main(int argc, const char *argv[])
{
    int i = 30;
    int j = 20;
    int k = greater(i,j);
    printf("The larger value is %d\n", k);

    return 0;
}
