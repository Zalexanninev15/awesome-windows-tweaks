@echo off

echo --- Disable Basic Authentication usage in WinRM ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" /v "AllowBasic" /t REG_DWORD /d 0 /f

pause
exit /b 0