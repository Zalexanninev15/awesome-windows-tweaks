@echo off

echo --- Disable IPv6 Internet Connection Sharing and disable outdated transitional protocols ---
Reg add "HKLM\SYSTEM\ControlSet001\Services\TCPIP6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d "0" /f
Reg add "HKLM\SYSTEM\ControlSet001\Services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "6to4_State" /t REG_SZ /d "Disabled" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "ISATAP_State" /t REG_SZ /d "Disabled" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "Teredo_State" /t REG_SZ /d "Disabled" /f
Reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TCPIP\v6Transition" /v "Value" /t REG_SZ /d "Disabled" /f

pause
exit