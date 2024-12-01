@echo off

echo --- Disable Mobile hotspot ---
reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\Tethering" /v "RemoteStartupDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HotspotAuthentication" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v "NC_ShowSharedAccessUI" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ControlSet001\Services\icssvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SharedAccess" /v "Start" /t REG_DWORD /d "4" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b