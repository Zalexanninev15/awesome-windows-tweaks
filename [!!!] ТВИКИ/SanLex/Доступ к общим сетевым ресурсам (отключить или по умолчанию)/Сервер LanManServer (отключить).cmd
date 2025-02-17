@echo off
TITLE SMB Server deactivator
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
ECHO Disabling SMB Server service...

sc config lanmanserver start= disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\Parameters" /v "hidden" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "SmbDeviceEnabled" /t REG_DWORD /d "0" /f

ECHO.
ECHO Done!
ECHO.
ECHO Please REBOOT your system to make sure that settings are applied and TCP port 445 is closed.
ECHO.
PAUSE

:end
exit
