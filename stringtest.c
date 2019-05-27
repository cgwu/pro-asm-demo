// gcc stringtest.c cpuidfunc.s
#include <stdio.h>

char * cpuidfunc();

int main(int argc, const char *argv[])
{
    char *spValue;
    spValue = cpuidfunc();
    printf("The CPUID is: '%s'\n", spValue);

    return 0;
}
