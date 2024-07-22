@echo off
title MAX_TWEAKS Cleaner V8

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
cleanmgr /sagerun:77

::SetLocal EnableExtensions
if not exist "%windir%\Sysnative\cmd.exe" (set CMD_EXE=%COMSPEC%) else (set CMD_EXE=%windir%\Sysnative\cmd.exe)

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
  rd /s /q "%Profiles%\%%I\AppData\Local\Microsoft\Windows\Temporary Internet Files"
  
)

:: 1C Chache
powershell -command "Get-ChildItem "$env:USERPROFILE\AppData\Local\1C\1Cv8\*","$env:USERPROFILE\AppData\Roaming\1C\1Cv8\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"
powershell -command "Get-ChildItem "$env:USERPROFILE\AppData\Local\1C\1Cv81\*","$env:USERPROFILE\AppData\Roaming\1C\1Cv81\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"
powershell -command "Get-ChildItem "$env:USERPROFILE\AppData\Local\1C\1Cv82\*","$env:USERPROFILE\AppData\Roaming\1C\1Cv82\*" | Where {$_.Name -as [guid]} |Remove-Item -Force -Recurse"

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
del "r\Microsoft\Edge\User Data\Default\Shortcuts-journal" /s /f /q
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
del "%LocalAppData%\YGoogle\Chrome\User Data\Default\Web Data" /s /f /q
del "%LocalAppData%\Google\Chrome\User Data\Default\Web Data-journal" /s /f /q

powershell -command "Clear-RecycleBin -Force"

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
powercfg /x -hibernate-timeout-ac 0
powercfg /x -hibernate-timeout-dc 0
powercfg -h -type reduced
powercfg -h off

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
net start wuauserv >nul

"%~dp0nircmdc.exe" infobox "Have a good day!" "Cleaning complete" 

exit