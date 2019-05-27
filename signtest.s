#signtest.s - An example of using the sign flag.
.section .data
value:
	.int 21, 15, 34, 11, 6, 50, 32, 80, 10, 2
len = (. - value)/4 - 1
output:
	.asciz "The value is: %d\n"

.section .text
.globl _start
_start:
	movl $len, %edi
loop:
	pushl value(, %edi, 4)
	pushl $output
	call printf
	add $8, %esp
	dec %edi
	jns loop #不为负则跳转到loop
	movl $1, %eax
	movl $0, %ebx
	int $0x80

