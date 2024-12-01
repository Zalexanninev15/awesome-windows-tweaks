@echo off

echo --- Restrict anonymous enumeration of shares ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /t REG_DWORD /d 1 /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b