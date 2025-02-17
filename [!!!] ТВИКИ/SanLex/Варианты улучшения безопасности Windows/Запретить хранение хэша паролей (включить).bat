@echo off

echo --- Prevent the storage of the LAN Manager hash of passwords ---
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "NoLMHash" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------

pause
exit /b 0