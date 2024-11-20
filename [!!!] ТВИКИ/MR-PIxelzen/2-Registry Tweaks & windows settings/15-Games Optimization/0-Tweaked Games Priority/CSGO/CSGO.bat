@echo off
wmic process where name="csgo.exe" CALL setpriority "high priority"
reg add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_DWORD /d 10 /f
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "Path\To\csgo.exe" /t REG_SZ /d "~DISABLEMOUSEACCELERATION" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d 8 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d 8 /f
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="_Total" set InitialSize=8192, MaximumSize=8192
reg add "HKCU\System\GameConfigStore" /v "GameBarEnabled" /t REG_DWORD /d 0 /f
taskkill /f /im "steam.exe"
reg add "HKCU\Software\Valve\Steam" /v "EnableOverlay" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Valve\Steam" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Valve\Steam" /v "TcpNoDelay" /t REG_DWORD /d 1 /f
rd /s /q "%APPDATA%\Steam\htmlcache"
rd /s /q "%PROGRAMFILES(X86)%\Steam\appcache"
reg add "HKCU\Software\Valve\Steam" /v "AutoUpdateEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Valve\Steam" /v "SilentStartup" /t REG_DWORD /d 1 /f
cls
echo Done, exiting...
timeout /t 5 >nul
pause >nul
exit

