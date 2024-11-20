@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\Control Panel\Colors" /v "Hilight" /t REG_SZ /d "80 80 80" /f
Reg.exe add "HKCU\Control Panel\Colors" /v "HotTrackingColor" /t REG_SZ /d "60 60 60" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
