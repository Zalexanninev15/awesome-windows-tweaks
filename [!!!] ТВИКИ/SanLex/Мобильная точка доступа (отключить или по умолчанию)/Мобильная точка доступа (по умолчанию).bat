@echo off

echo --- Mobile hotspot (default) ---
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\HotspotAuthentication" /f
reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\Tethering" /v "RemoteStartupDisabled" /t REG_DWORD /d "0" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v "NC_ShowSharedAccessUI" /f

reg add "HKLM\SYSTEM\ControlSet001\Services\icssvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SharedAccess" /v "Start" /t REG_DWORD /d "3" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b