:: SET TSCSYNCPOLICY TO LEGACY

@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || (echo This script must be Run as Administrator. && pause && exit /b 1)

:: FOR BETTER INPUT BUT WORSE FPS (YOUR EXPERIENCE MAY BE DIFFERENT)
bcdedit /set tscsyncpolicy legacy

echo TscSyncPolicy is now set to legacy. Please restart your computer.
pause

exit /b 0
