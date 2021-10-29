include console.inc

COMMENT ~

��������������� ������ 15
������� �������     ������ 111

~

COMMENT ~

 ������_3 (����������� 30 �����)
 
 ������� ������� C� ������������ ������������ � ������ Calc_64(X,N).
 ����� X - ������ �� ������� ���� (�/��), N - ��� ������������ (N>0).
 ������� ������������ ���������� ��������� ����� �������, ������� ������ 64, �
 ���������� ����� ����� ������� EAX.
 
 ������ ����������: � ������� ��������� ������������ ������� div, and � �����
 ������� ������� (��� �������� ����� �� ��������� 64 ������� ��������������� 
 �������� test � ��������� ����������� �������).
 
 �������� ��������� � ���� ������� ��� ������� Z ����������� Len, �������� 
 �������� ���� � ������ ������ ���� ���������, � �����  ��������� - ������� 
 ������������ ����� (����� ����� ������������ �� �������� ���������). ��� 
 ���������� ������ ������� ������ ���� ���������� ����� 5

~

.data
T   db " ������� ������� ��� �����   ������_3 (�-� 15)",0		

Z   dd 127,320,654321,3555555520,790080,639983,64,151943,63209856   ; �/��
;           ^              ^        ^          ^            ^
;   (� ���������� ������ �������� �������� ^ ��� ��������, ������� 64)
Len equ ($-Z)/4 ; �������� ��������� �������������� ��������� ����� ������� Z

.code
Calc_64 proc
    push EBP
    mov EBP, ESP
    push EBX
    push ECX
    push EDX
    push ESI
    mov ECX, [EBP + 12]
    mov EDX, [EBP + 8]
    mov EAX, 0
@L: mov ESI, [EDX + ECX * 4]
    test ESI, 111111b
    jNZ @K
    inc EAX
@K: loop @L
    pop ESI
    pop EDX
    pop ECX
    pop EBX
    pop EBP
    ret 4 * 2
Calc_64 endp
Start:
    ConsoleTitle offset T	
    push Len
    push offset Z
    call Calc_64
    outword EAX
    pause						; ����� ��� ����� �� e-mail
    exit						
    end Start
