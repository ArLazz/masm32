include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_1_8  '  Алгебраическая сумма  '",0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EBX, 0
    inchar BL
    sub BL, '0'
L:  inchar AH
    cmp AH, '+'
    jE plus
    cmp AH, '-'
    jE minus
    cmp AH, '.'
    jE endd
plus:inchar AH
    sub AH, '0'    
    movzx EAX, AH
    add EBX,EAX
    jmp L
minus:
    inchar AH
    sub AH, '0'
    movzx EAX, AH
    sub EBX, EAX
    jmp L
endd:
    outint EBX
    pause 
    exit
end Start