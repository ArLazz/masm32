
include console.inc

.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_1 'Частоты вхождения букв'"
    N equ 100
    S db N dup (?)
    
.code

ReadText proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    mov EBX, [EBP + 8]
    mov EAX, 0
@L: inchar CL
    cmp CL, '.'
    jE @ennd
    mov [EBX + EAX], CL
    inc EAX
    jmp @L
@ennd:
    pop ECX
    pop EBX
    pop EBP
    ret 4
ReadText endp  
 
MaxLet proc
    push EBP
    mov EBP, ESP
    sub ESP, 28
    push ECX
    push EBX
    push EDX  
    mov ECX, 0
    mov EBX, 0
    mov EDX, [EBP + 8]
@L: cmp EBX, 28
    jE @Q
    mov byte ptr [EBP - 28 + EBX], 0
    inc EBX
    jmp @L   
@Q: mov EBX, 0
    mov BL,[EDX + ECX]
    sub BL, 'a'
    inc byte ptr [EBP - 28 + EBX]
    inc ECX
    cmp ECX, EAX
    jE @E
    jmp @Q 
@E: mov EBX, 0
    mov ECX, 0
@R: cmp ECX, 27
    jE @ennd
    cmp byte ptr [EBP - 28 + ECX], BL
    jA @H
    inc ECX
    jmp @R
@H: mov BL, byte ptr [EBP - 28 + ECX]
    mov EAX, ECX
    inc ECX
    jmp @R
@ennd:
    add AL, 'a'
    pop EDX
    pop EBX
    pop ECX
    add ESP, 28
    pop EBP
    ret 4
MaxLet endp

Start:
    ConsoleTitle offset T  
    push offset S
    call ReadText
    push offset S
    call MaxLet
    outchar AL
    pause 
    exit
end Start
