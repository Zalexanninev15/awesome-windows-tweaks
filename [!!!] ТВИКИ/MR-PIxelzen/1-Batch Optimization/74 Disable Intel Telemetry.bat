@echo off
rem:Intel Telemetry
@echo Disabling Intel Telemetry Tasks...
schtasks /change /disable /tn "IntelSURQC-Upgrade-86621605-2a0b-4128-8ffc-15514c247132" 
schtasks /change /disable /tn "IntelSURQC-Upgrade-86621605-2a0b-4128-8ffc-15514c247132-Logon" 
schtasks /change /disable /tn "Intel PTT EK Recertification" 
schtasks /change /disable /tn "USER_ESRV_SVC_QUEENCREEK" 
pause