@echo off

echo --- Enable camera on/off OSD notifications ---
reg add "HKLM\SOFTWARE\Microsoft\OEM\Device\Capture" /v "NoPhysicalCameraLED" /d 1 /t REG_DWORD /f
:: ----------------------------------------------------------

pause
exit /b 0