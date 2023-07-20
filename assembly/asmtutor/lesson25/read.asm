%include './lesson17/functions.asm'

SECTION .data
filename db './lesson25/readme.txt', 0h
contents db 'Hello world!', 0h

SECTION .bss
fileContents resb 255

SECTION .text
global _start
_start:
    mov ecx, 0777o
    mov ebx, filename
    mov eax, 8 ; 8是创建
    int 80h ; 执行完后会返回file descriptor，并存在eax

    mov edx, 12
    mov ecx, contents
    mov ebx, eax ; 将eax取出来放到ebx中
    mov eax, 4 ; 写入
    int 80h

    mov ecx, 0
    mov ebx, filename
    mov eax, 5 ; 打开
    int 80h ; 同样会返回fd存在eax中

    mov edx, 12
    mov ecx, fileContents
    mov ebx, eax ; 将fd放到ebx中
    mov eax, 3 ; 读取
    int 80h

    mov eax, fileContents
    call sprintLF

    call quit