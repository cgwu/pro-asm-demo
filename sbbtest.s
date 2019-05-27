/*
sbbtest.s - quad sub use sbb.

编译命令:
$ as -gstabs -o sbbtest.o sbbtest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o sbbtest.out sbbtest.o
vim替换
:%s/sbbtest/filename/g
*/
.section .data
data1:
	.quad 7252051615
data2:
	.quad 5732348928
output:
	.asciz "The result is %qd\n"

.section .text
.globl _start
_start:
	movl data1, %ebx
	movl data1+4, %eax # eax:ebx 代表被减数
	movl data2, %edx
	movl data2+4, %ecx # ecx:edx 代表减数

	subl %ebx, %edx
	sbbl %eax, %ecx # ecx:edx 保存结果

	pushl %ecx
	pushl %edx
	push $output
	call printf
	addl $12, %esp
	pushl $0
	call exit

