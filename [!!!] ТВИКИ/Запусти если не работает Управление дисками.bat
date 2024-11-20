fsutil behavior set allowextchar 0 > NUL 2>&1
fsutil behavior set Bugcheckoncorrupt 0 > NUL 2>&1
fsutil repair set C: 9 > NUL 2>&1
fsutil behavior set disable8dot3 2 > NUL 2>&1
fsutil behavior set disablecompression 0 > NUL 2>&1
fsutil behavior set disableencryption 0 > NUL 2>&1
fsutil behavior set disablelastaccess 2 > NUL 2>&1
fsutil behavior set disablespotcorruptionhandling 0 > NUL 2>&1
fsutil behavior set encryptpagingfile 0 > NUL 2>&1
fsutil behavior set quotanotify 3600 > NUL 2>&1
fsutil behavior set symlinkevaluation L2L:1 > NUL 2>&1
fsutl behavior set disabledeletenotify 0 > NUL 2>&1
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\vds" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\EventSystem" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\COMSysApp" /v "Start" /t REG_DWORD /d "3" /f
