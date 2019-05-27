/*
An example of using command line parameters.
编译命令:
$ as -gstabs -o param_test3.o param_test3.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o param_test3.out param_test3.o
$ gdb -q param_test3.out
vim替换
:%s/param_test3/filename/g
*/
.section .data
output:
	.asciz "The area is: %f\n"

.section .bss
	.lcomm res1, 4

.section .text
.globl _start
_start:
	finit
	pushl 8(%esp) #第一个参数位置
	call atoi
	addl $4, %esp
	movl %eax, res1 #转为int的参数

	fldpi
	filds res1
	fmul %st(0), %st(0)
	fmul %st(1), %st(0)
	subl $8, %esp #栈顶指针下移8字节，用于存储面积值double类型.
	fstpl (%esp)
	pushl $output
	call printf
	addl $12, %esp

	pushl $0
	call exit

