/*
An example of using external functions.
编译命令:
$ as -gstabs -o func_test4.o func_test4.s
$ as -gstabs -o func_area.o func_area.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o func_test4.out func_test4.o func_area.o
$ gdb -q func_test4.out
vim替换
:%s/func_test4/filename/g
*/
.section .data
precision:
	.byte 0x7f, 0x00
msg:
	#.asciz "Area = %.2f\n"
	.asciz "独立库计算圆的面积Area = %f\n"
foo:	.float 3.125
doo:	.double 3.125

.section .bss
	.lcomm res1, 4

.section .text
.globl _start
_start:
	finit
	fldcw precision

	pushl $10
	call area
	add $4, %esp
	movl %eax, res1
	//输出面积值
	pushl %eax
	pushl $msg
	call print_area
	add $8, %esp
/*
	subl $8, %esp
	flds res1		#float进FPU栈
	fstpl (%esp)	#double出FPU栈,保存到函数栈
	pushl $msg
	call printf
	add $12, %esp
*/
	pushl $2
	call area
	add $4, %esp
	movl %eax, res1
	//输出面积值
	pushl %eax
	pushl $msg
	call print_area
	add $8, %esp

	pushl $120
	call area
	add $4, %esp
	movl %eax, res1
	//输出面积值
	pushl %eax
	pushl $msg
	call print_area
	add $8, %esp

	movl $1, %eax
	movl $0, %ebx
	int $0x80

