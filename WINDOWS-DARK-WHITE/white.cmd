@Echo Off
For /f "tokens=2*" %%a in ('Reg Query HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme') Do Set "Theme=%%b"
If %Theme%==0x1 ( 
  Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 1 /f
)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 1 /f
Reg.exe add "HKLM\Software\Microsoft\Windows\Dwm" /v "AccentColor" /t REG_DWORD /d "286331153" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\Dwm" /v "AccentColorInactive" /t REG_DWORD /d "4280756007" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\Dwm" /v "AccentColor" /t REG_DWORD /d "286331153" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\Dwm" /v "AccentColorInactive" /t REG_DWORD /d "4280756007" /f
::Reg.exe add "HKU\.DEFAULT\SOFTWARE\StartIsBack" /v "TaskbarColor" /t REG_DWORD /d "286331153" /f
::Reg.exe add "HKU\.DEFAULT\SOFTWARE\StartIsBack" /v "StartMenuColor" /t REG_DWORD /d "4280756007" /f
::Reg.exe add "HKCU\Software\StartIsBack" /v "TaskbarColor" /t REG_DWORD /d "4280756007" /f
::Reg.exe add "HKCU\Software\StartIsBack" /v "StartMenuColor" /t REG_DWORD /d "4280756007" /f
Reg.exe add "HKLM\Software\Microsoft\Windows\Dwm" /v "AccentColor" /t REG_DWORD /d "286331153" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\Dwm" /v "AccentColor" /t REG_DWORD /d "286331153" /f
taskkill /f /im explorer.exe
start explorer.exe
exit