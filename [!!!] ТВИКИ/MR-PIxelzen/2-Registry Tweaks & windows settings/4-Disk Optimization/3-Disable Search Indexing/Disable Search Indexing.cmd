@echo off
setlocal EnableDelayedExpansion

net stop WSearch
sc config WSearch start=disabled

echo Finished, please reboot your device for changes to apply.
pause
exit /b