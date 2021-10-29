include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_1_1 'Простое ли?'",0
    S db "СОСТАВНОЕ",0
    K db "ПРОСТОЕ",0
    N dd ?
.code
Start:
    ConsoleTitle offset T  
    mov ESI, offset K
    inint EAX, 'N = '
    cmp EAx, 2
    jE true
    cmp EAx, 3
    jE true
    mov EBX, 2 
    mov ECX, EAX
    mov EDX, 0
    div EBX
    mov EDI, EAX
    mov EAX, ECX
L:  mov ECX, EAX
    div EBX ; EDX := N mod EBX, EAX(N) := N div EBX
    cmp EDX, 0
    jE false
    mov EAX, ECX
    cmp EDI, EBX
    jE true
    inc EBX
    mov EDX, 0
    jmp L
false:
    mov ESI, offset S
true:
    outstr ESI

    pause 
    exit
end Start