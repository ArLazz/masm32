include console.inc
.data
    T db "Ћазарев јртур (группа 111)"
      db "Task_1_9  '  ѕерва€ и последн€€ буквы  '",0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov ECX, 0
H:  inchar AL
    mov BL, AL
L:  inchar AH
    cmp AH, ','
    jE sr1
    cmp AH, '.'
    jE sr2
    mov BL, AH
    jmp L
sr1:cmp AL, BL
    jNE H
    inc ECX
    jmp H
sr2:
    cmp AL, BL
    jNE endd
    inc ECX
    jmp endd
endd:
    outint ECX
    
    
    
    pause 
    exit
end Start