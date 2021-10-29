comment ~
������-2 (�����-5)
~

include console.inc

public In_text, Out_text, Find_min_word 

.code
;-----------------------------------------------------------------------
; procedure In_word(var Elem_of_Arr: array of byte; K: longword)
; ��������: ���� ����� �� � ����, �������������� ��� � �������� ��������
; � ���������� ����� ����� �� ������, ��������� ���������� Elem_of_Array.
; ����� ���������� ������ ��������� In_word  "������" ����� ����� 
; (������������� flush) �� ����������� ��������, �������� � ����� � 
; ���������� ������� ������� ENTER (������� ��� �����������, ����� ���������� 
; ���� ����� �������������� ����������� !!!). 
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
; ��������: ����� ����� �� � ����, ����� ������ ����� ����� 
; ���������� Elem_of_Arr. 
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
; ��������: ���� ������������������ �� N ���� (�� � ���� � ������ �����), 
; �������������� ���� � �����.�������� � ���������� �� � ������� Arr_of_words.
; � �������� ������ ��������� In_text ���������� � ��������������� ���������
; In_word ��� ����� ���������� ����� � ���������� ��� � ��������� �������� 
; ������� Arr_of_words
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
    push EDX;offset ������ �����
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
; ��������: ����� N ���� (�� � ���� � ������ �����), ������ ����� � � ����� 
; ������ ������. ����� ������ ������� �� ���� ������� ���������� Arr_of_words.
; � �������� ������ ��������� Out_text ���������� � ��������������� ���������
; Out_word ��� ������ ���������� �����
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
    push EDX;offset ������ �����
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
; ��������: ����� ����� (� ������� Arr_of_words), ������� ����������������� 
; ������������ ���� ��������� ������ � ����� ���������� ����� �� �����.
; ����� ������ ������� �� N ���� (������ ����� ������ � ����) ������� 
; ���������� Arr_of_words.
; � �������� ����� ������ ��������� Find_min_word ���������� � ���������������
; ��������� Out_word ��� ������ ���������� �����.  
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
;Find_min_word2(Arr_of_words1;Arr_of_words2;K) �������
; ����������������� ������� ����� �� ���� ������������
; � ���������� ������ �� ���� ����� EAX
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

------------- ������ ��� ������������ ----------------------------------
����_1:

zxCvbN
ZxccCc
zxbBBb
CbbbBB
cBBbba

����_2:

ZXCVBN
ZXCCCC
ZXBBBB
CBBBBB
CBBBBA


����_3:

CBBBBA

--------------------------------------------------------------------------
