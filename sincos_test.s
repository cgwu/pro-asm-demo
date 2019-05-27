	.file	"sincos_test.c"
	.section	.rodata
	.align 4
.LC3:
	.string	"The cosine is %f, and the sin is %f\n"
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
	subl	$48, %esp
	movl	.LC0, %eax
	movl	%eax, 32(%esp)
	flds	32(%esp)
	flds	.LC1
	fdivrp	%st, %st(1)
	fldl	.LC2
	fmulp	%st, %st(1)
	fstps	36(%esp)
	movl	36(%esp), %eax
	movl	%eax, 24(%esp)
	flds	24(%esp)
#APP
# 8 "sincos_test.c" 1
	fsincos
# 0 "" 2
#NO_APP
	fstps	40(%esp)
	fstps	44(%esp)
	flds	44(%esp)
	flds	40(%esp)
	fxch	%st(1)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$.LC3, (%esp)
	call	printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1119092736
	.align 4
.LC1:
	.long	1127481344
	.align 8
.LC2:
	.long	-266631570
	.long	1074340345
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
