.data:
	var		DB 3



; mov — Move (Opcodes: 88, 89, 8A, 8B, 8C, 8E, ...) 
; The move instruction copies the data item referred to by its second operand 
; (i.e. register contents, memory contents, or a constant value) into the 
; location referred to by its first operand (i.e. a register or memory). While 
; register-to-register moves are possible, direct memory-to-memory moves are 
; not.

; The syntax for using the MOV instruction is:
;	MOV		<DST>, <SRC>
.start:
	;		<reg>			<const>
	MOV		eax,			0xA 	; Moves the value 0xA into EAX

	;		<reg>			<reg>
	MOV		ebx,			eax		; Moves the value stored in EAX to EBX

	;		<mem>			<const> 
	MOV		byte [var],			5	; Moves the value: 5 into the byte at the 
									; location var.
									; Here [var] translates to the address of
									; var in memory.

	;		<mem>			<reg>
	MOV		[var],			ebx		; Moves the value in ebx to [var]

	;		<reg>			<mem>
	MOV		ecx,			[var]   ; Moves the value stored at [var] into
										 ; the ecx register


; push — Push stack (Opcodes: FF, 89, 8A, 8B, 8C, 8E, ...)
; The push instruction places its operand onto the top of the hardware 
; supported stack in memory. 
; Simply put, the push operation does the following:
; 1. Decrement ESP by 4
; 2. Place ESP's operand into the contents of the 32-bit location at address 
;	 [ESP]

; Here are some examples:
	PUSH eax						; Push the contents of EAX onto the stack 
	PUSH word [var]					; Push the 4 bytes at [var] onto the stack
	PUSH 64							; Push a 32 bit constant onto the stack

; lea — Load effective address (Opcodes: 8D)
; The lea instruction places the address specified by its second operand into 
; the register specified by its first operand. The contents of the memory 
; location are not loaded, only the effective address. This is usually used to
; obtain a pointer to a memory region.

; Here's an example:
	LEA eax, [var]					; The value in [var] is placed in EAX
	LEA edi, [ebx+4*esi]			; the quantity EBX+4*ESI is placed in EDI
