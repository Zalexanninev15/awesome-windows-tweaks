@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\EmptyThisFolder" /ve /t REG_SZ /d "Удалить содержимое папки" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\EmptyThisFolder" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\EmptyThisFolder" /v "Icon" /t REG_SZ /d "imageres.dll,257" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\EmptyThisFolder\command" /ve /t REG_SZ /d "cmd /c \"cd /d %%1 && del /s /f /q *.* && rd /s /q .\"" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
