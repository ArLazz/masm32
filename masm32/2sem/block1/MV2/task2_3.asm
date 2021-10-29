include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_3   ",0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    outword ESP
    newline
    inint EAX
    mov EDX, 0
L:  push EAX
    inc EDX 
    inint EAX
    cmp EAX, 0
    jNE L
    mov EAX, 0
    add EAx, [ESP]
    add EAX, [ESP + 4]
    mov EBx, EDX
    
G:  cmp EAX,[ESP + 4*EDX-4]
    jE H
    outword [ESP + 4*EDX-4]
    outchar ' '
H:  dec EDX
    cmp EDX, 0
    jNE G
K:  pop EDX
    dec EBX
    cmp EBX, 0
    jNE K
    newline
    outword ESP

    


pause 
    exit
end Start