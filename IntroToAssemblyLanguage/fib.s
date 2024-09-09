global _start
extern printf, scanf=[

section .data
	message db "Input Max Fn: ", 0x0a
	outFormat db "%d", 0x0a, 0x00
	inFormat db "%d", 0x0

; Uninitialized buffer space is stored in .bss
section .bss
	userInput resb 1 ; create 1 byte buffer space for the users input

section .text
_start:
	call printMessage
	call getInput
	call initFib
	call loopFib
	call Exit

; printf -> printf FORMAT [ARGUMENT]
printMessage:
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 15
	syscall
	ret

; scanf -> int scanf(const char *restrict format, ...);
getInput:
	; we're making a call but no push instructions so we need to align the stack
	; currently with one call its 8 bytes but needs to be a multiple of 16
	; so we'll add 8 bytes
	; sub 8 then call then add 8 back
	sub rsp, 8
	mov rdi, inFormat  ; 1st parameter of scanf
	mov rsi, userInput ; 2nd parameter of scanf
	call scanf
	add rsp, 8
	ret

initFib:
	xor rax, rax ; initialize rax & rbx to 0
	xor rbx, rbx
	inc rbx

printFib:
	push rax ; pushing these to save the values
	push rbx
	mov rdi, outFormat
	mov rsi, rbx
	call printf
	pop rbx ; restoring the saved values
	pop rax
	ret

loopFib:
	call printFib
	add rax, rbx  ; get next number
	xchg rax, rbx ; swap values
	cmp rbx, [userInput]   ; rbx - 10
	js loopFib    ; jump if result < 0
	ret

Exit:
	mov rax, 60
	mov rdi, 0
	syscall
