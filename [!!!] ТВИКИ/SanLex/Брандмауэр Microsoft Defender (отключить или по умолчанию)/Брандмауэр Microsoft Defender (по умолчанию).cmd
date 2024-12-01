@echo off

echo --- Enable Windows Firewall telemetry ---
reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\IPSec\ICFv4" /f

reg add "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t REG_DWORD /d "1" /f

echo.
echo Finished, please reboot your device for changes to apply.
echo.

pause
exit /b