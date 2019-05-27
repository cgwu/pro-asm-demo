/*
signed add.
addtest4.s - An example of detecting a carry condition.

编译命令:
$ as -gstabs -o addtest4.o addtest4.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o addtest4.out addtest4.o
vim替换
:%s/addtest4/filename/g
*/
.section .data
output:
	.asciz "The result is %d\n"

.section .text
.globl _start
_start:
	#movl $-1590876934, %ebx 
	#movl $-1259230143, %eax
	movl $-190876934, %ebx 
	movl $-159230143, %eax
	addl %eax, %ebx
	jo over 	#jump if over flag = 1
	pushl %ebx
	pushl $output
	call printf
	add $8, %esp
	pushl $0
	call exit
over:
	pushl $0
	pushl $output
	call printf
	add $8, %esp
	pushl $0
	call exit

