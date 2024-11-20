@echo off
:init
title Windows activator
set r=set var=999

:menu
%r%
cls
echo Choose your Windows version
echo.
echo 1. Windown 10/11
echo 2. Windows 8/8.1
echo 3. Windows 7
echo 4. Windows Vista
echo 5. Windows Server 2022
echo.
echo 6. Our GitHub
set /p var=Type some number : 
if "%var%" == "1" call :win1011
if "%var%" == "2" call :win8ch
if "%var%" == "3" call :win7
if "%var%" == "5" call :winserver2022
if "%var%" == "4" call :winVista
if "%var%" == "6" start https://github.com/m-a-prod/activating-windows-10-11
goto menu

:winserver2022
%r%
cls
echo Chose your Windows Server 2022 version
echo.
echo 1. Datacenter
echo 2. Standart
echo.
echo 0. Back
set /p var=Type some number : 
if "%var%" == "1" call :activate WX4NM-KYWYW-QJJR4-XV3QB-6VM33
if "%var%" == "2" call :activate VDYBN-27WPP-V4HQT-9VMD4-VMK7H
if "%var%" == "0" goto :eof
goto winserver2022

:win1011
%r%
cls
title Windows 10/11
echo Choose your Windows version
echo.
echo 1. Pro
echo 2. Pro for Workstations
echo 3. Education
echo 4. Enterprise
echo.
echo 0. Back
set /p var=Type some number : 
if "%var%" == "1" call :activate W269N-WFGWX-YVC9B-4J6C9-T83GX
if "%var%" == "2" call :activate NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
if "%var%" == "3" call :activate 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
if "%var%" == "4" call :activate NPPR9-FWDCX-D2C8J-H872K-2YT43
if "%var%" == "0" goto :eof
goto win1011

:win8ch
%r%
cls
title Windows 8
echo Choose your Windows version
echo.
echo 1. Windows 8.1
echo 2. Windows 8
echo.
echo 0. Back
set /p var=Type some number : 
if "%var%" == "1" call :win81
if "%var%" == "2" call :win8
if "%var%" == "0" goto :eof
goto win8ch

:win8
%r%
cls
title Windows 8
echo Choose your Windows 8 version
echo.
echo 1. Pro
echo 2. Enterprise
echo.
echo 0. Back
set /p var=Type some number : 
if "%var%" == "1" call :activate NG4HW-VH26C-733KW-K6F98-J8CK4
if "%var%" == "2" call :activate 32JNW-9KQ84-P47T8-D8GGY-CWCK7
if "%var%" == "0" goto :eof
goto win8

:win81
%r%
cls
title Windows 8.1
echo Choose your Windows 8.1 version
echo.
echo 1. Pro
echo 2. Enterprise
echo.
echo 0. Back
set /p var=Type some number : 
if "%var%" == "1" call :activate GCRJD-8NW9H-F2CDX-CCM8D-9D6T9
if "%var%" == "2" call :activate MHF9N-XY6XB-WVXMC-BTDCT-MKKG7
if "%var%" == "0" call :eof
goto win81

:win7
%r%
cls
title Windows 7
echo Choose your Windows 7 version
echo.
echo 1. Professional
echo 2. Enterprise
echo.
echo 0. Back
set /p var=Type some number : 
if "%var%" == "1" call :activate FJ82H-XT6CR-J8D7P-XQJJ2-GPDD4
if "%var%" == "2" call :activate 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
if "%var%" == "0" goto :eof
goto win7

:winVista
%r%
cls
title Windows Vista
echo Choose your Windows Vista version
echo.
echo 1. Windows Vista Business
echo 2. Windows Vista Business N
echo 3. Windows Vista Enterprise
echo 4. Windows Vista Enterprise N
echo.
set /p var=Type some number : 
if "%var%" == "1" call :activate YFKBB-PQJJV-G996G-VWGXY-2V3X8
if "%var%" == "2" call :activate HMBQG-8H2RH-C77VX-27R82-VMQBT
if "%var%" == "3" call :activate VKK3X-68KWM-X2YGT-QR4M6-4BWMV
if "%var%" == "4" call :activate VTC42-BM838-43QHV-84HX6-XJXKV
if "%var%" == "0" goto :eof
goto winVista


:activate
cls
echo Popups may appear during activation, so you should close them to complete activation.
echo Please wait...
title Activating... - 0%%  & slmgr /ipk %1
title Activating... - 33%% & slmgr /skms kms.digiboy.ir
title Activating... - 66%% & slmgr /ato
title Windows 10/11 activator
cls
echo Windows activated successfully!
echo If it isn't, try to choose diffrent vesrion from the menu of this program.
echo.
echo Press any key to quit...
