echo off
color F0
title Windows 10 Service Disabler
mode con: cols=92 lines=21

setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "del=%%a"
)

cls
call :colortext F0 "This script was made by" 
call :colortext F3 " EverythingTech" && echo.
timeout 2 > nul
echo I am not responsible for damages/issues caused by this file or guide.
timeout 4 > nul

:main
cls
call :colortext F0 "This script is"
call :colortext FA " REVERSIBLE"
call :colortext F0 " and will allow you to choose services you want to disable." && echo .
echo Would you to like to continue?
set /p con=
if /i "%con%" == "yes" (
       goto services
) else (
     cls && echo Misspell detected.
     timeout 2 >nul
     cls && echo Returning. && timeout 1 >nul && cls && echo Returning.. && timeout 1 >nul && cls && echo Returning... && timeout 1 >nul && cls
     goto :main
)

:services
cls 
call :colortext FC "Disable" && echo  App-V (Virtual Applications)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service AppVClient -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Auto-Play Events Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service ShellHWDetection -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Auto Time Zone Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service tzautoupdate -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Bluetooth Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service bthserv -StartupType Disabled" && PowerShell -Command "Set-Service BTAGService -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  GPS Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service lfsvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Maps Broker?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service MapsBroker -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Microsort Store Dependencies?
set /p con=
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service NcbService -StartupType Disabled" && PowerShell -Command "Set-Service InstallService -StartupType Disabled" && PowerShell -Command "Set-Service PushToInstall -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Phone and Contact Searching Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service PimIndexMaintenanceSvc -StartupType Disabled" && PowerShell -Command "Set-Service PhoneSvc -StartupType Disabled" && PowerShell -Command "Set-Service icssvc -StartupType Disabled" && PowerShell -Command "Set-Service TapiSrv -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Print Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service LanmanServer -StartupType Disabled" && PowerShell -Command "Set-Service Spooler -StartupType Disabled" && PowerShell -Command "Set-Service PrintNotify -StartupType Disabled" && PowerShell -Command "Set-Service Fax -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Quality Windows Audio Video Experience Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service QWAVE -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Remote Access Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service RemoteAccess -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Sensor Services (don't disable on 2-in-1s or 360 devices)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service TabletInputService -StartupType Disabled" && PowerShell -Command "Set-Service SensorService -StartupType Disabled" && PowerShell -Command "Set-Service SensrSvc -StartupType Disabled" && PowerShell -Command "Set-Service SensorDataService -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Smart Card Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service SCardSvr -StartupType Disabled" && PowerShell -Command "Set-Service ScDeviceEnum -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Theme Management Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service Themes -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext FC "Disable" && echo  UPnP Device Host?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service SSDPSRV -StartupType Disabled" && PowerShell -Command "Set-Service upnphost -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Virtual Machine Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service HvHost -StartupType Disabled" && PowerShell -Command "Set-Service vmickvpexchange -StartupType Disabled" && PowerShell -Command "Set-Service vmicguestinterface -StartupType Disabled" && PowerShell -Command "Set-Service vmicshutdown -StartupType Disabled" && PowerShell -Command "Set-Service vmicheartbeat -StartupType Disabled" && PowerShell -Command "Set-Service vmicvmsession -StartupType Disabled" && PowerShell -Command "Set-Service vmicrdv -StartupType Disabled" && PowerShell -Command "Set-Service vmictimesync -StartupType Disabled" && PowerShell -Command "Set-Service vmicvss -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Camera Frame Client Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service FrameServer -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Windows Font Cache Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service FontCache -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext FC "Disable" && echo  Windows Image Scanning Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service stisvc -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Insider Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service wisvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Search Indexing?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service WSearch -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Xbox Live Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service XblAuthManager -StartupType Disabled" && PowerShell -Command "Set-Service XblGameSave -StartupType Disabled" && PowerShell -Command "Set-Service XboxNetApiSvc -StartupType Disabled" && cls  
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Diagnostics and Telemetry Services (breaks diagnostics)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service DiagTrack -StartupType Disabled" && PowerShell -Command "Set-Service DPS -StartupType Disabled" && PowerShell -Command "Set-Service WdiServiceHost -StartupType Disabled" && PowerShell -Command "Set-Service WdiSystemHost -StartupType Disabled" && PowerShell -Command "Set-Service WerSvc -StartupType Disabled" && PowerShell -Command "Set-Service diagsvc -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext F4 "Disable" && echo  Sync Host (breaks synchronization)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service OneSyncSvc -StartupType Disabled" && PowerShell -Command "Set-Service CDPUserSvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Task Scheduler Service (breaks Windows Search)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service Schedule -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext F4 "Disable" && echo  Windows Defender Services (breaks MS Defender)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service WdNisSvc -StartupType Disabled" && PowerShell -Command "Set-Service WinDefend -StartupType Disabled" && PowerShell -Command "Set-Service wscsvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext F0 "All chosen services are now " && call :colortext FA " disabled" && echo. && timeout 2 > nul
timeout 2 >nul
echo Make sure to restart your PC for the changes to take effect!


:colortext
echo off
<nul set /p ".=%del%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1