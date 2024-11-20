@echo off

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
"
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
"
