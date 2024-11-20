@echo off
echo Made by ios1ph

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FSE" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EFS" /v "Start" /t REG_DWORD /d 2 /f

for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "cbdhsvc" ^| find /i "cbdhsvc"') do (reg add "%%i" /v "Start" /t reg_dword /d 2 /f)  > NUL 2>&1

sc start EFS
sc config EFS start=demand
echo �ᯥ譮!

