comment ~
������-2 (�����-5)
~

include console.inc

extern In_text@0:proc, Out_text@0:proc, Find_min_word@0:proc 

.data
T   db " �������______ ���______    ������_1 (����� 1 � 2) (�����-5)",0	;	
N  	 equ 5                        ;  ���������� ����
K  	 equ 6                        ;  ����� ������ �����
Arr_of_words db N*K dup(?),"ABBBBA"0

extern In_text@0: proc, Out_text@0: proc, Find_min_word@0: proc

.code
	
Start:	;------------- ���� 1 -------(40 �����)-----------------------------
	ConsoleTitle offset T	
	outword N,,"������� ����� �� "
	outstrln " ����,"
	outword K,,"� ������ ����� - �� "
	outstrln " ��������,"
	outstrln "����� ��������� ���� �� ����� �������� ENTER:"
	
	; �������� �� ������ ��������� In_text:
    mov EAX, K
    push EAX
    mov EAX, N
    push EAX
    push offset Arr_of_words
    call  In_text@0  
	newline
	
	;--------------- ���� 2 ---------(30 �����)---------------------------------
	outstrln "��� �����, ��������������� � �������� ��������:"
	; �������� �� ������ ��������� Out_text:
    mov EAX, K
    push EAX
    mov EAX, N
    push EAX
    push offset Arr_of_words
    call  Out_text@0  
	newline
	
	;---------------- ���� 3 ---------(50 �����)--------------------------------
	outstrln "�����, ����������������� �������������� ���� ���������:"
	; �������� �� ������ ��������� Find_min_word:
    mov EAX, K
    push EAX
    mov EAX, N
    push EAX
    push offset Arr_of_words
    call  Find_min_word@0  
    newline
    
    pause     ; ����� ��� ����� �� email
    exit
end Start

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

**************************************************************

���������� �� ���������� ���� ������������� ���������:

**************************************************************
��������� �������� ���� prompt1.bat � ��� �������, ��� ��������� �������� 
������������ ������ (m2.asm � u2.asm) � ��������� ��� �� ���������� 
(������� �� ���� ������), ����� ���� ��������� ���� ��������� ������

��� ���������� ����� ������ (m2.asm) ��������� 
�� ��������� ������:
ml /c /coff /Fl m2.asm

��� ���������� ���������������� ������ (u2.asm) ��������� 
�� ��������� ������:
ml /c /coff /Fl u2.asm

��� ������ (��������) ���� ���� ������� ��������� �� ��������� ������:
link /subsystem:console m2.obj u2.obj 

��� ������� ������� ��������� m2.exe �� ���� ��������� �� ��������� ������:
m2
