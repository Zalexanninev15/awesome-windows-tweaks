@echo off
title Windows Optimization Script
color 0a

:MENU
cls
echo ================================ WINDOWS OPTIMIZATION SCRIPT =================================
echo Version 1.0
echo ==============================================================================================
echo [1] Individual Optimizations
echo [2] Preset Optimizations
echo [3] About
echo [4] Exit
echo ==============================================================================================
echo.
set /p choice=Type the number of your choice:

if %choice%==1 goto INDIVIDUAL
if %choice%==2 goto PRESET
if %choice%==3 goto ABOUT
if %choice%==4 goto EXIT
goto MENU

:INDIVIDUAL
cls
echo ================================= INDIVIDUAL OPTIMIZATIONS ===================================
echo.
echo Select the number of the optimization you want to apply (Enter 0 to go back):
echo.
echo [1]   Disable unnecessary startup programs
echo [2]   Disable unnecessary services
echo [3]   Disable unused features
echo [4]   Disable unnecessary animations
echo [5]   Disable unnecessary visual effects
echo [6]   Disable tips and suggestions
echo [7]   Disable unnecessary scheduled tasks
echo [8]   Disable telemetry and data collection
echo [9]   Disable Windows Hello face recognition
echo [10]  Disable Windows Hello fingerprint recognition
echo [11]  Disable Xbox Game Bar
echo [12]  Disable Game Mode
echo [13]  Disable Automatic Updates
echo [14]  Enable Large System Cache
echo [15]  Increase Virtual Memory
echo [16]  Increase CPU Priority
echo [17]  Increase File System Cache
echo [18]  Increase NTFS Memory Usage
echo [19]  Increase Network Throughput
echo [20]  Enable DMA Mode for Hard Disk Drives
echo [21]  Disable Hibernation
echo [22]  Disable Sleep
echo [23]  Disable Remote Assistance
echo [24]  Disable Remote Desktop
echo [25]  Disable Remote Registry
echo [26]  Disable Automatic Maintenance
echo [27]  Disable Action Center
echo [28]  Disable Error Reporting
echo [29]  Disable Compatibility Telemetry
echo [30]  Disable Microsoft Compatibility Appraiser
echo.
set /p choice=Enter the number of the optimization to apply: 

if "%choice%"=="0" goto :MENU
if "%choice%"=="1" goto :DISABLE_STARTUP_PROGRAMS
if "%choice%"=="2" goto :DISABLE_SERVICES
if "%choice%"=="3" goto :DISABLE_UNUSED_FEATURES
if "%choice%"=="4" goto :DISABLE_ANIMATIONS
if "%choice%"=="5" goto :DISABLE_VISUAL_EFFECTS
if "%choice%"=="6" goto :DISABLE_TIPS_SUGGESTIONS
if "%choice%"=="7" goto :DISABLE_SCHEDULED_TASKS
if "%choice%"=="8" goto :DISABLE_TELEMETRY
if "%choice%"=="9" goto :DISABLE_WINDOWS_HELLO_FACE
if "%choice%"=="10" goto :DISABLE_WINDOWS_HELLO_FINGERPRINT
if "%choice%"=="11" goto :DISABLE_XBOX_GAME_BAR
if "%choice%"=="12" goto :DISABLE_GAME_MODE
if "%choice%"=="13" goto :DISABLE_AUTO_UPDATES
if "%choice%"=="14" goto :ENABLE_LARGE_SYSTEM_CACHE
if "%choice%"=="15" goto :INCREASE_VIRTUAL_MEMORY
if "%choice%"=="16" goto :INCREASE_CPU_PRIORITY
if "%choice%"=="17" goto :INCREASE_FILE_SYSTEM_CACHE
if "%choice%"=="18" goto :INCREASE_NTFS_MEMORY_USAGE
if "%choice%"=="19" goto :INCREASE_NETWORK_THROUGHPUT
if "%choice%"=="20" goto :ENABLE_DMA_MODE
if "%choice%"=="21" goto :DISABLE_HIBERNATION
if "%choice%"=="22" goto :DISABLE_SLEEP
if "%choice%"=="23" goto :DISABLE_REMOTE_ASSISTANCE
if "%choice%"=="24" goto :DISABLE_REMOTE_DESKTOP
if "%choice%"=="25" goto :DISABLE_REMOTE_REGISTRY
if "%choice%"=="26" goto :DISABLE_AUTO_MAINTENANCE
if "%choice%"=="27" goto :DISABLE_ACTION_CENTER
if "%choice%"=="28" goto :DISABLE_ERROR_REPORTING
if "%choice%"=="29" goto :DISABLE_COMPATIBILITY_TELEMETRY
if "%choice%"=="30" goto :DISABLE_MICROSOFT_COMPATIBILITY_APPRAISER
goto :MENU

