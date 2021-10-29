include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_1   ",0
    N equ 5
    X db N dup(?)
    Y dW N dup(?)
    Z dd N dup(?)
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EAX, 0
L:  inint X[EAX]
    inc EAX
    cmp EAX, 5
    jNE L
    mov EAX, 0
H:  inint Y[2 * EAX]
    inc EAX
    cmp EAX, 5
    jNE H
    mov EAX, 0
    mov EBX, 0
    mov ECX, 0
K:  movsx EAX,X[ECX]
    movsx EBX,Y[2 * ECX]
    imul EBx 
    mov ESi,3 * N
    add ESI,ECX
    idiv ESI
    mov Z[4*ECX], EAX
    outint Z[4*ECX]
    outchar ' '
    inc ECX
    cmp ECX, 5 
    jNE K



pause 
    exit
end Start