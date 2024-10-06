Reg.exe add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
echo - Disable UAC (* REBOOT)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0x0 /f>nul
echo - Disable Windows Defender
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0x1 /f>nul
echo - Disable TCP Auto-Tuning
netsh interface tcp set heuristics disabled>nul
rem echo - Hide This PC 7 folders (* RESTART EXPLORER)
rem rem 3D Objects
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f>nul 2>nul
rem rem Desktop
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f>nul 2>nul
rem rem Documents
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f>nul 2>nul
rem rem Downloads
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f>nul 2>nul
rem rem Music
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f>nul 2>nul
rem rem Pictures
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f>nul 2>nul
rem rem Videos
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide" /f>nul 2>nul
echo - Show extensions for known file types
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0x0 /f>nul
echo - Open File Explorer to This PC
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 0x1 /f>nul
echo - Hide recently used files in Quick access
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0x0 /f>nul
echo - Hide frequently used files in Quick access
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0x0 /f>nul
echo - Hide Recycle bin on Desktop
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0x1 /f>nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d 0x1 /f>nul
echo - Show Recycle bin on This PC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /f>nul
rem reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{645FF040-5081-101B-9F08-00AA002F954E}" /f>nul 2>nul
rem echo - Pin Recycle bin to Quick access
rem call :pintohomeCLSID {645FF040-5081-101B-9F08-00AA002F954E}
echo - Pin GodMode control panel to Quick access
call :pintohomeDir "Control Panel (GodMode).{ED7BA470-8E54-465E-825C-99712043E01C}"
echo - Disable Windows Feedback
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0x0 /f>nul
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d 0x0 /f>nul
echo - Disable Application Experience task schedulers
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable>nul 2>nul
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable>nul 2>nul
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable>nul 2>nul
echo - Disable Customer Experience Improvement Program task schedulers
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable>nul 2>nul
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable>nul 2>nul
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable>nul 2>nul
echo (3/3) Config Appx
reg add "HKCR\CLSID\%1\shell\pintohome" /v "MUIVerb" /t REG_SZ /d "@shell32.dll,-51377" /f>nul
reg add "HKCR\CLSID\%1\shell\pintohome\command" /v "DelegateExecute" /t REG_SZ /d "{b455f46e-e4af-4035-b0a4-cf18d2f6f28e}" /f>nul
PowerShell /Command "&{$o=New-Object -ComObject shell.application;$o.Namespace('shell:::%1').Self.InvokeVerb('pintohome')}">nul
reg delete "HKCR\CLSID\%1\shell\pintohome" /f>nul
set serviceName=%~1
if "%serviceName%"=="" goto :eof
if "%2"=="" goto :eof
set regKey="HKLM\SYSTEM\CurrentControlSet\services\%serviceName%"
reg query %regKey% /v Start>nul 2>nul
if ERRORLEVEL 1 goto :eof
reg add %regKey% /v Start /t REG_DWORD /d %2 /f>nul
if "%3"=="" goto :eof
if /i %3==null goto :eof
reg add %regKey% /v DelayedAutostart /t REG_DWORD /d %3 /f>nul
if "%4"=="" goto :eof
if /i %4==null goto :eof
net %4 %serviceName%>nul
goto :eof
if "%1"=="" goto :eof
PowerShell /Command "&{Get-AppxPackage %1 | Remove-AppxPackage}">nul

:: Disable Services
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushsvc" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Services\PeerDistSvc" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL

:: Disable Slideshow during Lock Screen
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Lock Screen" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Enable Dark Mode
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Remove "- Shortcut" text from shortcuts
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v "ShortcutNameTemplate" /t REG_SZ /d "\"%%s.lnk\"" /f 1>NUL 2>NUL

