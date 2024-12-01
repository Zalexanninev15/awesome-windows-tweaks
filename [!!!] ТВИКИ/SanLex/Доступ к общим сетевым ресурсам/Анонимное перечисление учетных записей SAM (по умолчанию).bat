@echo off

echo --- Block Anonymous enumeration of SAM accounts ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "RestrictAnonymousSAM" /t REG_DWORD /d 0 /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b