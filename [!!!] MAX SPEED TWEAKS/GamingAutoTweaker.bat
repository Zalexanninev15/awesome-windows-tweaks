@echo OFF &SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title Felipe.#8581 ~ Donate: bit.ly/3goAOyc

echo.
echo  Tweaking improves latency, input lag, system responsiveness, not FPS
echo  Do not expect your computer to hit higher fps unless you did shit before 
echo  This is not realistic and that's why it's called optimization, not a miracle
echo.
echo.
echo  Automatization is not the best way, please learn tweaking
echo  You can start reading all guides on Revision discord (revi.cc)
echo.

:: Enabling necessary services
powershell "Set-ExecutionPolicy -ExecutionPolicy Unrestricted" >NUL 2>&1
sc config Winmgmt start=demand >NUL 2>&1 & sc start Winmgmt >NUL 2>&1
sc config TrustedInstaller start=demand >NUL 2>&1 & sc start TrustedInstaller >NUL 2>&1
sc config AppInfo start=demand >NUL 2>&1 & sc start AppInfo >NUL 2>&1
sc config DeviceInstall start=demand >NUL 2>&1 & sc start DeviceInstall >NUL 2>&1
sc config Dhcp start=demand >NUL 2>&1 & sc start Dhcp >NUL 2>&1

:: Automatically set static ip, Thanks to Phlegm
set DNS1=156.154.70.22
set DNS2=8.8.4.4
if "%INTERFACE%"=="" for /f "tokens=3,*" %%i in ('netsh int show interface^|find "Connected"') do set INTERFACE=%%j
if "%IP%"=="" for /f "tokens=3 delims=: " %%i in ('netsh int ip show config name^="%INTERFACE%" ^| findstr "IP Address" ^| findstr [0-9]') do set IP=%%i
if "%MASK%"=="" for /f "tokens=2 delims=()" %%i in ('netsh int ip show config name^="%INTERFACE%" ^| findstr /r "(.*)"') do for %%j in (%%i) do set MASK=%%j
if "%GATEWAY%"=="" for /f "tokens=3 delims=: " %%i in ('netsh int ip show config name^="%INTERFACE%" ^| findstr "Default" ^| findstr [0-9]') do set GATEWAY=%%i
if "%DNS1%"=="" for /f "tokens=2 delims=: " %%i in ('echo quit^|nslookup^|find "Address:"') do set DNS1=%%i
call:isValidIP %IP%
call:isValidIP %MASK%
call:isValidIP %GATEWAY%
call:isValidIP %DNS1%
if defined DNS2 call:isValidIP %DNS2%
if defined _notValidIP (
echo  Setting a static IP failed. Exiting program . . .
pause
exit /b 2
)
netsh int ipv4 set address name="%INTERFACE%" static %IP% %MASK% %GATEWAY% >nul 2>&1
netsh int ipv4 set dns name="%INTERFACE%" static %DNS1% primary >nul 2>&1
if defined DNS2 netsh int ipv4 add dns name="%INTERFACE%" %DNS2% index=2 >nul 2>&1
for /f "tokens=3 delims=: " %%i in ('netsh int ip show config name^="%INTERFACE%" ^| findstr "DHCP" ^| findstr [a-z]') do set DHCP=%%i
if "%DHCP%"=="Yes" (
echo  Setting a static IP failed. Exiting program . . .
pause
exit /b 2
) else (
netsh int set interface name="%INTERFACE%" admin="disabled" && netsh int set interface name="%INTERFACE%" admin="enabled" >nul 2>&1
)
:isValidIP
for /F "tokens=1-4 delims=./" %%a in ("%1") do (
if %%a LSS 1 set _notValidIP=1
if %%a GTR 255 set _notValidIP=1
if %%b LSS 0 set _notValidIP=1
if %%b GTR 255 set _notValidIP=1
if %%c LSS 0 set _notValidIP=1
if %%c GTR 255 set _notValidIP=1
if %%d LSS 0 set _notValidIP=1
if %%d GTR 255 set _notValidIP=1
)

LODCTR /R >nul 2>&1
LODCTR /R >nul 2>&1

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "BranchReadinessLevel" /t REG_SZ /d "CB" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "DeferFeatureUpdates" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "DeferQualityUpdates" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "ExcludeWUDrivers" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "FeatureUpdatesDeferralInDays" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsDeferralIsActive" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsWUfBConfigured" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "IsWUfBDualScanActive" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UpdatePolicy\PolicyState" /v "PolicySources" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "BranchReadinessLevel" /t REG_DWORD /d "16" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdates" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DeferFeatureUpdatesPeriodInDays" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuilds" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ManagePreviewBuildsPolicyValue" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequency" /t REG_DWORD /d "20" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequencyEnabled" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "EnableFeaturedSoftware" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\Update" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\Update" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\Update\ExcludeWUDriversInQualityUpdate" /v "value" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Runtimes
IF NOT EXIST "%SystemDrive%\Felipe\dxwebsetup.exe" certutil -urlcache -Unicode -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/dxwebsetup.exe %SystemDrive%\Felipe\dxwebsetup.exe >NUL 2>&1
start "" /wait "%SystemDrive%\Felipe\dxwebsetup.exe" /Q >NUL 2>&1
IF NOT EXIST "%SystemDrive%\Felipe\vulkansetup.exe" certutil -urlcache -Unicode -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/vulkansetup.exe %SystemDrive%\Felipe\vulkansetup.exe >NUL 2>&1
start "" /wait "%SystemDrive%\Felipe\vulkansetup.exe" /S >NUL 2>&1

:: Image File Execution
powershell "Remove-Item -Path \"HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\*\" -Recurse -ErrorAction SilentlyContinue"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >NUL 2>&1

:: Installing AeroLite
IF EXIST "%WinDir%\Resources\Themes\aero\aerolite.msstyles" (
powershell "$content = [System.IO.File]::ReadAllText('%WinDir%\Resources\Themes\aero.theme').Replace('%ResourceDir%\Themes\Aero\Aero.msstyles','%ResourceDir%\Themes\Aero\Aerolite.msstyles'); [System.IO.File]::WriteAllText('%WinDir%\Resources\Themes\aerolite.theme', $content)"
IF EXIST "%WinDir%\Resources\Themes\light.theme" (
powershell "$content = [System.IO.File]::ReadAllText('%WinDir%\Resources\Themes\light.theme').Replace('%ResourceDir%\Themes\Aero\Aero.msstyles','%ResourceDir%\Themes\Aero\Aerolite.msstyles'); [System.IO.File]::WriteAllText('%WinDir%\Resources\Themes\lightlite.theme', $content)" 
)
)

:: Disabling Devices Platform Connection that synchronizes user data and telemetry
for /F "eol=E" %%a in ('reg query "HKLM\System\CurrentControlSet\Services" /F "cdpusersvc"') DO (
reg add "%%a" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
for /F "tokens=*" %%z IN ("%%a") DO (
set STR=%%z
set STR=!STR:HKLM\System\CurrentControlSet\services\=!
)
)

:: Disabling Link power management mode
for /F "eol=E" %%a in ('reg query "HKLM\System\CurrentControlSet\Services" /S /F "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
reg add "%%a" /v "EnableHIPM" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "%%a" /v "EnableDIPM" /t REG_DWORD /d "0" /f >NUL 2>&1
for /F "tokens=*" %%z IN ("%%a") DO (
set STR=%%z
set STR=!STR:HKLM\System\CurrentControlSet\Services\=!
)
)

:: Testing new I/O settings 
:: NumberOfRequests limits the concurrent requests Windows will make to the drive (to 20)
:: IoLatencyCap will prevent more requests to be sent if the drive latency is >50ms (aka it's already struggling to satisfy those it's got)
:: IoTimeoutValue will reset the drive after one second of no response instead of 30, which will make any resets that might still happen almost unnoticeable
reg add "HKLM\SYSTEM\CurrentControlSet\Services\storahci\Parameters" /v "IoLatencyCap" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\storahci\Parameters" /v "IoTimeoutValue" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\storahci\Parameters" /v "NumberOfRequests" /t REG_DWORD /d "20" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaStorAV\Parameters" /v "IoLatencyCap" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaStorAV\Parameters" /v "IoTimeoutValue" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaStorAV\Parameters" /v "NumberOfRequests" /t REG_DWORD /d "20" /f

:: Installing Power Plan
IF NOT EXIST %SystemDrive%\Felipe\Disabled.pow certutil -urlcache -split -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/Disabled.pow %SystemDrive%\Felipe\Disabled.pow >NUL 2>&1
IF NOT EXIST %SystemDrive%\Felipe\Enabled.pow certutil -urlcache -split -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/Enabled.pow %SystemDrive%\Felipe\Enabled.pow >NUL 2>&1

reg query "HKLM\System\CurrentControlSet\Services\Power" /v Start | find "4" >NUL 2>&1
if errorlevel 1 goto addplans
goto powerisoff
:addplans
echo  Adding powerplans
powercfg -restoredefaultschemes >NUL 2>&1
powercfg -attributes sub_processor 5d76a2ca-e8c0-402f-a133-2158492d58ad -ATTRIB_HIDE >NUL 2>&1
powercfg -import %SystemDrive%\Felipe\Disabled.pow >NUL 2>&1
powercfg -import %SystemDrive%\Felipe\Enabled.pow >NUL 2>&1
for /f "tokens=4" %%f in ('powercfg -list ^| findstr /C:"Disabled"') do set GUID=%%f
powercfg -setactive %GUID% >NUL 2>&1
:powerisoff

echo  Enabling Windows Components
dism /online /enable-feature /featurename:DesktopExperience /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:LegacyComponents /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:DirectPlay /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:NetFx4-AdvSrvs /all /norestart >NUL 2>&1
dism /online /enable-feature /featurename:NetFx3 /all /norestart >NUL 2>&1

echo  Enabling MSI-mode for GPU
for /F %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f >NUL 2>&1
)

ECHO  Configurating Nvidia...
certutil -urlcache -split -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/nvdrsdb0.bin "C:\ProgramData\NVIDIA Corporation\Drs\nvdrsdb0.bin" >NUL 2>&1
certutil -urlcache -split -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/nvdrsdb1.bin "C:\ProgramData\NVIDIA Corporation\Drs\nvdrsdb1.bin" >NUL 2>&1

echo  Disabling USB Hub and StorPort idle
for /F %%a in ('WMIC PATH Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f	>NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f >NUL 2>&1	
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D1Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D2Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D3Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D1Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D2Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D3Latency" /t REG_DWORD /d "0" /f >NUL 2>&1
)
for /F "tokens=*" %%a in ('reg query "HKLM\System\CurrentControlSet\Enum" /S /F "StorPort"^| FINDSTR /E "StorPort"') DO (
reg add "%%a" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f >NUL 2>&1
)

