
REM ;Registry File By Adamx
REM ;Disable Windows Biometric Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WbioSrvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Windows Font Cache Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Graphics performance monitor service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Windows Image Acquisition (WIA)
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Windows Error Reporting Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WerSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Program Compatibility Assistant Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PcaSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Windows Event Collector
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Wecsvc" /v "Start" /t REG_DWORD /d "4" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


REM ; Registry File By Adamx
REM ; Disable Connected User Experiences and Telemetry
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f
REM ; Disable dmwappushservice
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
REM ; Disable Diagnostic Execution Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\diagsvc" /v "Start" /t REG_DWORD /d "4" /f
REM ; Disable Diagnostic Policy Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d "4" /f
REM ; Disable Microsoft (R) Diagnostics Hub Standard Collector Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f
REM ; Disable Diagnostic Service Host
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d "4" /f
REM ; Disable Diagnostic System Host
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d "4" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


REM ; Registry File By Adamx
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wdboot" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wdfilter" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wdnisdrv" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mssecflt" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d "1" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


REM ;Registry File By Adamx
REM ;Disable Windows Defender Antivirus Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Windows Defender Security Center Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Windows Defender Antivirus Network Inspection Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Windows Defender Advanced Threat Protection Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Security Center
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Credits To https://yjsky.cn/index.php/content/142.html
REM ;Credits To https://sites.google.com/view/melodystweaks/basictweaks?authuser=0#h.7g93yhn8tk0u
REM ;Credits To http://eddiejackson.net/lab/2020/02/05/windows-10-disable-windows-firewall-notification/
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v "DisableEnhancedNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotification" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d "1" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


REM ;Registry File By Adamx
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


REM ;Registry File By Adamx
REM ;Disable Bluetooth Audio Gateway Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BTAGService" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Bluetooth Support Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d "4" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


REM ;Registry File By Adamx
REM ;Disable Xbox Live Game Save
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Xbox Live Networking Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Xbox Accessory Management Service
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Xbox Live Auth Manager
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d "4" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


REM ;Registry File By Adamx
REM ;Disable Print Spooler
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
REM ;Disable Printer Extensions and Notifications
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\PrintNotify" /v "Start" /t REG_DWORD /d "4" /f

Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)


::
:: Creator: ShadowWhisperer
::  Github: https://github.com/ShadowWhisperer
:: Created: Sometime before 2015
:: Updated: 10/20/2023
::
::
::  Works with Windows XP Pro and all other verions after.
::  Taskkill and tasklist are not part of XP Home. You can downlaod from above my github page, and
::  place them "C:\Windows\System32" They were taken from a pro version of XP when this script was first written.
::
:: Gets a list of running proccesses
:: Sorts by unique *Redundant to kill the name multiple times, /t/f forces all closed
:: Check if name should be skipped
::  - Force kills
::  - Skips
::
:: Services
:: Gets a list of running services
:: Check if name should be skipped
::  - Force stop
::  - Skips
::


:#Kill Processes (1)
del "%tmp%\1.txt" >nul 2>&1
del "%tmp%\2.txt" >nul 2>&1
del "%tmp%\3.txt" >nul 2>&1
WMIC /OUTPUT:"%tmp%\1.txt" path win32_process get Caption /format:csv
for /f "tokens=1,* delims=," %%A in ('type "%tmp%\1.txt"') do echo %%~nxB|find "."|find /v "svchost.exe">>"%tmp%\3.txt"
sort "%tmp%\3.txt" /O "%tmp%\3.txt"
setlocal enabledelayedexpansion
for /f "tokens=*" %%a in ('type "%tmp%\3.txt"') do (
 if "%%a" neq "!last!" (
  echo %%a>>"%tmp%\2.txt"
  set "last=%%a"
 )
)
endlocal

