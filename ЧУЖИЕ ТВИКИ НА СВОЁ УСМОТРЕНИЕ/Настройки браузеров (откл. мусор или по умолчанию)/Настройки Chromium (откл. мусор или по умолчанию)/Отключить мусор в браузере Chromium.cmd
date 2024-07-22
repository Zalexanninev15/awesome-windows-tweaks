@echo off 

ECHO ============================================================================================================
echo -------------- Disable junk in browser Chromium ---------------------------------------------------
ECHO ============================================================================================================
ECHO.

Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d "1" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "BrowserLabsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "RemoteDebuggingAllowed" /t REG_DWORD /d "0" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "PasswordLeakDetectionEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "QuicAllowed" /t REG_DWORD /d "0" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "PromotionalTabsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "DefaultGeolocationSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "DefaultNotificationsSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\TK_SOFTWARE\Policies\Chromium" /v "DefaultSensorsSetting" /t REG_DWORD /d "2" /f

echo.
echo Finished...
echo.

pause
exit /b