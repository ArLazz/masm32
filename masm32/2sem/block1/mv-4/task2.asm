include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_2 "
.code

Replace_4_to_3 proc
    cmp EAX, 0
    jE @K
    push ECX
    push EBX
    push EDX
    mov EDX, 0
    mov EBX, 10
    div EBX
    mov ECX, EDX
    call Replace_4_to_3
    mul EBX
    cmp ECX, 4
    jNE @L
    add EAX, 3
    jmp @S
@L: add EAX, ECX
@S: pop EDX
    pop EBX
    pop ECX
@K: ret 0
Replace_4_to_3 endp

Start:
    ConsoleTitle offset T     
    inint EAX
    call Replace_4_to_3
    outword EAX
    pause                       
    exit 
end Start
