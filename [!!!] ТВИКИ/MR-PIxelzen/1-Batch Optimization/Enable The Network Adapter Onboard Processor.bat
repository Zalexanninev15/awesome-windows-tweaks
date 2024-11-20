@echo off
::Enable The Network Adapter Onboard Processor
netsh int ip set global taskoffload=enabled 
Reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d "0" /f 
echo Enable The Network Adapter Onboard Processor
pause