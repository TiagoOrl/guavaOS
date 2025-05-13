ORG 0x7C00  ; tells the assembler to do the addressing from this location
BITS 16     ; 16 bits mode



main:
    HLT



halt:
    JMP halt

;
TIMES 510-($-$$) DB 0   ; write 0 until byte 510
DW 0AA55h   ; Define Word, write signature expected by BIOS