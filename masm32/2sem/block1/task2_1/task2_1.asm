include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_1  ' Первые вхождения   '",0
    LAT db 26 dup(0)
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EAX, 0
L:  cmp AL, '.'
    jE endd
    sub AL,'A'
    cmp LAT[EAX], 0
    jE true
    inchar AL
    jmp L
    
true:
    inc LAT[EAX]
    add AL, 'A'
    outchar AL
    inchar AL
    jmp L
endd:   
    
    
   
    pause 
    exit
end Start