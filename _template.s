/*
编译命令:
$ as -gstabs -o _t.o _t.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o _t.out _t.o
$ gdb -q _t.out
vim替换
:%s/_t/filename/g
*/
.section .data
#len = (. - values)/4

.section .text
.globl _start
_start:

	movl $1, %eax
	movl $0, %ebx
	int $0x80

