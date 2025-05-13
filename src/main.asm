ORG 0x7C00  ; tells the assembler to do the addressing from this location
BITS 16     ; 16 bits mode



main:
    mov ax, 0
    mov ds, ax
    mov es, ax
    mov ss, ax

    mov sp, 0x7C00 ; start the stack from this location
    mov si, os_boot_msg
    call print
    HLT



halt:
    JMP halt


print:
    push si
    push ax
    push bx

print_loop:
    LODSB   ; loads single byte from current location in SI register and puts in AL register
    OR al, al
    JZ done_print

    mov ah, 0x0E    ; interrupt to print a character to the screen
    mov bh, 0       ; page number argument
    int 0x10        ; video interrupt

    JMP print_loop

done_print:
    pop bx
    pop ax
    pop si
    ret


os_boot_msg: DB 'Welcome to Guava OS', 0x0D, 0x0A, 0

;
TIMES 510-($-$$) DB 0   ; write 0 until byte 510
DW 0AA55h   ; Define Word, write signature expected by BIOS