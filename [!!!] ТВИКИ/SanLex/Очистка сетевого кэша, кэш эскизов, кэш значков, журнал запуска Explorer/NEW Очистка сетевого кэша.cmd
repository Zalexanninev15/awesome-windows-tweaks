@echo off

echo Clearing network cache...
IPCONFIG /release
IPCONFIG /renew
IPCONFIG /flushdns
IPCONFIG /registerdns
echo Optimizing netsh settings
echo Enable Memory Pressure Protection
netsh int tcp set security mpp=enabled
echo Enable Direct Cache Access (DCA)
netsh int tcp set global dca=enabled
echo Disable TCP timestamps
netsh int tcp set global timestamps=disabled
echo Increase icw
netsh int tcp set supplemental template=custom icw=10
echo Set initial RTO
:: It is 3000 by default. However I do wanna make sure it's set to that (like if someone used another bad optimizer)
netsh int tcp set global initialRto=3000
echo Disable Media Sense
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v " DisableDHCPMediaSense" /t REG_DWORD /d 1 /f
echo Enable Packet Coalescing
powershell -ExecutionPolicy Unrestricted Set-NetOffloadGlobalSetting -PacketCoalescingFilter enabled
echo Disable unused/bloat network devices
powershell -ExecutionPolicy Unrestricted "Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6, ms_msclient, ms_server, ms_lldp, ms_lltdio, ms_rspndr"
echo Set all networks to Public
powershell -NoProfile "$net=get-netconnectionprofile; Set-NetConnectionProfile -Name $net.Name -NetworkCategory Public"

echo ======================================================
taskkill /f /im explorer.exe & TIMEOUT /T 5 /NOBREAK
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\ExplorerStartupLog_*.etl
start explorer.exe & TIMEOUT /T 30 /NOBREAK

echo Finished, please reboot your device for changes to apply.
pause
exit /b
