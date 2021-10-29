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
 ������_1 (����������� 50 �����)
 
 ������� ������� Search(Str1, Str2,n,k), ��� Str1 � Str2 - ���������� ������
 ������������� ����� �� n (n>0) �������� ������, k - ����� �� ��������� 
 �� 1 �� n. ������� ����������, ������ �� ������ k �������� ������ Str2 
 � ������ Str1 ��� ���������. 
 ���� ��, �� ���������� ����� ������� EAX ����� ������� (� Str1), ������� 
 � ������� ������� ������ ��������� ��������� (������� ���������� � ����!).
 ���� ���, �� ���������� ����� ��� ����� -1 (����� �������).
 
 ����������. 
 ----------
 1) ��������� Str1 � Str2 ������ ���� �������� �� ������, ��������� n � k - 
 �� �������� (+ c���������� ���������� � ������ stdcall).
  
 2) ��������� ������� Search(Str1, Str2,n,k) � ��������� ������:
 Search(S1,S2,n,k)
 (�������� ��� S1, S2, n � k ���� ���� � ������ ������)
 �������� ��� k ������� �������������� ������ � ����������.
 ��������� �������� ������� (������� ������������ ����� ���) - 
 ���������� �� �������� ��������� ����� ������ ������� Search
 
 3) � ������� ������������ ������� cmpsb � ���� � ������ ��������� ����������
 ��� ������ ��������� (��� ��������� �������). 
 
 ��. ����������� � ����� (����� ��������� end) ��� ����٨���� ����������
 ���� ������, �� �� 30 ����� (���� � �������� ���������� ������ ������ ������)
  
 ������� ������ ��������� ��� S1 � S2 � ���������� (� .data) ����������
 (��� ������������ ��������� Search):
 k = 1   i = 0
 k = 2   i = 0
 k = 3   i = 2
 k = 4   i = 5
 k = 5   i = 9
 k = 6   i = 17
 k = 11  i = 17
 k = 28  i = -1
 ����� �������� ��� k ������������� ���������� � �������� � ����������, 
 �������� ��� i (������� ���������) - ����������� � ���������� �� �����.

��������� �� �������� � ��������� ����:
���� ��������� �������� �� ���������������� ��������� (����� ����������
����������, ��� � �������������� ������) - �������� ����� Task1_Sername.zip
� ����� �������: asm, lst � exe �� ���� ���������. ���� ��������� �� ��������
��� �� �������� �� ����� - ��������  ������ ���� Task1_sername.asm 
(��� ������). ��������! �������� � �������� ����� � ������ ����� Sername 
�� ���� ������� �� ���������� ����� (����� ������ � �������� ������ � ����� 
�� ���������). 

~
.data
T   db  "������-1 (�-� 21)"

S1  db "ababcabcdabcdelmnabcdefghijk"
S2  db "abcdefghijklmnopqrstuvwxyzab"

n   equ ($-S2)                ; ����� ����� ������ (=28)
k   db ?                      ; ����� ��������� (1..n)

.code
; procedure Search(var Str1, Str2: array of byte; n, k: longword);
Search proc
;   [EBP+8]  - ����� Str1
;   [EBP+12] - ����� Str2
;   [EBP+16] - n
;   [EBP+20] - k
; ����� ���� �������
    push EBP
    mov EBP, ESP
    push EDX
    push ECX
    push EDI
    push ESI
    mov ECX, [EBP + 20]
    mov EDX, [EBP + 16]
    sub EDX, ECX
    inc EDX
    mov EDI, [EBP + 12]
    mov ESI, [EBP + 8]
    mov EAX, 0
@L: cld
repE cmpsb
    jZ @ennd;good
    inc EAX
    mov ECX, [EBP + 20]
    mov EDI, [EBP + 12]
    mov ESI, [EBP + 8]
    add ESI, EAX
    dec EDX
    cmp EDX, 0
    jNE @L
    mov EAX, -1
@ennd:
    pop ESI
    pop EDI
    pop ECX
    pop EDX
    pop EBP 
    ret 4 * 4   
Search endp
 
Start:
    ConsoleTitle offset T	
    
; ����� ���������� ����� ��������� (� ������������ � �������� ������):
    inint k
    movzx EAX, k
    push EAX
    mov EAX, n
    push EAX
    push offset S2
    push offset S1
    call Search
    outintln EAX
    pause						; ����� ��� ����� �� e-mail
    exit						
end Start
-------------------------------------------------------------------
����������� (���������� ���������� ������ - �� 30 ����� ������ 50):
-------------------------------------------------------------------
���������� �������_1:
���� ������ ��������� ������ ������� ���������, �� ����� ���� ����� � 
����� ������� ��������:
���� �� (������), �� ���������� ����� ������� EAX �������� 0 (����).
���� ��� (�� ������), �� ���������� ����� ��� ����� -1 (����� �������).
������� (�����������!) � ����������� � ������� Search, ��� ������� �����
������� ���������� ������ (��� ���������� ��������).
-------------------------------------------------------------------
���������� �������_2:
���� �� ������ ��� ������������ ������� cmpsb � ���� � ������ ���������
���������� ��� ������ ��������� (��� ��������� �������), �� ������� ��� 
������ (��� ��������� ������), �� ����� �� ��� �������� 30 �����
-------------------------------------------------------------------

 