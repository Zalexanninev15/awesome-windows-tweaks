@echo off
color 3

REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "Application Name" /t REG_SZ /d "csgo.exe" /f 
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "DSCP value" /t REG_SZ /d "46" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "Local IP" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "Local Port" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "Protocol" /t REG_SZ /d "UDP" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "Remote IP" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "Remote Port" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "throttle Rate" /t REG_SZ /d "-1" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\csgo" /v "version" /t REG_SZ /d "1.0" /f

bcdedit /set useplatformclock no 
bcdedit /set useplatformtick yes

@echo
gpupdate /force

pause