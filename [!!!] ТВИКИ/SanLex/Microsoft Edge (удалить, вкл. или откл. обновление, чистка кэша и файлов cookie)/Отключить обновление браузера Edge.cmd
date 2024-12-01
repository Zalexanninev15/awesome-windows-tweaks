@echo off
TITLE Edge Update deactivator

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
echo Disabling Edge Update...

reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d "1" /f >nul 2>&1
if not "%ProgramFiles(x86)%"=="" (
 reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d "1" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d "1" /f >nul 2>&1
)


set "EdgeSettings=CreateDesktopShortcutDefault,AutoUpdateCheckPeriodMinutes,UpdaterExperimentationAndConfigurationServiceControl"
set "EdgeSettings=%EdgeSettings%,EdgePreview{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062},EdgePreview{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5},EdgePreview{F3C4FE00-EFD5-403B-9569-398A20F1BA4A}"
set "EdgeSettings=%EdgeSettings%,UpdateDefault,Update{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062},Update{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5},Update{F3C4FE00-EFD5-403B-9569-398A20F1BA4A}"
REM Uncomment the line below if you want to completely block installation of Edge, WebView2 and Edge Update
rem set "EdgeSettings=%EdgeSettings%,InstallDefault,Install{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062},Install{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5},Install{F3C4FE00-EFD5-403B-9569-398A20F1BA4A}"

for %%e in (%EdgeSettings%) do (
 reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /v "%%e" /t REG_DWORD /d "0" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "%%e" /t REG_DWORD /d "0" /f >nul 2>&1
 if not "%ProgramFiles(x86)%"=="" (
  reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate" /v "%%e" /t REG_DWORD /d "0" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate" /v "%%e" /t REG_DWORD /d "0" /f >nul 2>&1
 )
)


set "EdgeSettings={56EB18F8-B008-4CBD-B6D2-8C97FE7E9062},{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5},{F3C4FE00-EFD5-403B-9569-398A20F1BA4A}"
set "EdgeKeys=on-logon,on-logon-autolaunch,on-logon-startup-boost,on-os-upgrade"

for %%e in (%EdgeSettings%) do (
 for %%k in (%EdgeKeys%) do (
  reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnLogon" /t REG_DWORD /d "0" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnOSUpgrade" /t REG_DWORD /d "0" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnLogon" /t REG_DWORD /d "0" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnOSUpgrade" /t REG_DWORD /d "0" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
  if not "%ProgramFiles(x86)%"=="" (
   reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnLogon" /t REG_DWORD /d "0" /f >nul 2>&1
   reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnOSUpgrade" /t REG_DWORD /d "0" /f >nul 2>&1
   reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
   reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnLogon" /t REG_DWORD /d "0" /f >nul 2>&1
   reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "AutoRunOnOSUpgrade" /t REG_DWORD /d "0" /f >nul 2>&1
   reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate\Clients\%%e\Commands\%%k" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
  )
 )
)

set EdgeKeys=

reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /v "UpdatesSuppressedStartHour" /t REG_DWORD /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /v "UpdatesSuppressedStartMin" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /v "UpdatesSuppressedDurationMin" /t REG_DWORD /d "960" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "UpdatesSuppressedStartHour" /t REG_DWORD /d "6" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "UpdatesSuppressedStartMin" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "UpdatesSuppressedDurationMin" /t REG_DWORD /d "960" /f >nul 2>&1
if not "%ProgramFiles(x86)%"=="" (
 reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate" /v "UpdatesSuppressedStartHour" /t REG_DWORD /d "6" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate" /v "UpdatesSuppressedStartMin" /t REG_DWORD /d "0" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate" /v "UpdatesSuppressedDurationMin" /t REG_DWORD /d "960" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate" /v "UpdatesSuppressedStartHour" /t REG_DWORD /d "6" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate" /v "UpdatesSuppressedStartMin" /t REG_DWORD /d "0" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate" /v "UpdatesSuppressedDurationMin" /t REG_DWORD /d "960" /f >nul 2>&1
)

set "EdgeSettings=msedge-stable-win,msedgewebview-stable-win,msedgeupdate-stable-win"

reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdateDev" /v "CanContinueWithMissingUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdateDev" /v "AllowUninstall" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdateDev" /v "CanContinueWithMissingUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdateDev" /v "AllowUninstall" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev" /v "CanContinueWithMissingUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev" /v "AllowUninstall" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdateDev" /v "CanContinueWithMissingUpdate" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdateDev" /v "AllowUninstall" /t REG_DWORD /d "1" /f >nul 2>&1

for %%e in (%EdgeSettings%) do (
 reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x64" /d "%%e-arm64" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x64-zdp" /d "%%e-arm64-zdp" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x86" /d "%%e-arm64" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x86-zdp" /d "%%e-arm64-zdp" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x64" /d "%%e-arm64" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x64-zdp" /d "%%e-arm64-zdp" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x86" /d "%%e-arm64" /f >nul 2>&1
 reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x86-zdp" /d "%%e-arm64-zdp" /f >nul 2>&1
 if not "%ProgramFiles(x86)%"=="" (
  reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x64" /d "%%e-arm64" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x64-zdp" /d "%%e-arm64-zdp" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x86" /d "%%e-arm64" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x86-zdp" /d "%%e-arm64-zdp" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x64" /d "%%e-arm64" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x64-zdp" /d "%%e-arm64-zdp" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x86" /d "%%e-arm64" /f >nul 2>&1
  reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdateDev\CdpNames" /v "%%e-x86-zdp" /d "%%e-arm64-zdp" /f >nul 2>&1
 )
)

set EdgeSettings=

for /f "tokens=1 delims=," %%t in ('schtasks /query /FO CSV ^| find """\" ^| find "MicrosoftEdgeUpdate"') do (
 schtasks /Change /TN %%t /Disable >nul 2>&1
)

net stop edgeupdate /y >nul 2>&1
net stop edgeupdatem /y >nul 2>&1
sc config edgeupdate start= disabled >nul 2>&1
sc config edgeupdatem start= disabled >nul 2>&1

ECHO.
ECHO Done!
ECHO.
PAUSE

:end
