powershell Invoke-WebRequest "https://cdn.discordapp.com/attachments/1119999293793763481/1119999322885476382/SetTimerResolutionService.exe" -OutFile "C:\Windows\SetTimerResolutionService.exe"
"C:\Windows\SetTimerResolutionService.exe" -install
sc start STR