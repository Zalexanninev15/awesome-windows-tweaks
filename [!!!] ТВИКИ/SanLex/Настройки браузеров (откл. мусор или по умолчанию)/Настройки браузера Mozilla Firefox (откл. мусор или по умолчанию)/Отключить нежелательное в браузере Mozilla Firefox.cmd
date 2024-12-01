@echo off 

ECHO ============================================================================================================
echo -------------- Disable junk in Mozilla Firefox browser ---------------------------------------------------
ECHO ============================================================================================================
ECHO.

Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "AppAutoUpdate" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "BackgroundAppUpdate" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisablePocket" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "CaptivePortal" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "SearchSuggestEnabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "NetworkPrediction" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableFirefoxAccounts" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableFirefoxScreenshots" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableFirefoxStudies" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableProfileRefresh" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "NoDefaultBookmarks" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "WindowsSSO" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "OverrideFirstRunPage" /t REG_SZ /d "" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "OverridePostUpdatePage" /t REG_SZ /d "" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisablePrivateBrowsing" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "geo.enabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "browser.safebrowsing.phishing.enabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "browser.safebrowsing.malware.enabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "browser.slowStartup.notificationDisabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "security.ssl.errorReporting.enabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "network.IDN_show_punycode" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "extensions.htmlaboutaddons.recommendations.enabled" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "extensions.getAddons.showPane" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "WhatsNew" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "ExtensionRecommendations" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "FeatureRecommendations" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "UrlbarInterventions" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "SkipOnboarding" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "MoreFromMozilla" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "TopSites" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "SponsoredTopSites" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "Highlights" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "Pocket" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "SponsoredPocket" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "Snippets" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxSuggest" /v "SponsoredSuggestions" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxSuggest" /v "ImproveSuggest" /t REG_DWORD /d "0" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /v "BlockNewRequests" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /v "BlockNewRequests" /t REG_DWORD /d "1" /f
Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /v "Default" /t REG_SZ /d "block-audio-video" /f

echo.
echo Finished...
echo.

pause
exit /b