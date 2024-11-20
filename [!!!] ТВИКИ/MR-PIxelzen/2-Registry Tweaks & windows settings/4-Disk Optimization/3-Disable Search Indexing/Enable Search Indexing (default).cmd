@echo off
setlocal EnableDelayedExpansion

sc config WSearch start=auto
net start WSearch

echo Reverted changes. Windows Search service is now enabled.
pause
exit /b
