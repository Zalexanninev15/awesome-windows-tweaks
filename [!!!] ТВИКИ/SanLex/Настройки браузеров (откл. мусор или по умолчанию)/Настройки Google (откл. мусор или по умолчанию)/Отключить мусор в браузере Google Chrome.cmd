@echo off 

ECHO ============================================================================================================
echo -------------- Disable junk in browser Google Chrome ---------------------------------------------------
ECHO ============================================================================================================
ECHO.

Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "BrowserLabsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "RemoteDebuggingAllowed" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PasswordLeakDetectionEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultGeolocationSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultNotificationsSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultSensorsSetting" /t REG_DWORD /d "2" /f

echo.
echo Finished...
echo.

pause
exit /b