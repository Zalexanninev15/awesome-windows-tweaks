@echo off

echo --- Restrict anonymous enumeration of shares ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\LSA" /v "RestrictAnonymous" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictRemoteSAM" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "UseMachineId" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RunAsPPL" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "allownullsessionfallback" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b