:: Enable Peek at desktop
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Windows Defender SmartScreen Filter
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable first login animation
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable all Content Delivery Manager features
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RemediationRequired" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable all suggested apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "22StokedOnIt.NotebookPro_ffs55s3hze5sr" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "2FE3CB00.PicsArt-PhotoStudio_crhqpqs3x1ygc" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "41038Axilesoft.ACGMediaPlayer_wxjjre7dryqb6" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "5CB722CC.SeekersNotesMysteriesofDarkwood_ypk0bew5psyra" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "7458BE2C.WorldofTanksBlitz_x4tje2y229k00" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "828B5831.HiddenCityMysteryofShadows_ytsefhwckbdv6" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.317180B0BB486_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.Facebook_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.InstagramBeta_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Fitbit.FitbitCoach_6mqt6hf9g46tw" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "flaregamesGmbH.RoyalRevolt2_g0q0z3kw54rap" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "GAMELOFTSA.Asphalt8Airborne_0pp20fcewvvtj" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.BubbleWitch3Saga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.CandyCrushSaga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.CandyCrushSodaSaga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.AgeCastles_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingNews_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingSports_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingWeather_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "microsoft.microsoftskydrive_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MinecraftUWP_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MSPaint_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "NAVER.LINEwin8_8ptj331gd3tyt" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Nordcurrent.CookingFever_m9bz608c1b9ra" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "SiliconBendersLLC.Sketchable_r2kxzpx527qgj" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "SpotifyAB.SpotifyMusic_zpdnekdrzrea0" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "ThumbmunkeysLtd.PhototasticCollage_nfy108tqq3p12" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "USATODAY.USATODAY_wy7mw3214mat8" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "WinZipComputing.WinZipUniversal_3ykzqggjzj4z0" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "828B5831.TheSecretSociety-HiddenMystery_ytsefhwckbdv6" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "89006A2E.AutodeskSketchBook_tf1gferkr813w" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "9E2F88E3.Twitter_wgeqdkkx372wm" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.AsphaltStreetStormRacing_h6adky7gbf63m" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.DisneyMagicKingdoms_h6adky7gbf63m" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.DragonManiaLegends_h6adky7gbf63m" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.MarchofEmpires_h6adky7gbf63m" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "AdobeSystemsIncorporated.PhotoshopElements2018_ynb6jyjzte8ga" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "CAF9E577.Plex_aam28m9va5cke" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "DolbyLaboratories.DolbyAccess_rz1tebttyb220" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Drawboard.DrawboardPDF_gqbn7fs4pywxm" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Expedia.ExpediaHotelsFlightsCarsActivities_0wbx8rnn4qk5c" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable mouse acceleration
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable User Account Control prompts
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Network Location Wizard prompts
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff" /f 1>NUL 2>NUL

:: Disable Gamebar
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Game Mode
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Notify when Windows updates are available
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d "2" /f 1>NUL 2>NUL

:: Change Windows Update branch readiness level to Semi-Annual Channel
reg add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v "BranchReadinessLevel" /t REG_DWORD /d "32" /f 1>NUL 2>NUL

:: Change Performance Options to Adjust for best appearence
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: File Explorer opens to This PC
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Aero Shake
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable "Look for an app in the Store" dialogue
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable "You have new apps that can open this type of file" notification
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoNewAppAlert" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Automatic Maintenance
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable "Windows protected your PC" dialogue
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Malicious Software Removal Tool from installing
reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Error Reporting
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Keep thumbnail cache upon Restart
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "Autorun" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "Autorun" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Task Kill Foreground Processes
taskkill /F /IM "MicrosoftEdge.exe" 1>NUL 2>NUL
taskkill /F /IM "explorer.exe" 1>NUL 2>NUL

:: Disable metro boot menu
bcdedit /set {default} bootmenupolicy legacy 1>NUL 2>NUL

:: Uninstall OneDrive
taskkill /F /IM "OneDrive.exe" 1>NUL 2>NUL
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall 1>NUL 2>NUL
rd "%UserProfile%\OneDrive" /Q /S 1>NUL 2>NUL
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S 1>NUL 2>NUL
rd "%ProgramData%\Microsoft OneDrive" /Q /S 1>NUL 2>NUL
rd "C:\OneDriveTemp" /Q /S 1>NUL 2>NUL

:: Hide PerfLogs folder
attrib "C:\PerfLogs" +h 1>NUL 2>NUL

