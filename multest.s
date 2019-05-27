/*
multest.s - An example of using the MUL instruction.
编译命令:
$ as -gstabs -o multest.o multest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o multest.out multest.o
vim替换
:%s/multest/filename/g
*/
.section .data
data1:
	.int 315814
data2:
	.int 165432
result:
	.quad 0
output:
	.asciz "The result is %qd\n"

.section .text
.globl _start
_start:
	movl data1, %eax
	mull data2	#乘积放在EDX:EAX
	movl %eax, result
	movl %edx, result + 4
	pushl %edx
	pushl %eax
	pushl $output
	call printf
	add $12, %esp
	pushl $0
	call exit

