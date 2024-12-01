@echo off

echo --- Disable unsafe SMBv1 protocol ---
dism /online /Enable-Feature /FeatureName:"SMB1Protocol" /NoRestart
dism /Online /Enable-Feature /FeatureName:"SMB1Protocol-Client" /NoRestart
dism /Online /Enable-Feature /FeatureName:"SMB1Protocol-Server" /NoRestart

echo --- Enable SMB 1.0/2.0 ---
reg delete "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /f
reg delete "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB2" /f

reg add "HKLM\System\CurrentControlSet\Services\KSecPkg" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\mrxsmb" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\mrxsmb20" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\rdbss" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\srv2" /v "Start" /t REG_DWORD /d "3" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b