include console.inc

COMMENT *

��������������� ������ 14
������� �������     ������ �����

*

COMMENT *

 ������_2 
 ����� �� ����� Free Pascal ���� ��������� ��������:
 const
    N = 10
    vector = array [1..N] of longint;
 ������� ��������� Sum(X,N) �� ������������ ������������ � ������ stdcall
 ��� ��������� ��������:
 X - ������ ���� vector, N - ����������� ����� ������� 
 ��������� ����������� ������ � �� ���������� �������: 
 for i:= 1 to N-1 do X[i]:= X[i]+X[N]

 �������� ��������� � ���� ��������� ��� ������� Y, �������� ��������
 ���� � ������ ������ ���� ���������, � �����  ��������� � ���������
  - ������� ������ Y ����� ��������� (����� ����� ����������� ��������, 
  �� �������� ��� ����� ����������� ���������, �.�. ����� ����� �����
  ������ ��� �������� ������������ ������ ��������� Sum).

*
.data

T   db " ������� ������� ��� �����   ������_2 (�-� 14)",0		
.data
N   = 10
Y   dd 1,-20,300,-4000,50000,-6000000,70000000,-800000000,2000000000,-1; �/��
.code
sum proc
    push EBX
    push ECX
    push EDX
    push EAX
    mov EAX, N - 1
    mov EBX,Y[(N-1) * 4]
    mov ECX, 0
@J: mov EDX,Y[ECX * 4]
    add EDX, EBX
    mov Y[ECX * 4], EDX
    inc ECX
    cmp ECX, EAX
    jNE @J
    pop EAX
    pop EDX
    pop ECX
    pop EBX
    ret
sum endp
Start:
    ConsoleTitle offset T	
    call sum
    mov EAX, 0
    mov EBX, N-1
L:  outint Y[EAX * 4]
    newline
    inc EAX
    cmp EAX, EBX
    jNE L
    pause						; ����� ��� ����� �� e-mail
    exit						
    end Start
