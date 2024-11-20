@echo off
cls
net session > nul
IF ERRORLEVEL 1 (
	echo Please run as Admin
	pause
	exit
)
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=16384,MaximumSize=16384
if NOT ERRORLEVEL 0 (
	echo ERROR: Failed to set pagefile to 16 GB
	echo Maybe you don't have enough free space to do so
	pause
	exit
)
echo Done
pause
exit
