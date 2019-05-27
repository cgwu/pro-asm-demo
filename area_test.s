	.file	"area_test.c"
	.section	.rodata
.LC0:
	.string	"The result is %f\n"
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
	movl	$10, 24(%esp)
#APP
# 7 "area_test.c" 1
	fild 24(%esp) 
	fimul 24(%esp) 
	fldpi 
	fmul %st(1), %st(0)
# 0 "" 2
#NO_APP
	fstps	28(%esp)
	flds	28(%esp)
	fstpl	4(%esp)
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