:PRESET
cls
echo ================================== PRESET OPTIMIZATIONS ====================================
echo.
echo Select the number of the preset optimization you want to apply (Enter 0 to go back):
echo.
echo [1]   General Optimization
echo [2]   Gaming Optimization
echo [3]   Network Optimization
echo [4]   High Performance Optimization
echo [5]   Low End PC Optimization
echo [6]   Privacy Optimization
echo [7]   Office Productivity Optimization
echo [8]   Creative Work Optimization
echo [9]   Developer Optimization
echo [10]  Power Saver Optimization
echo.
set /p choice=Enter the number of the preset optimization to apply: 

if "%choice%"=="0" goto :MENU
if "%choice%"=="1" goto :PRESET_GENERAL
if "%choice%"=="2" goto :PRESET_GAMING
if "%choice%"=="3" goto :PRESET_NETWORK
if "%choice%"=="4" goto :PRESET_HIGH_PERFORMANCE
if "%choice%"=="5" goto :PRESET_LOW_END_PC
if "%choice%"=="6" goto :PRESET_PRIVACY
if "%choice%"=="7" goto :PRESET_OFFICE_PRODUCTIVITY
if "%choice%"=="8" goto :PRESET_CREATIVE_WORK
if "%choice%"=="9" goto :PRESET_DEVELOPER
if "%choice%"=="10" goto :PRESET_POWER_SAVER
goto PRESET

:PRESET_GENERAL
echo Applying General Optimization preset...
echo.
echo Disabling unnecessary startup programs...
wmic startup where "not commandline like '%%autostart%%' and not commandline like '%%autoupdate%%' and not commandline like '%%updater%%' and not commandline like '%%helper%%' and not commandline like '%%driver%%' and not commandline like '%%scheduler%%' and not commandline like '%%updater%%' and not commandline like '%%helper%%' and not commandline like '%%launcher%%' and not commandline like '%%monitor%%' and not commandline like '%%update%%' and not commandline like '%%update.exe%%'" call delete
echo Disabling unnecessary services...
sc config "DiagTrack" start=disabled
sc config "dmwappushservice" start=disabled
sc config "WerSvc" start=disabled
sc config "SysMain" start=disabled
sc config "wuauserv" start=disabled
sc config "WindowsSearch" start=disabled
sc config "AppXSvc" start=disabled
echo Disabling unused features...
dism /online /disable-feature /featurename:"MicrosoftWindowsPowerShellV2Root" /norestart
dism /online /disable-feature /featurename:"MediaPlayback" /norestart
dism /online /disable-feature /featurename:"WorkFolders-Client" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-LPRPortMonitor" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-InternetPrinting-Client" /norestart
dism /online /disable-feature /featurename:"RemoteAssistance" /norestart
echo Disabling unnecessary animations...
SystemPropertiesPerformance.exe /s AnimationOff
echo Disabling unnecessary visual effects...
SystemPropertiesPerformance.exe /s AdjustForBestPerformance
echo Disabling tips and suggestions...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalled/reg_dword /d 1 /f
echo General Optimization preset applied.
goto MENU

