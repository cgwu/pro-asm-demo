// as -gstabs -o movtest2.o movtest2.s
// ld -o movtest2.out movtest2.o
.section .data
value:
	.int 1

.section .text
.globl _start
_start:
	nop
	movl $100, %eax
	movl %eax, value
	// exit
	movl $1, %eax
	movl $0, %ebx
	int $0x80

