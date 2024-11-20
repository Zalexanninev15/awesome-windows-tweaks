@echo off

echo --- Disable Windows Installer Always install with elevated privileges ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v "AlwaysInstallElevated" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------

pause
exit /b 0