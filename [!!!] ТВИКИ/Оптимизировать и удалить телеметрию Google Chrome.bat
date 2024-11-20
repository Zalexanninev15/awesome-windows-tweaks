sc delete gupdate
sc delete gupdatem
sc delete googlechromeelevationservice
rmdir /s /q "C:\Program Files (x86)\Google\Update"

SC STOP gupdate
SC CONFIG gupdate start= disabled
SC DELETE gupdate

SC STOP gupdatem
SC CONFIG gupdatem start= disabled
SC DELETE gupdatem

SC STOP GoogleChromeElevationService
SC CONFIG GoogleChromeElevationService start= disabled
SC DELETE GoogleChromeElevationService

Reg.exe add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupReportingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ChromeCleanupEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DeviceMetricsReportingEnabled" /t REG_DWORD /d "0" /f
