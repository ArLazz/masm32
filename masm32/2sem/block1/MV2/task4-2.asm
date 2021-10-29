include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_2   ",0
    N equ 5
    X dw N dup (N dup (?))
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EAX, 0
H:  mov EBX, 0
L:  inint X[EAX + 2 * EBX]
    inc EBX
    cmp EBx, 5
    jNE L
    add EAX, 10
    cmp EAX, 50
    jNE H
    mov EAX, 0
    mov EBX, 0
    mov EDX, 0
    mov ECX, 0
    mov ESI, 0
S:  mov EBX, 0    
K:  cmp SI, X[EAX + 2 * EBX]
    jA P
    mov SI, X[EAX + 2 * EBX]
    mov EDX, EAX
    add EDX, EBX
    add EDX, EBX
P:  inc EBX
    cmp EBX, 5
    jNE K
    xchg X[EAX + 2 * ECX], SI
    mov X[EDX], SI
    mov EDX, 0  
    mov ESI, 0
    inc ECX
    add EAX, 10
    cmp ECX, 5
    jNE S
    mov EAX, 0
    mov EBX, 0
I:  mov EBX, 0
    newline
O:  outword X[EAX + 2 * EBX]
    outchar ' '
    inc EBX
    cmp EBx, 5
    jNE O
    add EAX, 10
    cmp EAX, 50
    jNE I


pause 
    exit
end Start