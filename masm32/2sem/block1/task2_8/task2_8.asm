
include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_8  ' Палиндром?   '",0
    N equ 30
    X db N dup(?),0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    mov EBX, 0
    mov EAX, 0
L:  inchar AL
    cmp AL, '.'
    jE ennd
    cmp AL, ' '
    jE L
    cmp AL, 'a'
    jAE S
    sub AL, 'A'
    mov X[EBX],AL
    inc EBX
    jmp L 
S:  sub AL, 'a'
    mov X[EBx],AL
    inc EBX
    jmp L
ennd:  
    mov EDX, EBX
    dec EDX
    mov ECX, 0
    cmp EDX, 0
    jE out2
G:  mov BL, X[ECX]
    cmp BL, X[EDX]
    jNE out1
    inc ECX
    dec EDX
    cmp ECX, EDX
    jAE out2
    jmp G
out1:
    outstr 'не '
out2:
    outstr 'палиндром'
    
    
    pause 
    exit
end Start