echo  Tweaking Network (Be Patient...)
netsh winsock reset >NUL 2>&1
netsh interface teredo set state disabled >NUL 2>&1
netsh interface 6to4 set state disabled >NUL 2>&1
netsh int isatap set state disable >NUL 2>&1
netsh int ip set global neighborcachelimit=4096 >NUL 2>&1
netsh int ip set global taskoffload=disabled >NUL 2>&1
netsh int tcp set global autotuninglevel=disable >NUL 2>&1
netsh int tcp set global chimney=disabled >NUL 2>&1
netsh int tcp set global dca=enabled >NUL 2>&1
netsh int tcp set global ecncapability=disabled >NUL 2>&1
netsh int tcp set global netdma=enabled >NUL 2>&1
netsh int tcp set global nonsackrttresiliency=disabled >NUL 2>&1
netsh int tcp set global rsc=disabled >NUL 2>&1
netsh int tcp set global rss=enabled >NUL 2>&1
netsh int tcp set global timestamps=disabled >NUL 2>&1
netsh int tcp set heuristics disabled >NUL 2>&1
netsh int tcp set security mpp=disabled >NUL 2>&1
netsh int tcp set security profiles=disabled >NUL 2>&1
netsh int tcp set global initialRto=3000 >NUL 2>&1
netsh int tcp set global maxsynretransmissions=2 >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "5840" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "5840" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "UseDelayedAcceptance" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MaxSockAddrLength" /t REG_DWORD /d "16" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MinSockAddrLength" /t REG_DWORD /d "16" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "MaxOutstandingSends" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "explorer.exe" /t REG_DWORD /d "10" /f >NUL 2>&1
reg add "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "iexplore.exe" /t REG_DWORD /d "10" /f >NUL 2>&1
reg add "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "explorer.exe" /t REG_DWORD /d "10" /f >NUL 2>&1
reg add "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "iexplore.exe" /t REG_DWORD /d "10" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d "16384" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d "16384" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d "16384" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "16384" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f >NUL 2>&1
for /F %%i in ('wmic path win32_networkadapter get GUID ^| findstr "{"') do (
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f >NUL 2>&1
)

:: Adapter
for /F %%r in ('reg query "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /f "PCI\VEN" /d /s^|Findstr HKEY') do (
reg add "%%r" /v "*EEE" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*FlowControl" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*InterruptModeration" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*JumboPacket" /t REG_SZ /d "1415" /f >NUL 2>&1
reg add "%%r" /v "*LsoV1IPv4" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "%%r" /v "*LsoV2IPv4" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "%%r" /v "*LsoV2IPv6" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "%%r" /v "*ModernStandbyWoLMagicPacket" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*NumRssQueues" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "%%r" /v "*PMARPOffload" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*PMNSOffload" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*PriorityVLANTag" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*ReceiveBuffers" /t REG_SZ /d "112" /f >NUL 2>&1
reg add "%%r" /v "*RSS" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "%%r" /v "*RssBaseProcNumber" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "%%r" /v "*RssMaxProcNumber" /t REG_SZ /d "1" /f >NUL 2>&1
reg add "%%r" /v "*SpeedDuplex" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*TCPChecksumOffloadIPv4" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*TCPChecksumOffloadIPv6" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*TransmitBuffers" /t REG_SZ /d "112" /f >NUL 2>&1
reg add "%%r" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "*WakeOnPattern" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "AdvancedEEE" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "AutoDisableGigabit" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "EnablePME" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "EnableTss" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "GigaLite" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "ITR" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "LogLinkStateEvent" /t REG_SZ /d "51" /f >NUL 2>&1
reg add "%%r" /v "MasterSlave" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "PowerSavingMode" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "S5WakeOnLan" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "TxIntDelay" /t REG_SZ /d "5" /f >NUL 2>&1
reg add "%%r" /v "ULPMode" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "WaitAutoNegComplete" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "WakeOnLink" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "WakeOnSlot" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "%%r" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f >NUL 2>&1
)

:: Core 2 Affinity
for /F %%n in ('wmic path win32_networkadapter get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /v "AssignmentSetOverride" /t REG_BINARY /d "04" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /t REG_DWORD /d "4" /f >NUL 2>&1
)

powershell Set-NetTCPSetting -SettingName internet -MinRto 300 -ErrorAction SilentlyContinue
powershell Disable-NetAdapterLso -Name "*" -ErrorAction SilentlyContinue
powershell Disable-NetAdapterRsc -Name "*" -ErrorAction SilentlyContinue
powershell Disable-NetAdapterIPsecOffload -Name "*" -ErrorAction SilentlyContinue
powershell Disable-NetAdapterPowerManagement -Name "*" -ErrorAction SilentlyContinue
powershell Disable-NetAdapterChecksumOffload -Name "*" -ErrorAction SilentlyContinue
powershell Disable-NetAdapterEncapsulatedPacketTaskOffload -Name "*" -ErrorAction SilentlyContinue

:: Adapter bindings
powershell Disable-NetAdapterBinding -Name "*" -ComponentID ms_lldp -ErrorAction SilentlyContinue
:: Link-Layer Topology Discovery Mapper I/O Driver
powershell Disable-NetAdapterBinding -Name "*" -ComponentID ms_lltdio -ErrorAction SilentlyContinue
:: Client for Microsoft Networks
powershell Disable-NetAdapterBinding -Name "*" -ComponentID ms_msclient -ErrorAction SilentlyContinue
:: Microsoft LLDP Protocol Driver
powershell Disable-NetAdapterBinding -Name "*" -ComponentID ms_rspndr -ErrorAction SilentlyContinue
:: File and Printer Sharing for Microsoft Networks
powershell Disable-NetAdapterBinding -Name "*" -ComponentID ms_server -ErrorAction SilentlyContinue
:: Microsoft Network Adapter Multiplexor Protocol
powershell Disable-NetAdapterBinding -Name "*" -ComponentID ms_implat -ErrorAction SilentlyContinue

:: QoS Packet Scheduler
powershell Disable-NetAdapterQos -Name "*" -ErrorAction SilentlyContinue
powershell Disable-NetAdapterBinding -Name "*" -ComponentID ms_pacer -ErrorAction SilentlyContinue

:: Restarting Adapter
powershell Restart-NetAdapter -Name "Ethernet" -ErrorAction SilentlyContinue

