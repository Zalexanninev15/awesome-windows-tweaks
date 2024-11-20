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
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcTimeout" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogPeriod" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileOffset" /t REG_DWORD /d 10000 /f
echo Done
pause
exit
