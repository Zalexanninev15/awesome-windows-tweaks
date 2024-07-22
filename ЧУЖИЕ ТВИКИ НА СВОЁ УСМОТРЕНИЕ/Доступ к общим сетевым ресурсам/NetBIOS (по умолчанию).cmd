@echo off
TITLE NetBIOS over TCP/IP activator

fsutil dirty query %systemdrive% >nul 2>&1
if ERRORLEVEL 1 (
 ECHO.
 ECHO.
 ECHO ===================================================================
 ECHO This script needs Administrator permissions!
 ECHO.
 ECHO Please run it as the Administrator or disable User Account Control.
 ECHO ===================================================================
 ECHO.
 PAUSE >NUL
 goto end
)

echo.
echo Enabling NetBIOS over TCP/IP...

FOR /F "tokens=1,2*" %%a in ('reg query HKLM\SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces /f Tcpip /k 2^>nul ^| find "HKEY_"') do (
 reg add "%%a" /v NetbiosOptions /t REG_DWORD /d 0 /f >nul
)

ECHO.
ECHO Done!
ECHO.
ECHO Please REBOOT your system to make sure that settings are applied and TCP/UDP ports 137-139 are opened.
ECHO.
PAUSE

:end
