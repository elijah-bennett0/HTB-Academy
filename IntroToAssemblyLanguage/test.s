	.file	"test.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"/bin/cat"
.LC1:
	.string	"flag.txt"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	lea	rax, .LC0[rip]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC1[rip]
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, -32[rbp]
	mov	edx, 0
	mov	rsi, rcx
	mov	rdi, rax
	call	execve@PLT
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 13.2.0-24) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
