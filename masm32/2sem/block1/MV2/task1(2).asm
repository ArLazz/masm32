include console.inc
.data
    T db "������� ����� (������ 111)"
      db "������-1 �������-2   ",0
    LAT db 26 dup(0),0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    inint EAX
    mov EAX, 0
L:  cmp AL, '.'
    jE endd
    sub AL,'a'
    cmp LAT[EAX], 0
    jE true
    inchar AL
    jmp L
    
true:
    inc LAT[EAX]
    inchar AL
    jmp L
endd:   
    mov EAX, 0
    mov EBX, 0
H:  add BL, LAT[EAX]
    inc EAX
    cmp EAX, 26
    jNE H
    outint BL

pause 
    exit
end Start