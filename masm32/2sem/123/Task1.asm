include console.inc
COMMENT *
	EAX = N
	EBX = 3
	ECX = K
*
.data
T   db " Коржин Алексей (группа 111)     " 
    db " Задача_1 (блок_1) 'Степень тройки' ",0      
N   dd ?

.code
Start:
    ConsoleTitle offset T       
    inint EAX, 'N = '; Ввод N
    mov EBX, 3; делитель
	mov ECX, 0; K := 0
	
L:  cmp EAX, 1
	jE tru; if N = 1 goto print
	mov EDX, 0
	div EBX; EDX := N mod 3, EAX(N) := N div 3
    cmp EDX, 0;
	jNE fal; if N mod 3 <> 0 goto false
	inc ECX; K := K + 1
	jmp L; в начало цикла
	
fal:mov ECX, -1
tru:outint ECX,,'K = '

    pause                   
    exit
    end Start
