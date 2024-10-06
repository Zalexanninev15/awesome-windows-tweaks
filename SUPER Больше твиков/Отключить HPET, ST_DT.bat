@echo off
echo Disable HPET
bcdedit /deletevalue useplatformclock
@echo
echo Disable Dynamic Tick
bcdedit /set disabledynamictick yes
@echo
echo Disable Synthetic Timers
bcdedit /set useplatformtick yes
