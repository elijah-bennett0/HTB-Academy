global _start

section .data
	message db "Hello World", 0xa

section .text
_start:

	mov rax, 1 		; write
	mov rdi, 1 		; file descriptor
	mov rsi, message	; pointer to our message
	mov rdx, 12		; length of message
	syscall

	mov rax, 60		; exit
	mov rdi, 0		; exit normally
	syscall			; this is so we dont segfault



