@echo off

:: ----------------------------------------------------------
:: ------------Remove "Microsoft 3D Builder" app-------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft 3D Builder" app
:: Uninstall 'Microsoft.3DBuilder' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.3DBuilder' | Remove-AppxPackage"
:: Mark 'Microsoft.3DBuilder' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.3DBuilder_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Remove "3D Viewer" app------------------
:: ----------------------------------------------------------
echo --- Remove "3D Viewer" app
:: Uninstall 'Microsoft.Microsoft3DViewer' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Microsoft3DViewer' | Remove-AppxPackage"
:: Mark 'Microsoft.Microsoft3DViewer' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Microsoft3DViewer_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Remove "MSN Weather" app-----------------
:: ----------------------------------------------------------
echo --- Remove "MSN Weather" app
:: Uninstall 'Microsoft.BingWeather' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingWeather' | Remove-AppxPackage"
:: Mark 'Microsoft.BingWeather' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingWeather_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Remove "MSN Sports" app------------------
:: ----------------------------------------------------------
echo --- Remove "MSN Sports" app
:: Uninstall 'Microsoft.BingSports' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingSports' | Remove-AppxPackage"
:: Mark 'Microsoft.BingSports' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingSports_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Remove "Microsoft News" app----------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft News" app
:: Uninstall 'Microsoft.BingNews' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingNews' | Remove-AppxPackage"
:: Mark 'Microsoft.BingNews' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingNews_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Remove "MSN Money" app------------------
:: ----------------------------------------------------------
echo --- Remove "MSN Money" app
:: Uninstall 'Microsoft.BingFinance' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.BingFinance' | Remove-AppxPackage"
:: Mark 'Microsoft.BingFinance' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.BingFinance_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "HEIF Image Extensions" app------------
:: ----------------------------------------------------------
echo --- Remove "HEIF Image Extensions" app
:: Uninstall 'Microsoft.HEIFImageExtension' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.HEIFImageExtension' | Remove-AppxPackage"
:: Mark 'Microsoft.HEIFImageExtension' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.HEIFImageExtension_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "VP9 Video Extensions" app-------------
:: ----------------------------------------------------------
echo --- Remove "VP9 Video Extensions" app
:: Uninstall 'Microsoft.VP9VideoExtensions' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.VP9VideoExtensions' | Remove-AppxPackage"
:: Mark 'Microsoft.VP9VideoExtensions' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.VP9VideoExtensions_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Web Media Extensions" app-------------
:: ----------------------------------------------------------
echo --- Remove "Web Media Extensions" app
:: Uninstall 'Microsoft.WebMediaExtensions' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WebMediaExtensions' | Remove-AppxPackage"
:: Mark 'Microsoft.WebMediaExtensions' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WebMediaExtensions_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Webp Image Extensions" app------------
:: ----------------------------------------------------------
echo --- Remove "Webp Image Extensions" app
:: Uninstall 'Microsoft.WebpImageExtension' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WebpImageExtension' | Remove-AppxPackage"
:: Mark 'Microsoft.WebpImageExtension' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WebpImageExtension_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "HEVC Video Extensions" app------------
:: ----------------------------------------------------------
echo --- Remove "HEVC Video Extensions" app
:: Uninstall 'Microsoft.HEVCVideoExtension' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.HEVCVideoExtension' | Remove-AppxPackage"
:: Mark 'Microsoft.HEVCVideoExtension' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.HEVCVideoExtension_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Remove "Raw Image Extension" app-------------
:: ----------------------------------------------------------
echo --- Remove "Raw Image Extension" app
:: Uninstall 'Microsoft.RawImageExtension' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.RawImageExtension' | Remove-AppxPackage"
:: Mark 'Microsoft.RawImageExtension' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.RawImageExtension_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Remove "Microsoft 365 (Office)" app------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft 365 (Office)" app
:: Uninstall 'Microsoft.MicrosoftOfficeHub' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MicrosoftOfficeHub' | Remove-AppxPackage"
:: Mark 'Microsoft.MicrosoftOfficeHub' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Remove "OneNote" app-------------------
:: ----------------------------------------------------------
echo --- Remove "OneNote" app
:: Uninstall 'Microsoft.Office.OneNote' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Office.OneNote' | Remove-AppxPackage"
:: Mark 'Microsoft.Office.OneNote' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.OneNote_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------------Remove "Sway" app---------------------
:: ----------------------------------------------------------
echo --- Remove "Sway" app
:: Uninstall 'Microsoft.Office.Sway' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Office.Sway' | Remove-AppxPackage"
:: Mark 'Microsoft.Office.Sway' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Office.Sway_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Remove "Microsoft Store" app---------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft Store" app
:: Uninstall 'Microsoft.WindowsStore' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsStore' | Remove-AppxPackage"
:: Mark 'Microsoft.WindowsStore' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsStore_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Remove "Store Purchase" app----------------
:: ----------------------------------------------------------
echo --- Remove "Store Purchase" app
:: Uninstall 'Microsoft.StorePurchaseApp' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.StorePurchaseApp' | Remove-AppxPackage"
:: Mark 'Microsoft.StorePurchaseApp' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.StorePurchaseApp_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Remove "Xbox Console Companion" app------------
:: ----------------------------------------------------------
echo --- Remove "Xbox Console Companion" app
:: Uninstall 'Microsoft.XboxApp' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxApp' | Remove-AppxPackage"
:: Mark 'Microsoft.XboxApp' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxApp_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Remove "Xbox Live in-game experience" app---------
:: ----------------------------------------------------------
echo --- Remove "Xbox Live in-game experience" app
:: Uninstall 'Microsoft.Xbox.TCUI' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Xbox.TCUI' | Remove-AppxPackage"
:: Mark 'Microsoft.Xbox.TCUI' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Xbox.TCUI_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove "Xbox Game Bar" app----------------
:: ----------------------------------------------------------
echo --- Remove "Xbox Game Bar" app
:: Uninstall 'Microsoft.XboxGamingOverlay' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGamingOverlay' | Remove-AppxPackage"
:: Mark 'Microsoft.XboxGamingOverlay' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Xbox Game Bar Plugin" app-------------
:: ----------------------------------------------------------
echo --- Remove "Xbox Game Bar Plugin" app
:: Uninstall 'Microsoft.XboxGameOverlay' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxGameOverlay' | Remove-AppxPackage"
:: Mark 'Microsoft.XboxGameOverlay' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxGameOverlay_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: Remove "Xbox Identity Provider" app (breaks Xbox sign-in)-
:: ----------------------------------------------------------
echo --- Remove "Xbox Identity Provider" app (breaks Xbox sign-in)
:: Uninstall 'Microsoft.XboxIdentityProvider' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxIdentityProvider' | Remove-AppxPackage"
:: Mark 'Microsoft.XboxIdentityProvider' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxIdentityProvider_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Remove "Xbox Speech To Text Overlay" app---------
:: ----------------------------------------------------------
echo --- Remove "Xbox Speech To Text Overlay" app
:: Uninstall 'Microsoft.XboxSpeechToTextOverlay' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.XboxSpeechToTextOverlay' | Remove-AppxPackage"
:: Mark 'Microsoft.XboxSpeechToTextOverlay' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Your Phone Companion" app-------------
:: ----------------------------------------------------------
echo --- Remove "Your Phone Companion" app
:: Uninstall 'Microsoft.WindowsPhone' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsPhone' | Remove-AppxPackage"
:: Mark 'Microsoft.WindowsPhone' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsPhone_8wekyb3d8bbwe" /f
:: Uninstall 'Microsoft.Windows.Phone' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Windows.Phone' | Remove-AppxPackage"
:: Mark 'Microsoft.Windows.Phone' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Phone_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Remove "Communications - Phone" app------------
:: ----------------------------------------------------------
echo --- Remove "Communications - Phone" app
:: Uninstall 'Microsoft.CommsPhone' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.CommsPhone' | Remove-AppxPackage"
:: Mark 'Microsoft.CommsPhone' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.CommsPhone_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Remove "Phone Link" app------------------
:: ----------------------------------------------------------
echo --- Remove "Phone Link" app
:: Uninstall 'Microsoft.YourPhone' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.YourPhone' | Remove-AppxPackage"
:: Mark 'Microsoft.YourPhone' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.YourPhone_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Remove "Candy Crush Saga" app---------------
:: ----------------------------------------------------------
echo --- Remove "Candy Crush Saga" app
:: Uninstall 'king.com.CandyCrushSaga' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'king.com.CandyCrushSaga' | Remove-AppxPackage"
:: Mark 'king.com.CandyCrushSaga' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\king.com.CandyCrushSaga_kgqvnymyfvs32" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Candy Crush Soda Saga" app------------
:: ----------------------------------------------------------
echo --- Remove "Candy Crush Soda Saga" app
:: Uninstall 'king.com.CandyCrushSodaSaga' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'king.com.CandyCrushSodaSaga' | Remove-AppxPackage"
:: Mark 'king.com.CandyCrushSodaSaga' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\king.com.CandyCrushSodaSaga_kgqvnymyfvs32" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Remove "Shazam" app--------------------
:: ----------------------------------------------------------
echo --- Remove "Shazam" app
:: Uninstall 'ShazamEntertainmentLtd.Shazam' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ShazamEntertainmentLtd.Shazam' | Remove-AppxPackage"
:: Mark 'ShazamEntertainmentLtd.Shazam' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\ShazamEntertainmentLtd.Shazam_pqbynwjfrbcg4" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Remove "Flipboard" app------------------
:: ----------------------------------------------------------
echo --- Remove "Flipboard" app
:: Uninstall 'Flipboard.Flipboard' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Flipboard.Flipboard' | Remove-AppxPackage"
:: Mark 'Flipboard.Flipboard' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Flipboard.Flipboard_3f5azkryzdbc4" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Remove "Twitter" app-------------------
:: ----------------------------------------------------------
echo --- Remove "Twitter" app
:: Uninstall '9E2F88E3.Twitter' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage '9E2F88E3.Twitter' | Remove-AppxPackage"
:: Mark '9E2F88E3.Twitter' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\9E2F88E3.Twitter_wgeqdkkx372wm" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Remove "iHeart: Radio, Music, Podcasts" app--------
:: ----------------------------------------------------------
echo --- Remove "iHeart: Radio, Music, Podcasts" app
:: Uninstall 'ClearChannelRadioDigital.iHeartRadio' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ClearChannelRadioDigital.iHeartRadio' | Remove-AppxPackage"
:: Mark 'ClearChannelRadioDigital.iHeartRadio' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\ClearChannelRadioDigital.iHeartRadio_a76a11dkgb644" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Remove "Duolingo - Language Lessons" app---------
:: ----------------------------------------------------------
echo --- Remove "Duolingo - Language Lessons" app
:: Uninstall 'D5EA27B7.Duolingo-LearnLanguagesforFree' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'D5EA27B7.Duolingo-LearnLanguagesforFree' | Remove-AppxPackage"
:: Mark 'D5EA27B7.Duolingo-LearnLanguagesforFree' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\D5EA27B7.Duolingo-LearnLanguagesforFree_yx6k7tf7xvsea" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Remove "Adobe Photoshop Express" app-----------
:: ----------------------------------------------------------
echo --- Remove "Adobe Photoshop Express" app
:: Uninstall 'AdobeSystemsIncorporated.AdobePhotoshopExpress' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'AdobeSystemsIncorporated.AdobePhotoshopExpress' | Remove-AppxPackage"
:: Mark 'AdobeSystemsIncorporated.AdobePhotoshopExpress' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\AdobeSystemsIncorporated.AdobePhotoshopExpress_ynb6jyjzte8ga" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Remove "Pandora" app-------------------
:: ----------------------------------------------------------
echo --- Remove "Pandora" app
:: Uninstall 'PandoraMediaInc.29680B314EFC2' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'PandoraMediaInc.29680B314EFC2' | Remove-AppxPackage"
:: Mark 'PandoraMediaInc.29680B314EFC2' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\PandoraMediaInc.29680B314EFC2_n619g4d5j0fnw" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Remove "Eclipse Manager" app---------------
:: ----------------------------------------------------------
echo --- Remove "Eclipse Manager" app
:: Uninstall '46928bounde.EclipseManager' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage '46928bounde.EclipseManager' | Remove-AppxPackage"
:: Mark '46928bounde.EclipseManager' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\46928bounde.EclipseManager_a5h4egax66k6y" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Remove "Code Writer" app-----------------
:: ----------------------------------------------------------
echo --- Remove "Code Writer" app
:: Uninstall 'ActiproSoftwareLLC.562882FEEB491' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'ActiproSoftwareLLC.562882FEEB491' | Remove-AppxPackage"
:: Mark 'ActiproSoftwareLLC.562882FEEB491' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\ActiproSoftwareLLC.562882FEEB491_24pqs290vpjk0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Remove "Spotify - Music and Podcasts" app---------
:: ----------------------------------------------------------
echo --- Remove "Spotify - Music and Podcasts" app
:: Uninstall 'SpotifyAB.SpotifyMusic' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'SpotifyAB.SpotifyMusic' | Remove-AppxPackage"
:: Mark 'SpotifyAB.SpotifyMusic' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\SpotifyAB.SpotifyMusic_zpdnekdrzrea0" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove "App Connector" app----------------
:: ----------------------------------------------------------
echo --- Remove "App Connector" app
:: Uninstall 'Microsoft.Appconnector' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Appconnector' | Remove-AppxPackage"
:: Mark 'Microsoft.Appconnector' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Appconnector_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Remove "Cortana" app-------------------
:: ----------------------------------------------------------
echo --- Remove "Cortana" app
:: Uninstall 'Microsoft.549981C3F5F10' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.549981C3F5F10' | Remove-AppxPackage"
:: Mark 'Microsoft.549981C3F5F10' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.549981C3F5F10_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove "App Installer" app----------------
:: ----------------------------------------------------------
echo --- Remove "App Installer" app
:: Uninstall 'Microsoft.DesktopAppInstaller' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.DesktopAppInstaller' | Remove-AppxPackage"
:: Mark 'Microsoft.DesktopAppInstaller' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Remove "Get Help" app (breaks built-in troubleshooting)--
:: ----------------------------------------------------------
echo --- Remove "Get Help" app (breaks built-in troubleshooting)
:: Uninstall 'Microsoft.GetHelp' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.GetHelp' | Remove-AppxPackage"
:: Mark 'Microsoft.GetHelp' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.GetHelp_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Remove "Microsoft Tips" app----------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft Tips" app
:: Uninstall 'Microsoft.Getstarted' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Getstarted' | Remove-AppxPackage"
:: Mark 'Microsoft.Getstarted' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Getstarted_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Remove "Microsoft Messaging" app-------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft Messaging" app
:: Uninstall 'Microsoft.Messaging' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Messaging' | Remove-AppxPackage"
:: Mark 'Microsoft.Messaging' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Messaging_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Mixed Reality Portal" app-------------
:: ----------------------------------------------------------
echo --- Remove "Mixed Reality Portal" app
:: Uninstall 'Microsoft.MixedReality.Portal' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MixedReality.Portal' | Remove-AppxPackage"
:: Mark 'Microsoft.MixedReality.Portal' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MixedReality.Portal_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove "Feedback Hub" app-----------------
:: ----------------------------------------------------------
echo --- Remove "Feedback Hub" app
:: Uninstall 'Microsoft.WindowsFeedbackHub' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsFeedbackHub' | Remove-AppxPackage"
:: Mark 'Microsoft.WindowsFeedbackHub' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Remove "Windows Alarms and Clock" app-----------
:: ----------------------------------------------------------
echo --- Remove "Windows Alarms and Clock" app
:: Uninstall 'Microsoft.WindowsAlarms' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsAlarms' | Remove-AppxPackage"
:: Mark 'Microsoft.WindowsAlarms' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsAlarms_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Remove "Windows Camera" app----------------
:: ----------------------------------------------------------
echo --- Remove "Windows Camera" app
:: Uninstall 'Microsoft.WindowsCamera' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsCamera' | Remove-AppxPackage"
:: Mark 'Microsoft.WindowsCamera' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsCamera_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Remove "Paint 3D" app-------------------
:: ----------------------------------------------------------
echo --- Remove "Paint 3D" app
:: Uninstall 'Microsoft.MSPaint' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MSPaint' | Remove-AppxPackage"
:: Mark 'Microsoft.MSPaint' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MSPaint_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove "Windows Maps" app-----------------
:: ----------------------------------------------------------
echo --- Remove "Windows Maps" app
:: Uninstall 'Microsoft.WindowsMaps' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsMaps' | Remove-AppxPackage"
:: Mark 'Microsoft.WindowsMaps' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsMaps_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Minecraft for Windows" app------------
:: ----------------------------------------------------------
echo --- Remove "Minecraft for Windows" app
:: Uninstall 'Microsoft.MinecraftUWP' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MinecraftUWP' | Remove-AppxPackage"
:: Mark 'Microsoft.MinecraftUWP' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MinecraftUWP_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Remove "Microsoft People" app---------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft People" app
:: Uninstall 'Microsoft.People' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.People' | Remove-AppxPackage"
:: Mark 'Microsoft.People' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.People_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove "Microsoft Pay" app----------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft Pay" app
:: Uninstall 'Microsoft.Wallet' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Wallet' | Remove-AppxPackage"
:: Mark 'Microsoft.Wallet' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Wallet_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove "Snipping Tool" app----------------
:: ----------------------------------------------------------
echo --- Remove "Snipping Tool" app
:: Uninstall 'Microsoft.ScreenSketch' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.ScreenSketch' | Remove-AppxPackage"
:: Mark 'Microsoft.ScreenSketch' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ScreenSketch_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Remove "Print 3D" app-------------------
:: ----------------------------------------------------------
echo --- Remove "Print 3D" app
:: Uninstall 'Microsoft.Print3D' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Print3D' | Remove-AppxPackage"
:: Mark 'Microsoft.Print3D' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Print3D_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Remove "Mobile Plans" app-----------------
:: ----------------------------------------------------------
echo --- Remove "Mobile Plans" app
:: Uninstall 'Microsoft.OneConnect' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.OneConnect' | Remove-AppxPackage"
:: Mark 'Microsoft.OneConnect' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.OneConnect_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Remove "Microsoft Solitaire Collection" app--------
:: ----------------------------------------------------------
echo --- Remove "Microsoft Solitaire Collection" app
:: Uninstall 'Microsoft.MicrosoftSolitaireCollection' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MicrosoftSolitaireCollection' | Remove-AppxPackage"
:: Mark 'Microsoft.MicrosoftSolitaireCollection' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Remove "Microsoft Sticky Notes" app------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft Sticky Notes" app
:: Uninstall 'Microsoft.MicrosoftStickyNotes' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.MicrosoftStickyNotes' | Remove-AppxPackage"
:: Mark 'Microsoft.MicrosoftStickyNotes' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Remove "Mail and Calendar" app--------------
:: ----------------------------------------------------------
echo --- Remove "Mail and Calendar" app
:: Uninstall 'microsoft.windowscommunicationsapps' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'microsoft.windowscommunicationsapps' | Remove-AppxPackage"
:: Mark 'microsoft.windowscommunicationsapps' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\microsoft.windowscommunicationsapps_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Windows Media Player" app-------------
:: ----------------------------------------------------------
echo --- Remove "Windows Media Player" app
:: Uninstall 'Microsoft.ZuneMusic' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.ZuneMusic' | Remove-AppxPackage"
:: Mark 'Microsoft.ZuneMusic' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ZuneMusic_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Remove "Movies & TV" app-----------------
:: ----------------------------------------------------------
echo --- Remove "Movies ^& TV" app
:: Uninstall 'Microsoft.ZuneVideo' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.ZuneVideo' | Remove-AppxPackage"
:: Mark 'Microsoft.ZuneVideo' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.ZuneVideo_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Remove "Windows Calculator" app--------------
:: ----------------------------------------------------------
echo --- Remove "Windows Calculator" app
:: Uninstall 'Microsoft.WindowsCalculator' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsCalculator' | Remove-AppxPackage"
:: Mark 'Microsoft.WindowsCalculator' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsCalculator_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Remove "Microsoft Photos" app---------------
:: ----------------------------------------------------------
echo --- Remove "Microsoft Photos" app
:: Uninstall 'Microsoft.Windows.Photos' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Windows.Photos' | Remove-AppxPackage"
:: Mark 'Microsoft.Windows.Photos' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Windows.Photos_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------------Remove "Skype" app--------------------
:: ----------------------------------------------------------
echo --- Remove "Skype" app
:: Uninstall 'Microsoft.SkypeApp' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.SkypeApp' | Remove-AppxPackage"
:: Mark 'Microsoft.SkypeApp' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.SkypeApp_kzf8qxf38zg5c" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Remove "GroupMe" app-------------------
:: ----------------------------------------------------------
echo --- Remove "GroupMe" app
:: Uninstall 'Microsoft.GroupMe10' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.GroupMe10' | Remove-AppxPackage"
:: Mark 'Microsoft.GroupMe10' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.GroupMe10_kzf8qxf38zg5c" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Remove "Windows Sound Recorder" app------------
:: ----------------------------------------------------------
echo --- Remove "Windows Sound Recorder" app
:: Uninstall 'Microsoft.WindowsSoundRecorder' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsSoundRecorder' | Remove-AppxPackage"
:: Mark 'Microsoft.WindowsSoundRecorder' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Remove "Microsoft Remote Desktop" app-----------
:: ----------------------------------------------------------
echo --- Remove "Microsoft Remote Desktop" app
:: Uninstall 'Microsoft.RemoteDesktop' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.RemoteDesktop' | Remove-AppxPackage"
:: Mark 'Microsoft.RemoteDesktop' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.RemoteDesktop_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Remove "Network Speed Test" app--------------
:: ----------------------------------------------------------
echo --- Remove "Network Speed Test" app
:: Uninstall 'Microsoft.NetworkSpeedTest' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.NetworkSpeedTest' | Remove-AppxPackage"
:: Mark 'Microsoft.NetworkSpeedTest' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.NetworkSpeedTest_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Remove "Microsoft To Do: Lists, Tasks & Reminders" app--
:: ----------------------------------------------------------
echo --- Remove "Microsoft To Do: Lists, Tasks ^& Reminders" app
:: Uninstall 'Microsoft.Todos' Microsoft Store app.
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.Todos' | Remove-AppxPackage"
:: Mark 'Microsoft.Todos' as deprovisioned to block reinstall during Windows updates.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\Microsoft.Todos_8wekyb3d8bbwe" /f
:: ----------------------------------------------------------


pause
exit /b 0