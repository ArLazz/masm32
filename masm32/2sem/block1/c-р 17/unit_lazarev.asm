; 
; ������� ������� ��� ����� ������ 111

comment ~

c-p 17    (max = 60 �����)
�������� ���������, ��������� �� ���� �������.

� �������� ������ ������ ���� �������: 
1) �������� ��������� � ������ K � ��������� �� ��������� [0..31]
  (������������ � ��������� ��� ������������� �������� 29);  
2) ������ S ��� ������ ��������� �Overflow�; 
3) ������� ����� � ������ D; 
4) ���� � ������ B. 

�������� ������  ������  ��������  �������� �� ���� �����������  
���������� B (�� ������������ inint), � ����� ������� ���������� 
�� ��������������� ������. 

�� ��������������� ������ ����������� ��������: 
������������ �� �������� B*(2^K) � ������ �������� �����?

���� ������������, �� ��������� ��������� �������� (���� �� ������):
1) ��������� (�� ��������������� ������) ���������� D �������� B*(2^K); 
2) ���������� ���������� � �������� ������;
3) �������� �� ��������� ������ ���������� �������� ���������� D;
4) ��������� ������ ��������� (� �������� ������).

���� �� ������������, �� ��������� ��������� �������� (���� �� ������):
1) ���������� (������������� outstr �� ���������������� ������) �����, 
�������� � ������ S; 
2) ��������� ������ ��������� (�� ��������������� ������).

�����������: ������ "B*(2^K)" ���������� ��������� �������� ��������
���������� � �� ��� � ������� �

���������� � ����������: �� ������������ �������������� ������. 
����������� "�������" ��������.

~

; (unit_sername.asm) ��������������� ������

; ---------------����� ���� ������� --------------------------------------
include console.inc
    
public unit
extern B: byte, K: abs, D: dword, mn: near, S: byte

.code
unit:
    mov ECX, K
    movzx EAX, B
    cmp ECX, 0
    jE O
L:  shl EAX, 1
    jC bad
    loop L
O:  mov D, EAX
    jmp mn
bad:
    outstrln offset S
    pause
    exit
end
; -------------����� ������ ������� --------------------------------------