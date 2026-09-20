; comment
section .text
    global main
    extern printf
    func:
        ret

main:
    ; comment 2
    push rbp
    call func
    lea rdi, [rel s]
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel s]
    mov rax, 0
    call printf wrt ..plt
    pop rbp
    mov rax, 0
    ret

section .data
s db "; comment%1$csection .text%1$c    global main%1$c    extern printf%1$c    func:%1$c        ret%1$c%1$cmain:%1$c    ; comment 2%1$c    push rbp%1$c    call func%1$c    lea rdi, [rel s]%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    lea rcx, [rel s]%1$c    mov rax, 0%1$c    call printf wrt ..plt%1$c    pop rbp%1$c    mov rax, 0%1$c    ret%1$c%1$csection .data%1$cs db %2$c%3$s%2$c, 0%1$c", 0
