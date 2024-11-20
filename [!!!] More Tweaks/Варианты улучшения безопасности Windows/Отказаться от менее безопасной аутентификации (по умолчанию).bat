@echo off

echo --- Refuse less secure authentication ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LmCompatibilityLevel" /t REG_DWORD /d 3 /f
:: ----------------------------------------------------------

pause
exit /b 0