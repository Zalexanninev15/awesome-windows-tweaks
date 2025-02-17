@echo off
TITLE Edge Update activator

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
echo Enabling Edge Update...

reg delete "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /f >nul 2>&1
if not "%ProgramFiles(x86)%"=="" (
 reg delete "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate" /f >nul 2>&1
)

set "EdgeSettings=UpdatesSuppressedStartHour,UpdatesSuppressedStartMin,UpdatesSuppressedDurationMin,DoNotUpdateToEdgeWithChromium,AutoUpdateCheckPeriodMinutes,UpdaterExperimentationAndConfigurationServiceControl"
set "EdgeSettings=%EdgeSettings%,InstallDefault,UpdateDefault"
set "EdgeSettings=%EdgeSettings%,Install{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062},EdgePreview{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062},Update{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}"
set "EdgeSettings=%EdgeSettings%,Install{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5},EdgePreview{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5},Update{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}"
set "EdgeSettings=%EdgeSettings%,Install{F3C4FE00-EFD5-403B-9569-398A20F1BA4A},EdgePreview{F3C4FE00-EFD5-403B-9569-398A20F1BA4A},Update{F3C4FE00-EFD5-403B-9569-398A20F1BA4A}"

for %%e in (%EdgeSettings%) do (
 reg delete "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /v "%%e" /f >nul 2>&1
 if not "%ProgramFiles(x86)%"=="" (
  reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate" /v "%%e" /f >nul 2>&1
 )
)

set "EdgeSettings={56EB18F8-B008-4CBD-B6D2-8C97FE7E9062},{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5},{F3C4FE00-EFD5-403B-9569-398A20F1BA4A}"
set "EdgeKeys=on-logon,on-logon-autolaunch,on-logon-startup-boost,on-os-upgrade"

for %%e in (%EdgeSettings%) do (
 for %%k in (%EdgeKeys%) do (
  reg delete "HKLM\SOFTWARE\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnLogon" /f >nul 2>&1
  reg delete "HKLM\SOFTWARE\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnOSUpgrade" /f >nul 2>&1
  reg delete "HKLM\SOFTWARE\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "Enabled" /f >nul 2>&1
  if not "%ProgramFiles(x86)%"=="" (
   reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnLogon" /f >nul 2>&1
   reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnOSUpgrade" /f >nul 2>&1
   reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "Enabled" /f >nul 2>&1
  )
 )
)

set EdgeSettings=
set EdgeKeys=

reg delete "HKLM\SOFTWARE\Microsoft\EdgeUpdateDev" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdateDev" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdateDev" /f >nul 2>&1

sc config edgeupdate start= auto >nul 2>&1
sc config edgeupdatem start= demand >nul 2>&1

for /f "tokens=1 delims=," %%t in ('schtasks /query /FO CSV ^| find """\" ^| find "MicrosoftEdgeUpdate"') do (
 schtasks /Change /TN %%t /Enable >nul 2>&1
)

ECHO.
ECHO Done!
ECHO.
PAUSE

:end
