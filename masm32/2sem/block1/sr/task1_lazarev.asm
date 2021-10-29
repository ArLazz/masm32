include console.inc

COMMENT *

—јћќ—“ќя“≈Ћ№Ќјя –јЅќ“ј 14
—“”ƒ≈Ќ“ Ћазарев     группа 111

*

COMMENT *

 «јƒј„ј_1 
 ќписать процедуру Assign(A,B), реализующую следующее действие: 
 B := (A-13) mod B 
 «десь A Ц двойное слово с/зн, B Ц байт с/зн. 
 ѕараметр ј передаЄтс€ по значению через регистр EAX.  
 ѕараметр ¬ передаЄтс€ по ссылке через регистр EBX. 
 ¬ыписать обращение к этой процедуре дл€ переменных A и B,
 описание которых приведено в секции данных (предварительно
 ввести значени€ этих переменных, а после  обращени€ к процедуре
 - вывести новое значение переменной ¬.

*
.data

T   db " ‘јћ»Ћ»я Ћј«ј–≈¬ »ћя ј–“”–   «адача_1 (с-р 14)",0		
.data
A   dd ?  ; c/зн
B   db ?  ; с/зн
.code
Assign proc
    push EDX
    push ECX
    sub EAX, 13
    mov CL, [EBX]
    movsx EBX, CL
    mov EDX, 0
    idiv EBX
    mov B,DL
    outint B
    pop ECX
    pop EDX
    ret 4*1
Assign endp
Start:
    ConsoleTitle offset T	
    inintln A
    inintln B
    mov EAX, A
    mov EBX, offset B
    call Assign
    pause						; нужно при сдаче по e-mail
    exit						
end Start
