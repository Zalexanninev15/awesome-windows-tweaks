@echo off

echo Resetting network settings to Windows defaults...

(
	netsh int ip reset
	netsh interface ipv4 reset
	netsh interface ipv6 reset
	netsh interface tcp reset
	netsh winsock reset
)

PowerShell -NoP -C "foreach ($dev in Get-PnpDevice -Class Net -Status 'OK') { pnputil /remove-device $dev.InstanceId }"
pnputil /scan-devices

echo Finished, please reboot your device for changes to apply.
pause
exit /b