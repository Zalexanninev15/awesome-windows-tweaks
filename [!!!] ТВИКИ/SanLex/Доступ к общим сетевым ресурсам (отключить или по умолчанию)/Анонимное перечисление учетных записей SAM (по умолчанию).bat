@echo off

echo --- Block Anonymous enumeration of SAM accounts ---
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "RestrictAnonymousSAM" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b