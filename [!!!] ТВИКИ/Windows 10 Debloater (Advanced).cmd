echo off
color F0
title Windows 10 Debloater (Advanced)
mode con: cols=92 lines=21
cls

setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "del=%%a"
)

cls
echo Created by wnuku and Michal Wnuowski (updated by Legolash2o)
timeout 1 >nul
echo Original concept by Aviv00@msfn / lite8@MDL
timeout 1 >nul
call :colortext F0 "Modified by " && call :colortext F3 " EverythingTech" && echo.
timeout 2 > nul
echo I am not responsible for damages/issues caused by this file or guide.
timeout 4 > nul

:main
cls
call :colortext F0 "This script is"
call :colortext F4 " NON-REVERSIBLE"
call :colortext F0 " and will allow you to choose apps you want to remove." && echo .
echo Keep in mind that these changes are permanent, are you sure you want to continue?
set /p con=
if /i "%con%" == "yes" (
       goto debloat
) else (
     cls && echo Misspell detected.
     timeout 2 >nul
     cls && echo Returning. && timeout 1 >nul && cls && echo Returning.. && timeout 1 >nul && cls && echo Returning... && timeout 1 >nul && cls
     goto :main
)

:debloat
cls
call :colortext F4 "PERMANENTLY REMOVE" && echo  Microsoft Connect?
set /p con= 
if /i "%con%" == "yes" cls && cd /d "%~dp0" && install_wim_tweak.exe /o /c  Microsoft-PPIProjection-Package /r >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "PERMANENTLY REMOVE" && echo  Remote Desktop Package?
set /p con= 
if /i "%con%" == "yes" cls && cd /d "%~dp0" && install_wim_tweak.exe /o /c  RemoteDesktopServices-Base-Package /r >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "PERMANENTLY REMOVE" && echo  Windows Fax Client?
set /p con= 
if /i "%con%" == "yes" cls && cd /d "%~dp0" && install_wim_tweak.exe /o /c  Microsoft-Windows-Fax-Client-Feature-Opt-Package /r >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "PERMANENTLY REMOVE" && echo  Windows OneDrive Setup?
set /p con= 
if /i "%con%" == "yes" cls && cd /d "%~dp0" && install_wim_tweak.exe /o /c  Microsoft-Windows-OneDrive-Setup-Package /r >nul && install_wim_tweak.exe /o /c  Microsoft-Windows-OneDrive-Setup-WOW64-Package /r >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "PERMANENTLY REMOVE" && echo  All AppX Packages?
set /p con= 
if /i "%con%" == "yes" cls && cd "C:\Program Files" >nul && takeown /f "WindowsApps" >nul && takeown /f "WindowsApps\*" >nul && rd /s /q "WindowsApps" >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F0 "Your copy of Windows 10 is now fully " && call :colortext F2 " debloated" && echo. && timeout 2 > nul


:colortext
echo off
<nul set /p ".=%del%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1