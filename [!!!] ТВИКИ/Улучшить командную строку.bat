@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\FlightedFeatures" /v "ImmersiveContextMenu" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "FaceName" /t REG_SZ /d "Lucida Console" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "FontFamily" /t REG_DWORD /d "54" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "FontSize" /t REG_DWORD /d "917512" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "FontWeight" /t REG_DWORD /d "400" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "PopupColors" /t REG_DWORD /d "240" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "ScreenBufferSize" /t REG_DWORD /d "589889620" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "ScreenColors" /t REG_DWORD /d "240" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowAlpha" /t REG_DWORD /d "236" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_system32_cmd.exe" /v "WindowSize" /t REG_DWORD /d "1572948" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "FontSize" /t REG_DWORD /d "851976" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "PopupColors" /t REG_DWORD /d "95" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenBufferSize" /t REG_DWORD /d "196608083" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "ScreenColors" /t REG_DWORD /d "95" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "WindowAlpha" /t REG_DWORD /d "235" /f
Reg.exe add "HKCU\Console\%%SystemRoot%%_System32_WindowsPowerShell_v1.0_powershell.exe" /v "WindowSize" /t REG_DWORD /d "1638483" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
