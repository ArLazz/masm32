include console.inc
.data
  T db "Лазарев Артур (группа 111)"
    db "Task_1_1 'Степень тройки'"
    N equ 1
.code
Start:
  ConsoleTitle offset T  
    mov EAX, type N
    outintln EAX
    
 
  pause 
  exit
end Start