:PRESET_GAMING
echo Applying Gaming Optimization preset...
echo.
echo Setting power plan to high performance...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo Setting game mode...
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameBarEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore\Children" /v "" /t REG_SZ /d "" /f
echo Gaming Optimization preset applied.
goto MENU

:PRESET_NETWORK
echo Applying Network Optimization preset...
echo.
echo Disabling network throttling...
netsh interface tcp set global autotuning=disabled
netsh interface tcp set global congestionprovider=none
echo Enabling network throughput optimization...
netsh int tcp set global dca=enabled
echo Network Optimization preset applied.
goto MENU

:PRESET_HIGH_PERFORMANCE
echo Applying High Performance Optimization preset...
echo.
echo Disabling background apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
echo Disabling system cooling policy...
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -setacvalueindex scheme_current sub_processor 0cc5b647-c1df-4637-891a-dec35c318583 bc5038f7-23e0-4960-96da-33abaf5935ec 0
powercfg -setactive scheme_current
echo High Performance Optimization preset applied.
goto MENU

:PRESET_LOW_END_PC
echo Applying Low End PC Optimization preset...
echo.
echo Disabling unnecessary services...
sc config "DiagTrack" start=disabled
sc config "dmwappushservice" start=disabled
sc config "WerSvc" start=disabled
sc config "SysMain" start=disabled
sc config "wuauserv" start=disabled
sc config "WindowsSearch" start=disabled
sc config "AppXSvc" start=disabled
echo Disabling unused features...
dism /online /disable-feature /featurename:"MicrosoftWindowsPowerShellV2Root" /norestart
dism /online /disable-feature /featurename:"MediaPlayback" /norestart
dism /online /disable-feature /featurename:"WorkFolders-Client" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-LPRPortMonitor" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-InternetPrinting-Client" /norestart
dism /online /disable-feature /featurename:"RemoteAssistance" /norestart
echo Disabling unnecessary animations...
SystemPropertiesPerformance.exe /s AnimationOff
echo Disabling unnecessary visual effects...
SystemPropertiesPerformance.exe /s AdjustForBestPerformance
echo Disabling tips and suggestions...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalled
"
/reg_dword /d 1 /f
echo Low End PC Optimization preset applied.
goto MENU

:PRESET_PRIVACY
echo Applying Privacy Optimization preset...
echo.
echo Disabling telemetry and data collection...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableInventory /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisablePCA /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableUAR /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableWer /t REG_DWORD /d 1 /f
echo Applying tweaks to improve system performance...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
echo.
echo Privacy Optimization applied successfully!
goto PRESET
:PRESET_GAMING
echo Applying Gaming Optimization preset...
echo.
echo Disabling unnecessary services...
sc config "DiagTrack" start=disabled
sc config "dmwappushservice" start=disabled
sc config "WerSvc" start=disabled
sc config "SysMain" start=disabled
sc config "wuauserv" start=disabled
sc config "WindowsSearch" start=disabled
sc config "AppXSvc" start=disabled
echo Setting processor performance to high...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo Disabling background apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
echo Disabling Game DVR...
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
echo Disabling Xbox Game Bar...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f
echo Disabling Xbox Live...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v Start /t REG_DWORD /d 4 /f
echo Setting network optimization for gaming...
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set heuristics enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rss=enabled
echo Applying NVIDIA graphics settings for gaming...
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\Stereo3D" /v "Enable" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\Stereo3D" /v "Stereo3D_EnableByDefault" /t REG_DWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\Stereo3D" /v "Stereo3DMode" /t REG_DWORD /d 2 /f
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\Stereo3D" /v "Stereo3DPredefinedMode" /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\NVIDIA Corporation\Global\Stereo3D" /v "Stereo3DPredefinedModeDX10" /t REG_DWORD /d 0 /f
echo.
echo Gaming Optimization preset applied successfully!
goto MENU

