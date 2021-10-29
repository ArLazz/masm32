include console.inc
.data
  T db "Лазарев Артур (группа 111)"
    db "Task_1_1 'Степень тройки'"
  N dd ?
.code
Start:
  ConsoleTitle offset T  
  inint EAX, 'N = '
  mov EBX, 3 
  mov ECX, 0 
L:
  cmp EAX, 1
  jE plus
  mov EDX, 0
  div EBX
  cmp EDX, 0
  jNE minus
  inc ECX
  jmp L;
minus:
  mov ECX, -1
plus:
  outint ECX,, 'k = '
  pause 
  exit
end Start
