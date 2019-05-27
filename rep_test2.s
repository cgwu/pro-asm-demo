/*
编译命令:
$ as -gstabs -o rep_test2.o rep_test2.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o rep_test2.out rep_test2.o
$ gdb -q rep_test2.out
vim替换
:%s/rep_test2/filename/g
*/
.section .data
value1:
	.ascii "This is a test string.\n"
len = (. - value1) # 23
value2:
	.ascii "Xops"

.section .bss
	.lcomm output, len

.section .text
.globl _start
_start:
	movl $6, %ecx
	leal value1, %esi
	leal output, %edi
	cld		# clear DF flag in EFLAGS, increment after movs.
	rep movsl # 4 * 6 = 24 bytes.
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

