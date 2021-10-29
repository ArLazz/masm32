
include console.inc

.data
    T db "Лазарев Артур (группа 111)"
      db "Task_5_1 "
   
.code
Start:
    ConsoleTitle offset T  
    xor EAX, EAX
    xor EDX, EDX
L:  inchar DL
    cmp DL, ' '
    jE ennd
    sub DL,'0'
    SHL EAX, 1
    or EAX, EDX
    jmp L
ennd:
    mov ECX, 32
O:  rol EAX, 1
    mov DL, AL
    and DL, 1
    loopz O
    cmp ECX, 0
    jE E
Q:  outword DL
    rol EAX, 1
    mov EDX, EAX
    and DL, 1
    loop Q
E:  outword DL
    pause 
    exit
end Start
