@echo off

echo --- Restrict anonymous access to Named Pipes and Shares ---
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" /v "RestrictNullSessAccess" /t REG_DWORD /d 1 /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b