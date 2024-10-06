@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

REM ; от iosiph-a с любовью жи ес
REM ; отключить автообновление приложений стор (чтобы не включалось никогда)
Reg.exe delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "AutoDownload" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
