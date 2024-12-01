@echo off

echo --- Restrict anonymous enumeration of shares ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d 0 /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictRemoteSAM" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "UseMachineId" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "allownullsessionfallback" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b