:: Reveal Public Desktop folder
attrib "C:\Users\Public\Desktop" -h 1>NUL 2>NUL

:: Set Hibernation type to Reduced
powercfg /h /type reduced 1>NUL 2>NUL

:: Delete "Microsoft Edge" shortcut from Desktop
del /f /q "C:\Users\%USERNAME%\Desktop\Microsoft Edge.lnk" 1>NUL 2>NUL

:: Delete "Your Phone" shortcut from Desktop
del /f /q "C:\Users\%USERNAME%\Desktop\Your Phone.lnk" 1>NUL 2>NUL

:: Clean up taskbar
del /f /s /q /a "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*" 1>NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f 1>NUL 2>NUL

:: Increase System Restore point frequency
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Cortana
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable JPEG wallpaper quality reducion
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f 1>NUL 2>NUL

:: Increase 15 file selection limit that hides context menu items
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "MultipleInvokePromptMinimum" /t REG_DWORD /d "999" /f 1>NUL 2>NUL

:: Replace "Personalize" with "Appearance" in desktop context menu
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Personalize" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Personalize" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Personalize\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Personalize\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\DesktopBackground\Shell\Personalize" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance" /v "Icon" /t REG_SZ /d "display.dll,-1" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance" /v "MUIVerb" /t REG_SZ /d "Appearance" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance" /v "Position" /t REG_SZ /d "Bottom" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance" /v "Subcommands" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\01Background" /v "Icon" /t REG_SZ /d "imageres.dll,-110" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\01Background" /v "MUIVerb" /t REG_SZ /d "Background" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\01Background" /v "SettingsURI" /t REG_SZ /d "ms-settings:personalization-background" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\01Background\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\02Colors" /v "Icon" /t REG_SZ /d "themecpl.dll" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\02Colors" /v "MUIVerb" /t REG_SZ /d "Colors" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\02Colors" /v "SettingsURI" /t REG_SZ /d "ms-settings:personalization-colors" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\02Colors\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\03DesktopIcons" /v "Icon" /t REG_SZ /d "desk.cpl" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\03DesktopIcons" /v "MUIVerb" /t REG_SZ /d "Desktop Icons" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\03DesktopIcons\command" /v "" /t REG_SZ /d "rundll32 shell32.dll,Control_RunDLL desk.cpl,,0" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\04LockScreen" /v "Icon" /t REG_SZ /d "imageres.dll,285" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\04LockScreen" /v "MUIVerb" /t REG_SZ /d "Lock Screen" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\04LockScreen" /v "SettingsURI" /t REG_SZ /d "ms-settings:lockscreen" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\04LockScreen\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\05MousePointers" /v "Icon" /t REG_SZ /d "main.cpl" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\05MousePointers" /v "MUIVerb" /t REG_SZ /d "Mouse Pointers" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\05MousePointers\command" /v "" /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL main.cpl,,1" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\06ScreenSaver" /v "Icon" /t REG_SZ /d "PhotoScreensaver.scr" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\06ScreenSaver" /v "MUIVerb" /t REG_SZ /d "Screen Saver" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\06ScreenSaver\command" /v "" /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL desk.cpl,screensaver,@screensaver" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\07Sounds" /v "Icon" /t REG_SZ /d "mmsys.cpl" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\07Sounds" /v "MUIVerb" /t REG_SZ /d "Sounds" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\07Sounds\command" /v "" /t REG_SZ /d "rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl ,2" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\08Taskbar" /v "Icon" /t REG_SZ /d "shell32.dll,-40" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\08Taskbar" /v "MUIVerb" /t REG_SZ /d "Taskbar" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\08Taskbar" /v "SettingsURI" /t REG_SZ /d "ms-settings:taskbar" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\01Appearance\Shell\08Taskbar\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL

