@echo off

echo --- Enable remote Assistance ---
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicitedFullControl" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "TSAppCompat" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "TSEnabled" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "TSUserEnabled" /f
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d "1" /f

reg delete "HKLM\Software\Policies\Microsoft\Windows\WinRM" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b