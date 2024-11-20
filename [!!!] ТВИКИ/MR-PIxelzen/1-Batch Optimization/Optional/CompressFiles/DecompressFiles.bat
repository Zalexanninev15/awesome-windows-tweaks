@echo off
cls
setlocal enabledelayedexpansion
IF EXIST "C:\Windows\system32\adminrightstest" (
	rmdir C:\Windows\system32\adminrightstest > nul
)
mkdir C:\Windows\system32\adminrightstest > nul
if %errorlevel% neq 0 (
	powershell "Start-Process \"%~nx0\" -Verb RunAs"
	if !errorlevel! neq 0 (
		powershell "Start-Process '%~nx0' -Verb RunAs"
		if !errorlevel! neq 0 (
			echo You should run this script as Admin in order to allow system changes
			echo The tweaker will now exit
			pause
			exit
		)
	)
	exit
)
rmdir C:\Windows\system32\adminrightstest > nul
compact /compactos:query > nul
if %errorlevel% equ 100 (
	echo ERROR: Decompressing software data while Compact Mode is in use will prevent Windows from booting
	echo The script won't proceed
	pause
	exit
)
echo WARNING: THIS CAN TAKE A LONG WHILE
pause
compact /U /S:"C:\Windows" /A /I
compact /U /S:"C:\Program Files" /A /I
compact /U /S:"C:\Program Files (x86)" /A /I
compact /U /S:"C:\ProgramData" /A /I
compact /U /S:"%userprofile%\AppData" /A /I
echo Done, reboot
pause
exit
