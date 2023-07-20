%include './lesson17/functions.asm'

SECTION .data
filename db './lesson28/readme.txt', 0h

SECTION .text
global _start
_start:
    mov ebx, filename
    mov eax, 10
    int 80h

    call quit