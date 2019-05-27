/*
编译命令:
$ as -gstabs -o cmps_test1.o cmps_test1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o cmps_test1.out cmps_test1.o
$ gdb -q cmps_test1.out
vim替换
:%s/cmps_test1/filename/g
*/
.section .data
value1:
	.ascii "Test"
value2:
	.ascii "TEst"

.section .text
.globl _start
_start:
	movl $1, %eax
	leal value1, %esi
	leal value2, %edi
	cld
	cmpsl
	je equal
	movl $1, %ebx #不相等则返回1
	int $0x80
equal:
	movl $0, %ebx #相等则返回0
	int $0x80

