section .data
    filename: times 16 db 0
    i: dd 5
    dna: db "section .data%1$c    filename: times 16 db 0%1$c    i: dd %5$d%1$c    dna: db %3$c%2$s%3$c,0%1$c    buffer: times 4096 db 0%1$c    format: db %3$c%%s%%d%%s%3$c,0%1$c    name: db %3$cSully_%3$c,0%1$c    extension: db %3$c.s%3$c,0%1$c    mode: db %3$cw%3$c,0%1$c    str: db %3$c%%s%3$c,0%1$c    file: dq 0%1$c    cmd_buffer: times 2048 db 0%1$c    cmd: db %3$c%4$s%3$c,0%1$csection .text%1$c    global main%1$c    extern sprintf, fopen, fprintf, fclose, system%1$cmain:%1$c    sub rsp,8%1$c    lea rdi,[rel filename]%1$c    lea rsi,[rel format]%1$c    lea rdx,[rel name]%1$c    sub dword[rel i],1%1$c    mov ecx,[rel i]%1$c    lea r8,[rel extension]%1$c    xor eax,eax%1$c    call sprintf wrt ..plt%1$c    lea rdi,[rel buffer]%1$c    lea rsi,[rel dna]%1$c    mov rdx,10%1$c    lea rcx,[rel dna]%1$c    mov r8,34%1$c    lea r9,[rel cmd]%1$c    sub rsp,8%1$c    mov eax,[rel i]%1$c    push rax%1$c    xor eax,eax%1$c    call sprintf wrt ..plt%1$c    add rsp,16%1$c    lea rdi,[rel filename]%1$c    lea rsi,[rel mode]%1$c    call fopen wrt ..plt%1$c    mov [rel file],rax%1$c    test rax,rax%1$c    jz error%1$c    mov rdi,[rel file]%1$c    lea rsi,[rel str]%1$c    lea rdx,[rel buffer]%1$c    call fprintf wrt ..plt%1$c    mov rdi,[rel file]%1$c    call fclose wrt ..plt%1$c    cmp dword[rel i],0%1$c    ja recursion%1$c    add rsp,8%1$c    mov eax,0%1$c    ret%1$crecursion:%1$c    lea rdi,[rel cmd_buffer]%1$c    lea rsi,[rel cmd]%1$c    mov edx,[rel i]%1$c    xor eax,eax%1$c    call sprintf wrt ..plt%1$c    lea rdi,[rel cmd_buffer]%1$c    call system wrt ..plt%1$c    test rax,rax%1$c    jz error%1$cerror:%1$c    add rsp,8%1$c    mov eax,0%1$c    ret%1$c",0
    buffer: times 4096 db 0
    format: db "%s%d%s",0
    name: db "Sully_",0
    extension: db ".s",0
    mode: db "w",0
    str: db "%s",0
    file: dq 0
    cmd_buffer: times 2048 db 0
    cmd: db "nasm -f elf64 Sully_%d.s -o Sully.o && gcc Sully.o -o Sully && ./Sully",0
section .text
    global main
    extern sprintf, fopen, fprintf, fclose, system
main:
    sub rsp,8
    lea rdi,[rel filename]
    lea rsi,[rel format]
    lea rdx,[rel name]
    sub dword[rel i],1
    mov ecx,[rel i]
    lea r8,[rel extension]
    xor eax,eax
    call sprintf wrt ..plt
    lea rdi,[rel buffer]
    lea rsi,[rel dna]
    mov rdx,10
    lea rcx,[rel dna]
    mov r8,34
    lea r9,[rel cmd]
    sub rsp,8
    mov eax,[rel i]
    push rax
    xor eax,eax
    call sprintf wrt ..plt
    add rsp,16
    lea rdi,[rel filename]
    lea rsi,[rel mode]
    call fopen wrt ..plt
    mov [rel file],rax
    test rax,rax
    jz error
    mov rdi,[rel file]
    lea rsi,[rel str]
    lea rdx,[rel buffer]
    call fprintf wrt ..plt
    mov rdi,[rel file]
    call fclose wrt ..plt
    cmp dword[rel i],0
    ja recursion
    add rsp,8
    mov eax,0
    ret
recursion:
    lea rdi,[rel cmd_buffer]
    lea rsi,[rel cmd]
    mov edx,[rel i]
    xor eax,eax
    call sprintf wrt ..plt
    lea rdi,[rel cmd_buffer]
    call system wrt ..plt
    test rax,rax
    jz error
error:
    add rsp,8
    mov eax,0
    ret
