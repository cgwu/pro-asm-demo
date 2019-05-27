// An exmaple of passing input values in the proper order.
// gcc goodprog.c testfunc.s
#include <stdio.h>
double testfunc(double, int);
int main(int argc, const char *argv[])
{
    double data1 = 3.14159;
    int data2 = 10;
    double result = testfunc(data1, data2);
    printf("The proper result is %f\n", result);
    return 0;
}