:: Disabling Drivers...
:: Preventing Errors
reg add "HKLM\System\CurrentControlSet\Services\fvevol" /v "ErrorControl" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Dhcp" /v "DependOnService" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\hidserv" /v "DependOnService" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\Audiosrv" /v "DependOnService" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e96c-e325-11ce-bfc1-08002be10318}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Class\{4d36e967-e325-11ce-bfc1-08002be10318}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Class\{6bdd1fc6-810f-11d0-bec7-08002be2092f}" /v "UpperFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Class\{71a27cdd-812a-11d0-bec7-08002be2092f}" /v "LowerFilters" /t REG_MULTI_SZ /d "" /f >NUL 2>&1
:: ACPI Devices driver
reg add "HKLM\System\CurrentControlSet\Services\AcpiDev" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Charge Arbitration Driver
reg add "HKLM\System\CurrentControlSet\Services\CAD" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Windows Cloud Files Filter Driver
reg add "HKLM\System\CurrentControlSet\Services\CldFlt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Windows sandboxing and encryption filter
reg add "HKLM\System\CurrentControlSet\Services\FileCrypt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: GPU Energy Driver
reg add "HKLM\System\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: WAN Miniport (PPTP)
reg add "HKLM\System\CurrentControlSet\Services\PptpMiniport" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Remote Application Programming Interface (RAPI)
reg add "HKLM\System\CurrentControlSet\Services\RapiMgr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: WAN Miniport (IKEv2)
reg add "HKLM\System\CurrentControlSet\Services\RasAgileVpn" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: WAN Miniport (L2TP)
reg add "HKLM\System\CurrentControlSet\Services\Rasl2tp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: WAN Miniport (SSTP)
reg add "HKLM\System\CurrentControlSet\Services\RasSstp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Remote Access IP ARP Driver
reg add "HKLM\System\CurrentControlSet\Services\Wanarp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Remote Access IPv6 ARP Driver
reg add "HKLM\System\CurrentControlSet\Services\wanarpv6" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Related to windows defender
reg add "HKLM\System\CurrentControlSet\Services\Wdnsfltr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: CTF Loader
reg add "HKLM\System\CurrentControlSet\Services\WcesComm" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Windows Container Isolation
reg add "HKLM\System\CurrentControlSet\Services\Wcifs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Windows Container Name Virtualization
reg add "HKLM\System\CurrentControlSet\Services\Wcnfs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Windows Trusted Execution Environment Class Extension
reg add "HKLM\System\CurrentControlSet\Services\WindowsTrustedRT" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Microsoft Windows Trusted Runtime Secure Service
reg add "HKLM\System\CurrentControlSet\Services\WindowsTrustedRTProxy" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Background Activity Moderator Driver
reg add "HKLM\System\CurrentControlSet\Services\bam" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: CNG Hardware Assist algorithm provider
reg add "HKLM\System\CurrentControlSet\Services\cnghwassist" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Disk I/O Rate Filter Driver 
reg add "HKLM\System\CurrentControlSet\Services\iorate" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Security Events Component Minifilter 
reg add "HKLM\System\CurrentControlSet\Services\mssecflt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Tunnel Miniport Adapter Driver (W10Default=3)
reg add "HKLM\System\CurrentControlSet\Services\tunnel" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Virtual WiFi Filter Driver
reg add "HKLM\System\CurrentControlSet\Services\vwififlt" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: ACPI Processor Aggregator Driver
reg add "HKLM\System\CurrentControlSet\Services\acpipagr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: ACPI Power Meter Driver
reg add "HKLM\System\CurrentControlSet\Services\AcpiPmi" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: ACPI Wake Alarm Driver
reg add "HKLM\System\CurrentControlSet\Services\Acpitime" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Most useless driver to exist
reg add "HKLM\System\CurrentControlSet\Services\Beep" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: NT Lan Manager Datagram Receiver Driver
reg add "HKLM\System\CurrentControlSet\Services\bowser" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: CD/DVD File System Reader
reg add "HKLM\System\CurrentControlSet\Services\cdfs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: CD-ROM Driver / Cannot use programs like rufus
reg add "HKLM\System\CurrentControlSet\Services\cdrom" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Common Log / General-purpose logging service
reg add "HKLM\System\CurrentControlSet\Services\CLFS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Composite Bus Enumerator Driver
reg add "HKLM\System\CurrentControlSet\Services\CompositeBus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Console Driver
reg add "HKLM\System\CurrentControlSet\Services\condrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Offline Files Driver
reg add "HKLM\System\CurrentControlSet\Services\CSC" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Desktop Activity Moderator Driver
reg add "HKLM\System\CurrentControlSet\Services\dam" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: DFS Namespace Client Driver
reg add "HKLM\System\CurrentControlSet\Services\dfsc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Enhanced Storage Filter Driver
reg add "HKLM\System\CurrentControlSet\Services\EhStorClass" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: FAT12/16/32 File System Driver
reg add "HKLM\System\CurrentControlSet\Services\fastfat" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: File Information FS MiniFilter
reg add "HKLM\System\CurrentControlSet\Services\FileInfo" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: BitLocker Drive Encryption Filter Driver
reg add "HKLM\System\CurrentControlSet\Services\fvevol" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Kernel Debug Network Miniport NDIS 6.20
reg add "HKLM\System\CurrentControlSet\Services\kdnic" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Kernel Security Support Provider Interface Packages
reg add "HKLM\System\CurrentControlSet\Services\KSecPkg" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Link-Layer Topology Discovery Mapper I/O Driver
reg add "HKLM\System\CurrentControlSet\Services\lltdio" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: UAC File Virtualization
reg add "HKLM\System\CurrentControlSet\Services\luafv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Modem Device Driver
reg add "HKLM\System\CurrentControlSet\Services\Modem" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: The Networking-MPSSVC-Svc component is part of Windows Firewall
reg add "HKLM\System\CurrentControlSet\Services\MpsSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Windows Defender Firewall Authorization Driver
reg add "HKLM\System\CurrentControlSet\Services\mpsdrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: SMB MiniRedirector Wrapper and Engine
reg add "HKLM\System\CurrentControlSet\Services\mrxsmb" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: SMB 1.x MiniRedirector
reg add "HKLM\System\CurrentControlSet\Services\Mrxsmb10" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: SMB 2.0 MiniRedirector
reg add "HKLM\System\CurrentControlSet\Services\Mrxsmb20" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Disabling breaks laptop keyboards and PS2 keyboards
reg add "HKLM\System\CurrentControlSet\Services\msisadrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Link-Layer Discovery Protocol
reg add "HKLM\System\CurrentControlSet\Services\MsLldp" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: System Management BIOS Driver
reg add "HKLM\System\CurrentControlSet\Services\mssmbios" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: NDIS Capture
reg add "HKLM\System\CurrentControlSet\Services\NdisCap" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Remote Access NDIS TAPI Driver
reg add "HKLM\System\CurrentControlSet\Services\NdisTapi" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Virtual Network Adapter Enumerator
reg add "HKLM\System\CurrentControlSet\Services\NdisVirtualBus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Remote Access NDIS WAN Driver
reg add "HKLM\System\CurrentControlSet\Services\NdisWan" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: NDIS Proxy Driver 
reg add "HKLM\System\CurrentControlSet\Services\Ndproxy" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Windows Network Data Usage Monitoring Driver
reg add "HKLM\System\CurrentControlSet\Services\Ndu" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: NetBIOS interface driver 
reg add "HKLM\System\CurrentControlSet\Services\NetBIOS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Implements NetBios over TCP/IP
reg add "HKLM\System\CurrentControlSet\Services\NetBT" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Named pipe service trigger provider
reg add "HKLM\System\CurrentControlSet\Services\Npsvctrig" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Protected Environment Authentication and Authorization Export Driver
reg add "HKLM\System\CurrentControlSet\Services\PEAUTH" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: QoS Packet Scheduler
reg add "HKLM\System\CurrentControlSet\Services\Psched" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: QWAVE enhances AV streaming performance and reliability by ensuring network QoS for AV apps
reg add "HKLM\System\CurrentControlSet\Services\QWAVEdrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Remote Access Auto Connection Driver
reg add "HKLM\System\CurrentControlSet\Services\RasAcd" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Remote Access PPPOE Driver
reg add "HKLM\System\CurrentControlSet\Services\RasPppoe" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Redirected Buffering Sub System
reg add "HKLM\System\CurrentControlSet\Services\rdbss" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Remote Desktop Device Redirector Bus Driver
reg add "HKLM\System\CurrentControlSet\Services\rdpbus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Usually already stripped in custom isos
reg add "HKLM\System\CurrentControlSet\Services\rdyboost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Link-Layer Topology Discovery Responder
reg add "HKLM\System\CurrentControlSet\Services\rspndr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Serial Mouse Driver / Needed for ps2 mice
reg add "HKLM\System\CurrentControlSet\Services\sermouse" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Storage Spaces Driver
reg add "HKLM\System\CurrentControlSet\Services\spaceport" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Server SMB 2.xxx Driver
reg add "HKLM\System\CurrentControlSet\Services\srv2" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Server network driver
reg add "HKLM\System\CurrentControlSet\Services\Srvnet" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Central repository of Telephony data
reg add "HKLM\System\CurrentControlSet\Services\TapiSrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: IPv6 Protocol Driver
reg add "HKLM\System\CurrentControlSet\Services\Tcpip6" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: TCP/IP registry compatibility driver
reg add "HKLM\System\CurrentControlSet\Services\tcpipreg" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: TDI translation driver
reg add "HKLM\System\CurrentControlSet\Services\tdx" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Trusted Platform Module
reg add "HKLM\System\CurrentControlSet\Services\TPM" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Reads/Writes UDF 1.02,1.5,2.0x,2.5 disc formats, usually found on C/DVD discs
reg add "HKLM\System\CurrentControlSet\Services\udfs" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Can be disabled on UEFI. Bricks some systems
reg add "HKLM\System\CurrentControlSet\Services\UEFI" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: UMBus Enumerator Driver
reg add "HKLM\System\CurrentControlSet\Services\umbus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Virtual Drive Root Enumerator file
reg add "HKLM\System\CurrentControlSet\Services\vdrvroot" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Hyper-V Virtualization Infrastructure Driver
reg add "HKLM\System\CurrentControlSet\Services\Vid" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Volume Manager Driver
reg add "HKLM\System\CurrentControlSet\Services\Volmgrx" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Virtual Wireless Bus Driver
reg add "HKLM\System\CurrentControlSet\Services\vwifibus" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Related to windows defender
reg add "HKLM\System\CurrentControlSet\Services\Wdboot" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Related to windows defender
reg add "HKLM\System\CurrentControlSet\Services\WdFilter" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Related to windows defender
reg add "HKLM\System\CurrentControlSet\Services\WdNisDrv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Windows defender
reg add "HKLM\System\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Microsoft Windows Management Interface for ACPI
reg add "HKLM\System\CurrentControlSet\Services\WmiAcpi" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Winsock IFS Driver
reg add "HKLM\System\CurrentControlSet\Services\ws2ifsl" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
:: Null is required for piping thus for some programs to work, like wget and wsusoffline. This can be disabled, but it breaks some functionality of the kernel. 
reg add "HKLM\System\CurrentControlSet\Services\Null" /v "Start" /t REG_DWORD /d "1" /f >NUL 2>&1
:: This will make the necessary use of static ip
reg add "HKLM\System\CurrentControlSet\Services\AFD" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1

echo  Importing Main tweaks
:: Process Scheduling
reg add "HKLM\System\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "38" /f >NUL 2>&1

:: Disabling Mitigations...
powershell "ForEach($v in (Get-Command -Name \"Set-ProcessMitigation\").Parameters[\"Disable\"].Attributes.ValidValues){Set-ProcessMitigation -System -Disable $v.ToString() -ErrorAction SilentlyContinue}" >NUL 2>&1

:: Disabling RAM compression...
powershell Disable-MMAgent -MemoryCompression -ApplicationPreLaunch -ErrorAction SilentlyContinue >NUL 2>&1

:: Disable Meltdown/Spectre patches
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f >NUL 2>&1

:: Disable DMA memory protection and cores isolation
reg add "HKLM\Software\Policies\Microsoft\FVE" /v "DisableExternalDMAUnderLock" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceGuard" /v "HVCIMATRequired" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Power settings
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PerfCalculateActualUtilization" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "SleepReliabilityDetailedDiagnostics" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "QosManagesIdleProcessors" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableVsyncLatencyUpdate" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "DisableSensorWatchdog" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Kernel settings
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogProfileOffset" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DpcWatchdogPeriod" /t REG_DWORD /d "0" /f >NUL 2>&1

:: GPU settings
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "DisableWriteCombining" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Multimedia Profile
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f >NUL 2>&1

:: Unlock Silk Smoothness
reg add "HKLM\System\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableRID61684" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable NTFS/ReFS mitigations
reg add "HKLM\System\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Using big system memory caching to improve microstuttering
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Using big page file size to improve microstuttering but only if you have 16gb
for /F "skip=1" %%A in ('wmic os get TotalVisibleMemorySize') do ( 
set system_ram=%%A
goto :ramchecker
)
:ramchecker
if %system_ram% GEQ 16277216 if %system_ram% LEQ 17277216 goto 16gb
goto no16gb
:16gb
WMIC computersystem where name="%computername%" set AutomaticManagedPagefile=False >NUL 2>&1
WMIC pagefileset where name="C:\\pagefile.sys" set InitialSize=32768,MaximumSize=32768 >NUL 2>&1
:no16gb

echo  Importing Minimal tweaks
:: Mouse Settings
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f >NUL 2>&1

:: DWM Settings
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "Composition" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableWindowColorization" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable automatic folder type discovery
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f >NUL 2>&1
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /t REG_SZ /d "NotSpecified" /f >NUL 2>&1

:: Disable Startup Sound
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" /v "DisableStartupSound" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable Store And Display Recently Opened Programs In The Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable Sleep
reg add "HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "ACSettingIndex" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\abfc2519-3608-4c2a-94ea-171b0ed546ab" /v "DCSettingIndex" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Remove homegroup from file explorer
reg add "HKCR\WOW6432Node\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f >NUL 2>&1
reg add "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489444" /f >NUL 2>&1

:: Remove Homegroup From Navigation Pane
reg add "HKCR\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489612" /f >NUL 2>&1
reg add "HKLM\SOFTWARE\Wow6432Node\Classes\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489612" /f >NUL 2>&1

:: Disable You Have New Apps That Can Open This Type Of File
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoNewAppAlert" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable Personalization Data
reg add "HKCU\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Old Alt Tab
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Show hidden folders
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable Show Windows Store Apps On The Taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StoreAppsOnTaskbar" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable Corner Navigation
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\EdgeUi" /v "DisableTLCorner" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\EdgeUi" /v "DisableTRCorner" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable Show My Desktop Background On Start + Black Theme
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "MotionAccentId_v1.00" /t REG_DWORD /d "221" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "4282137660" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "4286019447" /f >NUL 2>&1

