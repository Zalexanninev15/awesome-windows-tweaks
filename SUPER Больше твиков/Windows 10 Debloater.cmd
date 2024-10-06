echo off
color F0
title Windows 10 Debloater
mode con: cols=92 lines=21

setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "del=%%a"
)

cls
call :colortext F0 "This script was made by" 
call :colortext F3 " EverythingTech" && echo.
timeout 2 > nul
echo I am not responsible for damages/issues caused by this file or guide.
timeout 4 > nul

:main
cls
call :colortext F0 "This script is"
call :colortext FA " SEMI-REVERSIBLE"
call :colortext F0 " and will allow you to choose apps you want to remove." && echo .
echo Keep in mind that not every app can come back, are you sure you want to continue?
set /p con=
if /i "%con%" == "yes" (
       goto debloat
) else (
     cls && echo Misspell detected.
     timeout 2 >nul
     cls && echo Returning. && timeout 1 >nul && cls && echo Returning.. && timeout 1 >nul && cls && echo Returning... && timeout 1 >nul && cls
     goto :main
)

:debloat
cls
call :colortext FC "Remove" && echo  3D Builder?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  3D Print?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  3D Viewer?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Alarms App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Bing News?
set /p con=
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Calculator App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsCalculator* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Camera App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Cortana (App only)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Feedback Hub?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Get Help?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage" && cls  
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Get Started?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Maps App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Messaging?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Advertising Client?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Advertising.Xaml* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Edge?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftEdge.Stable* | Remove-AppxPackage" && cd %PROGRAMFILES(X86)%\Microsoft\Edge\Application\8*\Installer && setup --uninstall --force-uninstall --system-level && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Office (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage" > nul && PowerShell -Command "Get-AppxPackage *Microsoft.Office.Sway* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.Office.Desktop* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Mail and Calendar?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage"  && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Mixed Reality Portal?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Pay?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Wallet* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft People?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft OneNote?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Snip and Sketch?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Solitare Collection?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Sticky Notes App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Store?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Store Purchase (breaks MS Store)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.StorePurchaseApp* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Microsoft Zune Video and Music Apps?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Photos App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Remote Desktop?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.RemoteDesktop* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Sound Recording App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Weather App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Xbox App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Xbox Extras?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage" && reg delete "HKEY_CURRENT_USER\System\GameConfigStore\Parents" /f >nul && reg delete "HKEY_CURRENT_USER\System\GameConfigStore\Children" /f >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Your Phone?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F6 "Preinstalled" && echo  Bloatware
timeout 3 >nul
cls && cls
call :colortext FC "Remove" && echo  Adobe Photoshop Express (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Remove Candy Crush (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Remove Duolingo (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Duolingo-LearnLanguagesforFree* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Remove Facebook (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Remove Flipboard (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Flipboard* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Intel Graphics Control Panel (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *AppUp.IntelGraphicsControlPanel* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  LinkedIn (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *7EE7776C.LinkedInforWindows* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Uninstall" && echo  Microsoft OneDrive?
set /p con= 
if /i "%con%" == "yes" cls && %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul && %SystemRoot%\System32\OneDriveSetup.exe /uninstall >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Mirkat (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Mirkat.Mirkat* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  MS Paint (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Network Speed Test (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.NetworkSpeedTest* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Spotify (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Spotify* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Realtek Audio Console (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *RealtekSemiconductorCorp.RealtekAudioControl* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Skype (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Remove" && echo  Twitter (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Advanced" && echo  Debloating (not recommended)
timeout 2 >nul
echo Are you sure you want to continue?
set /p con=
if /i "%con%" == "yes" goto advanced

:advanced
cls && cls
call :colortext F4 "PERMANENTLY REMOVE" && echo  All Startup entries?
set /p con= 
if /i "%con%" == "yes" cls && reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /va /f >nul && reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /va /f >nul && reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /va /f >nul && reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /va /f >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "PERMANENTLY REMOVE" && echo  OEM AppX Packages?
set /p con= 
if /i "%con%" == "yes" cls && cd C:\ProgramData >nul && takeown /f "Packages" >nul && takeown /f "Packages\*" >nul && rd /s /q "Packages" >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F0 "Your copy of Windows 10 is now " && call :colortext FA " debloated" && echo. && timeout 2 > nul


:colortext
echo off
<nul set /p ".=%del%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1