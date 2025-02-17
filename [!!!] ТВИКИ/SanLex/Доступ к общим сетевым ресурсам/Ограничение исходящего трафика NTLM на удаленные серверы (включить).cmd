@echo off

echo --- Restrict NTLM: Outgoing NTLM traffic to remote servers - Deny All ---
reg add "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0" /v "RestrictSendingNTLMTraffic" /t REG_DWORD /d "2" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b