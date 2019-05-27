/*
bcdtest.s - An example of using BCD integer values.
编译命令:
$ as -gstabs -o bcdtest.o bcdtest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o bcdtest.out bcdtest.o
vim替换
:%s/bcdtest/filename/g
gdb:
check the value in the ST0 register using the info all command:
*/
.section .data
data1:
	.byte 0x34, 0x12, 0x00, 0x00, 0x00, 	0x00, 0x00, 0x00, 0x00, 0x00
data2:
	.int 2

.section .text
.globl _start
_start:
	fbld data1	#load the value into the top of the FPU register stack (ST0).
	fimul data2	#乘以内存值2.
	fbstp data1 #move the new value on the stack back into the data1

	movl $0, %ebx
	movl $1, %eax
	int $0x80

