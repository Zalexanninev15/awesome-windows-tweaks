@echo off

echo --- Restrict anonymous enumeration of shares ---
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b