.data:
	var		db	64       ;; Declaring a byte with reference name as "var" and 
					     ;; assigning it a value of 64
					
	var2	db	?        ;; Same as before but "var2" is an uninitialized byte 
			db 10        ;; Declaring a byte without any lable. This will be 
					     ;; located at: var2+1

	x		dw ?         ;; Declaring x as an uninitialized "word" (2-bytes)
	y		dd 100000    ;; Declaring y as a double word (4-bytes) 

	z		dd 1,2,3     ;; Declare three 4-byte values, initialized to 1, 2, 
					     ;; and 3. The value of location Z+8 will be 3.

	bytes   dd 10 dup(?) ;; Declare 10 uninitialized bytes starting at location 
						 ;; bytes.

	arr		dd 100 dup(0);; Same stuff, but this declares 100 4-byte words 
						 ;; starting at the location arr and initialized to 0.
