@echo off

echo --- Prevent WinRM from using Basic Authentication ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" /v "AllowBasic" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------

pause
exit /b 0