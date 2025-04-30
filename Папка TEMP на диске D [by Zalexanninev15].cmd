@echo off
setx TEMP "D:\temp" /M
setx TMP "D:\temp" /M
reg add "HKEY_CURRENT_USER\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "D:\TEMP" /f
reg add "HKEY_CURRENT_USER\Environment" /v "TMP" /t REG_EXPAND_SZ /d "D:\TEMP" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TEMP" /t REG_EXPAND_SZ /d "D:\TEMP" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TMP" /t REG_EXPAND_SZ /d "D:\TEMP" /f
del /F /S /Q C:\TEMP
del /F /S /Q C:\TMP
msg * Please, reboot!