/*
as -o cpuid2.o cpuid2.s
ld -dynamic-linker /lib/ld-linux.so.2 -lc -o cpuid2.out cpuid2.o
*/
.section .data
output:
	.asciz "The processor Vendor ID is '%s'\n"

.section .bss
	.lcomm buffer, 12

.section .text
.globl _start
_start:
	movl $0, %eax
	cpuid
	movl $buffer, %edi
	movl %ebx, (%edi)
	movl %edx, 4(%edi)
	movl %ecx, 8(%edi)
	pushl $buffer
	pushl $output
	call printf
	addl $8, %esp
	pushl $0
	call exit

