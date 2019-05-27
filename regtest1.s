	.file	"regtest1.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"data1=%d, data2=%d, result=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	movl	$10, 20(%esp)
	movl	$20, 24(%esp)
	movl	20(%esp), %eax
	movl	24(%esp), %ecx
	movl	%eax, %edx
#APP
# 8 "regtest1.c" 1
	imull %edx, %ecx 
	movl %ecx, %eax
# 0 "" 2
#NO_APP
	movl	%eax, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 12(%esp)
	movl	24(%esp), %eax
	movl	%eax, 8(%esp)
	movl	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