:: Replace "Display Settings" with "Settings" in desktop context menu
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Display" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Display" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Display\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\DesktopBackground\Shell\Display\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\DesktopBackground\Shell\Display" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings" /v "MUIVerb" /t REG_SZ /d "Settings" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings" /v "Position" /t REG_SZ /d "Bottom" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings" /v "Subcommands" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\01Accounts" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\01Accounts" /v "MUIVerb" /t REG_SZ /d "Accounts" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\01Accounts" /v "SettingsURI" /t REG_SZ /d "ms-settings:yourinfo" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\01Accounts\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\02Apps" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\02Apps" /v "MUIVerb" /t REG_SZ /d "Apps" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\02Apps" /v "SettingsURI" /t REG_SZ /d "ms-settings:appsfeatures" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\02Apps\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\03Devices" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\03Devices" /v "MUIVerb" /t REG_SZ /d "Devices" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\03Devices" /v "SettingsURI" /t REG_SZ /d "ms-settings:bluetooth" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\03Devices\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\04Display" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\11Search" /v "SettingsURI" /t REG_SZ /d "ms-settings:cortana" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\11Search\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\12Time" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\12Time" /v "MUIVerb" /t REG_SZ /d "Time && Language" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\12Time" /v "SettingsURI" /t REG_SZ /d "ms-settings:dateandtime" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\12Time\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\13Update" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\13Update" /v "MUIVerb" /t REG_SZ /d "Update && Security" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\13Update" /v "SettingsURI" /t REG_SZ /d "ms-settings:windowsupdate" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\13Update\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\04Display" /v "MUIVerb" /t REG_SZ /d "Display" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\04Display" /v "SettingsURI" /t REG_SZ /d "ms-settings:display" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\04Display\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\05Ease" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\05Ease" /v "MUIVerb" /t REG_SZ /d "Ease of Access" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\05Ease" /v "SettingsURI" /t REG_SZ /d "ms-settings:easeofaccess-narrator" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\05Ease\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\06Gaming" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\06Gaming" /v "MUIVerb" /t REG_SZ /d "Gaming" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\06Gaming" /v "SettingsURI" /t REG_SZ /d "ms-settings:gaming-gamebar" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\06Gaming\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\07Network" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\07Network" /v "MUIVerb" /t REG_SZ /d "Network && Internet" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\07Network" /v "SettingsURI" /t REG_SZ /d "ms-settings:network" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\07Network\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\08Personalization" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\08Personalization" /v "MUIVerb" /t REG_SZ /d "Personalization" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\08Personalization" /v "SettingsURI" /t REG_SZ /d "ms-settings:themes" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\08Personalization\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\09Phone" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\09Phone" /v "MUIVerb" /t REG_SZ /d "Phone" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\09Phone" /v "SettingsURI" /t REG_SZ /d "ms-settings:mobile-devices" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\09Phone\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\10Privacy" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\10Privacy" /v "MUIVerb" /t REG_SZ /d "Privacy" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\10Privacy" /v "SettingsURI" /t REG_SZ /d "ms-settings:privacy" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\10Privacy\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\11Search" /v "Icon" /t REG_SZ /d "SystemSettingsBroker.exe" /f 1>NUL 2>NUL
reg add "HKCR\DesktopBackground\Shell\02Settings\shell\11Search" /v "MUIVerb" /t REG_SZ /d "Search" /f 1>NUL 2>NUL

:: Add "Open Command Prompt here" to context menus
SetACL.exe -silent -on "HKCR\Directory\shell\cmd" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\shell\cmd" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "Position" /t REG_SZ /d "Top" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas" /v "Position" /t REG_SZ /d "Top" /f 1>NUL 2>NUL
reg add "HKCR\Directory\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f 1>NUL 2>NUL
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\Background\shell\cmd" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas" /v "Position" /t REG_SZ /d "Top" /f 1>NUL 2>NUL
reg add "HKCR\Directory\Background\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas" /v "Position" /t REG_SZ /d "Top" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\Shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\LibraryFolder\background\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f 1>NUL 2>NUL

:: Remove "Open PowerShell window here" from Shift+Right-click context menus
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\shell\Powershell" /f 1>NUL 2>NUL
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\Background\shell\Powershell" /f 1>NUL 2>NUL

