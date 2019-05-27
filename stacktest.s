/*
stacktest.s - An example of working with the FPU stack.
编译命令:
$ as -gstabs -o stacktest.o stacktest.s
$ ld -dynamic-linker /lib/ld-linux.so.2 -lc -o stacktest.out stacktest.o
$ gdb -q stacktest.out
vim替换
:%s/stacktest/filename/g
*/
.section .data
value1:
	.int 40
value2:
	.float 92.4405
value3:
	.double 221.440321

.section .bss
	.lcomm int1, 4
	.lcomm control, 2
	.lcomm status, 2
	.lcomm res1, 4		#result value 1

.section .text
.globl _start
_start:
	/* FINIT initialize the FPU. It sets the control and status registers 
	to their default values, but it does not
	alter the data contained in the FPU data registers.*/
	finit
	fstcw control # copy control register to memory location:&control.
	fstsw status  # copy status register
	filds value1  # 入栈 (FILDS) loads a doubleword integer value into the FPU register stack
	fists int1    # FISTS instruction retrieves the value at the top of the register stack 
				  # 	(the value you just placed there) and places it into the destination
	flds value2	  # 入栈 load floating-point values into the FPU register stack
	fldl value3   # 入栈 load a double-precision floating-point
	fst %st(4)    # The FST instruction is used to move data from the ST0 register to another FPU register
	fxch %st(1)	  # FXCH instruction is used to exchange the value of the ST0 register with	another FPU register
	fstps res1    /*The FST instruction copies data from the ST0 FTP register 
					to a memory location (or another FPU register)
					while keeping the original value in the ST0 register.
					The FSTP instruction also copies the ST0 FPU register value, 
					but then pops it from the FPU register
					stack. This shifts all of the FPU stack values up one place in the stack.*/
end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

