
include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_6  ' Сортировка выбором   '",0
    N equ 30
    X dd N dup(?),0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    inint EAX
    mov EDI, EAX
    mov X[EAX * 4], 0
    mov ECX, 0
L:  inint EBX
    mov X[ECX * 4], EBX
    inc ECX
    cmp ECX, EAX
    jNE L       
    mov ECX, 0
    mov EDX, X[ECX * 4]
    mov ESI, ECX
G:  cmp EDX, X[ECX * 4]
    jG H
    mov EDX, X[ECX * 4]
    mov ESI, ECX
H:  inc ECX
    cmp ECX, EAX
    jNE G
    
    dec EAX
    mov EBP, X[EAX * 4]
    xchg EBP,X[ESI * 4]
    mov X[EAX * 4], EBP
    mov ECX, 0
    mov EDX, X[ECX]
    mov ESI, ECX
    cmp EAX, 0
    jE endd
    jmp G
endd:   
    mov ECX, 0
K:  outint X[ECX * 4]
    OUTCHAR ' '
    inc ECX
    cmp ECX, EDI
    jNE K
    
    
    pause 
    exit
end Start