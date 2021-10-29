include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_4_2   ",0
    X db 255 dup (?),0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EAX, 0
    mov EBX, 0
    mov ECX, 1
L:  inint AH
    cmp AH, 0
    jE ennd
    mov X[ECX], AH
    inc ECX
    jmp L
ennd:
    dec ECX
    outstrln 'вывод для а):' 
    mov EAX, ECX
K:  cmp X[ECX], BL
    jBE G
    outint X[ECX]
    outchar ' '
    outint ECX
    newline
    mov BL, X[ECX]
G:  dec ECX
    cmp ECX, 0
    jNE K
    outstrln 'вывод для б):'
    mov EBX, 0
    mov ECX, EAX
P:  cmp X[ECX], BL
    jBE O
    cmp X[ECX], BL
    jA C
C:  mov BL, X[ECX]
    jmp N
O:  mov X[ECX], 0

N:  dec ECX
    cmp ECX, 0
    jNE P
    inc EAX
U:  cmp X[ECX], 0
    jE H
    outint X[ECX]
    outchar ' '
    outint ECX
    newline
H:  inc ECX
    cmp ECX, EAX
    jNE U



pause 
    exit
end Start