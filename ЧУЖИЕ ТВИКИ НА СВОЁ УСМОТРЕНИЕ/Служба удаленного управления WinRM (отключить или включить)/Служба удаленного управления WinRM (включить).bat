@echo off

echo --- Enable Basic Authentication usage in WinRM ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" /v "AllowBasic" /t REG_DWORD /d 1 /f

pause
exit /b 0