echo off
color F0
title Windows 10 Driver Disabler
mode con: cols=92 lines=21

rem Credit to Adam and Felipe (https://docs.google.com/document/d/1r-pQgh2WHgCTu2Ra8T2PANr8v61m0BtbqsMJf5sacf0/mobilebasic)
rem They helped a ton with the creation of this script!

setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "del=%%a"
)

cls
call :colortext F0 "Research done by "
call :colortext F2 " Adam " 
call :colortext F0 " and "
call :colortext F4 " Felipe " && echo.
timeout 2 >nul
call :colortext F0 "This script was made by" 
call :colortext F3 " EverythingTech" && echo.
timeout 2 >nul
echo I am not responsible for damages/issues caused by this file or guide.
timeout 4 >nul

:main
cls
call :colortext F0 "This script is"
call :colortext FA " REVERSIBLE"
call :colortext F0 " and will allow you to choose drivers you want to disable." && echo .
echo Would you to like to continue?
set /p con=
if /i "%con%" == "yes" (
       goto drivers
) else (
     cls && echo Misspell detected.
     timeout 2 >nul
     cls && echo Returning. && timeout 1 >nul && cls && echo Returning.. && timeout 1 >nul && cls && echo Returning... && timeout 1 >nul && cls
     goto :main
)

:drivers
cls 
call :colortext FC "Disable" && echo  Application Compatibility Cache (breaks Settings app)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\ahcache" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Beep Driver (the most useless driver ever)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Beep" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  CD-ROM Drivers (breaks Rufus/CD Drive support)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\cdfs" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\cdrom" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\udfs" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Composite Bus Enumerator Driver?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\CompositeBus" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  GPU Energy Driver?
set /p con=
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Intel/AMD PPM (disables C-States)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\IntelPPM" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\AmdPPM" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Processor" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext FC "Disable" && echo  Microsoft Standard NVM Express Driver (disables NVME/M.2 support)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Microsoft Virtual Drive Enumerator Driver?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\vdrvroot" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Microsoft Virtual Network Adapter Enumerator Driver?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\NdisVirtualBus" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Offline/Cloud Files Drivers?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\CSC" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\CldFlt" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Performance Counters Driver (breaks Task Manager)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\pcw" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Quality Windows Audio Video Experience (web-related)?
set /p con=
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\QWAVEdrv" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Remote Access Related Drivers (disables VPNs and remote systems)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wanarp" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\wanarpv6" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\NdisTapi" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\NdisWan" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Rdpbus" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasAcd" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasAgileVpn" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Rasl2tp" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasPppoe" /v Start /t REG_DWORD /d 4 /f >nul && reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasSstp" /v Start /t REG_DWORD /d 4 /f >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Serial Mouse/Keyboard Driver (disables laptop/PS2 keyboards/mice)?
set /p con= 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Server Drivers (disables Printer support)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service LanmanServer -StartupType Disabled" && reg add "HKLM\SYSTEM\CurrentControlSet\Services\srv2" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Srvnet" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Software Bus Driver (disables webcam support)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\swenum" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Trusted Platform Module Driver (less secure)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\TPM" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  UMBus Enumerator Driver?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\UMBus" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Virtual WiFi Filter/Wireless Bus?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\vwifibus" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\vwififlt" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Defender/Firewall Drivers (disable Defender/Firewall first)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\MpsSvc" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wdboot" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdFilter" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv" /v Start /t REG_DWORD /d 4 /f && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wdnsfltr" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Network Data Usage Monitoring Driver?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\ndu" /v Start /t REG_DWORD /d 4 /f && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Overlay File System Filter Drive (may cause a BSoD)?
set /p con= 
if /i "%con%" == "yes" cls && reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wof" /v Start /t REG_DWORD /d 4 /f && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F0 "All chosen drivers are now " && call :colortext FA " disabled" && echo. && timeout 2 > nul
timeout 2 >nul
echo Make sure to restart your PC for the changes to take effect!


:colortext
echo off
<nul set /p ".=%del%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1