/*
编译命令:
$ as -gstabs -o param_test1.o param_test1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o param_test1.out param_test1.o
$ gdb -q param_test1.out
vim替换
:%s/param_test1/filename/g
*/
.section .data
output1:
	.asciz "There are %d parameters:\n"
output2:
	.asciz "%s\n"

.section .text
.globl _start
_start:
	movl (%esp), %ecx
	pushl %ecx
	pushl $output1
	call printf
	addl $4, %esp
	popl %ecx		#参数个数
	movl %esp, %ebp
	add $4, %ebp
loop1:
	pushl %ecx
	pushl (%ebp)
	pushl $output2
	call printf
	addl $8, %esp
	popl %ecx
	add $4, %ebp
	loop loop1

	movl $1, %eax
	movl $0, %ebx
	int $0x80

