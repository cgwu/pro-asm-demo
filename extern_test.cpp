/*
 * C++调用汇编函数示例.
 * g++ extern_test.cpp square.s areafunc.s cpuidfunc.s
 */
#include <iostream>

extern "C" {
    int square(int);
    float areafunc(int);
    char *cpuidfunc();
}

using namespace std;
int main(int argc, const char *argv[])
{
    int radius = 10;
    int radsquare = square(radius);
    cout << "Radius square:"<< radsquare << endl;

    float result;
    result = areafunc(radius);
    cout << "area:" << result << endl;

    char *pCpuInfo = cpuidfunc();
    cout << "CPUID:" << pCpuInfo << endl;
    return 0;
}
