@echo off

echo --- Restrict anonymous enumeration of shares ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictAnonymous" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "RestrictRemoteSAM" /t REG_SZ /d O:BAG:BAD:(A;;RC;;;BA) /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "UseMachineId" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "allownullsessionfallback" /t REG_DWORD /d 0 /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b