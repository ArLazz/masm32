
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
    
    mov ESI, 0      
    mov ECX, 0
    mov EDX, 1
  
G:  mov EBP, X[EDX * 4]
    cmp EBP, X[ECX * 4]
    jG H
    xchg EBP, X[EcX * 4]
    mov X[EDX * 4],EBP
    inc ESI
H:  inc ECX
    inc EDX
    cmp EDX, EAX
    jNE G
    cmp ESI, 0
    jE endd
    mov ESI, 0
    dec EAX
    mov EDX, 1
    mov ECX, 0
    cmp EAX, 1
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