@echo off
echo "Disabling Write-Cache Buffer Flushing on Disks"
for /f "Delims=" %%k in ('Reg.exe Query hklm\SYSTEM\CurrentControlSet\Enum /f "{4d36e967-e325-11ce-bfc1-08002be10318}" /d /s^|Find "HKEY"') do (
  Reg.exe add "%%k\Device Parameters\Disk" /v UserWriteCacheSetting /t reg_dword /d 1 /f
  Reg.exe add "%%k\Device Parameters\Disk" /v CacheIsPowerProtected /t reg_dword /d 1 /f
)
cls
pause