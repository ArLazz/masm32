include console.inc

COMMENT *

САМОСТОЯТЕЛЬНАЯ РАБОТА 14
СТУДЕНТ Лазарев     группа Артур

*

COMMENT *

 ЗАДАЧА_2 
 Пусть на языке Free Pascal даны следующие описания:
 const
    N = 10
    vector = array [1..N] of longint;
 Описать процедуру Sum(X,N) со стандартными соглашениями о связях stdcall
 при следующих условиях:
 X - массив типа vector, N - размерность этого массива 
 Процедура преобразует массив Х по следующему правилу: 
 for i:= 1 to N-1 do X[i]:= X[i]+X[N]

 Выписать обращение к этой процедуре для массива Y, описание которого
 дано в секции данных этой программы, а после  обращения к процедуре
  - вывести массив Y после изменений (вывод можно осуществить напрямую, 
  не описывая для этого специальной процедуры, т.к. вывод здесь нужен
  только для контроля правильности работы процедуры Sum).

*
.data

T   db " ФАМИЛИЯ ЛАЗАРЕВ ИМЯ АРТУР   Задача_2 (с-р 14)",0		
.data
N   = 10
Y   dd 1,-20,300,-4000,50000,-6000000,70000000,-800000000,2000000000,-1; с/зн
.code
sum proc
    push EBX
    push ECX
    push EDX
    push EAX
    mov EAX, N - 1
    mov EBX,Y[(N-1) * 4]
    mov ECX, 0
@J: mov EDX,Y[ECX * 4]
    add EDX, EBX
    mov Y[ECX * 4], EDX
    inc ECX
    cmp ECX, EAX
    jNE @J
    pop EAX
    pop EDX
    pop ECX
    pop EBX
    ret
sum endp
Start:
    ConsoleTitle offset T	
    call sum
    mov EAX, 0
    mov EBX, N-1
L:  outint Y[EAX * 4]
    newline
    inc EAX
    cmp EAX, EBX
    jNE L
    pause						; нужно при сдаче по e-mail
    exit						
    end Start
