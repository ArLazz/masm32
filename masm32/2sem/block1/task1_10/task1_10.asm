include console.inc
.data
    T db "Ћазарев јртур (группа 111)"
      db "Task_1_9  '  ѕерва€ и последн€€ буквы  '",0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    outchar ' '
    outchar ' '
    outchar '|'
    mov AL, 0
L:  outint AL,3
    inc AL
    cmp AL, 10
    jNE L
newline
    mov AH, 0
H:  outchar '-'
    inc AH
    cmp AH, 33
    jNE H
    mov AL, 0
    mov AH, 0
    mov BH, 0
    newline
G:  outint AL,2
    outchar '|'
    mov AH, 0
    outint AH, 3
K:  add AH, AL
    outint AH, 3
    inc BH
    cmp BH, 9
    jNE K
    mov BH, 0
    inc AL
    newline
    cmp AL, 10
    jNE G

    
    pause 
    exit
end Start