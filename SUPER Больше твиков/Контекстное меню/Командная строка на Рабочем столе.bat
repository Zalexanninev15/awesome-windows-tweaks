@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCR\DesktopBackground\Shell\cmd" /ve /t REG_SZ /d "Командная строка" /f
Reg.exe add "HKCR\DesktopBackground\Shell\cmd" /v "Position" /t REG_SZ /d "bottom" /f
Reg.exe add "HKCR\DesktopBackground\Shell\cmd" /v "Icon" /t REG_SZ /d "imageres.dll,311" /f
Reg.exe add "HKCR\DesktopBackground\Shell\cmd\command" /ve /t REG_SZ /d "cmd.exe" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
