/*
编译命令:
$ as -gstabs -o loop.o loop.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o loop.out loop.o
*/
.section .data
output:
	.asciz "The value is: %d\n"

.section .text
.globl _start
_start:
	#movl $100, %ecx
	movl $0, %ecx
	movl $0, %eax
loop1:
	addl %ecx, %eax
	loop loop1
	pushl %eax
	pushl $output
	call printf
	add $8, %esp

	movl $0, %ebx
	movl $1, %eax
	int $0x80