:PRESET_OFFICE_PRODUCTIVITY
echo Applying Office Productivity Optimization preset...
echo.
echo Disabling unnecessary startup programs...
wmic startup where "not commandline like '%%autostart%%' and not commandline like '%%autoupdate%%' and not commandline like '%%updater%%' and not commandline like '%%helper%%' and not commandline like '%%driver%%' and not commandline like '%%scheduler%%' and not commandline like '%%updater%%' and not commandline like '%%helper%%' and not commandline like '%%launcher%%' and not commandline like '%%monitor%%' and not commandline like '%%update%%' and not commandline like '%%update.exe%%'" call delete
echo Disabling unnecessary services...
sc config "DiagTrack" start=disabled
sc config "dmwappushservice" start=disabled
sc config "WerSvc" start=disabled
sc config "SysMain" start=disabled
sc config "wuauserv" start=disabled
sc config "WindowsSearch" start=disabled
sc config "AppXSvc" start=disabled
echo Disabling unused features...
dism /online /disable-feature /featurename:"MicrosoftWindowsPowerShellV2Root" /norestart
dism /online /disable-feature /featurename:"MediaPlayback" /norestart
dism /online /disable-feature /featurename:"WorkFolders-Client" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-LPRPortMonitor" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-InternetPrinting-Client" /norestart
dism /online /disable-feature /featurename:"RemoteAssistance" /norestart
echo Disabling unnecessary animations...
SystemPropertiesPerformance.exe /s AnimationOff
echo Disabling unnecessary visual effects...
SystemPropertiesPerformance.exe /s AdjustForBestPerformance
echo Disabling tips and suggestions...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalled
" /t REG_DWORD /d 1 /f
echo Enabling classic Alt+Tab switcher...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d 1 /f
echo Enabling hidden files and folders...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f
echo Enabling file extensions...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
echo Disabling Sticky Keys prompt...
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
echo Disabling Filter Keys prompt...
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f
echo Disabling Toggle Keys prompt...
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f
echo.
echo Office Productivity Optimization applied successfully!
goto :MENU

:PRESET_CREATIVE_WORK
echo Applying Creative Work Optimization preset...
echo.
echo Disabling unnecessary startup programs...
wmic startup where "not commandline like '%%autostart%%' and not commandline like '%%autoupdate%%' and not commandline like '%%updater%%' and not commandline like '%%helper%%' and not commandline like '%%driver%%' and not commandline like '%%scheduler%%' and not commandline like '%%updater%%' and not commandline like '%%helper%%' and not commandline like '%%launcher%%' and not commandline like '%%monitor%%' and not commandline like '%%update%%' and not commandline like '%%update.exe%%'" call delete
echo Disabling unnecessary services...
sc config "DiagTrack" start=disabled
sc config "dmwappushservice" start=disabled
sc config "WerSvc" start=disabled
sc config "SysMain" start=disabled
sc config "wuauserv" start=disabled
sc config "WindowsSearch" start=disabled
sc config "AppXSvc" start=disabled
echo Disabling unused features...
dism /online /disable-feature /featurename:"MicrosoftWindowsPowerShellV2Root" /norestart
dism /online /disable-feature /featurename:"MediaPlayback" /norestart
dism /online /disable-feature /featurename:"WorkFolders-Client" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-LPRPortMonitor" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-InternetPrinting-Client" /norestart
dism /online /disable-feature /featurename:"RemoteAssistance" /norestart
echo Disabling unnecessary animations...
SystemPropertiesPerformance.exe /s AnimationOff
echo Disabling unnecessary visual effects...
SystemPropertiesPerformance.exe /s AdjustForBestPerformance
echo Optimizing system for creative work...
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d 90 12 03 80 10 00 00 00 /f
echo.
echo Creative Work Optimization applied successfully!
goto :MENU

