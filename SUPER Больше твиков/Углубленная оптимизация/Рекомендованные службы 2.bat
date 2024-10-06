@echo off
echo Made by ios1ph
for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "PimIndexMaintenanceSvc" ^| find /i "PimIndexMaintenanceSvc"') do (reg add "%%i" /v "Start" /t reg_dword /d 4 /f)  > NUL 2>&1

for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "UnistoreSvc" ^| find /i "UnistoreSvc"') do (reg add "%%i" /v "Start" /t reg_dword /d 4 /f)  > NUL 2>&1

for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "UserDataSvc" ^| find /i "UserDataSvc"') do (reg add "%%i" /v "Start" /t reg_dword /d 4 /f)  > NUL 2>&1

for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "CDPUserSvc" ^| find /i "CDPUserSvc"') do (reg add "%%i" /v "Start" /t reg_dword /d 4 /f)  > NUL 2>&1

sc stop diagsvc
sc delete diagsvc
echo �ᯥ譮!

