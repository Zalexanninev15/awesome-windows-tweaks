@echo off

rem Don't run specified exe
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b