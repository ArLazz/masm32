
include console.inc

.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_2 'Mатрицы'"
    S dd ?
.code

MaxDig proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDX
    mov EDX, 0
    mov ECX, 10
    mov EAX, [EBP + 8]
    cmp EAX, 10
    jAE @K
    mov EAX, EAX
    jmp @ennd    
@K: div ECX
    push EAX
    call MaxDig
    cmp EDX, EAX
    jA @O
    jmp @ennd
@O: mov EAX, EDX
    jmp @ennd
@ennd:
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4
MaxDig endp

Start:
    ConsoleTitle offset T  
    inint S
    mov EAX, S
    push EAX
    mov EAX, 0
    call MaxDig
    outint EAX
    pause 
    exit
end Start
