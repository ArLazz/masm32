include console.inc
.data
    T db "������� ����� (������ 111)"
      db "Task_1_3 '������ ������'",0
    S db "���",0
    K db "��",0
    N db ?
.code
Start:
    ConsoleTitle offset T  
    
    mov EDX, offset S
    mov EBX, 0
L:  cmp EBX, 0
    jL ennd
    inchar N
    mov AL, N
    cmp AL, '.'
    jE ennd
    cmp AL, '('
    jE plus
    cmp AL, ')'
    jE minus
    jmp L
plus:
    inc EBX
    jmp L
    outint 0
minus:
    dec EBX
    jmp L
ennd:
    cmp EBX, 0
    jNE out1
    mov EDX, offset K
out1:
    outstr EDX
    
    
    pause 
    exit
end Start