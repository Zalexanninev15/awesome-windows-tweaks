@echo off

echo --- Domain Name Devolution (default) ---
reg delete "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "UseDomainNameDevolution" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b