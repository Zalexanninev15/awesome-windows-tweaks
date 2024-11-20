reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cphs" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cplspcon" /v "Start" /t REG_DWORD /d 3 /f

sc start cphs
sc start cplspcon