for /f "skip=1 tokens=*" %%a in ('type "%tmp%\2.txt"') do (
if not "%%a"=="AWCC.Service.exe" (
if not "%%a"=="cmd.exe" (
if not "%%a"=="CMGShieldSvc.exe" (
if not "%%a"=="conhost.exe" (
if not "%%a"=="csrss.exe" (
if not "%%a"=="Dell.SecurityFramework.Agent.exe" (
if not "%%a"=="Dell.SecurityFramework.Console.exe" (
if not "%%a"=="Dell.SecurityFramework.LocalServer.exe" (
if not "%%a"=="devmonsrv.exe" (
if not "%%a"=="DFSSvc.exe" (
if not "%%a"=="dllhost.exe" (
if not "%%a"=="dwm.exe" (
if not "%%a"=="EmsService.exe" (
if not "%%a"=="EmsServiceHelper.exe" (
if not "%%a"=="explorer.exe" (
if not "%%a"=="fontdrvhost.exe" (
if not "%%a"=="LsaIso.exe" (
if not "%%a"=="lsass.exe" (
if not "%%a"=="lsm.exe" (
if not "%%a"=="MDLCSvc.exe" (
if not "%%a"=="MsMpEng.exe" (
if not "%%a"=="NisSrv.exe" (
if not "%%a"=="obexsrv.exe" (
if not "%%a"=="PRSvc.exe" (
if not "%%a"=="sc.exe" (
if not "%%a"=="services.exe" (
if not "%%a"=="sihost.exe" (
if not "%%a"=="smss.exe" (
if not "%%a"=="taskhost.exe" (
if not "%%a"=="taskmgr.exe" (
if not "%%a"=="Taskmgr.exe" (
if not "%%a"=="wininit.exe" (
if not "%%a"=="winlogon.exe" (
if not "%%a"=="WMIC.exe" (
if not "%%a"=="WmiPrvSE.exe" (
taskkill /im "%%a" /f /t >nul 2>&1
))))))))))))))))))))))))))))))))))))


:#Stop Services (1)
del "%tmp%\1.txt" >nul 2>&1
del "%tmp%\2.txt" >nul 2>&1
del "%tmp%\3.txt" >nul 2>&1

for /f "tokens=1,*" %%a in ('sc queryex ^|find "SERVICE_NAME"^|find /v "cbdhsvc_"^|find /v "CDPUserSvc_"^|find /v "WpnUserService_"') do echo %%b>>"%tmp%\2.txt"
sort "%tmp%\2.txt" /O "%tmp%\2.txt"
setlocal enabledelayedexpansion
for /f "tokens=*" %%a in ('type "%tmp%\2.txt"') do (
 if "%%a" neq "!last!" (
  echo %%a>>"%tmp%\3.txt"
  set "last=%%a"
 )
)
endlocal

