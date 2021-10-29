program main;

var 
	X: longword;
	Res: shortint;
procedure Power2(X: longword; Res: shortint);
stdcall;
external name '_Power2@0';
{$L u1.obj}
BEGIN
	read(X);
	Res := 0;
	writeln(1);
	Power2(X,Res);
	writeln(2);
	writeln(Res);
	readln;
	readln;
	
END.