:: Enable Windows Installer in Safe Mode
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Network\MSIServer" /v "" /t REG_SZ /d "Service" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Minimal\MSIServer" /v "" /t REG_SZ /d "Service" /f 1>NUL 2>NUL

:: Increase 3 pinned contacts limit on taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "TaskbarCapacity" /t REG_DWORD /d "999" /f 1>NUL 2>NUL

:: Disable online tips in Settings
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Set "Do this for all current items" checked by default
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "ConfirmationCheckBoxDoForAll" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Add ".bat" to "New" submenu of Desktop context menu
reg add "HKLM\Software\Classes\.bat\ShellNew" /v "NullFile" /t REG_SZ /d "1" /f 1>NUL 2>NUL
reg add "HKLM\Software\Classes\.bat\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\Windows\System32\acppage.dll,-6002" /f 1>NUL 2>NUL

:: Add ".reg" to "New" submenu of Desktop context menu
reg add "HKLM\Software\Classes\.reg\ShellNew" /v "NullFile" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKLM\Software\Classes\.reg\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@C:\WINDOWS\regedit.exe,-309" /f 1>NUL 2>NUL

:: Disable wide context menu
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\FlightedFeatures" /v "ImmersiveContextMenu" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

rem :: Remove Desktop from This PC
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" /f 1>NUL 2>NUL

rem :: Remove Documents from This PC
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" /f 1>NUL 2>NUL

rem :: Remove Downloads from This PC
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" /f 1>NUL 2>NUL

rem :: Remove Music from This PC
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f 1>NUL 2>NUL

rem :: Remove Pictures from This PC
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f 1>NUL 2>NUL

rem :: Remove Videos from This PC
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f 1>NUL 2>NUL

rem :: Remove 3D Objects from This PC
rem reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f 1>NUL 2>NUL
rem reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f 1>NUL 2>NUL

:: Disable search history in File Explorer
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Set File Explorer starting folder to This PC
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Remove OneDrive from Navigation Pane
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Remove Network from Navigation Pane
SetACL.exe -silent -on "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -ot reg -actn ace -ace "n:Administrators;p:full"
reg add "HKCR\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Remove external drives from Navigation Pane
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f 1>NUL 2>NUL

:: Disable suggested apps Windows Ink WorkSpace
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Classes\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}" /v "AllowSuggestedAppsInWindowsInkWorkspace" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Sharing of handwriting data
reg add "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Sharing of handwriting error reports
reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Inventory Collector
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable Camera in login screen
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\AccessPage\Camera" /v "CameraEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Advertising ID
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /f 1>NUL 2>NUL

:: Disable transmission of typing information
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Microsoft conducting experiments with this machine
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable advertisements via Bluetooth
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Windows Customer Experience Improvement Program
reg add "HKLM\Software\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable syncing of text messages to Microsoft
reg add "HKLM\Software\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable application access to user account information
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f 1>NUL 2>NUL

:: Disable tracking of application startups
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable application access of diagnostic information
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2297E4E2-5DBE-466D-A12B-0F8286F0D9CA}" /v "Value" /t REG_SZ /d "Deny" /f 1>NUL 2>NUL

:: Disable password reveal buttom
reg add "HKLM\Software\Policies\Microsoft\Windows\CredUI" /v "DisablePasswordReveal" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable user steps recorder
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Disable telemetry
reg add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\ControlSet001\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f 1>NUL 2>NUL
reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable synchronization of all settings to Microsoft
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f 1>NUL 2>NUL

:: Disable Input Personalization
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicyy" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable peer-to-peer functionality in Windows Update
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable ads in File Explorer and OneDrive
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable feedback reminders
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Remove Search/Cortana from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Remove Task View button from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Remove People buttom from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Hide frequently used folders in "Quick access"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Hide recent files in "Quick access"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Timeline
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Enable clipboard history
reg add "HKEY_CURRENT_USER\Software\Microsoft\Clipboard" /v "EnableClipboardHistory" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Set OEM logo
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OEMInformation" /v "Logo" /t REG_SZ /d "C:\Windows\Custom\logo.bmp" /f 1>NUL 2>NUL

