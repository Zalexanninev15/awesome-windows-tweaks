@echo off

echo Bypass WinBlock for Microsoft Office
reg add "HKCU\Software\Microsoft\Office\16.0\Common\ExperimentConfigs\Ecs" /v "CountryCode" /t REG_SZ /d "std::wstring|US" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t REG_DWORD /d "0" /f

:: Устарело
REM echo Bypass block in Claude, ChatGPT and others
REM powershell -Command "(Invoke-WebRequest -Uri 'https://api.controld.com/dl' -UseBasicParsing).Content | Set-Content '%TEMP%\ctrld_install.bat'" && %TEMP%\ctrld_install.bat comss

echo !!! Press Enter for reboot the system !!!
shutdown /r /f /t 0