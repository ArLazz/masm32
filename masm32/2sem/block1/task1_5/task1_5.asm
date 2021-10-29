include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_1_5  '  Произведение старшей и младшей десятичных цифр '",0
    P dd ?
    Q dd ?
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    inint EAX
    mov EBX, 10
    mov EDX, 0
    div EBX
    cmp EAX, 0
    jE one
    mov ECX, EDX
L:  mov EDX, 0
    div EBX 
    cmp EAX,0
    jE two
    jmp L 
one:mov EAX, EDX
    mul EDX
    jmp outt
two:mov EAX, EDX
    mul ECX
outt:
    outint EAX

    pause 
    exit
end Start