:: Hide Language Bar
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "Transparency" /t REG_DWORD /d "255" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "Label" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Make desktop faster
reg add "HKU\.DEFAULT\Control Panel\Desktop" /v "ForegroundLockTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Desktop" /v "MouseWheelRouting" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Show file extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable Acessibility keys
reg add "HKU\.DEFAULT\Control Panel\Accessibility\HighContrast" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Accessibility\SoundSentry" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Accessibility\TimeOut" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f >NUL 2>&1

:: Disable automatic folder type discovery
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" /v "FolderType" /t REG_SZ /d "NotSpecified" /f >NUL 2>&1
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f >NUL 2>&1

:: Disable shortcut text for shortcuts
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "link" /t REG_BINARY /d "00000000" /f >NUL 2>&1

:: Disable Mouse Keys Keyboard Shortcut
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "186" /f >NUL 2>&1
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "MaximumSpeed" /t REG_SZ /d "40" /f >NUL 2>&1
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v "TimeToMaximumSpeed" /t REG_SZ /d "3000" /f >NUL 2>&1

:: Disable automatic maintenance
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disabling Hibernation
reg add "HKLM\System\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable fast startup
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable Sleep study
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable aero shake
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable downloads blocking
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable malicious software removal tool from installing
reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Windows update never notify and never install
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "2" /f >NUL 2>&1

:: Disable error reporting
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Show BSOD details instead of the sad smiley
reg add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable action center
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable jump lists
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable search history
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable administrative shares
reg add "HKLM\System\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable Keyboard Hotkeys
reg add "HKCU\Keyboard Layout\Toggle" /v "Language Hotkey" /t REG_SZ /d "3" /f >NUL 2>&1
reg add "HKCU\Keyboard Layout\Toggle" /v "Hotkey" /t REG_SZ /d "3" /f >NUL 2>&1
reg add "HKCU\Keyboard Layout\Toggle" /v "Layout Hotkey" /t REG_SZ /d "3" /f >NUL 2>&1

:: Turn Off Sleep And Lock In Power Options
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowSleepOption" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" /v "ShowLockOption" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Sound Communications Do Nothing
reg add "HKCU\Software\Microsoft\Multimedia\Audio" /v "UserDuckingPreference" /t REG_DWORD /d "3" /f >NUL 2>&1

:: Speed Up Start Time
reg add "HKCU\AppEvents\Schemes" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DelayedDesktopSwitchTimeout" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable Network Notification Icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCANetwork" /t REG_DWORD /d "1" /f >NUL 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCANetwork" /f >NUL 2>&1

:: Small Start Menu Icons
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_LargeMFUIcons" /t REG_DWORD /d "0" /f >NUL 2>&1

:: System properties - performance options - adjust for best performance
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "2" /f >NUL 2>&1

:: Disable KB4524752 Support Notifications
reg add "HKLM\Software\Policies\Microsoft\Windows\Gwx" /v "DisableGwx" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable KB4524752 Support Notifications
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable Prefetcher and Superfetch
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Show all icons and notifications on the taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable Consumer experiences from Microsoft
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable WPP Software Tracing Logs
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogEnable" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\WUDF" /v "LogLevel" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Turn off Microsoft Peer-to-Peer Networking Services
reg add "HKLM\Software\Policies\Microsoft\Peernet" /v "Disabled" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Turn off Data Execution Prevention
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "DEPOff" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Display highly detailed status messages
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Trick to make system Startup faster
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Turn off Pen feedback
reg add "HKLM\Software\Policies\Microsoft\TabletPC" /v "TurnOffPenFeedback" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Disable Remote Assistance Connections
reg add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f >NUL 2>&1

:: Disable Telemetry
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v "value" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\EnhancedStorageDevices" /v "TCGSecurityActivationDisabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\safer\codeidentifiers" /v "authenticodeenabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
echo "" > C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl >NUL 2>&1

:: Disable Firewall
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "DisableNotifications" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "DoNotAllowExceptions" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "DisableNotifications" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "DoNotAllowExceptions" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "DisableNotifications" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "DoNotAllowExceptions" /t REG_DWORD /d "1" /f >NUL 2>&1
reg delete "HKLM\System\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f >NUL 2>&1

:: Disable SettingSync
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableAppSyncSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableAppSyncSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableApplicationSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableApplicationSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableCredentialsSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableCredentialsSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableDesktopThemeSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableDesktopThemeSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisablePersonalizationSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisablePersonalizationSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableStartLayoutSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableStartLayoutSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableSyncOnPaidNetwork" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableWebBrowserSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableWebBrowserSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableWindowsSettingSync" /t Reg_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v "DisableWindowsSettingSyncUserOverride" /t Reg_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\DesktopTheme" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\PackageState" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\StartLayout" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t Reg_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t Reg_DWORD /d "5" /f >NUL 2>&1

:: Disable Windows Search
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\Experience" /v "AllowCortana" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AlwaysUseAutoLangDetection" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f >NUL 2>&1

:: Remove Metadata Tracking
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /f >NUL 2>&1

:: Remove Storage Sense
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense" /f >NUL 2>&1

echo  BCD Params
:: Constantly pool interrupts, dynamic tick was implemented as a power saving feature for laptops
bcdedit /set disabledynamictick yes >NUL 2>&1
:: Disable synthetic tick
bcdedit /set useplatformtick Yes >NUL 2>&1
:: Enhanced Sync Policy
bcdedit /set tscsyncpolicy Enhanced >NUL 2>&1
:: Disable Data Execution Prevention Security Feature
bcdedit /set nx AlwaysOff >NUL 2>&1
:: Disable Emergency Management Services
bcdedit /set ems No >NUL 2>&1
bcdedit /set bootems No >NUL 2>&1
:: Disable code integrity services
bcdedit /set integrityservices disable >NUL 2>&1
:: Disable TPM Boot Entropy policy Security Feature
bcdedit /set tpmbootentropy ForceDisable >NUL 2>&1
:: Change bootmenupolicy to be able to F8
bcdedit /set bootmenupolicy Legacy >NUL 2>&1
:: Disable kernel debugger
bcdedit /set debug No >NUL 2>&1
:: Disable Virtual Secure Mode from Hyper-V
bcdedit /set hypervisorlaunchtype Off >NUL 2>&1
:: Disable the Controls the loading of Early Launch Antimalware (ELAM) drivers
bcdedit /set disableelamdrivers Yes >NUL 2>&1
:: Disable some of the kernel memory mitigations, gamers dont use SGX under any possible circumstance
bcdedit /set isolatedcontext No >NUL 2>&1
bcdedit /set allowedinmemorysettings 0x0 >NUL 2>&1
:: Disable DMA memory protection and cores isolation
bcdedit /set vm No >NUL 2>&1
bcdedit /set vsmlaunchtype Off >NUL 2>&1
:: Enable X2Apic and enable Memory Mapping for PCI-E devices
:: (for best results, further more enable MSI mode for all devices using MSI utility or manually)
bcdedit /set x2apicpolicy Enable >NUL 2>&1
bcdedit /set configaccesspolicy Default >NUL 2>&1
bcdedit /set MSI Default >NUL 2>&1
bcdedit /set usephysicaldestination No >NUL 2>&1
bcdedit /set usefirmwarepcisettings No >NUL 2>&1

echo  Settings based on Windows Version
for /F "tokens=3*" %%A in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do set "WinVersion=%%A %%B"
echo %WinVersion% | find "Windows 7" > nul
if %errorlevel% equ 0 (
:: Mouse fix
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "0000000000000000703d0a0000000000e07a14000000000050b81e0000000000c0f5280000000000" /f >NUL 2>&1
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000000038000000000000007000000000000000a800000000000000e00000000000" /f >NUL 2>&1
:: Safety measures
reg add "HKLM\System\CurrentControlSet\Services\Power" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Services\atapi" /v "Start" /t REG_DWORD /d "0" /f >NUL 2>&1
)
echo %WinVersion% | find "Windows 8.1" > nul
if %errorlevel% equ 0 (
:: Black
reg add "HKCU\Software\Classes\Local Settings\MuiCache\4\52C64B7E" /v "@themecpl.dll,-5" /t REG_SZ /d "Color and Appearance" /f >NUL 2>&1
reg add "HKCU\Software\Classes\Local Settings\MuiCache\4\52C64B7E" /v "@themecpl.dll,-40" /t REG_SZ /d "Desktop Background" /f >NUL 2>&1
:: Services
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AeLookupSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ALG" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppIDSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppMgmt" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppReadiness" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Audiosrv" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AxInstSV" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BrokerInfrastructure" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CertPropSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\COMSysApp" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CryptSvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DcomLaunch" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\defragsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DeviceAssociationService" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DeviceInstall" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dhcp" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dot3svc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DsmSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Eaphost" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EFS" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventLog" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EventSystem" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\fdPHost" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\FDResPub" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\gpsvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hidserv" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\hkmsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IEEtwCollectorService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IKEEXT" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\KeyIso" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\KtmRm" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lltdsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LSM" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MMCSS" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MpsSvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MSDTC" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MSiSCSI" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\msiserver" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MsKeyboardFilter" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\napagent" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NcaSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NcbService" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NcdAutoSetup" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netman" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetTcpPortSharing" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NlaSvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nsi" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\p2pimsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\p2psvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PeerDistSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PerfHost" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\pla" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PlugPlay" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PNRPAutoReg" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PNRPsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Power" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ProfSvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasAuto" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RemoteAccess" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RpcEptMapper" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RpcLocator" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\RpcSs" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SamSs" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SCardSvr" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ScDeviceEnum" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SCPolicySvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\seclogon" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SENS" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SensrSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SessionEnv" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\smphost" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SNMPTRAP" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\sppsvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SstpSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\StorSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\svsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\swprv" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SystemEventsBroker" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TapiSrv" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TermService" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\THREADORDER" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TimeBroker" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrkWks" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UI0Detect" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UmRdpService" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\upnphost" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\VaultSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\vds" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\VSS" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wbengine" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wcmsvc" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wcncsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WcsPlugInService" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WebClient" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wecsvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WEPHOSTSVC" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WiaRpc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v "Start" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinRM" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WlanSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wmiApSrv" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WPCSvc" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WPDBusEnum" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wudfsvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WwanSvc" /v "Start" /t REG_DWORD /d "3" /f >NUL 2>&1
:: OldNewExplorer
IF NOT EXIST %SystemDrive%\Felipe\OldNewExplorer32.dll certutil -urlcache -Unicode -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/OldNewExplorer32.dll %SystemDrive%\Felipe\OldNewExplorer32.dll >NUL 2>&1
IF NOT EXIST %SystemDrive%\Felipe\OldNewExplorer64.dll certutil -urlcache -Unicode -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/OldNewExplorer64.dll %SystemDrive%\Felipe\OldNewExplorer64.dll >NUL 2>&1
cmd /c regsvr32 /s %SystemDrive%\Felipe\OldNewExplorer32.dll >NUL 2>&1
cmd /c regsvr32 /s %SystemDrive%\Felipe\OldNewExplorer64.dll >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "NoRibbon" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "NoCaption" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "NoIcon" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "NoUpButton" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "NavBarGlass" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "IEButtons" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "DriveGrouping" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "HideFolders" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Tihiy\OldNewExplorer" /v "Style" /t REG_DWORD /d "0" /f >NUL 2>&1
:: Mouse fix
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "0000000000000000c0cc0c0000000000809919000000000040662600000000000033330000000000" /f >NUL 2>&1
reg add add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000000038000000000000007000000000000000a800000000000000e00000000000" /f >NUL 2>&1
:: Disabling mitigation
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "00000000000000000000000000000000" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "00000000000000000000000000000000" /f >NUL 2>&1
)
echo %WinVersion% | find "Windows 10" > nul
if %errorlevel% equ 0 (
:: Disable FSO Globally and GameDVR
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKLM\Software\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKU\.DEFAULT\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f >NUL 2>&1
reg delete "HKCU\System\GameConfigStore\Children" /f >NUL 2>&1
reg delete "HKCU\System\GameConfigStore\Parents" /f >NUL 2>&1
:: Disable power throttling
reg add "HKLM\System\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f >NUL 2>&1
:: Mouse fix
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseXCurve" /t REG_BINARY /d "0000000000000000c0cc0c0000000000809919000000000040662600000000000033330000000000" /f >NUL 2>&1
reg add "HKCU\Control Panel\Mouse" /v "SmoothMouseYCurve" /t REG_BINARY /d "0000000000000000000038000000000000007000000000000000a800000000000000e00000000000" /f >NUL 2>&1
:: Disabling mitigation
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "22222222222222222002000000200000" /f >NUL 2>&1
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "20000020202022220000000000000000" /f >NUL 2>&1
)

