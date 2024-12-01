@echo off

echo --- Disable the Windows Connect Now wizard ---
reg delete "HKLM\Software\Policies\Microsoft\Windows\WCN" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b