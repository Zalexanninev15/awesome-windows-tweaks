@echo off 

ECHO ============================================================================================================
echo -------------- Disable junk in Brave browser Brave - web ---------------------------------------------------
ECHO ============================================================================================================
ECHO.

Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "BackgroundModeEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "SuppressUnsupportedOSWarning" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "BrowserLabsEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "RemoteDebuggingAllowed" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "PasswordLeakDetectionEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "DefaultGeolocationSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "DefaultNotificationsSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "DefaultSensorsSetting" /t REG_DWORD /d "2" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "BraveRewardsDisabled" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "BraveVPNDisabled" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "BraveWalletDisabled" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\BraveSoftware\Brave" /v "TorDisabled" /t REG_DWORD /d "1" /f

echo.
echo Finished...
echo.

pause
exit /b