@echo off

echo --- Restrict NTLM: Outgoing NTLM traffic to remote servers - Default ---
reg delete "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0" /v "RestrictSendingNTLMTraffic" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b