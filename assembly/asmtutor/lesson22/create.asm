%include './lesson17/functions.asm'

SECTION .data
filename db './lesson22/readme.txt', 0h

SECTION .text
global _start
_start:
    mov ecx, 0777o
    mov ebx, filename
    mov eax, 8
    int 80h
    call quit