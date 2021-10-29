include console.inc
.data
    T db "Лазарев Артур (группа 111)"
      db "Task_2_3  ' Картинка   '",0
    S db 20 dup('-'),0
.code
Start:
    ConsoleTitle offset T   ;EDX := N mod EBX, EAX(N) := N div EBX
    inint EAX
    mov S[EAX], 0
    dec EAX
L:  mov S[eax], '*'
    outstrln offset S
    cmp EAX, 0
    jE endd
    dec EAX
    jmp L
endd:
   
    pause 
    exit
end Start