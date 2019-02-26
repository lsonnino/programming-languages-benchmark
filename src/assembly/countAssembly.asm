
    global _main
    extern _printf

    section .data
count_to: dq 100000000

    section .text
_main:
    push rbp            ; set up stack
    mov rcx, count_to   ; rcx will countdown to 0
    mov rax, 0          ; rax will hold the current number

_print:
    inc rax         ; incrise the counter
    dec rcx 		; count down
    jnz _print 		; if not done counting, do some more

    pop rbp 		; restore stack
    mov rax, 0		; normal exit
ret
