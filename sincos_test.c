/* sincos_test.c - An example of using two FPU register. */
#include <stdio.h>
int main(int argc, const char *argv[])
{
    float angle = 90;
    float radian, cosine, sine;
    radian = angle / 180 * 3.14159;
    asm("fsincos"
        : "=t"(cosine), "=u"(sine)
        : "0"(radian));
    printf("The cosine is %f, and the sin is %f\n", cosine, sine);
    return 0;
}
