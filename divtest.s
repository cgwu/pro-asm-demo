/*
divtest.s - An example of the DIV instruction.
编译命令:
$ as -gstabs -o divtest.o divtest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o divtest.out divtest.o
vim替换
:%s/divtest/filename/g
*/
.section .data
dividend:
	.quad 8335
divisor:
	.int 25
quotient:
	.int 0
remainder:
	.int 0
output:
	.asciz "The quotient is %d, and the remainder is %d\n"

.section .text
.globl _start
_start:
	movl dividend, %eax
	movl dividend + 4, %edx
	divl divisor
	movl %eax, quotient
	movl %edx, remainder
	pushl remainder
	pushl quotient
	pushl $output
	call printf
	add $12, %esp
	pushl $0
	call exit

