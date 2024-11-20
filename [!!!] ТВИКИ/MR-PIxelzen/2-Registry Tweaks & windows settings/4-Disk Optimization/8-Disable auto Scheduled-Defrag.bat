@echo off
schtasks /change /tn "Microsoft\Windows\Defrag\ScheduledDefrag" /disable 
pause
