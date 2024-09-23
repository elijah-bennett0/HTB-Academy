global _start
extern printf

section .text
_start:

	call pushValues

pushValues:

	mov rax, 0xa284ee5c7cde4bd7
	push rax
	mov rax, 0x935add110510849a
	push rax
	mov rax, 0x10b29a9dab697500
	push rax
	mov rax, 0x200ce3eb0d96459a
	push rax
	mov rax, 0xe64c30e305108462
	push rax
	mov rax, 0x69cd355c7c3e0c51
	push rax
	mov rax, 0x65659a2584a185d6
	push rax
	mov rax, 0x69ff00506c6c5000
	push rax
	mov rax, 0x3127e434aa505681
	push rax
	mov rax, 0x6af2a5571e69ff48
	push rax
	mov rax, 0x6d179aaff20709e6
	push rax
	mov rax, 0x9ae3f152315bf1c9
	push rax
	mov rax, 0x373ab4bb0900179a
	push rax
	mov rax, 0x69751244059aa2a3
	push rax

	call decrypt

	ret

decrypt:

	mov rbx,0x2144d2144d2144d2 ; key

	xor r8, r8
	pop r8
	mov r9, r8
	xor r8, rbx

	; write(int fd, const void buf[.count], size_t count)
	mov rax, 1
	mov rdi, 1
	mov rsi, r8
	mov rdx, 9
	syscall

	mov r10, 0xa284ee5c7cde4bd7
	cmp r9, r10
	jz exit
	loop decrypt

exit:

	mov rax, 60
	mov rdi, 0
	syscall
