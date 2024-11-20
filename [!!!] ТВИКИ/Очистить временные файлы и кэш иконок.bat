taskkill /f /im explorer.exe
timeout 2 /nobreak>nul
DEL /F /S /Q /A %LocalAppData%MicrosoftWindowsExplorerthumbcache_*.db
DEL /f /s /q %systemdrive%*.tmp
DEL /f /s /q %systemdrive%*._mp
DEL /f /s /q %systemdrive%*.log
DEL /f /s /q %systemdrive%*.gid
DEL /f /s /q %systemdrive%*.chk
DEL /f /s /q %systemdrive%*.old
DEL /f /s /q %systemdrive%recycled*.*
DEL /f /s /q %systemdrive%$Recycle.Bin*.*
DEL /f /s /q %windir%*.bak
DEL /f /s /q %windir%prefetch*.*
rd /s /q %windir%temp & md %windir%temp
DEL /f /q %userprofile%cookies*.*
DEL /f /q %userprofile%recent*.*
DEL /f /s /q "%userprofile%Local SettingsTemporary Internet Files*.*"
DEL /f /s /q "%userprofile%Local SettingsTemp*.*"
DEL /f /s /q "%userprofile%recent*.*"
timeout 2 /nobreak>nul
start explorer.exe