echo off
color F0
title BCDEdit Optimization
mode con: cols=82 lines=21

:menu
cls
echo Batch script created by EverythingTech!
timeout 3 > nul
cls
echo If you would like to continue, type in "yes". If not, then type in "no".
echo If you would like to return to default, type in "default".
echo Input your answer below:
set /p a=
if "%a%" == "yes" goto :bcdedit
if "%a%" == "default" goto :default
cls

rem **This is placed in front to make sure if misspelled, it will redirect you instead of applying the wrong setting**
:misspell
cls
echo Misspell detected!
timeout 2 > nul
echo Redirecting back to menu.
timeout 2 > nul
goto :menu

:bcdedit
cls
bcdedit /set disabledynamictick yes > nul
bcdedit /set useplatformtick yes > nul
bcdedit /set tscsyncpolicy enhanced > nul
bcdedit /set tpmbootentropy ForceDisable > nul
bcdedit /set hypervisorlaunchtype off > nul
bcdedit /set quietboot yes > nul
bcdedit /timeout 0 > nul
bcdedit /set allowedinmemorysettings 0x0 > nul
bcdedit /set isolatedcontext No > nul
bcdedit /set nx alwaysoff > nul
bcdedit /set bootux disabled > nul
bcdedit /set bootmenupolicy legacy > nul
bcdedit /set x2apicpolicy disable > nul
bcdedit /set uselegacyapicmode yes > nul
timeout 3 > nul
cls
echo BCDEdit is now optimized!
timeout 2 > nul
cls
echo Exiting.
timeout 1 > nul
cls
echo Exiting..
timeout 1 > nul
cls
echo Exiting...
timeout 1 > nul

:default
cls
bcdedit /set disabledynamictick no > nul
bcdedit /set useplatformtick no > nul
bcdedit /deletevalue tscsyncpolicy > nul
bcdedit /deletevalue hypervisorlaunchtype > nul
bcdedit /deletevalue quietboot > nul
bcdedit /timeout 3 > nul
bcdedit /deletevalue allowedinmemorysettings > nul
bcdedit /deletevalue isolatedcontext > nul
bcdedit /deletevalue nx > nul
bcdedit /deletevalue bootux > nul
bcdedit /deletevalue bootmenupolicy > nul
bcdedit /deletevalue x2apicpolicy > nul
bcdedit /deletevalue uselegacyapicmode > nul
timeout 3 > nul
cls
echo BCDEdit is now default!
timeout 2 > nul
cls
echo Exiting.
timeout 1 > nul
cls
echo Exiting..
timeout 1 > nul
cls
echo Exiting...
timeout 1 > nul
