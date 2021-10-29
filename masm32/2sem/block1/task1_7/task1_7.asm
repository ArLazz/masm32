include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_1_7  ' Ближайшее число, кратное семи  '",0
    
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    inint EAX
    mov ECX, EAX
    mov EBX, 7
    mov EDX, 0
    div EBX
    cmp EDX, 0
    jE s
    cmp EDX, 4
    jB m
    cmp EDX, 4
    jAE b
m:  mov EAX, ECX
    sub EAX, EDX
    jmp outt
b:  mov EAX, ECX
    add EAX, 7
    sub EAX, EDX
    jmp outt
s:  mov EAX, ECX
    jmp outt
outt:
    outword EAX
   
    pause 
    exit
end Start