
include console.inc
;на EBX и EDX помещаю первую и вторую половину соответсвенно
;переворачиваю EDX и сравнивую его с EBX
;дальше вывод
.data
    T db "Ћазарев јртур (группа 111)"
      db "Task_5_2 "
   
.code

Start:
    ConsoleTitle offset T  
    mov ECX, 32
    mov EAX, 0
    mov EDX, 0
    mov EBX, 4
L:  inchar DL
    sub DL, '0'
    shl EAX, 1
    or EAX, EDX
    dec EBX
    cmp EBX, 0
    jNE I
    inchar DL
    mov EBX, 4 
I:  loop L
    mov EBX, EAX
    mov EDX, EAX
    and EBX,1111111111111111b 
    mov ECX, 32
    mov ESI, 0
U:  SHL EDX, 1
    RCR ESI, 1
    loop U
    mov EDX,ESI
    and EDX,1111111111111111b 
    cmp DX, BX
    jNE N
    mov ECX, 16
E:  SHL DX, 1
    dec ECX
    jE S
    jNC E
G:  SHR DX, 1
    inc ECX
    cmp ECX, 16
    jNE G
S:  mov BX, DX
    mov ECX, 16
    mov SI, 0
D:  SHL DX, 1
    RCR SI, 1
    loop D
    mov DX,SI
    mov ECX, 16
R:  SHL EDX, 1
    loop R
    xor EAX, EAX
    or EAX, EDX
    or AX, BX
    outstrln '—»ћћ≈“–»„Ќќ'
    jmp fin
N:  mov EDX, EAX
    and EDX, 2147483648
    ROL EDX, 1
    mov ECX, EAX
    and ECX, 1b
    ROR ECX, 1b
    and EAX, not 2147483649
    or EAX, EDX
    or EAX, ECX
    outstrln 'Ќ≈—»ћћ≈“–»„Ќќ '
fin:mov ECX, 32
    ROL EAX, 1
    mov EDI, 0
Y:  mov DL,AL
    and DL, 1b
    outint DL
    inc EDI
    cmp EDI, 4
    jNE W
    outchar ' '
    mov EDI, 0
W:  ROL EAX, 1
    dec ECX
    cmp ECX, 0
    jNE Y
    pause 
    exit
end Start
