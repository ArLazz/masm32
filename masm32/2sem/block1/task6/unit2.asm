
include console.inc
public Print
extern X: dword
.code
Print:
    outword X
    pause 
    exit
end 
