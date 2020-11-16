@echo off

REM 0 =OK button only

REM 1 =OK and Cancel buttons

REM 2 =Abort, Retry, and Ignore buttons

REM 3 =Yes, No, and Cancel buttons

REM 4 =Yes and No buttons

REM 5 =Retry and Cancel buttons

REM 16 =Critical Message icon3

REM 2 =Warning Query icon

REM 48 = Warning Message icon

REM 64 =Information Message icon

REM @echo on 

REM echo %1 > out.txt
echo wscript.quit MsgBox (Replace("%~1","\n",vbCrLf), %2, Replace("%~3","\n",vbCrLf)) > yesno.vbs
REM echo wscript.quit MsgBox ("This will" & vbCr & "be shown" & vbCr & "in a popup", 4, "sfsdf") > yesno.vbs
wscript //nologo yesno.vbs
set value=%errorlevel%
del yesno.vbs
echo %value%

REM REM example of how to get output:
REM if "%value%"=="6" echo You clicked yes
REM if "%value%"=="7" echo You clicked no
