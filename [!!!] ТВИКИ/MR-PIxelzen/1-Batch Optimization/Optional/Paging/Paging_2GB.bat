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
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=2048,MaximumSize=2048
if NOT ERRORLEVEL 0 (
	echo ERROR: Failed to set pagefile to 2 GB
	echo Maybe you don't have enough free space to do so
	pause
	exit
)
echo Done
pause
exit
