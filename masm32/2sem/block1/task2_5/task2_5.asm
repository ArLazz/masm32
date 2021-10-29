include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_5  ' Беззнаковое 16-е число   '",0
    S db 11 dup(0),0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov ESI,offset S
    mov ECX, 10
    mov EBX, 16
    inint EAX
L:  mov EDX, 0
    div EBX
    cmp EDX, 9
    jA O  
    add EDX, '0'
    jmp K
O:  sub EDX, 10
    add EDX, 'A'
    jmp K   
K:  mov S[ECX], DL
    cmp EAX, 0
    loopne L
    add ESI, ECX
    add ESI, 1
    outstr ESI     
        
    pause 
    exit
end Start