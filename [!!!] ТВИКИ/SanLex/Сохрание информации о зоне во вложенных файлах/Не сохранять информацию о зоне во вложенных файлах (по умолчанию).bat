@echo off

echo --- Disable notifications to antivirus programs for downloaded files ---
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t REG_DWORD /d "3" /f
:: ----------------------------------------------------------

echo --- Disable saving of zone information in downloaded files ---
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /f
:: ----------------------------------------------------------

pause
exit /b 0