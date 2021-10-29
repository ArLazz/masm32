
include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_3_2  ' max/min   '",0
    
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EAX, 0
L:  inchar AL
    cmp AL, '.'
    jE endd
    cmp AL, '('
    jE L
    cmp AL, ','
    jE L
    cmp AL, ')'
    jNE K
    pop EDX
    pop ECX
    pop EBX 
    sub ECX, '0'
    sub EDX, '0'
    cmp EBX, 'M'
    jE S
    cmp ECX, EDX
    JA U
    add ECX, '0'
    mov EAX, ECX
    jmp K
U:  add EDX, '0'
    mov EAX, EDX
    jmp K
S:  cmp ECX, EDX
    jA I
    add EDX, '0'
    mov EAX, EDX
    jmp K
I:  add ECX, '0'
    mov EAX, ECX
K:  push EAX

    jmp L
endd:
    pop EAX
    sub EAX, '0'
    outint EAX
    
    pause 
    exit
end Start