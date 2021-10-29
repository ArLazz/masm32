
include console.inc

.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_2 'Mатрицы'"
    MaxSize equ 150
    n db ?
    m db ?
    X dw MaxSize dup (?)
.code

OutMatr proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    mov EAX,[EBP + 8];offset X
    mov EDX,[EBP + 12];n
    mov ECX,[EBP + 16];m
    mov ESI, ECX
    mov EDI, 0
@O: mov BX, [EAX + 2 * EDI]
    outint BX,,' '
    inc EDI
    cmp EDI, ECX
    jNE @O
    newline
    add ECX, ESI
    dec EDX
    cmp EDX, 0
    jNE @O
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4 * 3
OutMatr endp

FirstMatr proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push ESI
    push EDI
    mov EAX,[EBP + 8];offset X
    mov EDX,[EBP + 12];n
    mov ECX,[EBP + 16];m
    mov EDI, 0
    mov ESI, ECX
    dec ECX
    mov EBX, 0
@I: cmp EDI, ECX
    jE @K
    push EBX
    mov BX,[EAX + 2 * EDI]
    push EDX
    mov DX, [EAX + 2 * EDI + 2]
    inc EDI
    cmp BX, DX
    pop EDX
    pop EBX
    jBE @I
    mov EDI, ECX
    jmp @C
@K: inc EBX
    outint EBX,, ' '
    dec EBX
@C: add ECX, ESI
    inc EDI
    dec EDX
    inc EBX
    cmp EDX, 0
    jNE @I
    newline
    pop EDI
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4 * 3
FirstMatr endp

SecondMatr proc
    push EBP
    mov EBP, ESP
    sub ESP, 4
    push ECX
    push EDX
    push EBX
    push EAX
    push ESI
    mov EBX, [EBP + 8];offset X
    mov EAX, [EBP + 16];m
    mov ECX, 0
    mov DL, 2
    div DL
    mov EDX, 0
    mov DL, AL
    mov [EBP - 4], EDX
@L: cmp ECX, [EBP + 12];n
    jE @ennd
    mov EAX, ECX
    inc ECX
    mov EDX, [EBP + 16];m
    mul EDX
    mov EDX, 0
@K: cmp EDX, [EBP - 4]
    jE @Q
    mov SI, word ptr [EBX + 2 * EAX]
    push EAX
    add EAX, [EBP + 16];m
    dec EAX
    sub EAX, EDX
    sub EAX, EDX
    cmp word ptr [EBX + 2 * EAX], SI
    jNE @E
    pop EAX
    inc EDX
    inc EAX
    jmp @K
@Q: outint ECX
    outstr ' '
    jmp @L
@E: pop EAX
    jmp @L
@ennd:
    pop ESI
    pop EAX
    pop EBX
    pop EDX
    pop ECX
    add ESP, 4
    pop EBP
    ret 4 * 3
SecondMatr endp

ThirdMatr proc
    push EBP
    mov EBP, ESP
    push ECX
    push EDX
    push EBX
    push EAX
    push ESI  
    mov EBX, [EBP + 8]
    mov ECX, -1
@L: inc ECX
    cmp ECX, [EBP + 16]
    jE @ennd
    mov EAX, ECX
    mov SI, word ptr [EBX + 2 * EAX]
    mov EDX, 0
@E:cmp EDX, [EBP + 12]
    jE @Q
    cmp word ptr [EBX + 2 * EAX], SI
    jNE @L    
    inc EDX
    add EAX, [EBP + 16]
    jmp @E
@Q: mov EAX, ECX
    inc EAX
    outint EAX
    outstr ' '
    jmp @L
@ennd:
    pop ESI
    pop EAX
    pop EBX
    pop EDX
    pop ECX
    pop EBP
    ret 4 * 3
ThirdMatr endp

FourthMatr proc
    push EBP
    mov EBP, ESP
    push EAX
    push ECX
    push EDX
    push EDI
    mov EAX,[EBP + 8];offset X
    mov EDX,[EBP + 12];n
    mov ECX, EDX
    mov EDI, 0
@I: mov BX, [EAX  + 2 * EDI]
    outint BX,, ' '
    add EDI, EDX
    inc EDI
    loop @I
    pop EDI
    pop EDX
    pop ECX
    pop EAX
    pop EBP
    ret 4 * 2
FourthMatr endp

FifthMatr proc    
    push EBP
    mov EBP, ESP
    push EAX
    push ECX
    push EDX
    push EDI
    mov EAX,[EBP + 8];offset X
    mov EDX,[EBP + 12];n
    mov ECX, EDX
    mov EDI, EDX
    dec EDI
@I: mov BX, [EAX  + 2 * EDI]
    outint BX,, ' '
    dec EDI
    add EDI, EDX
    loop @I
    pop EDI
    pop EDX
    pop ECX
    pop EAX
    pop EBP
    ret 4 * 2
FifthMatr endp
    
Start:
    ConsoleTitle offset T  
A:  inint n
    inint m
    mov EBX, 0
    cmp n, 1
    jE K
    cmp m, 1
    jE K
    cmp m, 0
    jE K
    cmp n, 0
    jE K
    mov AL, m
    mul n
    cmp AX, word ptr MaxSize
    jA K
    mov EBX, 1
K:  cmp EBX, 1
    jE nex
    outstrln 'Желаете ввести новые значения?(Y/N) '
    inchar CL
    inchar CL
    cmp CL, 'N'
    jE final
    jmp A
nex:mov ECX, 0
    mov EAX, 0
    mov AL, m
    mul n
L:  inint BX
    mov X[2 * ECX], BX
    inc ECX
    cmp EAX, ECX
    jNE L
    mov AL, m
    push EAX
    mov AL, n
    push EAX
    push offset X
    call OutMatr
    mov AL, m
    push EAX
    mov AL, n
    push EAX
    push offset X
    newline
    outstr 'номера (через пробелы) тех строк, элементы которых упорядочены по неубыванию '
    call FirstMatr
    mov AL, m
    push EAX
    mov AL, n
    push EAX
    push offset X
    newline
    outstr 'номера (через пробелы) всех симметричных строк матрицы '
    call SecondMatr
    mov AL, m
    push EAX
    mov AL, n
    push EAX
    push offset X
    newline
    outstr 'номера (через пробелы) тех столбцов, все элементы в которых одинаковые '
    call ThirdMatr
    mov AL, n
    mov AH, m
    cmp AL, AH
    jNE final
    mov EAX, 0
    mov AL, n
    push EAX
    push offset X
    newline
    outstr 'все элементы, находящиеся на главной диагонали (начиная с элемента верхней строки) '
    call FourthMatr
    mov AL, n
    push EAX
    push offset X
    newline
    outstr 'все элементы, находящиеся на побочной диагонали (начиная с элемента верхней строки) '
    call FifthMatr
final:
    pause 
    exit
end Start
