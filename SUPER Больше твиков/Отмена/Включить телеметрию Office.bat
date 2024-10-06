Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "accesssolution" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "olksolution" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "onenotesolution" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "pptsolution" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "projectsolution" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "publishersolution" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "visiosolution" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "wdsolution" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /v "xlsolution" /f
Reg.exe add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedapplications" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "agave" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "appaddins" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "comaddins" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "documentfiles" /f
Reg.exe delete "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /v "templatefiles" /f
Reg.exe add "HKCU\Software\Policies\microsoft\office\16.0\osm\preventedsolutiontypes" /f

schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /enable
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /enable

schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentFallBack" /enable
schtasks /change /tn "\Microsoft\Office\OfficeTelemetryAgentLogOn" /enable

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

reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 1 /f

reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 1 /f

reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 1 /f