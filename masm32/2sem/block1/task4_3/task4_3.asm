
include console.inc

.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_2 'Mатрицы'"
    S1 dd ?
    S2 db ?
.code

OUTD1 proc
    push EDX
    mov ESI, ESP
@L: mov EDX, 0
    div EBX
    push EDX
    cmp EAX, 0
    jNE @L
@K: pop EAX
    outint EAX
    cmp ESP,ESI
    jNE @K
    pop EDX
    ret
OUTD1 endp

OUTD2 proc
    push EDX
    mov EDX, 0
    cmp EAX, EBX
    JAE @K
    outint EAX
    jmp @endd
@K: div EBX
    call OUTD2
    outint EDX
@endd:
    pop EDX
    ret
OUTD2 endp

Start:
    ConsoleTitle offset T  
    inint S1
    inint S2
    mov EBX, 0
    mov EAX, S1
    mov BL, S2
    call OUTD1
    newline
    mov EAX, S1
    call OUTD2
    pause 
    exit
end Start
