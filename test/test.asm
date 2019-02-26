	global _main
	extern _printf

	section .data
format:	db '%15ld', 10, 0
title:	db 'fibinachi numbers', 10, 0

	section .text
_main:
	push rbp 		; set up stack
	mov rdi, title 		; arg 1 is a pointer
	mov rax, 0 		; no vector registers in use
	call _printf

	mov rcx, 10 		; rcx will countdown from 52 to 0
	mov rax, 1 		; rax will hold the current number
	mov rbx, 1 		; rbx will hold the next number
_print:
	;  We need to call printf, but we are using rax, rbx, and rcx.
	;  printf may destroy rax and rcx so we will save these before
	;  the call and restore them afterwards.
	push rax 		; 32-bit stack operands are not encodable
	push rcx 		; in 64-bit mode, so we use the "r" names
	mov rdi, format 	; arg 1 is a pointer
	mov rsi, rax 		; arg 2 is the current number
	mov eax, 0 		; no vector registers in use
	call _printf
	pop rcx
	pop rax
	mov rdx, rax 		; save the current number
	mov rax, rbx 		; next number is now current
	add rbx, rdx 		; get the new next number
	dec rcx 		; count down
	jnz _print 		; if not done counting, do some more

	pop rbp 		; restore stack
	mov rax, 0		; normal exit
	ret
