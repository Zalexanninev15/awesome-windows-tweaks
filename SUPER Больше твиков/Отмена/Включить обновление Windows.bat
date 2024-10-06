@echo off
echo Made By ios1ph
taskkill /F /FI "IMAGENAME eq SystemSettings.exe"
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "2" /f
echo.
schtasks /change /TN "Microsoft\Windows\WindowsUpdate\DoNotConnectToWindowsUpdateInternetLocations" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\WindowsUpdate\SetDisableUXWUAccess" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\WindowsUpdate\ExcludeWUDriversInQualityUpdate" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\UpdateOrchestrator\Start Oobe Expedite Work" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\UpdateOrchestrator\Schedule Scan" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\UpdateOrchestrator\USO_UxBroker" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\UpdateOrchestrator\UpdateModelTask" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\WaaSMedic\PerformRemediation" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\WindowsUpdate\Scheduled Start" /ENABLE > NUL 2>&1
echo.
net start wuauserv
net start UsoSvc
echo Обновления винды включены! Перезагрузи комп
