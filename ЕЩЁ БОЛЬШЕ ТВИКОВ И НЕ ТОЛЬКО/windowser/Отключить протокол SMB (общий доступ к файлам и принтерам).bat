Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB2" /t REG_DWORD /d "0" /f
dism /online /norestart /disable-feature /featurename:SMB1Protocol
wmic service where "Name LIKE '%%lanmanserver%%'" call StopService
wmic service where "Name LIKE '%%lanmanserver%%'" call ChangeStartMode Disabled