:PRESET_DEVELOPER
echo Applying Developer Optimization preset...
echo.
echo Disabling unnecessary startup programs...
wmic startup where "not commandline like '%%autostart%%' and not commandline like '%%autoupdate%%' and not commandline like '%%updater%%' and not commandline like '%%helper%%' and not commandline like '%%driver%%' and not commandline like '%%scheduler%%' and not commandline like '%%updater%%' and not commandline like '%%helper%%' and not commandline like '%%launcher%%' and not commandline like '%%monitor%%' and not commandline like '%%update%%' and not commandline like '%%update.exe%%'" call delete
echo Disabling unnecessary services...
sc config "DiagTrack" start=disabled
sc config "dmwappushservice" start=disabled
sc config "WerSvc" start=disabled
sc config "SysMain" start=disabled
sc config "wuauserv" start=disabled
sc config "WindowsSearch" start=disabled
sc config "AppXSvc" start=disabled
echo Disabling unused features...
dism /online /disable-feature /featurename:"MicrosoftWindowsPowerShellV2Root" /norestart
dism /online /disable-feature /featurename:"MediaPlayback" /norestart
dism /online /disable-feature /featurename:"WorkFolders-Client" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-LPRPortMonitor" /norestart
dism /online /disable-feature /featurename:"Printing-Foundation-InternetPrinting-Client" /norestart
echo Setting Developer Mode for Windows...
reg add "HKLM\SOFTWARE\Microsoft\Windows\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d 1
echo Enabling Developer Mode for Windows...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d 1
echo Disabling unnecessary animations...
SystemPropertiesPerformance.exe /s AnimationOff
echo Disabling unnecessary visual effects...
SystemPropertiesPerformance.exe /s AdjustForBestPerformance
echo Disabling tips and suggestions...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalled
"
echo Developer Optimization applied successfully!
goto MENU

:PRESET_POWER_SAVER
echo Applying Power Saver Optimization preset...
echo.
echo Setting power plan to Power Saver...
powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
echo Disabling unnecessary services...
sc config "XblAuthManager" start=disabled
sc config "XblGameSave" start=disabled
sc config "XboxNetApiSvc" start=disabled
echo Disabling unused features...
dism /online /disable-feature /featurename:"Internet-Explorer-Optional-amd64" /norestart
dism /online /disable-feature /featurename:"WindowsMediaPlayer" /norestart
echo Disabling unnecessary animations...
SystemPropertiesPerformance.exe /s AnimationOff
echo Disabling unnecessary visual effects...
SystemPropertiesPerformance.exe /s AdjustForBestPerformance
echo Applying additional power settings...
powercfg -change -monitor-timeout-ac 15
powercfg -change -monitor-timeout-dc 10
powercfg -change -disk-timeout-ac 15
powercfg -change -disk-timeout-dc 10
powercfg -change -standby-timeout-ac 30
powercfg -change -standby-timeout-dc 20
echo Power Saver Optimization applied successfully.
goto :MENU

:ABOUT
cls
echo ===================================== ABOUT THIS SCRIPT ======================================
echo.
echo This is a Windows Optimization Script designed to help users optimize their system for various use
echo cases such as general use, gaming, network, high performance, low-end PCs, privacy, office productivity,
echo creative work, and development. The script is designed to apply a set of predefined optimizations
echo specific to each use case, you can also apply individual tweaks aswell.
echo You can use multiple presets but be warned they might not be fully compatible together
echo ALWAYS DO RESEARCH BEFORE APPLYING RANDOM TWEAKS, NEVER TRUST ANY SOFTWARE WITHOUT RESEARCH
echo.
echo The script is provided as-is and without warranty of any kind. Use at your own risk.
echo.
echo ====================================== SCRIPT INFORMATION ======================================
echo.
echo Version: 1.0
echo Release Date: March 27, 2023
echo Author: Liu#4069
echo.
echo ====================================== CREDITS AND THANKS ======================================
echo.
echo The following resources were used in the development of this script:
echo - Microsoft documentation and forums
echo - Stack Overflow
echo - Github
echo - The Tech Community
echo.
echo.
goto MENU