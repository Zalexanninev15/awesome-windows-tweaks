@echo off

echo --- Default IPv6 Internet Connection Sharing and disable outdated transitional protocols ---
Reg delete "HKLM\SYSTEM\ControlSet001\Services\TCPIP6\Parameters" /v "EnableICSIPv6" /f
Reg delete "HKLM\SYSTEM\ControlSet001\Services\TCPIP6\Parameters" /v "DisabledComponents" /f
Reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\TCPIP" /f

pause
exit