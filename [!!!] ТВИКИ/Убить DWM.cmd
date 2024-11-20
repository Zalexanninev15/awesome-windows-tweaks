echo off
taskkill /im explorer.exe /f
taskkill /im shellexperiencehost.exe /f
taskkill /im searchui.exe /f
taskkill /im searchapp.exe /f
taskkill /im runtimebroker.exe /f
taskkill /im textinputhost.exe /f
taskkill /im dllhost.exe /f
taskkill /im wmiprvse.exe /f
start cmd.exe
cd C:\
rem Your game start here (only for command line based launchers)
cls && echo Launch your game now!
timeout /t 20
pssuspend winlogon.exe
taskkill /im dwm.exe /f
