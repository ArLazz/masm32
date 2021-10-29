comment ~
«адача-2 (выход-5)
~

include console.inc

extern In_text@0:proc, Out_text@0:proc, Find_min_word@0:proc 

.data
T   db " ‘јћ»Ћ»я______ »ћя______    «јƒј„ј_1 (этапы 1 и 2) (выход-5)",0	;	
N  	 equ 5                        ;  количество слов
K  	 equ 6                        ;  длина одного слова
Arr_of_words db N*K dup(?),"ABBBBA"0

extern In_text@0: proc, Out_text@0: proc, Find_min_word@0: proc

.code
	
Start:	;------------- этап 1 -------(40 очков)-----------------------------
	ConsoleTitle offset T	
	outword N,,"¬ведите “≈ —“ из "
	outstrln " слов,"
	outword K,,"в каждом —Ћќ¬≈ - по "
	outstrln " символов,"
	outstrln "слова отдел€йте друг от друга нажатием ENTER:"
	
	; действи€ по вызову процедуры In_text:
    mov EAX, K
    push EAX
    mov EAX, N
    push EAX
    push offset Arr_of_words
    call  In_text@0  
	newline
	
	;--------------- этап 2 ---------(30 очков)---------------------------------
	outstrln "¬аш текст, преобразованный к верхнему регистру:"
	; действи€ по вызову процедуры Out_text:
    mov EAX, K
    push EAX
    mov EAX, N
    push EAX
    push offset Arr_of_words
    call  Out_text@0  
	newline
	
	;---------------- этап 3 ---------(50 очков)--------------------------------
	outstrln "—лово, лексикографически предшествующее всем остальным:"
	; действи€ по вызову процедуры Find_min_word:
    mov EAX, K
    push EAX
    mov EAX, N
    push EAX
    push offset Arr_of_words
    call  Find_min_word@0  
    newline
    
    pause     ; нужно при сдаче по email
    exit
end Start

------------- ƒјЌЌџ≈ ƒЋя “≈—“»–ќ¬јЌ»я ----------------------------------
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

**************************************************************

»Ќ—“–” ÷»я ѕќ –ј«–јЅќ“ ≈ Ё“ќ… ƒ¬”’ћќƒ”Ћ№Ќќ… ѕ–ќ√–јћћџ:

**************************************************************
поместить пакетный файл prompt1.bat в тот каталог, где наход€тс€ исходные 
ассемблерные модули (m2.asm и u2.asm) и запустить его на выполнение 
(кликнув по нему мышкой), после чего откроетс€ окно командной строки

дл€ трансл€ции этого модул€ (m2.asm) выполнить 
из командной строки:
ml /c /coff /Fl m2.asm

дл€ трансл€ции вспомогательного модул€ (u2.asm) выполнить 
из командной строки:
ml /c /coff /Fl u2.asm

дл€ сборки (линковки) этих двух модулей выполнить из командной строки:
link /subsystem:console m2.obj u2.obj 

дл€ запуска готовой программы m2.exe на счЄт выполнить из командной строки:
m2
