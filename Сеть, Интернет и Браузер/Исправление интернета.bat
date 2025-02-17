@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "if (-Not ([Security.Principal.WindowsPrincipal]([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { exit 1 } else { exit 0 }"

if %errorlevel% equ 1 (
    echo Run as Administrator!
    pause
	exit
)

echo NetFix. Wait...
netsh interface ip delete arpcache
 timeout /t 2
ipconfig /flushdns
timeout /t 2
ipconfig /release
 timeout /t 2
ipconfig /flushdns
 timeout /t 2
ipconfig /renew
 timeout /t 5
netsh winsock reset
timeout /t 2
 netsh advfirewall reset
timeout /t 2
netsh int ip reset
timeout /t 5
echo 'All done, Reboot the computer now.'
pause
exit /b


