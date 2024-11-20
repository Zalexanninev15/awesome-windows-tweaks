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
cd /D "%~dp0\..\..\"
IF NOT EXIST "%~dp0\..\..\data\nvprofile.nip" (
	echo Error: Profile not found
	echo Nothing to do
	pause
	exit
)
"%~dp0\..\..\data\nvidiaProfileInspector.exe" "%~dp0\..\..\data\nvprofile.nip"
pause
exit
