: Disable acceleration on the Welcome screen and/or Log in dialog.
: (Part of the MarkC Windows Mouse Acceleration Fix.)
:
: If you apply a MarkC Mouse Fix .reg file and see a message: 
:  "Cannot import (file).reg: Not all data was successfully written to the registry."
: or if you run MarkC_Windows_10+8.x+7+Vista+XP_MouseFix_Builder.vbs and see a message:
:  "Part of the mouse acceleration fix can't be applied,
:   because you are not logged in as an Administrator.",
: AND you are not logged in as an administrator while applying the fix, then:
:
: Select this CMD file in Windows Explorer, right-click, click 'Run as administrator'
:
: See the ReadMe.txt file for more details.
:
@echo off
setlocal enableextensions

call :GetWelcomeScreenAccel
if "%Accel%"=="0" goto :Disabled

: Attempt to disable
echo.
echo Disabling acceleration on the Welcome screen and/or Log in dialog...
reg add "HKEY_USERS\.DEFAULT\Control Panel\Mouse" /v MouseSpeed /d 0 /f

: Check if it worked
call :GetWelcomeScreenAccel
if not "%Accel%"=="0" goto :NotDisabled

:Disabled
echo.
echo Mouse pointer acceleration is disabled for the Welcome screen.
echo.
pause
goto :eof

:NotDisabled
echo.
echo ERROR: Mouse pointer acceleration is NOT disabled for the Welcome screen.
echo.
echo Run %~nx0 as Administrator, by:
echo - Unzip %~nx0 to a folder,
echo - Select %~nx0 in Windows Explorer,
echo - Right-click and click 'Run as administrator' from the context menu.
echo.
pause
goto :eof

:GetWelcomeScreenAccel
for /f "tokens=3" %%a in ('reg query "HKEY_USERS\.DEFAULT\Control Panel\Mouse" /v MouseSpeed ^| find /i "MouseSpeed"') do set Accel=%%a
goto :eof