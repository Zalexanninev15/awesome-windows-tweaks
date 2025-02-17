@echo off

echo --- Disable lock screen camera ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreenCamera" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------

pause
exit /b 0