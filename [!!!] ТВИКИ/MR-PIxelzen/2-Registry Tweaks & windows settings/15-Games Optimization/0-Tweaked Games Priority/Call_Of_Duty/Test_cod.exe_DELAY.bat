@echo off
color 3

REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "Application Name" /t REG_SZ /d "cod.exe" /f 
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "DSCP value" /t REG_SZ /d "46" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "Local IP" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "Local Port" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "Protocol" /t REG_SZ /d "UDP" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "Remote IP" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "Remote Port" /t REG_SZ /d "*" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "throttle Rate" /t REG_SZ /d "-1" /f
REG ADD "HKEY_LOCAL_MACHINE\SOftWARE\Policies\Microsoft\Windows\QoS\cod" /v "version" /t REG_SZ /d "1.0" /f

bcdedit /set useplatformclock no 
bcdedit /set useplatformtick yes

@echo
gpupdate /force

pause