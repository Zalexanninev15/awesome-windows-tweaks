@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKLM\SOFTWARE\Classes\*\shell\runas" /ve /t REG_SZ /d "Стать владельцем и получить полный доступ" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\shell\runas" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\shell\runas" /v "Icon" /t REG_SZ /d "imageres.dll,101" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKLM\SOFTWARE\Classes\*\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\runas" /ve /t REG_SZ /d "Стать владельцем и получить полный доступ" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\runas" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\runas" /v "Icon" /t REG_SZ /d "imageres.dll,101" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Directory\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" /r /d y && icacls \"%%1\" /grant administrators:F /t" /f
Reg.exe add "HKLM\SOFTWARE\Classes\dllfile\shell\runas" /ve /t REG_SZ /d "Стать владельцем и получить полный доступ" /f
Reg.exe add "HKLM\SOFTWARE\Classes\dllfile\shell\runas" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\dllfile\shell\runas" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\dllfile\shell\runas" /v "Icon" /t REG_SZ /d "imageres.dll,101" /f
Reg.exe add "HKLM\SOFTWARE\Classes\dllfile\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\dllfile\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKLM\SOFTWARE\Classes\dllfile\shell\runas\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKLM\SOFTWARE\Classes\exefile\shell\runas2" /ve /t REG_SZ /d "Стать владельцем и получить полный доступ" /f
Reg.exe add "HKLM\SOFTWARE\Classes\exefile\shell\runas2" /v "Extended" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\exefile\shell\runas2" /v "HasLUAShield" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\exefile\shell\runas2" /v "Icon" /t REG_SZ /d "imageres.dll,101" /f
Reg.exe add "HKLM\SOFTWARE\Classes\exefile\shell\runas2" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
Reg.exe add "HKLM\SOFTWARE\Classes\exefile\shell\runas2\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Reg.exe add "HKLM\SOFTWARE\Classes\exefile\shell\runas2\command" /v "IsolatedCommand" /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" && icacls \"%%1\" /grant administrators:F" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
