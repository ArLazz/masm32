include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_add ",0
    s0 db " 000 0   00   00   0 000 "
    s1 db "  1   11    1    1   111 "
    s2 db " 222 2   2   2  22  22222"
    s3 db "3333     3 333     33333 "
    s4 db "4   44   444444    4    4"
    s5 db "555555    5555     55555 "
    s6 db " 666 6    6666 6   6 666 "
    s7 db "77777    7   7   7   7   "
    s8 db " 888 8   8 888 8   8 888 "
    s9 db " 999 9   9 9999    9 999 "
    t1 db 60 dup(' '),0
    t2 db 60 dup(' '),0
    t3 db 60 dup(' '),0
    t4 db 60 dup(' '),0; ESP
    t5 db 60 dup(' '),0
.code

Start:
    ConsoleTitle offset T     
    inint EAX
    mov ECX, 10
    mov EDI, 0
    mov EBX, EAX
    mov EDX, 0
J:  div ECX
    push EDX
    inc EDI
    cmp EAX,0
    jNE J
    mov ECX,offset s0
    mov EDI,offset t1
    mov EBX, 0
    mov ESI, 0
    mov EBP, 25
T1: mov EAX,[ESP + EBX * 4]
    mul EBP
    add EAX,ESI
    add EBX,ESI
    mov EAX,[ECX + EAX]
    mov [EDI + EBX],EAX
    sub EDX,ESI
    add EBX, 5
    inc ESI
    cmp ESI, 4
    jNE T1
    outstr offset t1
    pause                       
    exit 
end Start
