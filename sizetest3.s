.section .data
buffer:
/*
The .fill directive enables the assembler to automatically create the 10,000 data elements for you. The
default is to create one byte per field, and fill it with zeros.
*/
	.fill 10000

.section .text
.globl _start
_start:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

