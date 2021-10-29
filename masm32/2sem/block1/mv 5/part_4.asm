include console.inc

; ќѕ»—јЌ»≈ “»ѕќ¬ («јѕ»—») » (—“–” “”–џ):
Date_pack record D:5, M:4, Y:7
Date_unpack struc  ; дата в рамках некоторого столети€
D   db ?           ; день (от 1 до 31)
M   db ?           ; мес€ц (от 1 до 12)
Y   db ?           ; год (от 0 до 99)
Date_unpack ends

; ќѕ»—јЌ»≈ ѕ≈–≈ћ≈ЌЌџ’:
.data
T   db " ‘јћ»Ћ»я Ћј«ј–≈¬ »ћя ј–“”–    Ё“јѕ_1 (выход-4)",0	;	
N   equ 6
D1  Date_pack <>                    ; упакованна€ дата_1
D2  Date_pack <>                    ; упакованна€ дата_2
Arr_of_Rec Date_pack N dup (<>)     ; массив записей (упакованных дат)
Arr_of_Struc Date_unpack N dup (<>) ; массив структур (распакованных дат)

; ќѕ»—јЌ»≈ ѕ–ќ÷≈ƒ”–: 
.code
; -----------------------------------------------------
; procedure In_Rec(var D: Date_pack)
; действие: ввод значений полей D, M, Y записи типа Date_pack
In_Rec proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    mov EAX,[EBP + 8];ссылка
    mov ECX, 0
    inint BX
    shl BX, 11
    add CX, BX
    inint BX
    shl BX, 7
    add CX, BX
    inint BX
    add CX, BX
    mov [EAX],CX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4
In_Rec endp
; -----------------------------------------------------
; function Less(D1, D2: Date_pack): byte
; AL := 1 (если D1<D2, т.е. если дата_1 предшествует дате_2)
; AL := 0 (иначе)
Less proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDX
    push ESI
    mov AL, 0
    mov EDX, 0
    mov ECX, 0
    mov ESI, 0
    mov EBX, 0
    mov ESI, [EBP + 12];D2
    mov EBX, [EBP + 8];D1
    mov DX, SI
    mov CX, BX
    and DX, mask Y
    and CX, mask Y
    cmp DX, CX
    jB @ennd
    mov DX, SI
    mov CX, BX
    and DX, mask M
    and CX, mask M
    cmp DX, CX
    jB @ennd
    mov DX, SI
    mov CX, BX
    and DX, mask D
    and CX, mask D
    cmp DX, CX
    jB @ennd
    mov AL, 1
@ennd:  
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4*2
Less endp
; -----------------------------------------------------
; procedure Out_Rec(D: Date_pack)
; действие: вывод значений полей D, M, Y записи типа Date_pack
Out_Rec proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    mov EAX,[EBP + 8];значение
    mov EBX, 0
    mov EBX, EAX
    and EBX, mask D
    shr EBX, 11
    outword EBX
    outchar '.'
    mov EBX, EAX
    and EBX, mask M
    shr EBX, 7
    outword EBX
    outchar '.'
    mov EBX, EAX
    and EBX, mask Y
    outword EBX
    pop EBX
    pop EAX
    pop EBP
    ret 4
Out_Rec endp
; -----------------------------------------------------
; function Min_Date(var Arr: array of Date_pack; N: longword): word
; действие: ј’ := минимальна€ дата среди элементов-дат массива Arr
; (минимальна€ - предшествующа€ всем остальным датам)
Min_Date proc
    push EBP
    mov EBP, ESP
    push EDI
    push EBX
    push ECX
    push EDX
    mov EDX, [EBP + 8];массив
    mov ECX, [EBP + 12];N
    mov EBX, [EDX]
    inc EDX
    inc EDX
    dec ECX
@I: mov EDI,[EDX]
    push EDI
    push EBX
    call Less
    cmp AL, 1
    jE @O
    mov EBX, EDI
@O: add EDX, 2
    loop @I
    mov EAX,EBX
    pop EDX
    pop ECX
    pop EBX
    pop EDI
    pop EBP
    ret 4*2
