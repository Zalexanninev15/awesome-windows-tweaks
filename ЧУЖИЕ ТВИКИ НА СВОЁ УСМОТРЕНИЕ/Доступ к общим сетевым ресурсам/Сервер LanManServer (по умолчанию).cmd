@echo off
TITLE SMB Server activator
CLS

fsutil dirty query %systemdrive% >nul 2>&1
if ERRORLEVEL 1 (
 ECHO.
 ECHO =============================================
 ECHO This script needs Administrator permissions!
 ECHO.
 ECHO Please run it as the Administrator.
 ECHO =============================================
 ECHO.
 PAUSE >NUL
 goto end
)

ECHO.
ECHO Enabling SMB Server service...

reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\Parameters" /v "hidden" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "SmbDeviceEnabled" /t REG_DWORD /d "1" /f
sc config lanmanserver start= auto

ECHO.
ECHO Done!
ECHO.
ECHO Please REBOOT your system to make sure that settings are applied and TCP port 445 is opened.
ECHO.
PAUSE

:end
exit
