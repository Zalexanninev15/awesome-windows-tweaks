@echo off
echo Made by FadeMind
echo Уборка телеметрии NVIDIA
sc stop NvTelemetryContainer > NUL 2>&1
sc config NvTelemetryContainer start= disabled > NUL 2>&1
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvTmMon"') do schtasks /Change /TN "%%~t" /Disable >nul 2>&1
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvTmRep"') do schtasks /Change /TN "%%~t" /Disable >nul 2>&1
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvTmRepOnLogon"') do schtasks /Change /TN "%%~t" /Disable >nul 2>&1
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvProfileUpdaterDaily"') do schtasks /Change /TN "%%~t" /Disable >nul 2>&1
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvProfileUpdaterOnLogon"') do schtasks /Change /TN "%%~t" /Disable >nul 2>&1
reg add "HKCU\SOFTWARE\NVIDIA Corporation\NVControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f > NUL 2>&1
echo Успешно!
