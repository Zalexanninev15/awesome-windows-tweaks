@echo off

echo --- Enable camera on/off OSD notifications ---
reg delete "HKLM\Software\Microsoft\OEM\Device\Capture" /v "NoPhysicalCameraLED" /f
:: ----------------------------------------------------------

pause
exit /b 0