echo  Debloating...
:: Discord
taskkill /f /im Discord.exe >NUL 2>&1
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_modules\397863cd8f\2\discord_game_sdk_x64.dll" /F /Q >NUL 2>&1
DEL "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_modules\397863cd8f\2\discord_game_sdk_x86.dll" /F /Q >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_cloudsync" >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_dispatch" >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_erlpack" >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_game_utils" >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_krisp" >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_media" >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_overlay2" >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_rpc" >NUL 2>&1
rd /s /q "%HOMEPATH%\appdata\Roaming\discord\0.0.308\modules\discord_Spellcheck" >NUL 2>&1
attrib +r "%localappdata%\Discord\Update.exe" >NUL 2>&1
del "%userprofile%\Desktop\Discord.lnk" >NUL 2>&1
mklink "%userprofile%\Desktop\Discord.lnk" "%localappdata%\Discord\app-0.0.308\Discord.exe" >NUL 2>&1
:: Google Chrome
taskkill /f /im chrome.exe >NUL 2>&1
IF NOT EXIST "C:\Program Files\Google\Chrome\Application\chrome.exe" IF NOT EXIST %SystemDrive%\Felipe\ChromeSetup.exe certutil -urlcache -Unicode -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/ChromeSetup.exe %SystemDrive%\Felipe\ChromeSetup.exe >NUL 2>&1
IF NOT EXIST "C:\Program Files\Google\Chrome\Application\chrome.exe" start "" /wait "%SystemDrive%\Felipe\ChromeSetup.exe" /silent /install >NUL 2>&1
schtasks.exe /change /TN "\GoogleUpdateTaskMachineCore" /Disable >NUL 2>&1
schtasks.exe /change /TN "\GoogleUpdateTaskMachineUA" /Disable >NUL 2>&1
del "c:\program files\google\chrome\application\85.0.4183.102\installer\chrmstp.exe" >NUL 2>&1
sc delete gupdate >NUL 2>&1
sc delete gupdatem >NUL 2>&1
sc delete GoogleChromeElevationService >NUL 2>&1
:: Notepad++
taskkill /f /im Notepad++.exe >NUL 2>&1
IF NOT EXIST "C:\Program Files\Notepad++\notepad++.exe" IF NOT EXIST %SystemDrive%\Felipe\Notepad++.exe certutil -urlcache -Unicode -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/Notepad++.exe %SystemDrive%\Felipe\Notepad++.exe >NUL 2>&1
IF NOT EXIST "C:\Program Files\Notepad++\notepad++.exe" start "nppInstaller" "%SystemDrive%\Felipe\Notepad++.exe" /S /D=%ProgramFiles%\Notepad++\ >NUL 2>&1
del /F /Q "%ProgramFiles%\Notepad++\updater" >NUL 2>&1
:: Easy7zip
taskkill /f /im 7zFM.exe >NUL 2>&1
IF NOT EXIST "C:\Program Files\Easy 7-Zip\7zFM.exe" IF NOT EXIST %SystemDrive%\Felipe\Easy7zip.exe certutil -urlcache -Unicode -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/Easy7zip.exe %SystemDrive%\Felipe\Easy7zip.exe >NUL 2>&1
IF NOT EXIST "C:\Program Files\Easy 7-Zip\7zFM.exe" start "" /wait "%SystemDrive%\Felipe\Easy7zip.exe" /SILENT >NUL 2>&1
del "C:\Users\Public\Desktop\7-Zip File Manager.lnk" >NUL 2>&1
reg add "HKCR\*\shellex\ContextMenuHandlers\7-Zip" /ve /t REG_SZ /d "{23170F69-40C1-278A-1000-000100020000}" /f >NUL 2>&1
reg add "HKCU\Software\7-Zip\FM\Columns" /v "RootFolder" /t REG_BINARY /d "0100000000000000010000000400000001000000a0000000" /f >NUL 2>&1
reg add "HKCU\Software\7-Zip\Options" /v "CascadedMenu" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\7-Zip\Options" /v "MenuIcons" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\7-Zip\Options" /v "ContextMenu" /t REG_DWORD /d "4132" /f >NUL 2>&1
:: Process Explorer
taskkill /f /im procexp64.exe >NUL 2>&1
IF NOT EXIST %SystemDrive%\Felipe\procexp64.exe certutil -urlcache -split -f https://github.com/Felipe8581/GamingTweaks/raw/master/files/procexp64.exe %SystemDrive%\Felipe\procexp64.exe >NUL 2>&1
IF EXIST "%WINDIR%\procexp64.exe" reg add "HKLM\System\CurrentControlSet\Services\PCW" /v "Start" /t REG_DWORD /d "4" /f >NUL 2>&1
IF EXIST "%WINDIR%\procexp64.exe" reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe" /v "Debugger" /t REG_SZ /d "%WINDIR%\procexp64.exe" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "EulaAccepted" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "Windowplacement" /t REG_BINARY /d "2c0000000200000003000000ffffffffffffffffffffffffffffffff75030000110000009506000069020000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "FindWindowplacement" /t REG_BINARY /d "2c00000000000000000000000000000000000000000000000000000096000000960000000000000000000000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "SysinfoWindowplacement" /t REG_BINARY /d "2c00000000000000010000000000000000000000ffffffffffffffff28000000280000002b0300002b020000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "PropWindowplacement" /t REG_BINARY /d "2c00000000000000000000000000000000000000000000000000000028000000280000000000000000000000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "DllPropWindowplacement" /t REG_BINARY /d "2c00000000000000000000000000000000000000000000000000000028000000280000000000000000000000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "UnicodeFont" /t REG_BINARY /d "080000000000000000000000000000009001000000000000000000004d00530020005300680065006c006c00200044006c00670000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "Divider" /t REG_BINARY /d "531f0e151662ea3f" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "SavedDivider" /t REG_BINARY /d "531f0e151662ea3f" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ProcessImageColumnWidth" /t REG_DWORD /d "261" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowUnnamedHandles" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowDllView" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HandleSortColumn" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HandleSortDirection" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "DllSortColumn" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "DllSortDirection" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ProcessSortColumn" /t REG_DWORD /d "4294967295" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ProcessSortDirection" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightServices" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightOwnProcesses" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightRelocatedDlls" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightJobs" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightNewProc" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightDelProc" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightImmersive" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightProtected" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightPacked" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightNetProcess" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightSuspend" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HighlightDuration" /t REG_DWORD /d "1000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowCpuFractions" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowLowerpane" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowAllUsers" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowProcessTree" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "SymbolWarningShown" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HideWhenMinimized" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "AlwaysOntop" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "OneInstance" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "NumColumnSets" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ConfirmKill" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "RefreshRate" /t REG_DWORD /d "1000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "PrcessColumnCount" /t REG_DWORD /d "12" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "DllColumnCount" /t REG_DWORD /d "5" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "HandleColumnCount" /t REG_DWORD /d "2" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "DefaultProcPropPage" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "DefaultSysInfoPage" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "DefaultDllPropPage" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "DbgHelpPath" /t REG_SZ /d "C:\Windows\SYSTEM32\dbghelp.dll" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "SymbolPath" /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorPacked" /t REG_DWORD /d "16711808" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorImmersive" /t REG_DWORD /d "15395328" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorOwn" /t REG_DWORD /d "16765136" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorServices" /t REG_DWORD /d "13684991" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorRelocatedDlls" /t REG_DWORD /d "10551295" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorGraphBk" /t REG_DWORD /d "15790320" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorJobs" /t REG_DWORD /d "27856" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorDelProc" /t REG_DWORD /d "4605695" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorNewProc" /t REG_DWORD /d "4652870" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorNet" /t REG_DWORD /d "10551295" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorProtected" /t REG_DWORD /d "8388863" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowHeatmaps" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ColorSuspend" /t REG_DWORD /d "8421504" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "StatusBarColumns" /t REG_DWORD /d "13589" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowAllCpus" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowAllGpus" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "Opacity" /t REG_DWORD /d "100" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "GpuNodeUsageMask" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "GpuNodeUsageMask1" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "VerifySignatures" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "VirusTotalCheck" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "VirusTotalSubmitUnknown" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ToolbarBands" /t REG_BINARY /d "0601000000000000000000004b00000001000000000000004b00000002000000000000004b00000003000000000000004b0000000400000000000000400000000500000000000000500000000600000000000000930400000700000000000000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "UseGoogle" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowNewProcesses" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "TrayCPUHistory" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowIoTray" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowNetTray" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowDiskTray" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowPhysTray" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowCommitTray" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ShowGpuTray" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "FormatIoBytes" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "StackWindowPlacement" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer" /v "ETWstandardUserWarning" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumnMap" /v "0" /t REG_DWORD /d "26" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumnMap" /v "1" /t REG_DWORD /d "42" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumnMap" /v "2" /t REG_DWORD /d "1033" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumnMap" /v "3" /t REG_DWORD /d "1111" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumnMap" /v "4" /t REG_DWORD /d "1670" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumns" /v "0" /t REG_DWORD /d "110" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumns" /v "1" /t REG_DWORD /d "180" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumns" /v "2" /t REG_DWORD /d "140" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumns" /v "3" /t REG_DWORD /d "300" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\DllColumns" /v "4" /t REG_DWORD /d "100" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\HandleColumnMap" /v "0" /t REG_DWORD /d "21" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\HandleColumnMap" /v "1" /t REG_DWORD /d "22" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\HandleColumns" /v "0" /t REG_DWORD /d "100" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\HandleColumns" /v "1" /t REG_DWORD /d "450" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "0" /t REG_DWORD /d "3" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "1" /t REG_DWORD /d "1055" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "2" /t REG_DWORD /d "1650" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "3" /t REG_DWORD /d "1065" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "4" /t REG_DWORD /d "1200" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "5" /t REG_DWORD /d "1092" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "6" /t REG_DWORD /d "1340" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "7" /t REG_DWORD /d "5" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "8" /t REG_DWORD /d "1333" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "9" /t REG_DWORD /d "1636" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "10" /t REG_DWORD /d "4" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "11" /t REG_DWORD /d "1670" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "12" /t REG_DWORD /d "1670" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "13" /t REG_DWORD /d "1670" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "14" /t REG_DWORD /d "1670" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "15" /t REG_DWORD /d "1670" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "16" /t REG_DWORD /d "1670" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "17" /t REG_DWORD /d "1653" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "18" /t REG_DWORD /d "1653" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumnMap" /v "19" /t REG_DWORD /d "1653" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "0" /t REG_DWORD /d "261" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "1" /t REG_DWORD /d "35" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "2" /t REG_DWORD /d "37" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "3" /t REG_DWORD /d "52" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "4" /t REG_DWORD /d "85" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "5" /t REG_DWORD /d "80" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "6" /t REG_DWORD /d "60" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "7" /t REG_DWORD /d "39" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "8" /t REG_DWORD /d "65" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "9" /t REG_DWORD /d "76" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "10" /t REG_DWORD /d "31" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "11" /t REG_DWORD /d "32" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "12" /t REG_DWORD /d "55" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "13" /t REG_DWORD /d "31" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "14" /t REG_DWORD /d "70" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "15" /t REG_DWORD /d "70" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\ProcessColumns" /v "16" /t REG_DWORD /d "44" /f >NUL 2>&1
reg add "HKCU\Software\Sysinternals\Process Explorer\VirusTotal" /v "VirusTotalTermsAccepted" /t REG_DWORD /d "1" /f >NUL 2>&1
::OpenShell
del "%programfiles%\Open-Shell\Menu Settings.xml" >NUL 2>&1
echo ^<?xml version=^"1.0^"?^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Settings component=^"StartMenu^" version=^"4.4.142^"^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<MenuStyle value=^"Win7^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<ShiftClick value=^"Nothing^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<ShiftWin value=^"Nothing^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<AllProgramsMetro value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<OpenPrograms value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<ProgramsMenuDelay value=^"400^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<RecentPrograms value=^"None^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<EnableJumplists value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<HybridShutdown value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<StartScreenShortcut value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<AutoStart value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<HighlightNew value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<HighlightNewApps value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<CheckWinUpdates value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<MenuDelay value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<SplitMenuDelay value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<InfotipDelay value=^"0,0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<DragHideDelay value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<EnableAccessibility value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<DelayIcons value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<SearchMetroApps value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<SearchInternet value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<MainMenuAnimationSpeed value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<SubMenuAnimationSpeed value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<MenuFadeSpeed value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<MenuShadow value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<SkinW7 value=^"Dark^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<SkinVariationW7 value=^"^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<SkinOptionsW7^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>USER_IMAGE=0^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>SMALL_ICONS=1^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>LARGE_FONT=0^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>ALL_DARK=1^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>SCROLL=1^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>GLYPHS=0^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<^/SkinOptionsW7^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<CustomTaskbar value=^"1^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<TaskbarLook value=^"Opaque^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<TaskbarOpacity value=^"100^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<TaskbarColor value=^"1644825^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<SkipMetro value=^"1^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<DisableHotCorner value=^"DisableAll^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<MenuItems7^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item1.Command=computer^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item1.Settings=NOEXPAND^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item2.Command=separator^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item2.Settings=ITEM_DISABLED^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item3.Command=desktop^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item3.Settings=NOEXPAND^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item4.Command=user_documents^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item4.Settings=NOEXPAND^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item5.Command=downloads^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item5.Settings=NOEXPAND^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item6.Command=user_music^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item6.Settings=NOEXPAND^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item7.Command=user_pictures^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item7.Settings=NOEXPAND^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item8.Command=user_videos^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item8.Settings=NOEXPAND^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item9.Command=separator^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item10.Command=control_panel^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item10.Settings=TRACK_RECENT^|NOEXPAND^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item11.Command=pc_settings^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item11.Settings=TRACK_RECENT^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<Line^>Item12.Command=run^<^/Line^> >>"%programfiles%/Open-Shell/Menu Settings.xml"
echo ^<^/MenuItems7^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<EnableContextMenu value=^"1^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<ShowNewFolder value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<EnableExit value=^"1^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<EnableExplorer value=^"0^"^/^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
echo ^<^/Settings^> >>"%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1
"%programfiles%/Open-Shell/StartMenu.exe" -xml "%programfiles%/Open-Shell/Menu Settings.xml" >NUL 2>&1