:: Disable Open File security warning
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "00000000" /f 1>NUL 2>NUL
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1806" /t "REG_DWORD" /d "00000000" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t "REG_DWORD" /d "00000001" /f 1>NUL 2>NUL
:: Disable updates for Speech Recognition and Speech Synthesis
reg add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Speech" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable functionality to locate the system
reg add "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d "1" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f 1>NUL 2>NUL
reg add "HKLM\Software\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d "1" /f 1>NUL 2>NUL


:: Remove "Edit with photos" from context menus
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ActivatableClassId" /t REG_SZ /d "App.AppX65n3t4j73ch7cremsjxn7q8bph1ma8jw.mca" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "PackageId" /t REG_SZ /d "Microsoft.Windows.Photos_2017.18062.12990.0_x64__8wekyb3d8bbwe" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ContractId" /t REG_SZ /d "Windows.File" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "DesiredInitialViewState" /t REG_DWORD /d "0" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "" /t REG_SZ /d "@{Microsoft.Windows.Photos_2017.18062.12990.0_x64__8wekyb3d8bbwe?ms-resource://Microsoft.Windows.Photos/Resources/EditWithPhotos}" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f 1>NUL 2>NUL
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit\command" /v "DelegateExecute" /t REG_SZ /d "{4ED3A719-CEA8-4BD9-910D-E252F997AFC2}" /f 1>NUL 2>NUL

:: Remove "Edit with Paint 3D" from context menus
reg delete "HKLM\Software\Classes\SystemFileAssociations\.bmp\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpe\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.png\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.gif\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.tif\Shell\3D Edit" /f 1>NUL 2>NUL
reg delete "HKLM\Software\Classes\SystemFileAssociations\.tiff\Shell\3D Edit" /f 1>NUL 2>NUL

:: Remove "Include in library" from context menus
reg delete "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" /f 1>NUL 2>NUL

:: Disable Microsoft Edge prelaunching
reg add "HKCU\Software\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowPrelaunch" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Disable Microsoft Edge tab preloading
reg add "HKCU\Software\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowTabPreloading" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

:: Change active title bar color to black
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "6B 6B 6B FF 59 59 59 FF 4C 4C 4C FF 3F 3F 3F FF 33 33 33 FF 26 26 26 FF 14 14 14 FF 88 17 98 00" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "4281545523" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "4278190080" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "4278190080" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "3288334336" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationAfterglow" /t REG_DWORD /d "3288334336" /f 1>NUL 2>NUL
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "1" /f 1>NUL 2>NUL

:: Change inactive title bar color to grey
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorInactive" /t REG_DWORD /d "4280953386" /f 1>NUL 2>NUL

