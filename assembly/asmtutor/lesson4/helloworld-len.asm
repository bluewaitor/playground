SECTION .data
msg db 'Hello, brave new world!', 0Ah

SECTION .text
global _start
_start:
    mov eax, msg
    call strlen ; 调用方法

    mov edx, eax
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

    mov ebx, 0
    mov eax, 1
    int 80h

strlen: ; 会先将调用的地址push进栈
    push ebx ; 将ebx的值push进栈
    mov ebx, eax ; 将eax的值赋给ebx，此时eax和ebx都指向msg
nextchar:
    cmp byte [eax], 0 ; 和lesson3一样
    jz finished
    inc eax
    jmp nextchar
finished:
    sub eax, ebx
    pop ebx ; 恢复ebx的值
    ret ; 恢复调用的地址，返回到调用方法的地方
    