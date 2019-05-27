/*
roundtest.s - An example of the FRNDINT instruction.
编译命令:
$ as -gstabs -o roundtest.o roundtest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o roundtest.out roundtest.o
$ gdb -q roundtest.out
vim替换
:%s/roundtest/filename/g
*/
.section .data
value1:
	.float 3.65
rdown:
	.byte 0x7f, 0x07
rup:
	.byte 0x7f, 0x0b

.section .bss
	.lcomm result1, 4
	.lcomm result2, 4
	.lcomm result3, 4

.section .text
.globl _start
_start:
	finit
	flds value1
	frndint
	fists result1

	fldcw rdown
	flds value1
	frndint
	fists result2

	fldcw rup
	flds value1
	frndint
	fists result3

	movl $1, %eax
	movl $0, %ebx
	int $0x80

