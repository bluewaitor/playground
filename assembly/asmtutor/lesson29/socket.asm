%include './lesson17/functions.asm'

SECTION .text
global _start
_start:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
_socket:
    push byte 6
    push byte 1
    push byte 2
    mov ecx, esp
    mov ebx, 1
    mov eax, 102
    int 80h
    call iprintLF
_exit:
    call quit