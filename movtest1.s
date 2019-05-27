// as -gstabs -o movtest1.o movtest1.s
// ld -o movtest1.out movtest1.o
.section .data
value:
	.int 1

.section .text
.globl _start
_start:
	nop
	movl value, %ecx
	movl $1, %eax
	movl $0, %ebx
	int $0x80

