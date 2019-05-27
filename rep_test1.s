/*
编译命令:
$ as -gstabs -o rep_test1.o rep_test1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o rep_test1.out rep_test1.o
$ gdb -q rep_test1.out
vim替换
:%s/rep_test1/filename/g
*/
.section .data
value1:
	.ascii "This is a test string.\n"
len = (. - value1)

.section .bss
	.lcomm output, len

.section .text
.globl _start
_start:
	movl $len, %ecx
	leal value1, %esi
	leal output, %edi
	cld		# clear DF flag in EFLAGS, increment after movs.
#loop1:
#	movsb
#	loop loop1
	rep movsb
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

