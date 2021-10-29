include console.inc

COMMENT ~

САМОСТОЯТЕЛЬНАЯ РАБОТА 21
СТУДЕНТ Лазарев     группа 111

~
COMMENT~ 
----------------------------------------------------------------------------
ВНИМАНИЕ: ВСЕ ИСПОЛЬЗУЕМЫЕ ОПИСАНИЯ ПЕРЕМЕННЫХ и КОНСТАНТ ДАЮТСЯ В СЕКЦИИ
ДАННЫХ ЭТОЙ ПРОГРАММЫ !!!
---------------------------------------------------------------------------- 
ЗАДАЧА_2 (максимально 50 очков)
 
Описать макрос с заголовком:
----------------------------
IsEq  macro List_Elem,Ok 
---------------------------- 
Здесь List_Elem – список вида <E1,E2,…,Ek>,  k >= 0
Элемент списка Ei может быть именем числовой константы или явно заданным числом
(из 32-битного знакового диапазона), именем знаковой переменной (размером байт,
слово, двойное слово или учетверённое слово). Ok – метка. 

Макрос передаёт управление на метку Ok в одном из двух случаев: 
если значения всех элементов из этого списка равны -5 (минус пяти)  или 
если этот список пустой. 

Требование: макрос не должен генерировать лишних команд.

Примеры возможного обращения (для тестирования) к макросу см. в секции кода 
данной программы.

Если программа с вашим макросом пройдёт трансляцию (на указанных тестах), то 
прислать по этой задаче архив с именем task2_sername.zip, в котором находятся 
три файла: task_2_sername.asm, task_2_sername.lst и task_2_sername.exe.
Если программа с вашим макросом не транслируется, то пришлите только файл 
task_2_sername.asm (без архива). Не забудьте заменить sername на свою фамилию
(на английском языке), номер группы указывать в названии архива и файла не надо
  
~
; макроопределение:
IsEq  macro List_Elem, Ok 
;; ДАЛЕЕ ВАШЕ РЕШЕНИЕ:
    N =  1
    for X, <List_Elem>
    local next
        IFNB <X>
            if type X eq 0
                push EAX
                mov EAX, X
                cmp EAX, -5
                pop EAX
                jE next
                N = 0
            elseif type X eq byte
                push EAX
                mov AL, X
                cmp AL, -5
                pop EAX
                jE next
                N = 0
            elseif type X eq word
                push EAX
                mov AX, X
                cmp AX, -5
                pop EAX
                jE next
                N = 0
            elseif type X eq dword
                push EAX
                mov EAX, X
                cmp EAX, -5
                pop EAX
                jE next
                N = 0 
            elseif type X eq qword
                push EAX
                mov EAX, -5
                cmp EAX, dword ptr X + 4
                pop EAX
                jE next
                N = 0
            endif
            next: 
        else
            jmp Ok
        endif
    endm
    if N eq 1
        jmp Ok
    endif
endm

.data
T   db  "Задача-2 (с-р 21)"

K1  =   -5
K2  =   -5
K3  =    1
B1  db  -5
B2  db   3
W1  dw  -5
W2  dw   4
D1  dd  -5
D2  dd   1
Q1  dq  -5
Q2  dq  -1

.code

Start:
    ConsoleTitle offset T	
.listmacro
    IsEq  <-5,D1,D2,K1,K2,-5,4>,Yes    ; перехода не будет 
    IsEq  <>,Yes                       ; переход будет
    IsEq  <-5,D1,D2,K1,K2,-5,-5>,Yes   ; перехода не будет 
    IsEq  <K1,K2,B1,W1,D1,Q1,-5>,Yes   ; переход будет 
    IsEq  <K1,-5>,Yes                  ; переход будет 
.nolistmacro
    outstrln "No"
    jmp Fin
Yes:outstrln "Yes"
Fin:pause						; нужно при сдаче по e-mail
    exit						
end Start


 