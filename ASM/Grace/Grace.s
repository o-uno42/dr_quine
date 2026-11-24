; This program will print its own source when run.
%define FILENAME "Grace_kid.s"
%define DNA "; This program will print its own source when run.%1$c%%define FILENAME %2$cGrace_kid.s%2$c%1$c%%define DNA %2$c%3$s%2$c%1$c%%macro PROGRAM 0%1$csection .data%1$c    filename db FILENAME, 0%1$c    mode db %2$cw%2$c, 0%1$c    kid db DNA, 0%1$csection .text%1$c    global main%1$c    extern fprintf, fopen, fclose%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    lea rdi, [rel filename]%1$c    lea rsi, [rel mode]%1$c    call fopen wrt ..plt%1$c    test rax, rax%1$c    jz .end%1$c    mov r12, rax%1$c    mov rdi, r12%1$c    lea rsi, [rel kid]%1$c    mov rdx, 34%1$c    mov rcx, 34%1$c    mov r8, 10%1$c    mov r9, 34%1$c    mov rdi, r12%1$c    lea rsi, [rel kid]%1$c    mov edx, 10%1$c    mov ecx, 34%1$c    lea r8, [rel kid]%1$c    xor eax, eax%1$c    call fprintf wrt ..plt%1$c    mov rdi, r12%1$c    call fclose wrt ..plt%1$c.end:%1$c    mov rax, 0%1$c    pop rbp%1$c    ret%1$c%%endmacro%1$c%1$cPROGRAM%1$c"
%macro PROGRAM 0
section .data
    filename db FILENAME, 0
    mode db "w", 0
    kid db DNA, 0
section .text
    global main
    extern fprintf, fopen, fclose
main:
    push rbp
    mov rbp, rsp
    lea rdi, [rel filename]
    lea rsi, [rel mode]
    call fopen wrt ..plt
    test rax, rax
    jz .end
    mov r12, rax
    mov rdi, r12
    lea rsi, [rel kid]
    mov rdx, 34
    mov rcx, 34
    mov r8, 10
    mov r9, 34
    mov rdi, r12
    lea rsi, [rel kid]
    mov edx, 10
    mov ecx, 34
    lea r8, [rel kid]
    xor eax, eax
    call fprintf wrt ..plt
    mov rdi, r12
    call fclose wrt ..plt
.end:
    mov rax, 0
    pop rbp
    ret
%endmacro

PROGRAM
