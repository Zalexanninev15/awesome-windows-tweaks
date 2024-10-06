@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCR\lnkfile" /v "IsShortcut" /t REG_SZ /d "" /f
Reg.exe add "HKCR\InternetShortcut" /v "IsShortcut" /t REG_SZ /d "" /f
Reg.exe add "HKCR\piffile" /v "IsShortcut" /t REG_SZ /d "" /f
Reg.exe add "HKCR\WSHFile" /v "IsShortcut" /t REG_SZ /d "" /f
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
