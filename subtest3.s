/*
subtest3.s - An example of an overflow condition in a SUB instruction.
编译命令:
$ as -gstabs -o subtest3.o subtest3.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o subtest3.out subtest3.o
vim替换
:%s/subtest3/filename/g
*/
.section .data
output:
	.asciz "The result is %d\n"

.section .text
.globl _start
_start:
	movl $-1590876934, %ebx
	#movl $1259230143, %eax
	movl $1, %eax
	subl %eax, %ebx
	jo over # jump if overflow flag is set

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

