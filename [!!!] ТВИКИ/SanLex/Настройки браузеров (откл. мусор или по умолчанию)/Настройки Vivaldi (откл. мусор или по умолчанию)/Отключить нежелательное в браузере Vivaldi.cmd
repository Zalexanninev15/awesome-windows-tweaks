@echo off 

ECHO ============================================================================================================
echo -------------- Disable junk in Vivaldi Browser ---------------------------------------------------
ECHO ============================================================================================================
ECHO.

Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "BrowserLabsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "RemoteDebuggingAllowed" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "PasswordLeakDetectionEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "DefaultGeolocationSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "DefaultNotificationsSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\Vivaldi" /v "DefaultSensorsSetting" /t REG_DWORD /d "2" /f

echo.
echo Finished...
echo.

pause
exit /b