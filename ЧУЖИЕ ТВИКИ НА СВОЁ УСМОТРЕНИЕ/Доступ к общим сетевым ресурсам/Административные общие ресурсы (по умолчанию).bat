@echo off

echo --- Disable administrative shares ---
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d 1 /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b