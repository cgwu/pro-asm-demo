/*
An example of writing data to a file.
编译命令:
$ as -gstabs -o readtest1.o readtest1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o readtest1.out readtest1.o
$ gdb -q readtest1.out
vim替换
:%s/readtest1/filename/g
*/
.section .bss
	.lcomm buffer, 42
	.lcomm filehandle, 4

.section .text
.globl _start
_start:
	movl %esp, %ebp
	movl $5, %eax #open
	movl 8(%ebp), %ebx  # 程序第一个参数
	movl $0, %ecx	# 打开模式
	movl $0444, %edx
	int $0x80
	test %eax, %eax
	js badfile # minus means error.
	movl %eax, filehandle

	movl $3, %eax #read to buffer
	movl filehandle, %ebx
	movl $buffer, %ecx
	movl $42, %edx  # 42 bytes
	int $0x80
	test %eax, %eax
	js badfile

	movl $4, %eax
	movl $1, %ebx
	movl $buffer, %ecx
	movl $42, %edx
	int $0x80	# write to stdout
	test %eax, %eax
	js badfile

	movl $6, %eax # close
	movl filehandle, %ebx
	int $0x80

badfile:
	movl %eax, %ebx
	movl $1, %eax
	int $0x80