:: Remove potential bloat
powershell.exe "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Appconnector* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingFinance* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingSports* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingTranslator* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.FreshPaint* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.DesktopAppInstaller* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MicrosoftPowerBIForWindows* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MinecraftUWP* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.NetworkSpeedTest* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsPhone* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.CommsPhone* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.ConnectivityStore* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Office.Sway* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingFoodAndDrink* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingTravel* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingHealthAndFitness* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *9E2F88E3.Twitter* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *PandoraMediaInc.29680B314EFC2* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Flipboard.Flipboard* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *ShazamEntertainmentLtd.Shazam* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *king.com.CandyCrushSaga* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *king.com.CandyCrushSodaSaga* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *king.com.* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *ClearChannelRadioDigital.iHeartRadio* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *4DF9E0F8.Netflix* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *6Wunderkinder.Wunderlist* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Drawboard.DrawboardPDF* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *22StokedOnIt.NotebookPro* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *2FE3CB00.PicsArt-PhotoStudio* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *41038Axilesoft.ACGMediaPlayer* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *5CB722CC.SeekersNotesMysteriesofDarkwood* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *7458BE2C.WorldofTanksBlitz* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *D52A8D61.FarmVille2CountryEscape | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *TuneIn.TuneInRadio* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *GAMELOFTSA.Asphalt8Airborne* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *TheNewYorkTimes.NYTCrossword* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *DB6EA5DB.CyberLinkMediaSuiteEssentials* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Facebook.Facebook* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *flaregamesGmbH.RoyalRevolt2* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Playtika.CaesarsSlotsFreeCasino* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *A278AB0D.MarchofEmpires* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *KeeperSecurityInc.Keeper* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *ThumbmunkeysLtd.PhototasticCollage* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *INGAG.XING* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *89006A2E.AutodeskSketchBook* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *D5EA27B7.Duolingo-LearnLanguagesforFree* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *46928bounde.EclipseManager* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *ActiproSoftwareLLC.562882FEEB49* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *DolbyLaboratories.DolbyAccess* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *A278AB0D.DisneyMagicKingdoms* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *WinZipComputing.WinZipUniversal* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Wallet* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.windowscommunicationsapps* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *828B5831.HiddenCityMysteryofShadows* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *king.com.BubbleWitch3Saga* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Fitbit.FitbitCoach* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Facebook.InstagramBeta* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Facebook.317180B0BB486* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Expedia.ExpediaHotelsFlightsCarsActivities* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *CAF9E577.Plex* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *AdobeSystemsIncorporated.PhotoshopElements2018* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *A278AB0D.DragonManiaLegends* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *A278AB0D.AsphaltStreetStormRacing* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *828B5831.TheSecretSociety-HiddenMystery* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *USATODAY.USATODAY* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *SiliconBendersLLC.Sketchable* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Nordcurrent.CookingFever* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *NAVER.LINEwin8* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *microsoft.microsoftskydrive* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.AgeCastles* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"

:: Remove potential bloat for new users
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.DesktopAppInstaller* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.3DBuilder* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Appconnector* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingFinance* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingNews* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingSports* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingTranslator* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingWeather* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.FreshPaint* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.DesktopAppInstaller* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Getstarted* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.GetHelp* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Messaging* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Microsoft3DViewer* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftOfficeHub* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftPowerBIForWindows* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftStickyNotes* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MinecraftUWP* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.NetworkSpeedTest* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsPhone* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.CommsPhone* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ConnectivityStore* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Office.Sway* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingFoodAndDrink* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingTravel* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingHealthAndFitness* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *9E2F88E3.Twitter* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *PandoraMediaInc.29680B314EFC2* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Flipboard.Flipboard* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ShazamEntertainmentLtd.Shazam* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.CandyCrushSaga* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.CandyCrushSodaSaga* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ClearChannelRadioDigital.iHeartRadio* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *4DF9E0F8.Netflix* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *6Wunderkinder.Wunderlist* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Drawboard.DrawboardPDF* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *22StokedOnIt.NotebookPro* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *2FE3CB00.PicsArt-PhotoStudio* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *41038Axilesoft.ACGMediaPlayer* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *5CB722CC.SeekersNotesMysteriesofDarkwood* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *7458BE2C.WorldofTanksBlitz* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *D52A8D61.FarmVille2CountryEscape | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *TuneIn.TuneInRadio* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *GAMELOFTSA.Asphalt8Airborne* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *TheNewYorkTimes.NYTCrossword* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *DB6EA5DB.CyberLinkMediaSuiteEssentials* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.Facebook* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *flaregamesGmbH.RoyalRevolt2* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Playtika.CaesarsSlotsFreeCasino* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.MarchofEmpires* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *KeeperSecurityInc.Keeper* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ThumbmunkeysLtd.PhototasticCollage* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *INGAG.XING* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *89006A2E.AutodeskSketchBook* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *D5EA27B7.Duolingo-LearnLanguagesforFree* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *46928bounde.EclipseManager* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ActiproSoftwareLLC.562882FEEB49* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *DolbyLaboratories.DolbyAccess* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *SpotifyAB.SpotifyMusic* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.DisneyMagicKingdoms* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *WinZipComputing.WinZipUniversal* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MSPaint* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Office.OneNote* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.OneConnect* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.People* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Print3D* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.SkypeApp* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Wallet* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Windows.Photos* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsAlarms* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsCamera* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.windowscommunicationsapps* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsFeedbackHub* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsMaps* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsSoundRecorder* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.XboxApp* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Xbox.TCUI* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ZuneMusic* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ZuneVideo* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *828B5831.HiddenCityMysteryofShadows* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.BubbleWitch3Saga* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Fitbit.FitbitCoach* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.InstagramBeta* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.317180B0BB486* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Expedia.ExpediaHotelsFlightsCarsActivities* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *CAF9E577.Plex* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *AdobeSystemsIncorporated.PhotoshopElements2018* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.DragonManiaLegends* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.AsphaltStreetStormRacing* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *828B5831.TheSecretSociety-HiddenMystery* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *USATODAY.USATODAY* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *SiliconBendersLLC.Sketchable* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Nordcurrent.CookingFever* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *NAVER.LINEwin8* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *microsoft.microsoftskydrive* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.AgeCastles* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ScreenSketch* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.YourPhone* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WebMediaExtensions* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MixedReality.Portal* | Remove-AppxProvisionedPackage -Online"