Min_Date endp
; -----------------------------------------------------
; procedure Rec_to_Struс(D_pack: Date_pack; var D_unpack: Date_unpack)
; действие: распаковка даты 
; (из записи типа Date_pack в структуру типа Date_unpack)
Rec_to_Struc proc
    push EBP
    mov EBP,ESP
    push EAX
    push EBX
    push ECX
    mov EAX, [EBP + 8];pack
    mov EBX, [EBP + 12];unpack
    mov ECX, EAX
    and ECX, mask D
    shr ECX, 11
    mov (Date_unpack ptr[EBX]).D, CL
    mov ECX, EAX
    and ECX, mask M
    shr ECX, 7
    mov (Date_unpack ptr[EBX]).M, CL
    mov ECX, EAX
    and ECX, mask Y
    mov (Date_unpack ptr[EBX]).Y, CL
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4*2
Rec_to_Struc endp
; -----------------------------------------------------
; procedure Out_Struc(var D: Date_unpack)
; действие: вывод значений полей D, M, Y структуры типа Date_unpack
Out_Struc proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    mov EBX, [EBP + 8]
    mov AL,(Date_unpack ptr [EBX]).D
    outint AL
    outchar '.'
    mov AL,(Date_unpack ptr [EBX]).M
    outint AL
    outchar '.'
    mov AL,(Date_unpack ptr [EBX]).Y
    outint AL
    pop EBX
    pop EAX
    pop EBP
    ret 4
Out_Struc endp
; -----------------------------------------------------
; ¬≈ƒ”ўјя „ј—“№ (ќ—Ќќ¬Ќјя ѕ–ќ√–јћћј):
start:	
    ConsoleTitle offset T	
; ----------------------------------------------------- 
; Ё“јѕ 1 (40 очков):
; (10 очков) ввод двух дат D1 и D2 (кажда€ в формате dd.mm.yy):
COMMENT ~ 
    push offset D1
    call In_Rec
    push offset D2
    call In_Rec
; (20 очков) сравнение двух дат (D1 < D2 ?):
    movzx EAX,D2
    push EAX
    movZX EAX,D1
    push EAX
    call Less
; (10 очков) вывод результата сравнени€ в виде "D1<D2 is true/false",
; где вместо D1 и D2 должна быть напечатана дата в формате dd.mm.yy:
    movzx EBX, D1
    push EBX
    call Out_Rec
    outchar 60
    movzx EBX, D2
    push EBX
    call Out_Rec
    outstr' is '
    cmp AL, 1
    jE L
    outstr 'false'
    jmp endd
L:  outstr 'true'
endd:
~ 
; ----------------------------------------------------- 
; Ё“јѕ 2 (50 очков):
; (15 очков) цикл дл€ ввода N дат и сохранени€ их в массиве Arr_of_Rec:
    mov ECX,N
    lea EBX,Arr_of_Rec
J:  push EBX
    call In_Rec
    inc EBX
    inc EBX
    loop J
; (15 очков) цикл дл€ вывода N дат, хран€щихс€ в массиве Arr_of_Rec:
    mov ECX, N
    lea EBX, Arr_of_Rec  
H:  mov EAX, [EBX]
    push EAX
    call Out_Rec
    outstr ' '
    inc EBX
    inc EBX
    loop H
; (20 очков) цикл дл€ проверки упор€дочены ли элементы-даты по возрастанию:
    mov ECX, N - 1
    lea EBX, Arr_of_Rec
U:  mov EAX, [EBX + 2]
    push EAX
    mov EAX, [EBX]
    push EAX
    call Less
    cmp AL, 0
    jE ennnd
    inc EBX
    inc EBX
    loop U
    outstrln 'sorted'
    jmp endd
ennnd:
    outstrln 'not sorted'
endd:
 
; ----------------------------------------------------- 
; Ё“јѕ 3 (40 очков):
; применение функции Min_Date дл€ поиска наименьшей даты в массиве Arr_of_Rec:
    push N
    lea EBX, Arr_of_Rec
    push EBX
    call Min_Date
; вывод наименьшей даты в виде "dd.mm.yy is minimum":
    push EAX
    call Out_Rec 
    outstrln' is minimum'
    
; ----------------------------------------------------- 
; Ё“јѕ 4 (60 очков):
; (30 очков) цикл движени€ по массиву Arr_of_Rec с целью распаковки дат 
; и сохранени€ их в массиве структур  Arr_of_Struc:
    mov ECX, N
    lea EBX, Arr_of_Rec
    lea EDX, Arr_of_Struc
P:  push EDX
    mov EAX, [EBX]
    push EAX
    call Rec_to_Struc
    inc EBX
    inc EBX
    add EDX, 3
    loop P
; (30 очков) цикл движени€ по массиву Arr_of_Struc с целью вывода дат 
; на экран (каждую дату - в формате dd.mm.yy):
    mov ECX, N
    lea EDX, Arr_of_Struc
Q:  push EDX
    call Out_Struc
    outchar ' '
    add EDX, 3
    loop Q
    
; ----------------------------------------------------- 
	
	pause
	exit
	end start