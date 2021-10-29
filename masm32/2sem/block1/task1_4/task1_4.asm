include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_1_4  ' Дробь P/Q '",0
    P dd ?
    Q dd ?
.code
Start:
    ConsoleTitle offset T  
    inint EAX
    inint EBX
    mov EDX, 0
    div EBX ; EDX := N mod EBX, EAX(N) := N div EBX
    outword EAX
    outchar '.'
    mov ECX, 5
L:  dec ECX
    mov EAX, 10
    mul EDX
    div EBX
    outint EAX
    cmp ECX, 0
    jNE L

    pause 
    exit
end Start