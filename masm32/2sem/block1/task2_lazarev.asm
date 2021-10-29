include console.inc

COMMENT ~

��������������� ������ 21
������� �������     ������ 111

~
COMMENT~ 
----------------------------------------------------------------------------
��������: ��� ������������ �������� ���������� � �������� ������ � ������
������ ���� ��������� !!!
---------------------------------------------------------------------------- 
������_2 (����������� 50 �����)
 
������� ������ � ����������:
----------------------------
IsEq  macro List_Elem,Ok 
---------------------------- 
����� List_Elem � ������ ���� <E1,E2,�,Ek>,  k >= 0
������� ������ Ei ����� ���� ������ �������� ��������� ��� ���� �������� ������
(�� 32-������� ��������� ���������), ������ �������� ���������� (�������� ����,
�����, ������� ����� ��� ����������� �����). Ok � �����. 

������ ������� ���������� �� ����� Ok � ����� �� ���� �������: 
���� �������� ���� ��������� �� ����� ������ ����� -5 (����� ����)  ��� 
���� ���� ������ ������. 

����������: ������ �� ������ ������������ ������ ������.

������� ���������� ��������� (��� ������������) � ������� ��. � ������ ���� 
������ ���������.

���� ��������� � ����� �������� ������ ���������� (�� ��������� ������), �� 
�������� �� ���� ������ ����� � ������ task2_sername.zip, � ������� ��������� 
��� �����: task_2_sername.asm, task_2_sername.lst � task_2_sername.exe.
���� ��������� � ����� �������� �� �������������, �� �������� ������ ���� 
task_2_sername.asm (��� ������). �� �������� �������� sername �� ���� �������
(�� ���������� �����), ����� ������ ��������� � �������� ������ � ����� �� ����
  
~
; ����������������:
IsEq  macro List_Elem, Ok 
;; ����� ���� �������:
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
T   db  "������-2 (�-� 21)"

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
    IsEq  <-5,D1,D2,K1,K2,-5,4>,Yes    ; �������� �� ����� 
    IsEq  <>,Yes                       ; ������� �����
    IsEq  <-5,D1,D2,K1,K2,-5,-5>,Yes   ; �������� �� ����� 
    IsEq  <K1,K2,B1,W1,D1,Q1,-5>,Yes   ; ������� ����� 
    IsEq  <K1,-5>,Yes                  ; ������� ����� 
.nolistmacro
    outstrln "No"
    jmp Fin
Yes:outstrln "Yes"
Fin:pause						; ����� ��� ����� �� e-mail
    exit						
end Start


 