@echo off

echo --- Disable Notification Center ---
reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "1" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d "1" /f

echo Finished, please reboot your device for changes to apply.
pause
exit /b