// gcc -o floattest.out floattest.c areafunc.s
#include <stdio.h>
float areafunc(int);

int main(int argc, const char *argv[])
{
    int radius = 10;
    float result;
    result = areafunc(radius);
    printf("The result is %f\n", result);

    result = areafunc(2);
    printf("The result is %f\n", result);

    return 0;
}
