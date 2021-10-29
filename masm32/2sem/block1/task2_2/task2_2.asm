include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_1  ' Первые вхождения   '",0
    z2 db 'неуд',0
    z3 db 'удовл',0
    z4 db 'хорошо',0
    z5 db 'отлично',0
    adr dd z2,z3,z4,z5
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    inint EBX
    sub EBX, 2
    mov EBX, adr[4*EBX]
    outstr EBX
    
   
    pause 
    exit
end Start