include console.inc

; �������� ����� (������) � (���������):
Date_pack record D:5, M:4, Y:7
Date_unpack struc  ; ���� � ������ ���������� ��������
D   db ?           ; ���� (�� 1 �� 31)
M   db ?           ; ����� (�� 1 �� 12)
Y   db ?           ; ��� (�� 0 �� 99)
Date_unpack ends

; �������� ����������:
.data
T   db " ������� ������� ��� �����    ����_1 (�����-4)",0	;	
N   equ 6
D1  Date_pack <>                    ; ����������� ����_1
D2  Date_pack <>                    ; ����������� ����_2
Arr_of_Rec Date_pack N dup (<>)     ; ������ ������� (����������� ���)
Arr_of_Struc Date_unpack N dup (<>) ; ������ �������� (������������� ���)

; �������� ��������: 
.code
; -----------------------------------------------------
; procedure In_Rec(var D: Date_pack)
; ��������: ���� �������� ����� D, M, Y ������ ���� Date_pack
In_Rec proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    mov EAX,[EBP + 8];������
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
; AL := 1 (���� D1<D2, �.�. ���� ����_1 ������������ ����_2)
; AL := 0 (�����)
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
; ��������: ����� �������� ����� D, M, Y ������ ���� Date_pack
Out_Rec proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    mov EAX,[EBP + 8];��������
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
; ��������: �� := ����������� ���� ����� ���������-��� ������� Arr
; (����������� - �������������� ���� ��������� �����)
Min_Date proc
    push EBP
    mov EBP, ESP
    push EDI
    push EBX
    push ECX
    push EDX
    mov EDX, [EBP + 8];������
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
; procedure Rec_to_Stru�(D_pack: Date_pack; var D_unpack: Date_unpack)
; ��������: ���������� ���� 
; (�� ������ ���� Date_pack � ��������� ���� Date_unpack)
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
; ��������: ����� �������� ����� D, M, Y ��������� ���� Date_unpack
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
; ������� ����� (�������� ���������):
start:	
    ConsoleTitle offset T	
; ----------------------------------------------------- 
; ���� 1 (40 �����):
; (10 �����) ���� ���� ��� D1 � D2 (������ � ������� dd.mm.yy):
COMMENT ~ 
    push offset D1
    call In_Rec
    push offset D2
    call In_Rec
; (20 �����) ��������� ���� ��� (D1 < D2 ?):
    movzx EAX,D2
    push EAX
    movZX EAX,D1
    push EAX
    call Less
; (10 �����) ����� ���������� ��������� � ���� "D1<D2 is true/false",
; ��� ������ D1 � D2 ������ ���� ���������� ���� � ������� dd.mm.yy:
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
; ���� 2 (50 �����):
; (15 �����) ���� ��� ����� N ��� � ���������� �� � ������� Arr_of_Rec:
    mov ECX,N
    lea EBX,Arr_of_Rec
J:  push EBX
    call In_Rec
    inc EBX
    inc EBX
    loop J
; (15 �����) ���� ��� ������ N ���, ���������� � ������� Arr_of_Rec:
    mov ECX, N
    lea EBX, Arr_of_Rec  
H:  mov EAX, [EBX]
    push EAX
    call Out_Rec
    outstr ' '
    inc EBX
    inc EBX
    loop H
; (20 �����) ���� ��� �������� ����������� �� ��������-���� �� �����������:
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
; ���� 3 (40 �����):
; ���������� ������� Min_Date ��� ������ ���������� ���� � ������� Arr_of_Rec:
    push N
    lea EBX, Arr_of_Rec
    push EBX
    call Min_Date
; ����� ���������� ���� � ���� "dd.mm.yy is minimum":
    push EAX
    call Out_Rec 
    outstrln' is minimum'
    
; ----------------------------------------------------- 
; ���� 4 (60 �����):
; (30 �����) ���� �������� �� ������� Arr_of_Rec � ����� ���������� ��� 
; � ���������� �� � ������� ��������  Arr_of_Struc:
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
; (30 �����) ���� �������� �� ������� Arr_of_Struc � ����� ������ ��� 
; �� ����� (������ ���� - � ������� dd.mm.yy):
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