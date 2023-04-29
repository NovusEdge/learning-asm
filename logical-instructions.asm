.data:
	var1		DB 5
	var2		DB 6


.start:
	; For use in eaxmples:
	MOV		eax,		0
	MOV		ebx,		5
	; First on the list is the most basic of all, the "add" instruction. The
	; usage is quite straightforward...
	; Syntax
	;	add <reg>,<reg>
	;	add <reg>,<mem>
	;	add <mem>,<reg>
	;	add <reg>,<const>
	;	add <mem>,<const>
	; Here's some examples:
	;		<reg>		<const>
	ADD		eax,		10			; Results in 10 being added to EAX, the 
									; result is then stored in EAX. Thus
									; now EAX holds 10. This is very similar to
									; just saying: EAX += 10
	
	;		<reg>		<reg>
	ADD		eax,		ebx
	
	;		<mem>		<reg>
	ADD		[var1],		eax			; This will add the contents of EAX to the
									; single byte stored at [var]. Thus, now 
									; var1 will now contain 5+15 == 20
	
	;		<mem>		<const>
	ADD		byte [var2],	4		; Same as before but now we add a constant
									; instead of a regiser's value
	
	;		<reg>		<mem>
	ADD		ebx,		[var2]		; This will add the byte at [var2] to EBX.


	; Resetting values :)
	MOV		eax,			0
	MOV		ebx,			5
	MOV		byte [var1],	5
	MOV		byte [var2],	6
	; The next instruction is sub, it's got the same syntax and works the same 
	; way. If there's an underflow, the CF flag will be set. 
	; Syntax:
	;	sub <reg>,<reg>
	;	sub <reg>,<mem>
	;	sub <mem>,<reg>
	;	sub <reg>,<const>
	;	sub <mem>,<const>
	; Here's some examples:
	SUB		ebx,			eax			; Same as saying: EBX -= EAX
	SUB		ebx,			5			
	SUB		[var1],			ebx
	SUB		byte [var2],	6
	SUB		eax,			0

	; Next come the increment and decrement instructions, they're pretty simple
	; The INC instruction increments the value inside a register/at a memory 
	; location, and the DEC instruction decrements the same. They both 
	; increment/decrement the value by 1
	; Here's an example:
	INC		eax			; <reg>
	INC		[var1]		; <mem>
	DEC		eax			; <reg>
	DEC		[var1]		; <mem>

	; imul — Integer Multiplication
    ; The imul instruction has two basic formats: two-operand (first two syntax
	; listings above) and three-operand (last two syntax listings above). 
	
	; The two operand syntax multiplies the values of both the operands and 
	; stores it inside the first one
	
	; The 3 operand syntax works something like this:
	; IMUL a, b, c ==> a = b*c

	; Syntax
	;	imul <reg32>, <reg32>
	;	imul <reg32>, <mem>
	;	imul <reg32>, <reg32>, <const>
	;	imul <reg32>, <mem>, <const>
	
	; Here's some examples:
	;;  First we reset the values tho >.>
	MOV		eax,			1
	MOV		ebx,			5
	MOV		byte [var1],	5
	MOV		byte [var2],	6

	;		<reg32>			<reg32>
	IMUL	eax,			ebx

	;		<reg32>			<mem>
	IMUL	eax,			[var1]
	
	;		<reg32>			<reg32>		<const>
	IMUL	eax,			ebx,		8
	
	;		<reg32>			<mem>		<const>
	IMUL	ebx,			[var2],		0



	; idiv — Integer Division 
	; This works in a simple way, the dividend should be stored in the EAX 
	; register and the divisor must be provided as an operand to the 
	; instruction. The answer/quotient is stored in EAX after the operation and
	; the remainder is stored in EDX
	; Here's an example:
	MOV		eax,			8
	MOV		ebx,			2

	MOV		edx,			0	; Set the high 32 bits of the dividend to 0
								; This is essential if you wanna have a 32-bit
								; division result, we do this by setting the 
								; upper 32 bits of the dividend either to zero 
								; or to the sign-extension of the lower 32 bits
								; If we set the higher 32-bits of the register
								; to something, it'll infer to some sort of 
								; signing of the number
	
	IDIV	ebx					; EDX = EAX % EBX && EAX /= EBX
	

	MOV		eax,			1
	MOV		ebx,			0
	MOV		byte [var1],	1
	MOV		byte [var2],	0
	; Next are some logical instruction like AND, OR, XOR, and NOT. They are 
	; quite simple and work just as expected. Here's the syntax for each:
	; and - Bitwise logical AND:
	; Syntax:
	;	and <reg>,<reg>
	;	and <reg>,<mem>
	;	and <mem>,<reg>
	;	and <reg>,<con>
	;	and <mem>,<con>
	AND		eax,			ebx		; EAX &= EBX
	AND		eax,			[var1]	; EAX &= [var1]
	AND		ebx,			2		; EBX &= 2
	AND		[var1],			7		; [var1] &= 7
	AND		[var2],			ebx		; [var2] &= EBX

	; or - Bitwise OR:
	; Syntax is the same as AND, the same applies to XOR

	; not - bitwise logical NOT
	; Syntax:
	;	not <reg>
	;	not <mem>
	NOT		eax
	NOT		[var1]

	
	; neg - Negate
	; This performs 2's complement nagation of the operand:
	; Syntax:
	;	neg	<reg>
	;	neg <mem>
	NEG		ebx			; EAX = -EAX
	NEG		[var2]		; [var2] = -[var2]

	; shl, shr - Left and Right shift (respectively).
	; Performs left and right shifts on the first operand with the offset being
	; the second operand. The max offset is 31. Any shift counts greater than 31
	; are performed modulo 32. The second operand can either be an 8 bit const
	; or the register CL:
	; Syntax:
	;	shl/r <reg>, <const8>
	;   shl/r <mem>, <const8>
	;	shl/r <reg>, CL
	;	shl/r <mem>, CL
	SHL		ebx,	4		; EBX <<= 4
	
	MOV		CL,		5	
	SHL		eax,	CL		; EAX <<= CL 
							;		  ^---| ==5
