/*
$ as -o movtest3.o movtest3.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o movtest3 movtest3.o
*/
.section .data
output:
	.asciz "The value is %d\n"
values:
	.int 10,15,20,25,99,-123
len = (. - values)/4

.section .text
.globl _start
_start:
	nop
	movl $0, %edi
loop:
	movl values(, %edi, 4), %eax
	pushl %eax
	pushl $output
	call printf
	addl $8, %esp
	inc %edi
	cmpl $len, %edi
	jne loop
	movl $0, %ebx
	movl $1, %eax
	int $0x80

