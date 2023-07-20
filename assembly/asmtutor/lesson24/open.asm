%include './lesson17/functions.asm'

SECTION .data
filename db './lesson24/readme.txt', 0h
contents db 'Hello world!', 0h

SECTION .text
global _start

_start:
    mov ecx, 0777o
    mov ebx, filename
    mov eax, 8
    int 80h

    mov edx, 12
    mov ecx, contents
    mov ebx, eax
    mov eax, 4
    int 80h

    mov ecx, 0
    mov ebx, filename
    mov eax, 5
    int 80h

    call iprintLF

    call quit