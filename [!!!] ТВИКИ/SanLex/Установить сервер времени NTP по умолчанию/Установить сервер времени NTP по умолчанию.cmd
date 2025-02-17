@ECHO off

ECHO ========================================
ECHO Set default NTP time server...
ECHO ========================================

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v "1" /t REG_SZ /d "pool.ntp.org" /f
Reg add "HKLM\SYSTEM\ControlSet001\Services\W32Time" /v "Start" /t REG_DWORD /d "2" /f
Reg add "HKLM\SYSTEM\ControlSet001\Services\W32Time\Parameters" /v "NtpServer" /t REG_SZ /d "%NTPserver%,0x9" /f
Reg add "HKLM\SYSTEM\ControlSet001\Services\W32Time\Parameters" /v "Type" /t REG_SZ /d "NTP" /f
Reg add "HKLM\SYSTEM\ControlSet001\Services\W32Time\TimeProviders\NtpClient" /v "Enabled" /t REG_DWORD /d 1 /f
Reg add "HKLM\SYSTEM\ControlSet001\Services\W32Time\TimeProviders\NtpClient" /v "SpecialPollInterval" /t REG_DWORD /d 86400 /f
Reg add "HKLM\SYSTEM\ControlSet001\Services\W32Time\TimeProviders\NtpClient" /v "SpecialPollTimeRemaining" /f

ECHO Finished...

pause
exit