@echo off
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
fsutil behavior set disabledeletenotify 0 >> me_log.txt
IF ERRORLEVEL 1 (
	echo WARNING: Failed to apply SSD drive behavior patch. Check me_log.txt for details.
	pause
) else (
	echo SSD drive behavior patch has been applied ALSO kNOW SSD trim enable
)



pause