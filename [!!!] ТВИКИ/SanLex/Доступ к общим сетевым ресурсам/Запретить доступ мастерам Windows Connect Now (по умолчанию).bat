@echo off

echo --- Disable the Windows Connect Now wizard ---
reg add "HKLM\Software\Policies\Microsoft\Windows\WCN\UI" /v "DisableWcnUi" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableFlashConfigRegistrar" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableInBand802DOT11Registrar" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableUPnPRegistrar" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "DisableWPDRegistrar" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WCN\Registrars" /v "EnableRegistrars" /t REG_DWORD /d 1 /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b