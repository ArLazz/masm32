include console.inc
.data
  T db "Лазарев Артур (группа 111)"
    db "Task_1_1 'Степень тройки'"
  X db -1  
.code
Start:
  ConsoleTitle offset T  
mov EAX, 0
neg X
outintln X
mov EBX, dword ptr X
outintln EBX    
sub EAX, dword ptr X
outintln EAX
 
  pause 
  exit
end Start
