/*
aaatest.s - An example of using the AAA instruction.
编译命令:
$ as -gstabs -o aaatest.o aaatest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o aaatest.out aaatest.o
vim替换
:%s/aaatest/filename/g
*/
.section .data
value1:
	.byte 0x05, 0x02, 0x01, 0x08, 0x02
value2:
	.byte 0x03, 0x03, 0x09, 0x02, 0x05

.section .bss
	.lcomm sum, 6

.section .text
.globl _start
_start:
	xor %edi, %edi
	movl $5, %ecx
	clc
loop1:
	movb value1(, %edi, 1), %al
	adcb value2(, %edi, 1), %al
	aaa		# 将al中的二进制格数转换成unpacked BCD格式.
	movb %al, sum(, %edi, 1)
	inc %edi
	loop loop1
	adcb $0, sum(, %edi, 4)

	movl $0, %ebx
	movl $1, %eax
	int $0x80

