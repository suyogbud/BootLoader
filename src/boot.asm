[BITS 16]
[ORG 0x7c00]

start:
  cli; Clear Interrupts
  mov ax, 0x00
  mov ds, ax
  mov es, ax
  mov ss, ax
  mov sp, 0x7c00
  sti; Enable Interrupts
  mov si, msg

print:
  lodsb; Loads byte at ds:si to AL register and increment SI
  cmp al, 0
  je done
  mov ah, 0x0E
  int 0x10
  jmp print

done:
  cli
  hlt ;Halting --Stoping CPU execution--

msg: db "Hello World!", 0

;GDT Implementation

gdt_start:
  db 0x00000000
  db 0x00000000

  ;Code segment descriptor
  dw 0xFFFF ;Limit
  dw 0x0000 ;Base
  db 0x00   ;Base
  db 1

times 510 - ($ - $$) db 0

dw 0xAA55

