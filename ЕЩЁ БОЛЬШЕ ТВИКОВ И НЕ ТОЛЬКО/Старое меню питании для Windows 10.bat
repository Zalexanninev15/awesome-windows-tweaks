REM ; ios1ph industries ahaha
REM ; Старое меню питание как в windows 7
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseWin32BatteryFlyout" /t REG_DWORD /d "1" /f

