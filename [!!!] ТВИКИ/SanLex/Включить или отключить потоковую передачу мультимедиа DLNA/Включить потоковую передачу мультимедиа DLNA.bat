@echo off

echo --- Enable DLNA ---
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "PreventLibrarySharing" /f
reg add "HKLM\System\ControlSet001\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d "3" /f

schtasks /Change /TN "Microsoft\Windows\Windows Media Sharing" /Enable

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b