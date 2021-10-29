include console.inc
    public In4
.code
In4 proc
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    mov EAX, 0
    mov ECX, 0
    mov EBX,[EBP + 8]
@L: inchar CL
    cmp CL, ' '
    JE @ennd
    sub ECX, '0'
    shl EAX, 2
    or EAX, ECX
    jmp @L
@ennd:
    mov [EBX], EAX
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4  
In4 endp

Out4 proc public
    push EBP
    mov EBP, ESP
    push EAX
    push EBX
    push ECX
    mov EAX, [EBP + 8]
    mov ECX, 16
@@: rol EAX, 2
    mov EBX, EAX
    and EBX,11b
    outint EBX
    loop @B
    pop ECX
    pop EBX
    pop EAX
    pop EBP
    ret 4
Out4 endp
end
