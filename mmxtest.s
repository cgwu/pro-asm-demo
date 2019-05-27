/*
编译命令:
$ as -gstabs -o mmxtest.o mmxtest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o mmxtest.out mmxtest.o
vim替换
:%s/mmxtest/filename/g

(gdb) print $mm0
(gdb) print $mm1
(gdb) print/x $mm1
*/
.section .data
values1:
	.int 1, -1
values2:
	.byte 0x10, 0x05, 0xff, 0x32, 0x47, 0xe4, 0x00, 0x01

.section .text
.globl _start
_start:
	movq values1, %mm0
	movq values2, %mm1
end:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

