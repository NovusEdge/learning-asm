.start:
	; jmp — Jump 
	; Transfers program control flow to the instruction at the memory location 
	; indicated by the operand. 
	; Syntax:
	;	jmp <label>
	


	JMP example_lable	; ---------------|
	;									 |
	; More instructions here...		     |
	; All ^these instructions are skipped|
	;									 |
	example_lable: ; <-- Jumps to here --|	

	
	; cmp — Compare
	; Compare the values of the two specified operands
	; This instruction is equivalent to the sub instruction, except the result 
	; of the subtraction is discarded instead of replacing the first operand.
	; 
	; According to the result of said subtraction, processor flags will be set.
	; 
	;	- If the two operands are equal, i.e. the subtraction results in 0, ZF 
	;	  will be set to 1 
	;			(operand_1 == operand_2) ==> ZF = 0
			
	;	- If the subtraction result is negative then SF will be set to 1 and CF
	;	  will be set to 1
	;			(operand_1 < operand_2) ==> CF = 1, SF = 1

	;	- If the subtraction result is positive the SF will be set to 0 and CF
	;	  will be set to 0
	;			(operand_1 > operand_2) ==> CF = 0, SF = 0

	; j<condition> — Conditional Jump 
	; These instructions are conditional jumps that are based on the status of 
	; a set of condition codes that are stored in a special register called the
	; "machine status word"
	; The contents of the machine status word include information about the 
	; last arithmetic operation performed.

	; Syntax:
	;	je <label> (jump when equal)
	;	jne <label> (jump when not equal)
	;	jz <label> (jump when last result was zero)
	;	jg <label> (jump when greater than)
	;	jge <label> (jump when greater than or equal to)
	;	jl <label> (jump when less than)
	;	jle <label> (jump when less than or equal to)
	; https://stackoverflow.com/questions/14267081/difference-between-je-jne-and-jz-jnz#14267642

	; call, ret — Subroutine call and return 
	;	These instructions implement a subroutine call and return.
	; Syntax:
	;	call <label>
	;	ret
