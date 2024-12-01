@echo off

echo --- Disable saving of zone information in downloaded files ---
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
:: ----------------------------------------------------------

echo --- Disable notifications to antivirus programs for downloaded files ---
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t REG_DWORD /d "1" /f
:: ----------------------------------------------------------

pause
exit /b 0