rem Create a backup of the registry keys that will be modified.
echo Creating a backup of the registry keys...
regedit /export HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters C:\temp\tcpip.reg

rem Delete temporary files and prefetch files.
echo Deleting temporary files...
del /q /f /s %temp%
del /q /f /s c:\windows\temp*.*
rmdir /q /s c:\windows\temp
md c:\windows\temp
del /q /f /s C:\WINDOWS\Prefetch*.*
echo Done.

rem Clear the pagefile.
echo Clearing Pagefile...
echo 1 > /proc/sys/vm/drop_caches
echo Done.

rem Disable Windows visual effects.
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 90 12 03 80 10 00 00 00 /f
echo Done.

rem Adjust Internet Settings...
ipconfig /flushdns
netsh int tcp set global autotuninglevel=normal
netsh interface 6to4 set state disabled
netsh int isatap set state disable
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int ip set global icmpredirects=disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int ip set global multicastforwarding=disabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface teredo set state disabled
netsh winsock reset
netsh int isatap set state disable
netsh int ip set global taskoffload=disabled
netsh int ip set global neighborcachelimit=4096
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
PowerShell Disable-NetAdapterLso -Name "*"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterPowerManagement -Name $adapter.Name -ErrorAction SilentlyContinue}"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}"

rem Adjusting Disk Caching Settings.
reg add "HKLM&lt;3>System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
reg add "HKLM\System&lt;4>CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
echo Done.

rem Adjusting File System Settings.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsMemoryUsage /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v DisableNTFSLastAccessUpdate /t REG_DWORD /d 1 /f
echo Done.

rem Adjusting Internet Settings.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPerServer /t REG_DWORD /d 12 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 12 /f

:1
  echo.
  color 0E
  echo Optimizing and Defragmenting All Connected Storage Drives.
  echo.
  defrag /c /a /o /u
  ping 8.8.8.8 -n 2 > nul
  echo.
  goto done
  goto menu

:2
  echo.
  color 0E
  echo Scanning and Fixing File System Errors.
  echo.
  chkdsk C: /f /r /scan
  ping 8.8.8.8 -n 2 > nul
  echo.
  goto done
  goto menu

:3
  echo.
  color 0E
  echo Scanning and Fixing File System Errors Deeply.
  echo.
  sfc /scannow
  ping 8.8.8.8 -n 2 > nul
  echo.
  goto done
  goto menu

:4
  echo.
  color 0E
  echo Optimizing and Defragmenting All Connected Storage Drives.
  echo.
  defrag /c /a /o /u
  ping 8.8.8.8 -n 2 > nul
  echo.
  echo Scanning and Fixing File System Errors.
  echo.
  chkdsk C: /f /r /scan
  ping 8.8.8.8 -n 2 > nul
  echo.
  echo Scanning and Fixing File System Errors Deeply.
  echo.
  sfc /scannow
  ping 8.8.8.8 