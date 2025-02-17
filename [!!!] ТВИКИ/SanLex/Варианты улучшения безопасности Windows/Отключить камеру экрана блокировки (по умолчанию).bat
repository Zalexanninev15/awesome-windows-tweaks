@echo off

echo --- Disable lock screen camera ---
reg delete "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreenCamera /f
:: ----------------------------------------------------------

pause
exit /b 0