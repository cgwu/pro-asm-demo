# cmovetest.s - An example of the CMOV instructions
/*
as -o cmovtest.o cmovtest.s
ld -dynamic-linker /lib/ld-linux.so.2 -lc -o cmovtest.out cmovtest.o
*/
.section .data
output:
	.asciz "The largest value is %d\n"
values:
	.int 105,225,10,-1,12,876,-9999
len = (. - values)/4

.section .text
.globl _start
_start:
	nop
	movl values, %ebx
	movl $1, %edi
loop:
	movl values(, %edi, 4), %eax
	cmp %ebx, %eax
	#cmova %eax, %ebx  # unsigned: if %eax > %ebx then %ebx = %eax
	cmovge %eax, %ebx  # signed: if %eax > %ebx then %ebx = %eax
	inc %edi
	cmp $len, %edi
	jne loop # jne: jump not equal
	pushl %ebx
	pushl $output
	call printf
	addl $8, %esp
	pushl $0
	call exit
	
