#include <stdio.h>
int main(int argc, const char *argv[])
{
    int radius = 10;
    float area;
    
    asm("fild %1 \n\t"
        "fimul %1 \n\t"
        "fldpi \n\t"
        "fmul %%st(1), %%st(0)"
        : "=t"(area)
        : "m"(radius)
        : "%st(1)");
    printf("The result is %f\n", area);
    return 0;
}
