include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_1_6  ' Пятеричное число '",0
    
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EAX, 0
    mov EBX, 0
L:  inchar BL
    cmp BL, ' '
    jE endd
    sub BL, '0'
    mov EDX, 5
    mul EDX
    add EAX, EBX
    jmp L
endd:
    outword EAX
   
    pause 
    exit
end Start