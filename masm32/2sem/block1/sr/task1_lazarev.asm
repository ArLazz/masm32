include console.inc

COMMENT *

��������������� ������ 14
������� �������     ������ 111

*

COMMENT *

 ������_1 
 ������� ��������� Assign(A,B), ����������� ��������� ��������: 
 B := (A-13) mod B 
 ����� A � ������� ����� �/��, B � ���� �/��. 
 �������� � ��������� �� �������� ����� ������� EAX.  
 �������� � ��������� �� ������ ����� ������� EBX. 
 �������� ��������� � ���� ��������� ��� ���������� A � B,
 �������� ������� ��������� � ������ ������ (��������������
 ������ �������� ���� ����������, � �����  ��������� � ���������
 - ������� ����� �������� ���������� �.

*
.data

T   db " ������� ������� ��� �����   ������_1 (�-� 14)",0		
.data
A   dd ?  ; c/��
B   db ?  ; �/��
.code
Assign proc
    push EDX
    push ECX
    sub EAX, 13
    mov CL, [EBX]
    movsx EBX, CL
    mov EDX, 0
    idiv EBX
    mov B,DL
    outint B
    pop ECX
    pop EDX
    ret 4*1
Assign endp
Start:
    ConsoleTitle offset T	
    inintln A
    inintln B
    mov EAX, A
    mov EBX, offset B
    call Assign
    pause						; ����� ��� ����� �� e-mail
    exit						
end Start
