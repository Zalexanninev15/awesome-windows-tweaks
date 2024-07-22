Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f

takeown /f C:\Windows\System32\CompatTelRunner.exe
taskkill /im C:\Windows\System32\CompatTelRunner.exe /f
netsh advfirewall firewall add rule name=CompatTelRunner.exe dir=in action=block program=CompatTelRunner.exe & netsh advfirewall firewall add rule name=CompatTelRunner.exe dir=out action=block program=CompatTelRunner.exe