@echo off

echo --- Sharing Wizard (disable) ---
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SharingWizardOn" /t REG_DWORD /d 0 /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b