ECHO  Adding host file
del /F /Q "%WINDIR%\system32\drivers\etc\hosts" >NUL 2>&1
echo 0.0.0.0 telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vortex-win.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telecommand.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telecommand.telemetry.microsoft.com.nsatc.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 oca.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 oca.telemetry.microsoft.com.nsatc.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sqm.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sqm.telemetry.microsoft.com.nsatc.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 watson.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 watson.telemetry.microsoft.com.nsatc.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 redir.metaservices.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 choice.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 choice.microsoft.com.nsatc.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 df.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wes.df.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 reports.wes.df.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 services.wes.df.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sqm.df.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 watson.ppe.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telemetry.appex.bing.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telemetry.urs.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telemetry.appex.bing.net:443>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 settings-sandbox.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vortex-sandbox.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 watson.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 survey.watson.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 watson.live.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 statsfe2.ws.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 corpext.msitadfs.glbdns2.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 compatexchange.cloudapp.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cs1.wpc.v0cdn.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 a-0001.a-msedge.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 fe2.update.microsoft.com.akadns.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 statsfe2.update.microsoft.com.akadns.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sls.update.microsoft.com.akadns.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 diagnostics.support.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 corp.sts.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 statsfe1.ws.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pre.footprintpredict.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 i1.services.social.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 i1.services.social.microsoft.com.nsatc.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 feedback.windows.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 feedback.microsoft-hohm.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 feedback.search.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.content.prod.cms.msn.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.content.prod.cms.msn.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 e10663.g.akamaiedge.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dmd.metaservices.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 schemas.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 go.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 40.76.0.0/14>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 40.96.0.0/12>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 40.124.0.0/16>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 40.112.0.0/13>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 40.125.0.0/17>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 40.74.0.0/15>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 40.80.0.0/12>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 40.120.0.0/14>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 137.116.0.0/16>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 23.192.0.0/11>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 23.32.0.0/11>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 23.64.0.0/14>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 23.55.130.182>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 a.ads1.msads.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 a.ads1.msn.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 a.ads2.msads.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 a.ads2.msn.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.live.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.msn.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bingads.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 browser.events.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cache.datamart.windows.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 events.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 manage.devcenter.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mobile.events.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mobile.pipe.aria.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 onecollector.cloudapp.aria.akadns.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 prod.nexusrules.live.com.akadns.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ris.api.iris.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 self.events.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 settings-win.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 spynet2.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 spynetalt.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telecommand.alpha.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telecommand.df.telemetry.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telemetry.appex.bing.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telemetry.urs.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telemetrysvc-by3p.smartscreen.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 us.vortex-win.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 v10-win.vortex.data.microsoft.com.akadns.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 v10.events.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 v10.vortex-win.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 v20.vortex-win.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vortex-bn2.metron.live.com.nsatc.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vortex-cy2.metron.live.com.nsatc.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vortex.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vortex.data.microsoft.com.akadns.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 web.vortex.data.microsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telemetry.remoteapp.windowsazure.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 static.2mdn.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 b.ads1.msn.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 b.ads2.msads.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 b.rad.msn.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tele.trafficmanager.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 1beb2a44.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 1q2w3.fun>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 1q2w3.me>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 300ca0d0.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 310ca263.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 320ca3f6.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 330ca589.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 340ca71c.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 360caa42.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 370cabd5.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 3c0cb3b4.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 3d0cb547.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 abc.pema.cl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad-miner.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adminer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.blue>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.inwemo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 azvjudwr.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 baiduccdn1.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 berserkpl.net.pl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 biberukalap.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bjorksta.men>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 blockchain.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 candid.zone>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.adless.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.cloudcoins.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 chainblock.science>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cnhv.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coin-have.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coin-hive.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinblind.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinerra.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinhive.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinhiveproxy.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinlab.biz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinnebula.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crypto-loot.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crypto-webminer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crypto.csgocpu.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cryptoloot.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cryweb.github.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crywebber.github.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dev.cryptobara.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 digger.cryptobara.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flare-analytics.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 go.megabanners.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gridiogrid.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gus.host>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hive.tubetitties.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hodlers.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hodling.faith>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 host.d-ns.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 intactoffers.club>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jroqvbvw.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jsccnn.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jscdndel.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jyhfuqoh.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 kdowqlpt.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 load.jsecoin.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 m.anyfiles.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mine.nahnoji.cz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mine.torrent.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minemytraffic.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.cryptobara.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.nablabee.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.pr0gramm.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minero-proxy-01.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minero-proxy-02.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minero-proxy-03.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minero.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 monerominer.rocks>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 noblock.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 okeyletsgo.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 papoto.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 playerassets.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ppoi.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 projectpoi.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 reservedoffers.club>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 rocks.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 smectapop12.pl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sparnove.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 static.sparechange.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tokyodrift.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webassembly.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webmine.cz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webmine.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webminepool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webminepool.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wsp.marketgid.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.cryptonoter.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.mutuza.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.sparechange.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 xbasfbno.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cnhv.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coin-hive.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinhive.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 authedmine.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.jsecoin.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 load.jsecoin.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 server.jsecoin.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.pr0gramm.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minemytraffic.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crypto-loot.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cryptaloot.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cryptoloot.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinerra.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coin-have.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minero.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minero-proxy-01.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minero-proxy-02.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minero-proxy-03.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.inwemo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 rocks.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adminer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad-miner.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jsccnn.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jscdndel.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinhiveproxy.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinblind.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinnebula.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 monerominer.rocks>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.cloudcoins.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinlab.biz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 go.megabanners.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 baiduccdn1.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wsp.marketgid.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 papoto.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flare-analytics.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.sparechange.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 static.sparechange.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.nablabee.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 m.anyfiles.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.coinimp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.coinimp.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.faith>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.loan>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.racing>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.blockchained.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.cryptonoter.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.mutuza.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crypto-webminer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.adless.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hegrinhar.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 verresof.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hemnes.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tidafors.xyz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 moneone.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 plexcoin.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.monkeyminer.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 go2.mercy.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinpirate.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 d.cpufan.club>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 krb.devphp.org.ua>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nfwebminer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cfcdist.gdn>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 node.cfcdist.gdn>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webxmr.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 xmr.mining.best>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webminepool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webminepool.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hive.tubetitties.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 playerassets.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tokyodrift.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webassembly.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.webassembly.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 okeyletsgo.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 candid.zone>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webmine.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 andlache.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bablace.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bewaslac.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 biberukalap.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bowithow.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 butcalve.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 evengparme.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gridiogrid.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hatcalter.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 kedtise.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ledinund.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nathetsof.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 renhertfo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 rintindown.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sparnove.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 witthethim.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 1q2w3.fun>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 1q2w3.me>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bjorksta.men>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crypto.csgocpu.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 noblock.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.cryptobara.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 digger.cryptobara.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dev.cryptobara.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 reservedoffers.club>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mine.torrent.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 host.d-ns.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 abc.pema.cl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 js.nahnoji.cz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mine.nahnoji.cz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webmine.cz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.webmine.cz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 intactoffers.club>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.blue>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 smectapop12.pl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 berserkpl.net.pl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hodlers.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hodling.faith>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 chainblock.science>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minescripts.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.minescripts.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.nablabee.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wss.nablabee.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 clickwith.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dronml.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 niematego.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tulip18.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 p.estream.to>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 didnkinrab.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ledhenone.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 losital.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mebablo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 moonsade.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nebabrop.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pearno.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 rintinwa.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 willacrit.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www2.adfreetv.ch>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minr.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 new.minr.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 test.minr.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 staticsfs.host>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn-code.host>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 g-content.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad.g-content.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.static-cnt.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cnt.statistic.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jquery-uim.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.jquery-uim.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn-jquery.host>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 p1.interestingz.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 kippbeak.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pasoherb.gq>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 axoncoho.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 depttake.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flophous.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pr0gram.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 authedmine.eu>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.monero-miner.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.datasecu.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jquery-cdn.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.etzbnfuigipwvs.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.terethat.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 freshrefresher.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.pzoifaum.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ws.pzoifaum.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.bhzejltg.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ws.bhzejltg.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 d.cfcnet.top>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vip.cfcnet.top>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 eu.cfcnet.top>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 as.cfcnet.top>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 us.cfcnet.top>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 eu.cfcdist.loan>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 as.cfcdist.loan>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 us.cfcdist.loan>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gustaver.ddns.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 worker.salon.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s2.appelamule.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mepirtedic.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.streambeam.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adzjzewsma.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ffinwwfpqi.gq>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ininmacerad.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mhiobjnirs.gq>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 open-hive-server-1.pp.ua>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pool.hws.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pool.etn.spacepools.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.aalbbh84.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.aymcsx.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros01.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros02.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros03.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros04.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros05.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros06.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros07.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros08.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros09.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros10.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros11.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aeros12.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 npcdn1.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mxcdn2.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sxcdn6.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mxcdn1.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sxcdn02.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sxcdn4.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jqcdn2.herokuapp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sxcdn1.herokuapp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sxcdn5.herokuapp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wpcdn1.herokuapp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jqcdn01.herokuapp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jqcdn03.herokuapp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 1q2w3.website>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 video.videos.vidto.me>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.play1.videos.vidto.me>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 playe.vidto.se>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 video.streaming.estream.to>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 eth-pocket.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 xvideosharing.site>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bestcoinsignals.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 eucsoft.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 traviilo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wasm24.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 xmr.cool>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.netflare.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdnjs.cloudflane.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.cloudflane.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 clgserv.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hide.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 graftpool.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 encoding.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 altavista.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 scaleway.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nexttime.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 never.ovh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 2giga.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webminerpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minercry.pt>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adplusplus.fr>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ethtrader.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gobba.myeffect.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bauersagtnein.myeffect.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 besti.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jurty.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jurtym.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mfio.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mwor.gq>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 oei1.gq>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wordc.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 berateveng.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ctlrnwbv.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ermaseuc.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 kdmkauchahynhrs.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 uoldid.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jqrcdn.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jqassets.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jqcdn.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jquerrycdn.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jqwww.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 lightminer.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.lightminer.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 browsermine.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.browsermine.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dl.browsermine.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mlib.browsermine.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minr.browsermine.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 static.browsermine.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ws.browsermine.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bmst.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bmnr.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bmcm.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bmcm.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 videoplayer2.xyz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.video2.stream.vidzi.tv>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 001.0x1f4b0.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 002.0x1f4b0.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 003.0x1f4b0.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 004.0x1f4b0.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 005.0x1f4b0.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 006.0x1f4b0.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 007.0x1f4b0.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 008.0x1f4b0.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 authedwebmine.cz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.authedwebmine.cz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 skencituer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 site.flashx.cc>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play1.flashx.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play2.flashx.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play4.flashx.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play5.flashx.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 js.vidoza.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mm.zubovskaya-banya.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mysite.irkdsu.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.estream.nu>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.estream.to>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.estream.xyz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.play.estream.nu>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.play.estream.to>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.play.estream.xyz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.tainiesonline.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.vidzi.tv>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.pampopholf.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s3.pampopholf.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.malictuiar.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s3.malictuiar.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.play.tainiesonline.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ocean2.authcaptcha.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 rock2.authcaptcha.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 stone2.authcaptcha.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sass2.authcaptcha.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sea2.authcaptcha.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.flowplayer.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.pc.belicimo.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.power.tainiesonline.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.s01.vidtodo.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wm.yololike.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.mix.kinostuff.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.on.animeteatr.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.mine.gay-hotvideo.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.www.intellecthosting.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mytestminer.xyz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.vb.wearesaudis.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flowplayer.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s2.flowplayer.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s3.flowplayer.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 thersprens.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s2.thersprens.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s3.thersprens.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gramombird.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.gramombird.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ugmfvqsu.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bsyauqwerd.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ccvwtdtwyu.trade>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 baywttgdhe.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pdheuryopd.loan>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 iaheyftbsn.review>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 djfhwosjck.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 najsiejfnc.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 zndaowjdnf.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 yqaywudifu.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 malictuiar.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proofly.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 zminer.zaloapp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vkcdnservice.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dexim.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 acbp0020171456.page.tl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vuryua.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minexmr.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gitgrub.pro>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 d8acddffe978b5dfcae6.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 eth-pocket.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 autologica.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 whysoserius.club>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aster18cdn.nl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nerohut.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gnrdomimplementation.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pon.ewtuyytdf45.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hhb123.tk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dzizsih.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nddmcconmqsy.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 silimbompom.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 unrummaged.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 fruitice.realnetwrk.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 synconnector.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 toftofcal.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gasolina.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 8jd2lfsq.me>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 afflow.18-plus.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 afminer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aservices.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 becanium.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 brominer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn-analytics.pl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.static-cnt.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cloudcdn.gdn>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coin-service.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinpot.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinrail.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 etacontent.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 exdynsrv.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 formulawire.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 go.bestmobiworld.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 goldoffer.online>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hallaert.online>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hashing.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 igrid.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 laserveradedomaina.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 machieved.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nametraff.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 offerreality.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ogrid.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 panelsave.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 party-vqgdyvoycc.now.sh>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pertholin.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 premiumstats.xyz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 serie-vostfr.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 salamaleyum.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 smartoffer.site>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 stonecalcom.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 thewhizmarketing.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 thewhizproducts.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 thewise.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 traffic.tc-clicks.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vcfs6ip5h6.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 web.dle-news.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webmining.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wp-monero-miner.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wtm.monitoringservice.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 xy.nullrefexcep.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 yrdrtzmsmt.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wss.rand.com.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.verifier.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.faith>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.loan>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.racing>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.review>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.science>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.trade>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jshosting.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.review>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.science>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.freecontent.trade>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.accountant>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.faith>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.loan>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.racing>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.review>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.science>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.trade>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.hostingcloud.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 minerad.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coin-cube.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coin-services.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 service4refresh.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 money-maker-script.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 money-maker-default.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 de-ner-mi-nis4.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 de-nis-ner-mi-5.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 de-mi-nis-ner2.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 de-mi-nis-ner.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mi-de-ner-nis3.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s2.soodatmish.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s2.thersprens.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.feesocrald.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn1.pebx.pl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.nexioniect.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.besstahete.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s2.myregeneaf.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s3.myregeneaf.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 reauthenticator.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 rock.reauthenticator.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 serv1swork.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 str1kee.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 f1tbit.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 g1thub.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 swiftmining.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cashbeet.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wmtech.website>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.notmining.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coinminingonline.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 alflying.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 alflying.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 alflying.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 anybest.host>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 anybest.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 anybest.site>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 anybest.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dubester.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dubester.site>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dubester.space>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flightsy.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flightsy.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flightsy.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flighty.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flightzy.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flightzy.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flightzy.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gettate.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gettate.faith>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gettate.racing>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mighbest.host>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mighbest.pw>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mighbest.site>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 zymerget.bid>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 zymerget.date>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 zymerget.faith>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 zymerget.party>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 zymerget.stream>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 zymerget.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 statdynamic.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 alpha.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.miner.beeppool.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beatingbytes.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 besocial.online>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beta.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bulls.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 de1.eu.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ethmedialab.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 feilding.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 foxton.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ganymed.beeppool.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 himatangi.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 levin.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mine.terorie.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-1.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-10.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-11.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-12.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-13.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-14.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-15.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-16.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-17.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-18.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-19.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-2.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-3.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-4.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-5.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-6.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-7.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-8.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-9.team.nimiq.agency>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-deu-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-deu-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-deu-3.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-deu-4.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-deu-5.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-deu-6.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-deu-7.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner-deu-8.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.beeppool.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mon-deu-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mon-deu-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mon-deu-3.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mon-fra-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mon-fra-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mon-gbr-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nimiq.terorie.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nimiqtest.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ninaning.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 node.alpha.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 node.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nodeb.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 nodeone.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-can-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-deu-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-deu-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-fra-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-fra-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-fra-3.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-gbr-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-gbr-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-pol-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 proxy-pol-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 script.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-1.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-1.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-1.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-10.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-10.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-10.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-11.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-11.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-11.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-12.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-12.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-12.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-13.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-13.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-13.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-14.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-14.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-14.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-15.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-15.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-15.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-16.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-16.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-16.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-17.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-17.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-17.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-18.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-18.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-18.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-19.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-19.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-19.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-2.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-2.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-2.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-20.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-20.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-20.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-3.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-3.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-3.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-4.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-4.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-4.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-5.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-5.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-5.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-6.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-6.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-6.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-7.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-7.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-7.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-8.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-8.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-8.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-9.nimiq-network.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-9.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-9.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-can-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-can-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-deu-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-deu-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-deu-3.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-deu-4.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-fra-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-fra-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-fra-3.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-fra-4.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-fra-5.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-fra-6.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-gbr-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-gbr-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-gbr-3.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-gbr-4.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-pol-1.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-pol-2.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-pol-3.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed-pol-4.inf.nimiq.network>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 seed1.sushipool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 shannon.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sunnimiq.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sunnimiq1.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sunnimiq2.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sunnimiq3.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sunnimiq4.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sunnimiq5.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sunnimiq6.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tokomaru.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 whanganui.nimiqpool.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.besocial.online>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 miner.nimiq.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jscoinminer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.jscoinminer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.tercabilis.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 play.istlandoll.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s01.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s02.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s03.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s04.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s05.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s06.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s07.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s08.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s09.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s10.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s100.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s11.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s12.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s13.hostcontent.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 binarybusiness.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bitcoin-pay.eu>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cloud-miner.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cloud-miner.eu>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 easyhash.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 srcip.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 srcips.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 4967133.fls.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 6498008.fls.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aax-us-east.amazon-adsystem.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 aax.amazon-adsystem.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad-apac.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad-emea.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad-g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad.mo.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad.pl.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad.sg.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ad.uk.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adclick.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adman.gr>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admarketing.yahoo.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admarvel.s3.amazonaws.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admedia.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admicro1.vcmedia.vn>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admicro2.vcmedia.vn>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admitad.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admixer.co.kr>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admixer.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admob.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 admulti.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adnxs.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adobesupportnumber.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adocean.pl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adonly.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adotsolution.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adotube.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adprotected.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adpublisher.s3.amazonaws.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adquota.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads-twitter.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.ad2iction.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.admoda.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.aerserv.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.easy-ads.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.facebook.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.fotoable.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.glispa.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.linkedin.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.marvel.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.matomymobile.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.mediaforge.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.midatlantic.aaa.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.mobilefuse.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.mobilityware.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.mobvertising.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.mopub.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.n-ws.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.ookla.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.pdbarea.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.pinger.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.pinterest.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.pubmatic.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.reddit>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.reward.rakuten.jp>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.taptapnetworks.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.tremorhub.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.xlxtra.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.yahoo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads.youtube.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ads2.contentabc.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsafeprotected.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsame.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adscale.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsee.jp>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adserver.goforandroid.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adserver.kimia.es>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adserver.mobillex.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adserver.pandora.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adserver.ubiyoo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adserver.unityads.unity3d.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adservetx.media.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adservice.google.co.uk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adservice.google.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adservice.google.ge>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adservice.google.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adservice.google.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adservice.google.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adshost2.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsmo.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsmoloco.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsniper.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adspirit.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adspynet.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsrvmedia.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsrvr.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adsymptotic.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adtaily.pl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adtech.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adtilt.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adtrack.king.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adultadworld.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adups.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adv.mxmcdn.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adversal.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adverticum.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 advertise.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 advertising.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 advertur.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 advombat.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adwhirl.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adwired.mobi>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adwods.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adx.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adz.mobi>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adzerk.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adzmedia.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adzmobi.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 adzworld.in>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 affinity.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 affiz.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 agile-support.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 airpush.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 almancakurslari.gen.tr>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 altitude-arena.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 am15.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazing-your-prize86.loan>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazon-adsystem.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazoncareers.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazoncash.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazoncash.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazonfromhome.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazongigs.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazonhiring.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazonmoney.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazonprofits.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazonprofits.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazonrecruiter.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazonwealth.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amazonwork.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amedi.cl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 americageekpayment.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 americageeks.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amoad.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amobee.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 amptrack.dailymail.co.uk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.brave.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.facebook.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.ff.avast.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.google.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.libertymutual.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.modul.ac.at>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.pinterest.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.pointdrive.linkedin.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.query.yahoo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.twitter.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 analytics.yahoo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 andomedia.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.appfireworks.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.fusepowered.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.kiip.me>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.leadbolt.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 api.usebutton.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 app-measurement.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 app-trackings.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 app.adjust.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 app.link>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 appads.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 appclick.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 appleforsystem.ga>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 appmetrica.yandex.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 appscase.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 banners.klm.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 basecrew.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beacon.clickequations.net.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beacon.eb-collector.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beacons.gcp.gvt2.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beacons.gvt2.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beacons2.gvt2.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beacons3.gvt2.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beacons4.gvt2.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 beacons5.gvt2.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 becoquin.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bid.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 biokamakozmetik.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 bloggingfornetworking.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 branch.io>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 brotherprintersupportphonenumber.co.uk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 c.aaxads.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 c.amazon-adsystem.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdex.mu>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdn.doublesclick.me>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cdnjs.cloudflare.com.cdn.cloudflare.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cesid.com.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 check-testingyourprize16.live>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 chiropractic-wellness.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 classyleague.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 clickandflirt.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 client-event-reporter.twitch.tv>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cm.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 coin-hive.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 combee84.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 countess.twitch.tv>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crash.discordapp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 crash.steampowered.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 cum.fr>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 d2v02itv0y9u9t.cloudfront.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 d355fqgqddpk8.cloudfront.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 digitechinfosolutions.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 download4.co>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 driverupdate.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 dunmebach.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 easyads.bg>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 easydownloadnow.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 economylube.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 errorconnect.webcam>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 euyexxwe.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 events.gfe.nvidia.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 events.redditmedia.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 fasterpropertybuyers.co.uk>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 fastframe.com.br>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 fgsmjjpn.top>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 firebaselogging.googleapis.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 flirt.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 forchaklaws.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 format557-info.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 freshmarketer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 geniegamer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ghochv3eng.trafficmanager.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gmil.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 google-analytics.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 googleads.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 googleads4.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 googleanalytics.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 googlesyndication.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 googletagmanager.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 goretail.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 gstaticadssl.l.google.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 harvestbiblefellowship.us>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 heshimed.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hostedocsp.globalsign.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 hotmailcustomersupport.com.au>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 i-mobile.co.jp>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 i-vengo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 i.skimresources.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ia-tracker.fbsbx.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 iad.appboy.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 iadsdk.apple.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 iamediaserve.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 imasdk.googleapis.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 improving.duckduckgo.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 incoming.telemetry.mozilla.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 infolinks.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 inmobi.cn>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 inmobi.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 inmobi.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 inmobicdn.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 inmobisdk-a.akamaihd.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 inner-active.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 inner-active.mobi>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 innity.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 innovid.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 insightexpressai.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 integral-marketing.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 intellitxt.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 intermarkets.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 internetcareer.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 itshurley.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 jnhosting.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 kallohonka.fi>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 kipos.xyz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 kurankitabevi.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 laze35.site>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 lb.usemaxserver.de>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 log.byteoversea.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 log.pinterest.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 logfiles.zoom.us>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 lord16.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mads.amazon-adsystem.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mail-ads.google.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 malengotours.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 matjournal.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 metrics.advisorchannel.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 metrics.asos.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 metrics.att.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 metrics.cvshealth.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 metrics.dynad.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 metrics.fedex.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 muonpreux.review>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 myphonesupport.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 mytilene.fr>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 myway.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 n4403ad.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 notify.bugsnag.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 onatonline.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 oneclicksupport.info>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 onlinetechsoft.weebly.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 p4-fbm4tfy4du3vk-rsg77dtzm53vwr6k-854535-i1-v6exp3.v4.metric.gstatic.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 p4-fbm4tfy4du3vk-rsg77dtzm53vwr6ks-854535-i2-v6exp3.ds.metric.gstatic.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 page-confrim-safe.ml>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pagead.googlesyndication.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pagead.l.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pagead1.googlesyndication.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pagead2.googlesyndication.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pagead46.l.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pagefair.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 partner.googleadservices.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 partner.intentmedia.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 partnerad.l.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 partnerearning.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 passporttraveleg.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pcoptimizerpro.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 perf-events.cloud.unity3d.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pflexads.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 phluant.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pixel.ad>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pixel.admobclick.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pixel.facebook.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 platinumphonesupport.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ponmile.myjino.ru>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 pubads.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 public.cloud.unity3d.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 reportcentral.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 rereddit.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 retailpay.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 revsherri.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 rtb2.doubleverify.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 s.amazon-adsystem.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 saltofearthlightofworld.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 securepubads.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sessions.bugsnag.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 settings.crashlytics.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 slicktimesavers.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 smetrics.midatlantic.aaa.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 smmknight.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 spicychats.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 sporthome.cl>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ssl.google-analytics.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 st-n.ads1-adnow.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 static.ads-twitter.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 static.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 stats.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 stats.mediaforge.com.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 stats.wp.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 stockretail.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 storejobs.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 strnet24.cf>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 survey.g.doubleclick.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tagmanager.google.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 telemetry.gfe.nvidia.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 theunknowncomposer.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 togethernetworks.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tom006.site>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tps20512.doubleverify.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 track.adform.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 track.cpatool.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 track.effiliation.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 track.wattpad.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 track.zappos.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.admarketplace.net.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.bp01.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.epicgames.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.feedmob.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.feedperfect.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.intl.miui.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.klickthru.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.opencandy.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 tracking.opencandy.com.s3.amazonaws.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 trafficjunky.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 trafficsourceoftoplevelcontentsources.download>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 trovi.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 ulla.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 universalpapercupmachines.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 us04logfiles.zoom.us>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 usa-usage.ime.cootek.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 usa.cc>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 uyoutube.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 v6analytics.htmedia.in.edgekey.net>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 video-ad-stats.googlesyndication.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vietbacsecurity.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 vm5apis.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 wapsort.win>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webserve.xyz>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 webstorejobs.org>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www-google-analytics.l.google.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www-googletagmanager.l.google.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.google-analytics.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.googletagmanager.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 www.googletagservices.com>>%windir%\system32\drivers\etc\hosts
echo 0.0.0.0 youtube.cleverads.vn>>%windir%\system32\drivers\etc\hosts

:ending
echo.
echo  Finished with tweaking
echo  Report feedbacks, end of script
pause
