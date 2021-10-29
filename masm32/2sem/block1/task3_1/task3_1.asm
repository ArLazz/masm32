
include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_3_1  ' Алгебраическая сумма   '",0
    
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EAX, 0
L:  inchar AL
    cmp AL, '.'
    jE endd
    cmp AL, '('
    jE L
    cmp AL, ')'
    jNE K
    pop EBX
    pop ECX
    pop EDX 
    sub EBX, '0'
    sub EDX, '0'
    cmp ECX, '+'
    jE S
    sub EDX, EBX
    add EDX, '0'
    mov EAX, EDX
    jmp K
S:  add EDX, EBX
    add EDX, '0'
    mov EAX, EDX
K:  push EAX

    jmp L
endd:
    pop EAX
    sub EAX, '0'
    outint EAX
    
    pause 
    exit
end Start