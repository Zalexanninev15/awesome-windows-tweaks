@echo off

title MAX_TWEAKS Cleaner V9.01
echo MAX_TWEAKS Cleaner V9.01
echo GitHub: https://github.com/Zalexanninev15/awesome-windows-tweaks
echo

net session >nul 2>&1
if %errorlevel% == 0 (
    goto start
) else (
    echo Elevating to admin privileges...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:start
"%~dp0nircmdc.exe" win close class "CabinetWClass"
taskkill /f /im explorer.exe >nul 2>&1

sc config MapsBroker start=disabled
sc config lfsvc start=disabled
sc config PhoneSvc start=disabled
sc config wisvc start=disabled
sc stop YandexBrowserService
sc config YandexBrowserService start=disabled
sc config TabletInputService start=disabled

:: Windows 7
:: schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\CorruptionDetector" /disable
:: schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\DecompressionFailureDetector" /disable

:: Windows 8-11
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable

Reg.exe add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "Startupdelayinmsec" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\BranchCache" /v "StateFlags0077" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v "StateFlags0077" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\RetailDemo Offline Content" /v "StateFlags0077" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Service Pack Cleanup" /v "StateFlags0077" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error memory dump files" /v "StateFlags0077" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error minidump files" /v "StateFlags0077" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Setup Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Upgrade Discarded Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\User file versions" /v "StateFlags0077" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Archive Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Queue Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Archive Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Queue Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Temp Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows ESD installation files" /v "StateFlags0077" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Upgrade Log Files" /v "StateFlags0077" /t REG_DWORD /d "2" /f

echo Use Alt+Tab if you think the cleanup process has hung!
echo cleanmgr - Step 1
cleanmgr /sagerun:77
echo cleanmgr - Step 2
cleanmgr /verylowdisk
echo cleanmgr - Step 3
cleanmgr /autoclear
echo cleanmgr - Done!

::SetLocal EnableExtensions
if not exist "êcmd.exe" (set CMD_EXE=%COMSPEC%) else (set CMD_EXE=%windir%\Sysnative\cmd.exe)

For /F "Tokens=2*" %%I In ('%CMD_EXE% /c Reg Query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" /V ProfilesDirectory') Do Set Profiles=%%J
Call Set Profiles=%Profiles%

For /F "Delims=" %%I In ('Dir /B /AD-S-H "%Profiles%" ^| FindStr /V /B /I /C:"All Users"') Do (
  cd /d "%Profiles%\%%I\AppData\Local Settings\Temp"
  cd /d "%Profiles%\%%I\AppData\Local\Temp"
  rd /s /q "%Profiles%\%%I\AppData\Local Settings\Temp"
  rd /s /q "%Profiles%\%%I\AppData\Local\Temp"
  cd /d "%Profiles%\%%I\AppData\Local Settings\Microsoft\Windows\Temporary Internet Files"
  cd /d "%Profiles%\%%I\AppData\Local\Microsoft\Windows\Temporary Internet Files"
  rd /s /q "%Profiles%\%%I\AppData\Local Settings\Microsoft\Windows\Temporary Internet Files"
  rd /s /q "%Profiles%\%%I\AppData\Local\Microsoft\Windows\Temporary Internet Files
)

:: 1C Chache
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem "$env:USERPROFILE\AppData\Local\1C\1Cv8\*","$env:USERPROFILE\AppData\Roaming\1C\1Cv8\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem "$env:USERPROFILE\AppData\Local\1C\1Cv81\*","$env:USERPROFILE\AppData\Roaming\1C\1Cv81\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem "$env:USERPROFILE\AppData\Local\1C\1Cv82\*","$env:USERPROFILE\AppData\Roaming\1C\1Cv82\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem "C:\Users\*\AppData\Roaming\1C\1cv8\*","C:\Users\*\AppData\Local\1C\1cv8\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem "C:\Users\*\AppData\Local\1C\1Cv82\*","C:\Users\*\AppData\Roaming\1C\1Cv81\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem "C:\Users\*\AppData\Local\1C\1Cv82\*","C:\Users\*\AppData\Roaming\1C\1Cv82\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"

:: If Exist %USERPROFILE%\AppData\Roaming\1C\1Cv82 (
:: Del /F /Q %USERPROFILE%\AppData\Roaming\1C\1Cv82\*.*
:: Del /F /Q %USERPROFILE%\AppData\Local\1C\1Cv82\*.*
:: for /d %%i in ("%USERPROFILE%\AppData\Roaming\1C\1Cv82\*") do rmdir /s /q "%%i"
:: for /d %%i in ("%USERPROFILE%\AppData\Local\1C\1Cv82\*") do rmdir /s /q "%%i"
:: )
:: If Exist %USERPROFILE%\AppData\Roaming\1C\1Cv8 (
:: Del /F /Q %USERPROFILE%\AppData\Roaming\1C\1Cv8\*.*
:: Del /F /Q %USERPROFILE%\AppData\Local\1C\1Cv8\*.*
:: for /d %%i in ("%USERPROFILE%\AppData\Roaming\1C\1Cv8\*") do rmdir /s /q "%%i"
:: for /d %%i in ("%USERPROFILE%\AppData\Local\1C\1Cv8\*") do rmdir /s /q "%%i"
:: )

:: Printer spooler
net stop spooler
del /Q /F /S “%systemroot%\System32\Spool\Printers\*.*
net start spooler

cd /d "%WINDIR%\Temp"
rd /s /q "%WINDIR%\Temp"
 
:: From https://github.com/rahilpathan/Win10Boost/blob/main/Quicktwks.bat
taskkill /im discord.exe /f
rd "%AppData%\Discord\Cache" /s /q
rd "%AppData%\Discord\Code Cache" /s /q
md "%AppData%\Discord\Cache"
md "%AppData%\Discord\Code Cache"

del "%LocalAppData%\Microsoft\Edge\User Data\Default\*history*." /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\LOG" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\LOG.old" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Login Data" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Login Data-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Media History" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Media History-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Action Predictor" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Action Predictor-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Persistent State" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Reporting and NEL" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Reporting and NEL-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\QuotaManager" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\QuotaManager-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Shortcuts" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Shortcuts-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Top Sites" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Top Sites-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Visited Links" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Web Data" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Web Data-journal" /s /f /q

del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\*history*." /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\LOG" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\LOG.old" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Login Data" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Login Data-journal" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Media History" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Media History-journal" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Network Action Predictor" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Network Action Predictor-journal" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Network Persistent State" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Reporting and NEL" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Reporting and NEL-journal" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\QuotaManager" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\QuotaManager-journal" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Shortcuts" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Shortcuts-journal" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Top Sites" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Top Sites-journal" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Visited Links" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Web Data" /s /f /q
del "%LocalAppData%\Yandex\YandexBrowser\User Data\Default\Web Data-journal" /s /f /q

del "%LocalAppData%\Google\Chrome\User Data\Default\*history*." /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\LOG" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\LOG.old" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Login Data" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Login Data-journal" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Media History" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Media History-journal" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Network Action Predictor" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Network Action Predictor-journal" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Network Persistent State" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Reporting and NEL" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Reporting and NEL-journal" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\QuotaManager" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\QuotaManager-journal" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Shortcuts" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Shortcuts-journal" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Top Sites" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Top Sites-journal" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Visited Links" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Web Data" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Web Data-journal" /s /f /q

rd /q /s %systemdrive%\$recycle.bin

powercfg /x -hibernate-timeout-ac 0
powercfg /x -hibernate-timeout-dc 0
powercfg -h off
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f

:: Max Perfomance
powercfg /export "C:\MaxPerfomance.pow" e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /import "C:\MaxPerfomance.pow" 99999999-9999-9999-9999-999999999999
powercfg /s 99999999-9999-9999-9999-999999999999
::powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

wevtutil sl Security /ms:48048576
wevtutil sl Application /ms:48048576
wevtutil sl Setup /ms:48048576
wevtutil sl System /ms:48048576
wevtutil sl "Windows Powershell" /ms:24048576
wevtutil sl "Microsoft-Windows-PowerShell/Operational" /ms:24048576
wevtutil sl "Microsoft-Windows-Sysmon/Operational" /ms:24048576
wevtutil sl "Microsoft-Windows-TaskScheduler/Operational" /e:true
wevtutil sl "Microsoft-Windows-DNS-Client/Operational" /e:true

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
reg add "HKCR\lnkfile" /v "NeverShowExt" /f
reg add "HKCR\IE.AssocFile.URL" /v "NeverShowExt" /f
reg add "HKCR\IE.AssocFile.WEBSITE" /v "NeverShowExt" /f
reg add "HKCR\InternetShortcut" /v "NeverShowExt" /f
reg add "HKCR\Microsoft.Website" /v "NeverShowExt" /f
reg add "HKCR\piffile" /v "NeverShowExt" /f
reg add "HKCR\SHCmdFile" /v "NeverShowExt" /f
reg add "HKCR\LibraryFolder" /v "NeverShowExt" /f

"%~dp0nircmdc.exe" emptybin
Dism /online /Cleanup-Image /StartComponentCleanup /ResetBase
DISM /Online /Set-ReservedStorageState /State:Disabled
compact /CompactOS:always

del /F /S /Q "%windir%\Logs\CBS\*.*"


del /F /S /Q /AH "%LOCALAPPDATA%\IconCache.db"
del /F /S /Q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\*.*"

rd /q /s %userprofile%\AppData\Local\Temp\ >nul
del /q /f /s %userprofile%\AppData\Local\Temp\*.* >nul
pushd "%temp% && (rd /s /q "%temp%" 2>nul & popd)
pushd "%windir%\temp" && (rd /s /q "%windir%\temp" 2>nul & popd)
pushd "%temp%" && (rd /s /q "%temp%" 2>nul & popd)
pushd "%windir%\Temp" && (rd /s /q "%windir%\Temp" 2>nul & popd)
pushd "%windir%\Prefetch " && (rd /s /q "%windir%\Prefetch" 2>nul & popd)
pushd "%windir%\system32\dllcache" && (rd /s /q "%windir%\system32\dllcache" 2>nul & popd)
pushd "%windir%\spool\printers" && (rd /s /q "%windir%\spool\printers" 2>nul & popd)
pushd "%USERPROFILE%\Local Settings\History" && (rd /s /q "%USERPROFILE%\Local Settings\History" 2>nul & popd)
pushd "%USERPROFILE%\Local Settings\Temporary Internet Files" && (rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files" 2>nul & popd)
pushd "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" && (rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" 2>nul & popd)
pushd "%USERPROFILE%\Local Settings\Temp" && (rd /s /q "%USERPROFILE%\Local Settings\Temp" 2>nul & popd)
pushd "%USERPROFILE%\AppData\Local\Temp" && (rd /s /q "%USERPROFILE%\AppData\Local\Temp" 2>nul & popd)
pushd "%AppData%\Microsoft\Windows\Recent\" && (rd /s /q "%AppData%\Microsoft\Windows\Recent\" 2>nul & popd)
pushd "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer" && (rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer" 2>nul & popd)
pushd "%USERPROFILE%\Local Settings\History" && (rd /s /q "%USERPROFILE%\Local Settings\History" 2>nul & popd)
pushd "%USERPROFILE%\AppData\Local\Temp" && (rd /s /q "%USERPROFILE%\AppData\Local\Temp" 2>nul & popd)
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
DEL /f /s /q /a %LocalAppData%\Microsoft\Windows\Explorer\*.db
DEL /q /f /s %USERPROFILE%\AppData\Roaming\Microsoft\Office\*.tmp 
DEL /f /s /q %systemdrive%\*.tmp
DEL /f /s /q %systemdrive%\LOG.old
DEL /f /s /q %systemdrive%\*._mp
DEL /f /s /q %systemdrive%\*.log
DEL /f /s /q %systemdrive%\*.gid
DEL /f /s /q %systemdrive%\*.chk
DEL /f /s /q %systemdrive%\*.old
DEL /f /s /q %systemdrive%\recycled\*.*
DEL /f /s /q %systemdrive%\$Recycle.Bin\*.*
DEL /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*

tasklist /FO TABLE /NH /FI "ImageName EQ explorer.exe" 2>nul | find /i "explorer.exe" >nul || ("%~dp0nircmdc.exe" execmd start "" explorer.exe)

net stop wuauserv >nul
cd %windir%\SoftwareDistribution\Download\ >nul
del /q /f /s %windir%\SoftwareDistribution\Download\*.* >nul
rd /q /s %windir%\SoftwareDistribution\Download\ >nul
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc
taskkill /im wuauclt.exe /f
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
Ren %systemroot%\SoftwareDistribution SoftwareDistribution.bak
Ren %systemroot%\system32\catroot2 catroot2.bak
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
cd /d %windir%\system32
regsvr32.exe atl.dll /s
regsvr32.exe urlmon.dll /s
regsvr32.exe mshtml.dll /s
regsvr32.exe shdocvw.dll /s
regsvr32.exe browseui.dll /s
regsvr32.exe jscript.dll /s
regsvr32.exe vbscript.dll /s
regsvr32.exe scrrun.dll /s
regsvr32.exe msxml.dll /s
regsvr32.exe msxml3.dll /s
regsvr32.exe msxml6.dll /s
regsvr32.exe actxprxy.dll /s
regsvr32.exe softpub.dll /s
regsvr32.exe wintrust.dll /s
regsvr32.exe dssenh.dll /s
regsvr32.exe rsaenh.dll /s
regsvr32.exe gpkcsp.dll /s
regsvr32.exe sccbase.dll /s
regsvr32.exe slbcsp.dll /s
regsvr32.exe cryptdlg.dll /s
regsvr32.exe oleaut32.dll /s
regsvr32.exe ole32.dll /s
regsvr32.exe shell32.dll /s
regsvr32.exe initpki.dll /s
regsvr32.exe wuapi.dll /s
regsvr32.exe wuaueng.dll /s
regsvr32.exe wuaueng1.dll /s
regsvr32.exe wucltui.dll /s
regsvr32.exe wups.dll /s
regsvr32.exe wups2.dll /s
regsvr32.exe wuweb.dll /s
regsvr32.exe qmgr.dll /s
regsvr32.exe qmgrprxy.dll /s
regsvr32.exe wucltux.dll /s
regsvr32.exe muweb.dll /s
regsvr32.exe wuwebv.dll /s
netsh winsock reset
netsh winhttp reset proxy
net start bits
net start wuauserv
net start appidsvc
net start wuauserv >nul
net start cryptsvc
wuauclt /Updatenow

"%~dp0nircmdc.exe" infobox "Have a good day!" "Cleaning complete" 

exit