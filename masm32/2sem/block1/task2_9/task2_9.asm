
include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_9  ' Минимальный элемент матрицы  '",0
    N equ 4
    M equ 6
    A dd N dup(M dup(?))
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov ECX, N*M
    mov EBX, 0
    inint EDX 
    mov A[EBX * 4] , EDX
    inc EBX
    mov EBP, 1
L:  inint EAX
    mov A[EBX * 4], EAX
    cmp A[EBX * 4], EDX
    jNE S
    inc EBP
S:  cmp A[EBX * 4], EDX
    jGE G
    mov EDX, A[EBX * 4]
    mov EBP, 1
    
    
G:  inc EBX
    cmp EBX, ECX
    jNe L
    
    
    outstr 'минимальный элемент '
    outint EDX
    outstr ' входит '
    outint EBP
    outstr ' раз'
    newline
    outstr 'индексы его вхождений:'
    mov EAX, 0
    mov EBX, 0
    mov EBP, 0
H:  mov EBP, EAX
    add EBP, EBX
    add EBP, EBX
    add EBP, EBX
    add EBP, EBX
    add EBP, EBX
    add EBP, EBX
    cmp A[EBP * 4], EDX
    jNE O
    outstr ' ['
    inc EBX
    outint EBX
    dec EBX
    outchar ','
    inc EAX
    outint EAX
    dec EAX
    outstr '] '
O:  inc EAX
    cmp EAX, M
    jE K
    cmp EAX, M
    jNE H
K:  mov EAX, 0
    inc EBX
    cmp EBX, N
    jNE H
    pause 
    exit
end Start