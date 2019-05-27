/*
编译命令:
$ as -gstabs -o betterloop.o betterloop.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o betterloop.out betterloop.o
*/
.section .data
output:
	.asciz "The value is: %d\n"

.section .text
.globl _start
_start:
	#movl $100, %ecx
	movl $10, %ecx
	movl $0, %eax
	jcxz done 	#jump if %ecx is zero.

loop1:
	addl %ecx, %eax
	loop loop1	#dec %ecx, then jump if it's not zero.

done:
	pushl %eax
	pushl $output
	call printf
	add $8, %esp
	movl $0, %ebx
	movl $1, %eax
	int $0x80

