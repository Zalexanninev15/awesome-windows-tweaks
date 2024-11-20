@Echo off
rem I am aware this has been floating around for a while, but these are the correct changes you should make. This should improve read/write speeds and access times.
fsutil behavior set disable8dot3 1
fsutil behavior set disabledeletenotify 0
fsutil behavior set disablelastaccess 1
fsutil behavior set encryptpagingfile 0
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
sc config SysMain start=disabled
sc config FontCache start=disabled
pause