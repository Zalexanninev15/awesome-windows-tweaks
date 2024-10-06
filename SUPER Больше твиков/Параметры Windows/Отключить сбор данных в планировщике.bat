@echo off
rem Made by FadeMind

echo Уборка телеметрии...

sc stop DiagTrack > NUL 2>&1
sc config DiagTrack start= disabled > NUL 2>&1
sc delete DiagTrack > NUL 2>&1

sc stop dmwappushservice > NUL 2>&1
sc config dmwappushservice start= disabled > NUL 2>&1
sc delete dmwappushservice > NUL 2>&1

set F=%TEMP%\al.reg
set F2=%TEMP%\al2.reg
regedit /e "%F%" "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" > NUL 2>&1
powershell -Command "Select-String -Pattern "\"Enabled\"", "\[HKEY", "Windows\sRegistry" -Path \"%F%\" | ForEach-Object {$_.Line} | Foreach-Object {$_ -replace '\"Enabled\"=dword:00000001', '\"Enabled\"=dword:00000000'} | Out-File \"%F2%\"" > NUL 2>&1
regedit /s "%F2%" > NUL 2>&1
del "%F%" "%F2%" > NUL 2>&1
del "%ProgramData%\Microsoft\Diagnosis\ETLLogs\AutoLogger\*.etl" "%ProgramData%\Microsoft\Diagnosis\ETLLogs\ShutdownLogger\*.etl" > NUL 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f > NUL 2>&1

sc config diagnosticshub.standardcollector.service start= disabled > NUL 2>&1

schtasks /change /TN "Microsoft\Windows\Autochk\Proxy" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Maintenance\WinSAT" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /DISABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\PI\Sqm-Tasks" /DISABLE > NUL 2>&1

echo Успешно!
pause