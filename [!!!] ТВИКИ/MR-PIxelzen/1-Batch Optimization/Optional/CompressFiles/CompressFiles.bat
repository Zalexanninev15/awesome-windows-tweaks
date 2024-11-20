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
echo WARNING: THIS CAN TAKE A LONG WHILE
pause
compact /C /S:"C:\Program Files" /A /I
compact /C /S:"C:\Program Files (x86)" /A /I
compact /C /S:"C:\ProgramData" /A /I
compact /C /S:"%userprofile%\AppData" /A /I
for /f "delims=" %%d in ('dir C:\Windows /b /AD') do (
	if "%%d" neq "Boot" (
		if "%%d" neq "System32" (
			if "%%d" neq "SysWOW64" (
				if "%%d" neq "Fonts" (
					if "%%d" neq "Cursors" (
						if "%%d" neq "INF" (
							compact /C /S:"C:\Windows\%%d" /A /I
						)
					)
				)
			)
		)
	)
)
for /f "delims=" %%f in ('dir C:\Windows /b /A-D') do (
	compact /C "C:\Windows\%%f" /A /I
)
compact /C "C:\Windows" /A /I
echo Done, reboot
pause
exit
