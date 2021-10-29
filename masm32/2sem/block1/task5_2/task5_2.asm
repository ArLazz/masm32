
include console.inc

.data
    T db "Лазарев Артур (группа 111)"
      db "Task_5_2 "
   dig16 db '0123456789ABCDEF'
.code
Start:
    ConsoleTitle offset T  
    xor EAX, EAX
    xor EDX, EDX
L:  inchar DL
    cmp DL, ' '
    jE fin
    cmp DL, 'A'
    jB chi
    sub DL, 'A'
    add DL, 10
    jmp nex
chi:sub DL,'0'
nex:and DL,1111b
    SHL EAX, 4
    or EAX, EDX
    jmp L
fin:mov ECX, 8
I:  rol EAX, 4
    mov EBX, EAX
    and EBX, 1111b   
    outchar dig16[EBX]
    loop I
    pause 
    exit
end Start
