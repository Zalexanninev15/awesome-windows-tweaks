@echo off

:: ----------------------------------------------------------
:: --------Disable Microsoft Office logging---------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office logging
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable client telemetry-------------
:: ----------------------------------------------------------
echo --- Disable client telemetry
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Customer Experience Improvement Program-----
:: ----------------------------------------------------------
echo --- Customer Experience Improvement Program
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable feedback-----------------
:: ----------------------------------------------------------
echo --- Disable feedback
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable telemetry agent-------------
:: ----------------------------------------------------------
echo --- Disable telemetry agent
schtasks /change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /ENABLE
schtasks /change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /ENABLE
schtasks /change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /ENABLE
schtasks /change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /ENABLE
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Subscription Heartbeat----------
:: ----------------------------------------------------------
echo --- Disable Subscription Heartbeat
schtasks /change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /ENABLE
schtasks /change /TN "Microsoft\Office\Office 16 Subscription Heartbeat" /ENABLE
:: ----------------------------------------------------------


pause
exit /b 0