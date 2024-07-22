echo off && title Debloat Script && mode con: cols=100 lines=25 && color F3 && cls
echo Debloat Script by EverythingTech && timeout /t 2 >nul && cls

powershell -command "Get-AppxPackage *Microsoft* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *Duolingo-LearnLanguagesforFree* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *Facebook* | Remove-AppxPackage" >nul 2>&1
powershell -command "Get-AppxPackage *Flipboard* | Remove-AppxPackage" >nul 2>&1
powershell -command "Get-AppxPackage *AppUp.IntelGraphicsControlPanel* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *7EE7776C.LinkedInforWindows* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *Mirkat.Mirkat* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *Spotify* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *RealtekSemiconductorCorp.RealtekAudioControl* | Remove-AppxPackage" >nul
powershell -command "Get-AppxPackage *Twitter* | Remove-AppxPackage" >nul
echo General bloatware removed! && echo Microsoft packages removed! && timeout /t 2 >nul
