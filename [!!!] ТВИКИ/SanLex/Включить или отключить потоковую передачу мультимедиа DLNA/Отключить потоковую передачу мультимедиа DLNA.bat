@echo off

echo --- Disable DLNA ---
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "PreventLibrarySharing" /t REG_DWORD /d "1" /f
reg add "HKLM\System\ControlSet001\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d "4" /f

schtasks /Change /TN "Microsoft\Windows\Windows Media Sharing" /Disable

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b