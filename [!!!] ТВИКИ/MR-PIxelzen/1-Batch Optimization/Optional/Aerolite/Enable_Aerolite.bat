@echo off
cls
IF NOT EXIST "C:\Windows\Resources\Themes\aerolite.theme" (
	echo ERROR: Aero Lite theme is not installed.
	pause
	exit
)
"C:\Windows\Resources\Themes\aerolite.theme"
