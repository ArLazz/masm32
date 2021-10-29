comment ~
Задача-2 (выход-5)
~

include console.inc

public In_text, Out_text, Find_min_word 

.code
;-----------------------------------------------------------------------
; procedure In_word(var Elem_of_Arr: array of byte; K: longword)
; Действие: ввод слова из К букв, преобразование его к верхнему регистру
; и сохранение этого слова по адресу, заданному параметром Elem_of_Array.
; Перед окончанием работы процедура In_word  "чистит" буфер ввода 
; (макрокомандой flush) от управляющих символов, попавших в буфер в 
; результате нажатия клавиши ENTER (сделать это обязательно, иначе дальнейший 
; ввод будет осуществялться некорректно !!!). 
In_word proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    mov ECX, [EBP + 12];K
    mov EAX, [EBP + 8];offset
    mov EDX, 0
@L: inchar BL
    and BL, 00011111b
    or BL, 01000000b
    mov [EAX + EDX], BL
    inc EDX
    cmp EDX, ECX
    jNE @L
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4 * 2
In_word endp
;-----------------------------------------------------------------------
; procedure Out_word(var Elem_of_Arr: array of byte; K: longword)
; Действие: вывод слова из К букв, адрес начала слова задан 
; параметром Elem_of_Arr. 
Out_word proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    mov ECX, [EBP + 12];K
    mov EAX, [EBP + 8];offset
    mov EDX, 0
@L: mov EBX, [EAX + EDX]
    outchar BL
    inc EDX
    cmp EDX, ECX
    jNE @L
    newline
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4 * 2
Out_word endp
;-----------------------------------------------------------------------
; procedure In_text(var Arr_of_words: array of byte; N,K: longword) 
; Действие: ввод последовательности из N слов (по К букв в каждом слове), 
; преобразование слов к верхн.регистру и сохранение их в массиве Arr_of_words.
; В процессе работы процедура In_text обращается к вспомогательной процедуре
; In_word для ввода очередного слова и сохранения его в очередном элементе 
; массива Arr_of_words
In_text proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push EDI
    mov EAX, [EBP + 8];offset
    mov EBX, 0
    mov EDI, [EBP + 16];K
    mov ECX, [EBP + 12];N  
@L: add EAX, EBX
    mov EDX, EAX
    sub EAX, EBX 
    push EDI;K
    push EDX;offset нового слова
    call In_word
    flush
    add EBX, EDI
    loop @L
    pop EDI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4 * 3
In_text endp
;-----------------------------------------------------------------------
; procedure Out_text(var Arr_of_words: array of byte; N,K: longword) 
; Действие: вывод N слов (по К букв в каждом слове), каждое слово – с новой 
; строки экрана. Адрес начала массива из слов задаётся параметром Arr_of_words.
; В процессе работы процедура Out_text обращается к вспомогательной процедуре
; Out_word для вывода очередного слова
Out_text proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push EDI
    mov EAX, [EBP + 8];offset
    mov EBX, 0
    mov EDI, [EBP + 16];K
    mov ECX, [EBP + 12];N
@L: add EAX, EBX
    mov EDX, EAX
    sub EAX, EBX
    push EDI;K
    push EDX;offset нового слова
    call Out_word
    add EBX, EDI
    loop @L
    pop EDI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4 * 3
Out_text endp	
;-----------------------------------------------------------------------		
; procedure Find_min_word(var Arr_of_words: array of byte; N,K: longword) 
; Действие: поиск слова (в массиве Arr_of_words), которое лексикографически 
; предшествует всем остальным словам и вывод найденного слова на экран.
; Адрес начала массива из N слов (каждое слово длиной К букв) задаётся 
; параметром Arr_of_words.
; В процессе своей работы процедура Find_min_word обращается к вспомогательной
; процедуре Out_word для вывода найденного слова.  
Find_min_word proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    push EDX
    push EDI
    push ESI
    mov EAX, [EBP + 8];offset
    mov EDI, [EBP + 16];K
    mov ECX, [EBP + 12];N
    mov ESI, EAX
    mov EBX, EDI
    dec ECX
@L: push EDI
    add ESI, EBX
    push ESI
    sub ESI, EBX
    push EAX
    call Find_min_word2
    add EBX, EDI
    loop @L
    push EDI;K
    push EAX;offset
    call Out_word
    pop ESI
    pop EDI
    pop EDX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4 * 3  
Find_min_word endp	
;-----------------------------------------------------------------------	
;Find_min_word2(Arr_of_words1;Arr_of_words2;K) находит
; лексикографически меньшее слово из двух предложенных
; и возвращает ссылку на него через EAX
Find_min_word2 proc	
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDX
    push EDI
    push ESI
    mov EAX, [EBP + 8];offset 1
    mov EDI, [EBP + 12];offset 2
    mov ESI, [EBP + 16];K
    mov EDX, 0
    mov ECX, 0
    mov EBX, 0
@L: mov BL, [EAX + EDX]
    mov CL, [EDI + EDX]
    cmp BL, CL
    jB @fin
    inc EDX
    cmp EDX, ESI
    jNE @L
    mov EAX, EDI
    jmp @fin
@fin:
    pop ESI
    pop EDI
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4 * 3
Find_min_word2 endp	
;-----------------------------------------------------------------------	




end

------------- ДАННЫЕ ДЛЯ ТЕСТИРОВАНИЯ ----------------------------------
этап_1:

zxCvbN
ZxccCc
zxbBBb
CbbbBB
cBBbba

этап_2:

ZXCVBN
ZXCCCC
ZXBBBB
CBBBBB
CBBBBA


этап_3:

CBBBBA

--------------------------------------------------------------------------
