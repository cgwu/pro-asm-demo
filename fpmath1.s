/*
fpmath1.s - An example of basic FPU math.
编译命令:
$ as -gstabs -o fpmath1.o fpmath1.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o fpmath1.out fpmath1.o
$ gdb -q fpmath1.out
vim替换
:%s/fpmath1/filename/g
*/
.section .data
value1:
	.float 43.65
value2:
	.int 22
value3:
	.float 76.34
value4:
	.float 3.1
value5:
	.float 12.43
value6:
	.int 6
value7:
	.float 140.2
value8:
	.float 94.21
output:
	.asciz "The result is %f\n"

.section .text
.globl _start
_start:
	finit
	flds value1		# 43.65 @ st0
	fidiv value2	# / 22
	flds value3		# 76.34 @ st0 -> st1
	flds value4		# 3.1 @ st0 -> st1 ->st2
	fmul %st(1), %st(0) # st0 = (st0 * st1); st0 -> st2
	fadd %st(2), %st(0) # st0 = ((43.65 / 22) + (76.34 * 3.1))
					# 前半部分完成，开始后半部分表达式:
part2:
	flds value5		# st0 -> st1
	fimul value6	# st0 -> st1
	flds value7		# 140.2 @st0 -> st1 -> st2
	flds value8		# 94.21 @st0 -> st1 -> st2 -> st3
	fdivrp			# st1 = (st1 / st0); pop st0
					# st0 -> st1 -> st2
	fsubr %st(1), %st(0) # st0 = (st1 - st0); st0 -> st2
	fdivr %st(2), %st(0) # st0 = st2 / st0
	subl $8, %esp
	fstpl (%esp)	# st0加载到内存地址esp
	pushl $output
	call printf
	add $12, %esp
	pushl $0
	call exit

