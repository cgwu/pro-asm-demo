/*
setprec.s - An example of setting the precision bits in the control register.
编译命令:
$ as -gstabs -o setprec.o setprec.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o setprec.out setprec.o
$ gdb -q setprec.out
vim替换
:%s/setprec/filename/g
*/
.section .data
newvalue:
	.byte 0x7f, 0x00

.section .bss
	.lcomm control, 2

.section .text
.globl _start
_start:
	fstcw control
	fldcw newvalue
	fstcw control

	movl $1, %eax
	movl $0, %ebx
	int $0x80

