include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_4  ' Знаковое 10-е число   '",0
    S db 11 dup(0),0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov ESI,offset S
    mov ECX, 10
    mov EBX, 10
    inint EAX
    cmp EAX, 0
    jG L
    neg EAX
    outchar '-'
    jmp L
K:  outchar '+'   
L:  mov EDX, 0
    div EBX
    add EDX, '0'  
    mov S[ECX], DL
    cmp EAX, 0
    loopne L
    add ESI, ECX
    add ESI, 1
    outstrln ESI     
    pause 
    exit
end Start