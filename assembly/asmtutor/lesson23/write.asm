%include './lesson17/functions.asm'

SECTION .data
filename db './lesson23/readme.txt', 0h
contents db 'Hello World!', 0h

SECTION .text
global _start
_start:
    mov ecx, 0777o
    mov ebx, filename
    mov eax, 8
    int 80h

    call iprintLF
    mov edx, 12
    mov ecx, contents
    mov ebx, eax
    mov eax, 4
    int 80h

    call quit