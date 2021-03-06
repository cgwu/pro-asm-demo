# pushpop.s - An example of using the PUSH and POP instructions
.section .data
data: .int 125

.section .text
.globl _start
_start:
	movl $24420, %ecx
	movw $350, %bx
	movl $100, %eax
lb_push:
	pushl %ecx
	pushw %bx
	pushl %eax
	pushl data
	pushl $data
lb_pop:
	popl %eax
	popl %eax
	popl %eax
	popw %ax
	popl %eax

	movl $0, %ebx
	movl $1, %eax
	int $0x80

