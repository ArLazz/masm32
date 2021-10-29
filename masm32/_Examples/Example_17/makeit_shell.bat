@echo off

  set Name=a_shell
  set path=..\bin;..\..\bin
  set include=..\include;..\..\include
  set lib=..\lib;..\..\lib

  ml /c /coff /Fl %Name%.asm

  if errorlevel 1 goto errasm

  Link /subsystem:console %Name%.obj

  if errorlevel 1 goto errlink

  goto TheEnd

:errlink
  echo Link Error !!!!!!!!!!!!!!!!!
  goto TheEnd

:errasm
  echo Assembler Error !!!!!!!!!!!!
  goto TheEnd

:TheEnd

pause
