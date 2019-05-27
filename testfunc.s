#testfunc.s - An example of reading input values wrong.
.section .text
.type testfunc, @function
.globl testfunc
testfunc:
	pushl %ebp
	movl %esp, %ebp

	fldl 8(%ebp)	# load 8 Byte double
	fimul 16(%ebp)  # multiply 4 byte int, at st0

	movl %ebp, %esp
	popl %ebp
	ret

