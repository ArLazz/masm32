include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_1 "
    Max_Len equ 20
    X dd Max_Len dup(?)
    N dd ?
.code
InArr proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    mov ECX,[EBP + 8]
    mov EAX, 0
@J: inint EBX
    cmp EBX, 0
    jE @ennd
    mov [ECX + EAX * 4],EBX
    inc EAX
    cmp EAX, 20
    jNE @J
@ennd:  
    pop ECX
    pop EBX
    pop EBP
    ret 4
InArr endp    
 
OutArr proc    
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    mov EBX, 0
    mov ECX, [EBP + 8]
    mov EAX, [EBP + 12]
    newline
@L: outword [ECX + EBX * 4]
    outchar ' ' 
    inc EBX
    cmp EBX, EAX
    jNE @L
    pop ECX
    pop EBX
    pop EBP
    ret 4 * 2
OutArr endp

Invert proc
    push EBP
    mov EBP,ESP
    push EBX
    push ECX
    push EDX
    push ESI
    mov EBX, 2
    mov EDX, 0
    mov EAX, [EBP + 12]
    div EBX
    mov EDX, EAX
    mov EBX, 0
    mov ECX, [EBP + 8]
    mov EAX, [EBP + 12]
    dec EAX
@O: mov ESI, [ECX + 4 * EBX]
    sub EAX, EBX
    xchg ESI, [ECX + 4 * EAX]
    mov [ECX + 4 * EBX], ESI
    add EAX, EBX
    inc EBX
    cmp EBX, EDX
    jNE @O
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4 * 2
Invert endp

IsSame proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDX
    push ESI
    push EAX 
    push EDI
    mov EDX, [EBP + 12]
    mov ESI, [EBP + 8]
    dec EDX
    mov AL, 0
    mov ECX, 0
@L1:inc EDX
    mov EDI, ECX
    inc EDI
    mov EBX,[ESI + ECX * 4]
@L2:cmp EBX, [ESI + EDI * 4]
    jE @ennd
    inc EDI
    cmp EDI, EDX
    jNE @L2
    inc ECX
    dec EDX
    cmp ECX, EDX
    jNE @L1
    jmp @fin
@ennd:
    mov AL, 1
@fin:
    pop EDI
    pop ESI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4 * 2
IsSame endp  
  
Start:
    ConsoleTitle offset T  
    push offset X
    call InArr
    mov N, EAX
    push EAX
    push offset X
    call OutArr
    push EAX
    push offset X
    call Invert
    mov EAX, N
    push EAX
    push offset X
    call OutArr
    push N
    push offset X
    call IsSame
    newline 
    cmp AL, 1
    jNE K
    outstr 'есть совпадения'
    jmp ennd
K:  outstr 'нет совпадений'
ennd:
    pause 
    exit
end Start
