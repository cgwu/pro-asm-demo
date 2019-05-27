/*
dastest - das unpacked BCD减法 示例。
编译命令:
$ as -gstabs -o dastest.o dastest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o dastest.out dastest.o
vim替换
:%s/dastest/filename/g
*/
.section .data
value1:
	.byte 0x25, 0x81, 0x02
value2:
	.byte 0x33,  0x29, 0x05
#r1:
#	.byte 0x0, 0x0, 0x0, 0x0

.section .bss
	.lcomm r1 4

.section .text
.globl _start
_start:
	xor %edi, %edi
	movl $3, %ecx
loop1:
	movb value2(, %edi, 1), %al
	sbbb value1(, %edi, 1), %al
	das
	movb %al, r1(, %edi, 1)
	inc %edi
	loop loop1
	sbb $0, r1(, %edi, 4)

end:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