for /f "tokens=*" %%a in ('type "%tmp%\3.txt"') do (
if not "%%a"=="Appinfo" (
if not "%%a"=="Browser" (
if not "%%a"=="CryptSvc" (
if not "%%a"=="DcomLaunch" (
if not "%%a"=="Dhcp" (
if not "%%a"=="eventlog" (
if not "%%a"=="FontCache" (
if not "%%a"=="gpsvc" (
if not "%%a"=="ibmpmsvc" (
if not "%%a"=="netprofm" (
if not "%%a"=="Netman" (
if not "%%a"=="NlaSvc" (
if not "%%a"=="nsi" (
if not "%%a"=="PlugPlay" (
if not "%%a"=="Power" (
if not "%%a"=="ProfSvc" (
if not "%%a"=="RpcEptMapper" (
if not "%%a"=="RpcSs" (
if not "%%a"=="SamSs" (
if not "%%a"=="Schedule" (
if not "%%a"=="Themes" (
if not "%%a"=="Winmgmt" (
if not "%%a"=="wudfsvc" (
if not "%%a"=="Wlansvc" (
if not "%%a"=="WlanSvc" (
if not "%%a"=="IBMPMSVC" (
if not "%%a"=="BFE" (
if not "%%a"=="EventLog" (
if not "%%a"=="Dnscache" (
if not "%%a"=="WinHttpAutoProxySvc" (
if not "%%a"=="servicesAppXSvc" (
if not "%%a"=="BITS" (
if not "%%a"=="BrokerInfrastructure" (
if not "%%a"=="camsvc" (
if not "%%a"=="CDPSvc" (
if not "%%a"=="ClipSVC" (
if not "%%a"=="CoreMessagingRegistrar" (
if not "%%a"=="DiagTrack" (
if not "%%a"=="DispBrokerDesktopSvc" (
if not "%%a"=="DisplayEnhancementService" (
if not "%%a"=="DoSvc" (
if not "%%a"=="DPS" (
if not "%%a"=="DsmSvc" (
if not "%%a"=="DusmSvc" (
if not "%%a"=="EventSystem" (
if not "%%a"=="iphlpsvc" (
if not "%%a"=="KeyIso" (
if not "%%a"=="LanmanServer" (
if not "%%a"=="LanmanWorkstation" (
if not "%%a"=="lfsvc" (
if not "%%a"=="LicenseManager" (
if not "%%a"=="lmhosts" (
if not "%%a"=="LSM" (
if not "%%a"=="mpssvc" (
if not "%%a"=="NcbService" (
if not "%%a"=="NgcCtnrSvc" (
if not "%%a"=="PcaSvc" (
if not "%%a"=="PushToInstall" (
if not "%%a"=="RasMan" (
if not "%%a"=="SEMgrSvc" (
if not "%%a"=="SENS" (
if not "%%a"=="SensrSvc" (
if not "%%a"=="SgrmBroker" (
if not "%%a"=="SSDPSRV" (
if not "%%a"=="SstpSvc" (
if not "%%a"=="StateRepository" (
if not "%%a"=="SysMain" (
if not "%%a"=="SystemEventsBroker" (
if not "%%a"=="TimeBrokerSvc" (
if not "%%a"=="TokenBroker" (
if not "%%a"=="TrkWks" (
if not "%%a"=="UserManager" (
if not "%%a"=="UsoSvc" (
if not "%%a"=="VaultSvc" (
if not "%%a"=="Wcmsvc" (
if not "%%a"=="WdiServiceHost" (
if not "%%a"=="WPDBusEnum" (
if not "%%a"=="WpnService" (
if not "%%a"=="wscsvc" (
sc stop "%%a" >nul 2>&1
))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))



:#Kill Processes (2)
del "%tmp%\1.txt" >nul 2>&1
del "%tmp%\2.txt" >nul 2>&1
del "%tmp%\3.txt" >nul 2>&1
WMIC /OUTPUT:"%tmp%\1.txt" path win32_process get Caption /format:csv
for /f "tokens=1,* delims=," %%A in ('type "%tmp%\1.txt"') do echo %%~nxB|find "."|find /v "svchost.exe">>"%tmp%\3.txt"
sort "%tmp%\3.txt" /O "%tmp%\3.txt"
setlocal enabledelayedexpansion
for /f "tokens=*" %%a in ('type "%tmp%\3.txt"') do (
 if "%%a" neq "!last!" (
  echo %%a>>"%tmp%\2.txt"
  set "last=%%a"
 )
)
endlocal

for /f "skip=1 tokens=*" %%a in ('type "%tmp%\2.txt"') do (
if not "%%a"=="AWCC.Service.exe" (
if not "%%a"=="cmd.exe" (
if not "%%a"=="CMGShieldSvc.exe" (
if not "%%a"=="conhost.exe" (
if not "%%a"=="csrss.exe" (
if not "%%a"=="Dell.SecurityFramework.Agent.exe" (
if not "%%a"=="Dell.SecurityFramework.Console.exe" (
if not "%%a"=="Dell.SecurityFramework.LocalServer.exe" (
if not "%%a"=="devmonsrv.exe" (
if not "%%a"=="DFSSvc.exe" (
if not "%%a"=="dllhost.exe" (
if not "%%a"=="dwm.exe" (
if not "%%a"=="EmsService.exe" (
if not "%%a"=="EmsServiceHelper.exe" (
if not "%%a"=="explorer.exe" (
if not "%%a"=="fontdrvhost.exe" (
if not "%%a"=="LsaIso.exe" (
if not "%%a"=="lsass.exe" (
if not "%%a"=="lsm.exe" (
if not "%%a"=="MDLCSvc.exe" (
if not "%%a"=="MsMpEng.exe" (
if not "%%a"=="NisSrv.exe" (
if not "%%a"=="obexsrv.exe" (
if not "%%a"=="PRSvc.exe" (
if not "%%a"=="sc.exe" (
if not "%%a"=="services.exe" (
if not "%%a"=="sihost.exe" (
if not "%%a"=="smss.exe" (
if not "%%a"=="taskhost.exe" (
if not "%%a"=="taskmgr.exe" (
if not "%%a"=="Taskmgr.exe" (
if not "%%a"=="wininit.exe" (
if not "%%a"=="winlogon.exe" (
if not "%%a"=="WMIC.exe" (
if not "%%a"=="WmiPrvSE.exe" (
wmic process where name='%%a' delete >nul 2>&1
)))))))))))))))))))))))))))))))))))))

