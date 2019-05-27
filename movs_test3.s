/*
编译命令:
$ as -gstabs -o movs_test3.o movs_test3.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o movs_test3.out movs_test3.o
$ gdb -q movs_test3.out
vim替换
:%s/movs_test3/filename/g
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
loop1:
	movsb
	loop loop1
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

