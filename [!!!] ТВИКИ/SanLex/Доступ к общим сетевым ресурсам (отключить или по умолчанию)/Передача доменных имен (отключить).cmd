@echo off

echo --- Domain Name Devolution (disable) ---
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "UseDomainNameDevolution" /t REG_DWORD /d "0" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b