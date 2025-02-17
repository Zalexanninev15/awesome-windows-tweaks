@echo off

echo --- Disable administrative shares ---
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b