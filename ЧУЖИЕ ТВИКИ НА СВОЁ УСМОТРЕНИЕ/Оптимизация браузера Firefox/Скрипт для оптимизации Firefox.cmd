@echo off
TITLE Firefox Slim 
CLS

fsutil dirty query %systemdrive% >nul 2>&1
if ERRORLEVEL 1 (
 ECHO.
 ECHO =============================================
 ECHO This script needs Administrator permissions!
 ECHO.
 ECHO Please run it as the Administrator.
 ECHO =============================================
 ECHO.
 PAUSE >NUL
 goto end
)

ECHO.

ECHO This script will clear everything except bookmarks and passwords
ECHO in your Firefox profile.
ECHO.
ECHO Especially: settings, cache, history, cookies, extensions
ECHO and extensions data will be CLEARED!
ECHO.
ECHO.
ECHO Type YES if your are sure, that you want to continue.
ECHO Otherwise, the script will do nothing.
ECHO.
set /p CONT=Do you want to continue?

if "%CONT%"=="YES" goto DOSLIMFF
if "%CONT%"=="yes" goto DOSLIMFF
if "%CONT%"=="Yes" goto DOSLIMFF
if "%CONT%"=="YEs" goto DOSLIMFF
if "%CONT%"=="yEs" goto DOSLIMFF
if "%CONT%"=="yES" goto DOSLIMFF
if "%CONT%"=="YeS" goto DOSLIMFF
set CONT=
ECHO.
ECHO Cancelling!
ECHO.
ECHO Press any key to exit the script.
ECHO.
PAUSE >NUL
goto end
:DOSLIMFF
set CONT=

ECHO.
ECHO.

if not exist "%APPDATA%\Mozilla\Firefox\installs.ini" goto FFnotinstalled
if not exist "%APPDATA%\Mozilla\Firefox\Profiles\*" goto FFnotinstalled
goto FFinstalled
:FFnotinstalled
 ECHO.
 ECHO ==================================================
 ECHO Firefox is not properly set up.
 ECHO.
 ECHO Please install Firefox, run it and then close it.
 ECHO ==================================================
 ECHO.
 PAUSE >NUL
 goto end
:FFinstalled

tasklist | findstr /i /l /c:"firefox.exe" >nul 2>&1 || goto noFFrunning
 ECHO.
 ECHO =============================================
 ECHO Firefox is running.
 ECHO.
 ECHO Please close Firefox and try again.
 ECHO =============================================
 ECHO.
 PAUSE >NUL
 goto end
:noFFrunning

ECHO Clearing cache...
rd /s /q "%LOCALAPPDATA%\Mozilla\Firefox" >nul 2>&1
rd /s /q "%APPDATA%\Mozilla\Firefox\Crash Reports" >nul 2>&1
rd /s /q "%APPDATA%\Mozilla\Firefox\Pending Pings" >nul 2>&1

ECHO Setting up Firefox...
for /f "delims=" %%i in ('dir /a /s /b "%APPDATA%\Mozilla\Firefox\Profiles\prefs.js" 2^>nul') do (
 mkdir "%TEMP%\SlimFirefox" >nul 2>&1
 copy /b /y "%%~dpiplaces.sqlite" "%TEMP%\SlimFirefox" >nul 2>&1
 copy /b /y "%%~dpilogins.json" "%TEMP%\SlimFirefox" >nul 2>&1
 copy /b /y "%%~dpikey4.db" "%TEMP%\SlimFirefox" >nul 2>&1
 rd /s /q "%%~dpi" >nul 2>&1
 mkdir "%%~dpi" >nul 2>&1 
 copy /b /y "%TEMP%\SlimFirefox\places.sqlite" "%%~dpi" >nul 2>&1
 copy /b /y "%TEMP%\SlimFirefox\logins.json" "%%~dpi" >nul 2>&1
 copy /b /y "%TEMP%\SlimFirefox\key4.db" "%%~dpi" >nul 2>&1
 rd /s /q "%TEMP%\SlimFirefox" >nul 2>&1
 call :create_prefs %%~dpiprefs.js
 mkdir "%%~dpichrome"
 call :create_userChrome %%~dpichrome\userChrome.css
)

ECHO.
ECHO Done!
ECHO.
PAUSE

:end
exit

:create_policies
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "AppAutoUpdate" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "BackgroundAppUpdate" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisablePocket" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableTelemetry" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "CaptivePortal" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "SearchSuggestEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "NetworkPrediction" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableFirefoxAccounts" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableFirefoxScreenshots" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableFirefoxStudies" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableProfileRefresh" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "NoDefaultBookmarks" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "WindowsSSO" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "OverrideFirstRunPage" /t REG_SZ /d "" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "OverridePostUpdatePage" /t REG_SZ /d "" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisablePrivateBrowsing" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "geo.enabled" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "browser.safebrowsing.phishing.enabled" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "browser.safebrowsing.malware.enabled" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "browser.slowStartup.notificationDisabled" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "security.ssl.errorReporting.enabled" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "network.IDN_show_punycode" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "extensions.htmlaboutaddons.recommendations.enabled" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Preferences" /v "extensions.getAddons.showPane" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "WhatsNew" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "ExtensionRecommendations" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "FeatureRecommendations" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "UrlbarInterventions" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "SkipOnboarding" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "MoreFromMozilla" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\UserMessaging" /v "Locked" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "TopSites" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "SponsoredTopSites" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "Highlights" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "Pocket" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "SponsoredPocket" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "Snippets" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxHome" /v "Locked" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxSuggest" /v "SponsoredSuggestions" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxSuggest" /v "ImproveSuggest" /t REG_DWORD /d "0" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxSuggest" /v "Locked" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /v "BlockNewRequests" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Location" /v "Locked" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /v "BlockNewRequests" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Notifications" /v "Locked" /t REG_DWORD /d "1" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /v "Default" /t REG_SZ /d "block-audio-video" /f >nul 2>&1
 Reg add "HKLM\SOFTWARE\Policies\Mozilla\Firefox\Permissions\Autoplay" /v "Locked" /t REG_DWORD /d "1" /f >nul 2>&1
exit /b

:create_prefs
 echo # Mozilla User Preferences>"%1"
 echo.>>"%1"
 echo /* Do not edit this file.>>"%1"
 echo  *>>"%1"
 echo  * If you make changes to this file while the application is running,>>"%1"
 echo  * the changes will be overwritten when the application exits.>>"%1"
 echo  *>>"%1"
 echo  * To make a manual change to preferences, you can visit the URL about:config>>"%1"
 echo  */>>"%1"
 echo.>>"%1"
 echo user_pref("accessibility.force_disabled", 1);>>"%1"
 echo user_pref("browser.send_pings", false);>>"%1"
 echo user_pref("app.update.auto", false);>>"%1"
 echo user_pref("app.update.enabled", false);>>"%1"
 echo user_pref("app.update.silent", true);>>"%1"
 echo user_pref("app.normandy.enabled", false);>>"%1"
 echo user_pref("browser.aboutConfig.showWarning", false);>>"%1"
 echo user_pref("browser.aboutwelcome.protonDesign", false);>>"%1"
 echo user_pref("browser.bookmarks.restore_default_bookmarks", false);>>"%1"
 echo user_pref("browser.sessionstore.max_tabs_undo", 0);>>"%1"
 echo user_pref("browser.cache.disk.capacity", 0);>>"%1"
 echo user_pref("browser.cache.disk.enable", false);>>"%1"
 echo user_pref("browser.contentblocking.report.lockwise.enabled", false);>>"%1"
 echo user_pref("browser.contentblocking.report.monitor.enabled", false);>>"%1"
 echo user_pref("browser.download.animateNotifications", false);>>"%1"
 echo user_pref("browser.download.useDownloadDir", false);>>"%1"
 echo user_pref("browser.formfill.enable", false);>>"%1"
 echo user_pref("browser.fullscreen.animate", false);>>"%1"
 echo user_pref("browser.urlbar.showSearchSuggestionsFirst", false);>>"%1"
 echo user_pref("browser.library.activity-stream.enabled", false);>>"%1"
 echo user_pref("browser.messaging-system.whatsNewPanel.enabled", false);>>"%1"
 echo user_pref("browser.compactmode.show", true);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);>>"%1"
 echo user_pref("browser.newtab.preload", false);>>"%1"
 echo user_pref("dom.enable_performance", false);>>"%1"
 echo user_pref("dom.enable_resource_timing", false);>>"%1"
 echo user_pref("dom.gamepad.enabled", false);>>"%1"
 echo user_pref("signon.storeWhenAutocompleteOff", false);>>"%1"
 echo user_pref("browser.formfill.expire_days", 0);>>"%1"
 echo user_pref("network.proxy.socks_remote_dns", true);>>"%1"
 echo user_pref("network.dns.disableIPv6", true);>>"%1"
 echo user_pref("beacon.enabled", false);>>"%1"
 echo user_pref("network.proxy.no_proxies_on", localhost, 127.0.0.1);>>"%1"
 echo user_pref("webgl.disabled", true);>>"%1"
 echo user_pref("webgl.min_capability_mode", true);>>"%1"
 echo user_pref("webgl.enable-debug-renderer-info", false);>>"%1"
 echo user_pref("media.video_stats.enabled", false);>>"%1"
 echo user_pref("browser.cache.disk_cache_ssl", false);>>"%1"
 echo user_pref("browser.cache.disk.smart_size.enabled", false);>>"%1"
 echo user_pref("browser.cache.offline.capacity", 0);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.safebrowsing.malware.enabled", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.providers.cfr", "{\"id\":\"cfr\",\"enabled\":false,\"type\":\"remote-settings\",\"bucket\":\"cfr\",\"updateCycleInMs\":3600000}");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.providers.cfr-fxa", "{\"id\":\"cfr-fxa\",\"enabled\":false,\"type\":\"remote-settings\",\"bucket\":\"cfr-fxa\",\"updateCycleInMs\":3600000}");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.providers.message-groups", "{\"id\":\"message-groups\",\"enabled\":false,\"type\":\"remote-settings\",\"bucket\":\"message-groups\",\"updateCycleInMs\":3600000}");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.providers.messaging-experiments", "{\"id\":\"messaging-experiments\",\"enabled\":false,\"type\":\"remote-experiments\",\"messageGroups\":[\"cfr\",\"whats-new-panel\",\"moments-page\",\"snippets\",\"cfr-fxa\",\"aboutwelcome\"],\"updateCycleInMs\":3600000}");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.providers.onboarding", "{\"id\":\"onboarding\",\"type\":\"local\",\"localProvider\":\"OnboardingMessageProvider\",\"enabled\":false,\"exclude\":[]}");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.providers.snippets", "{\"id\":\"snippets\",\"enabled\":false,\"type\":\"remote\",\"url\":\"https://snippets.cdn.mozilla.net/%%STARTPAGE_VERSION%%/%%NAME%%/%%VERSION%%/%%APPBUILDID%%/%%BUILD_TARGET%%/%%LOCALE%%/%%CHANNEL%%/%%OS_VERSION%%/%%DISTRIBUTION%%/%%DISTRIBUTION_VERSION%%/\",\"updateCycleInMs\":14400000}");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.providers.whats-new-panel", "{\"id\":\"whats-new-panel\",\"enabled\":false,\"type\":\"remote-settings\",\"bucket\":\"whats-new-panel\",\"updateCycleInMs\":3600000}");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.useRemoteL10n", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.default.sites", "");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.discoverystream.config", "{\"api_key_pref\":\"extensions.pocket.oAuthConsumerKey\",\"collapsible\":true,\"enabled\":false,\"show_spocs\":false,\"hardcoded_layout\":true,\"personalized\":true,\"layout_endpoint\":\"https://getpocket.cdn.mozilla.net/v3/newtab/layout?version=1^&consumer_key=$apiKey^&layout_variant=basic\"}");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.discoverystream.enabled", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.discoverystream.endpointSpocsClear", "");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.discoverystream.endpoints", "");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.discoverystream.region-basic-layout", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.discoverystream.spocs.personalized", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.aboutpreferences", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.sections", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.system.topsites", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.systemtick", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.places", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.favicon", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.asrouterfeed", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.feeds.recommendationproviderswitcher", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.filterAdult", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.fxaccounts.endpoint", "");>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar", false);>>"%1"               
 echo user_pref("browser.newtabpage.activity-stream.improvesearch.noDefaultSearchTile", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.prerender", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.showSponsored", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.telemetry", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.telemetry.structuredIngestion", false);>>"%1"
 echo user_pref("browser.newtabpage.activity-stream.telemetry.structuredIngestion.endpoint", "");>>"%1"
 echo user_pref("browser.newtabpage.enabled", false);>>"%1"
 echo user_pref("browser.newtabpage.introShown", true);>>"%1"
 echo user_pref("browser.ping-centre.telemetry", false);>>"%1"
 echo user_pref("browser.pocket.enabled", false);>>"%1"
 echo user_pref("browser.protections_panel.infoMessage.seen", true);>>"%1"
 echo user_pref("browser.rights.3.shown", true);>>"%1"
 echo user_pref("browser.search.geoSpecificDefaults", false);>>"%1"
 echo user_pref("browser.search.region", "PL");>>"%1"
 echo user_pref("browser.search.suggest.enabled", false);>>"%1"
 echo user_pref("browser.search.update", false);>>"%1"
 echo user_pref("browser.search.widget.inNavBar", true);>>"%1"
 echo user_pref("browser.safebrowsing.enabled", false);>>"%1"
 echo user_pref("browser.safebrowsing.malware.enabled", false);>>"%1"
 echo user_pref("browser.safebrowsing.phishing.enabled", false);>>"%1"
 echo user_pref("browser.safebrowsing.downloads.enabled", false);>>"%1"
 echo user_pref("browser.safebrowsing.downloads.remote.block_dangerous", false);>>"%1"
 echo user_pref("browser.safebrowsing.downloads.remote.block_dangerous_host", false);>>"%1"
 echo user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);>>"%1"
 echo user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);>>"%1"
 echo user_pref("browser.safebrowsing.downloads.remote.enabled", false);>>"%1"
 echo user_pref("browser.sessionstore.interval", 15000000);>>"%1"
 echo user_pref("browser.sessionstore.max_resumed_crashes", 0);>>"%1"
 echo user_pref("browser.sessionstore.restore_on_demand", false);>>"%1"
 echo user_pref("browser.sessionstore.resume_from_crash", false);>>"%1"
 echo user_pref("browser.slowStartup.notificationDisabled", true);>>"%1"
 echo user_pref("browser.startup.homepage_override.mstone", "ignore");>>"%1"
 echo user_pref("browser.tabs.animate", false);>>"%1"
 echo user_pref("browser.tabs.crashReporting.sendReport", false);>>"%1"
 echo user_pref("browser.tabs.warnOnClose", false);>>"%1"
 echo user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"urlbar-container\",\"search-container\",\"save-to-pocket-button\",\"downloads-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"]},\"seen\":[\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\",\"toolbar-menubar\",\"TabsToolbar\",\"PersonalToolbar\"],\"currentVersion\":17,\"newElementCount\":3}");>>"%1"
 echo user_pref("browser.urlbar.openViewOnFocus", false);>>"%1"
 echo user_pref("browser.urlbar.speculativeConnect.enabled", false);>>"%1"
 echo user_pref("browser.urlbar.suggest.engines", false);>>"%1"
 echo user_pref("browser.urlbar.suggest.topsites", false);>>"%1"
 echo user_pref("browser.urlbar.update1", false);>>"%1"
 echo user_pref("browser.urlbar.update1.interventions", false);>>"%1"
 echo user_pref("browser.urlbar.update1.searchTips", false);>>"%1"
 echo user_pref("browser.urlbar.update1.view.stripHttps", false);>>"%1"
 echo user_pref("browser.urlbar.userMadeSearchSuggestionsChoice", true);>>"%1"
 echo user_pref("toolkit.cosmeticAnimations.enabled", false);>>"%1"
 echo user_pref("datareporting.healthreport.uploadEnabled", false);>>"%1"
 echo user_pref("datareporting.policy.dataSubmissionEnabled", false);>>"%1"
 echo user_pref("datareporting.policy.dataSubmissionPolicyAcceptedVersion", 2);>>"%1"
 echo user_pref("datareporting.policy.dataSubmissionPolicyNotifiedTime", "1451245408110");>>"%1"
 echo user_pref("datareporting.policy.firstRunTime", "1451245397413");>>"%1"
 echo user_pref("devtools.whatsnew.feature-enabled", false);>>"%1"
 echo user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);>>"%1"
 echo user_pref("dom.ipc.plugins.reportCrashURL", false);>>"%1"
 echo user_pref("dom.battery.enabled", false);>>"%1"
 echo user_pref("dom.event.clipboardevents.enabled", false);>>"%1"
 echo user_pref("dom.event.contextmenu.enabled", false);>>"%1"
 echo user_pref("dom.push.connection.enabled", false);>>"%1"
 echo user_pref("dom.push.enabled", false);>>"%1"
 echo user_pref("dom.webnotifications.enabled", false);>>"%1"
 echo user_pref("dom.webnotifications.serviceworker.enabled", false);>>"%1"
 echo user_pref("experiments.activeExperiment", false);>>"%1"
 echo user_pref("experiments.enabled", false);>>"%1"
 echo user_pref("experiments.supported", false);>>"%1"
 echo user_pref("extensions.abuseReport.enabled", false);>>"%1"
 echo user_pref("extensions.blocklist.enabled", false);>>"%1"
 echo user_pref("extensions.fxmonitor.enabled", false);>>"%1"
 echo user_pref("extensions.fxmonitor.firstAlertShown", true);>>"%1"
 echo user_pref("extensions.getAddons.cache.enabled", false);>>"%1"
 echo user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);>>"%1"
 echo user_pref("extensions.pocket.enabled", false);>>"%1"
 echo user_pref("extensions.shownSelectionUI", true);>>"%1"
 echo user_pref("extensions.update.enabled", false);>>"%1"
 echo user_pref("general.autoScroll", false);>>"%1"
 echo user_pref("general.smoothScroll", false);>>"%1"
 echo user_pref("general.warnOnAboutConfig", false);>>"%1"
 echo user_pref("geo.enabled", false);>>"%1"
 echo user_pref("identity.fxaccounts.commands.enabled", false);>>"%1"
 echo user_pref("identity.fxaccounts.enabled", false);>>"%1"
 echo user_pref("identity.fxaccounts.pairing.enabled", false);>>"%1"
 echo user_pref("identity.fxaccounts.toolbar.enabled", false);>>"%1"
 echo user_pref("loop.enabled", false);>>"%1"
 echo user_pref("loop.showPartnerLogo", false);>>"%1"
 echo user_pref("media.autoplay.allow-muted", false);>>"%1"
 echo user_pref("media.autoplay.default", 5);>>"%1"
 echo user_pref("media.autoplay.enabled", false);>>"%1"
 echo user_pref("media.navigator.enabled", false);>>"%1"
 echo user_pref("media.peerconnection.enabled", false);>>"%1"
 echo user_pref("media.peerconnection.simulcast", false);>>"%1"
 echo user_pref("media.wmf.deblacklisting-for-telemetry-in-gpu-process", false);>>"%1"
 echo user_pref("network.IDN_show_punycode", true);>>"%1"
 echo user_pref("network.allow-experiments", false);>>"%1"
 echo user_pref("network.connectivity-service.enabled", false);>>"%1"
 echo user_pref("network.captive-portal-service.enabled", false);>>"%1"
 echo user_pref("network.cookie.cookieBehavior", 1);>>"%1"
 echo user_pref("network.cookie.lifetimePolicy", 2);>>"%1"
 echo user_pref("network.dns.disablePrefetch", true);>>"%1"
 echo user_pref("network.cookie.cookieBehavior", 1);>>"%1"
 echo user_pref("network.http.referer.XOriginPolicy", 1);>>"%1"
 echo user_pref("network.http.referer.XOriginTrimmingPolicy", 1);>>"%1"
 echo user_pref("network.http.referer.trimmingPolicy", 1);>>"%1"
 echo user_pref("network.http.speculative-parallel-limit", 0);>>"%1"
 echo user_pref("network.predictor.cleaned-up", true);>>"%1"
 echo user_pref("network.predictor.enabled", false);>>"%1"
 echo user_pref("network.prefetch-next", false);>>"%1"
 echo user_pref("pdfjs.migrationVersion", 2);>>"%1"
 echo user_pref("pdfjs.previousHandler.alwaysAskBeforeHandling", true);>>"%1"
 echo user_pref("pdfjs.previousHandler.preferredAction", 2);>>"%1"
 echo user_pref("permissions.default.camera", 2);>>"%1"
 echo user_pref("permissions.default.desktop-notification", 2);>>"%1"
 echo user_pref("permissions.default.geo", 2);>>"%1"
 echo user_pref("permissions.default.microphone", 2);>>"%1"
 echo user_pref("permissions.default.xr", 2);>>"%1"
 echo user_pref("plugin.disable_full_page_plugin_for_types", "application/pdf");>>"%1"
 echo user_pref("pref.browser.homepage.disable_button.current_page", false);>>"%1"
 echo user_pref("pref.browser.homepage.disable_button.restore_default", false);>>"%1"
 echo user_pref("privacy.clearOnShutdown.offlineApps", true);>>"%1"
 echo user_pref("privacy.clearOnShutdown.siteSettings", true);>>"%1"
 echo user_pref("privacy.firstparty.isolate", true);>>"%1"
 echo user_pref("privacy.history.custom", true);>>"%1"
 echo user_pref("privacy.sanitize.sanitizeOnShutdown", true);>>"%1"
 echo user_pref("privacy.socialtracking.block_cookies.enabled", false);>>"%1"
 echo user_pref("privacy.socialtracking.notification.enabled", false);>>"%1"
 echo user_pref("privacy.trackingprotection.annotate_channels", false);>>"%1"
 echo user_pref("privacy.trackingprotection.cryptomining.enabled", false);>>"%1"
 echo user_pref("privacy.trackingprotection.fingerprinting.enabled", false);>>"%1"
 echo user_pref("privacy.trackingprotection.pbmode.enabled", false);>>"%1"
 echo user_pref("reader.parse-on-load.enabled", false);>>"%1"
 echo user_pref("security.insecure_field_warning.contextual.enabled", false);>>"%1"
 echo user_pref("security.OCSP.enabled", 0);>>"%1"
 echo user_pref("security.app_menu.recordEventTelemetry", false);>>"%1"
 echo user_pref("security.certerrors.recordEventTelemetry", false);>>"%1"
 echo user_pref("security.identitypopup.recordEventTelemetry", false);>>"%1"
 echo user_pref("security.insecure_field_warning.contextual.enabled", false);>>"%1"
 echo user_pref("security.protectionspopup.recordEventTelemetry", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.sessionstore.restore_on_demand", false);>>"%1"
 echo user_pref("toolkit.startup.max_resumed_crashes", -1);>>"%1"
 echo user_pref("plugin.load_flash_only", false);>>"%1"
 echo user_pref("experiments.enabled", false);>>"%1"
 echo user_pref("experiments.supported", false);>>"%1"
 echo user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);>>"%1"
 echo user_pref("toolkit.telemetry.archive.enabled", false);>>"%1"
 echo user_pref("toolkit.telemetry.bhrPing.enabled", false);>>"%1"
 echo user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);>>"%1"
 echo user_pref("toolkit.telemetry.hybridContent.enabled", false);>>"%1"
 echo user_pref("toolkit.telemetry.newProfilePing.enabled", false);>>"%1"
 echo user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);>>"%1"
 echo user_pref("toolkit.telemetry.server", "");>>"%1"
 echo user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);>>"%1"
 echo user_pref("toolkit.telemetry.unified", false);>>"%1"
 echo user_pref("toolkit.telemetry.updatePing.enabled", false);>>"%1"
 echo user_pref("services.settings.server", "");>>"%1"
 echo user_pref("services.sync.engine.addons", false);>>"%1"
 echo user_pref("services.sync.engine.bookmarks", false);>>"%1"
 echo user_pref("services.sync.engine.bookmarks.buffer", false);>>"%1"
 echo user_pref("services.sync.engine.history", false);>>"%1"
 echo user_pref("services.sync.engine.passwords", false);>>"%1"
 echo user_pref("services.sync.engine.prefs", false);>>"%1"
 echo user_pref("services.sync.engine.tabs", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.crashReports.unsubmittedCheck.autoSubmit2", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.enabled", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.pinned", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.highlights", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.section.topstories", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.snippets", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.feeds.topsites", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includePocket", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.includeVisited", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.section.highlights.rows", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.section.topstories.rows", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSearch", true);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.topSitesRows", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.browser.sessionstore.restore_on_demand", false);>>"%1"
 echo user_pref("services.sync.prefs.sync.privacy.userContext.newTabContainerOnLeftClick.enabled", false);>>"%1"
 echo user_pref("signon.autofillForms", false);>>"%1"
 echo user_pref("signon.generation.enabled", false);>>"%1"
 echo user_pref("signon.management.page.breach-alerts.enabled", false);>>"%1"
 echo user_pref("webextensions.storage.sync.enabled", false);>>"%1"
 echo user_pref("webgl.disabled", false);>>"%1"
 echo.>>"%1"
 echo user_pref("canvas.capturestream.enabled", false);>>"%1"
 echo user_pref("gfx.offscreencanvas.enabled", false);>>"%1"
 echo user_pref("ui.use_standins_for_native_colors", true);>>"%1"
 echo user_pref("media.peerconnection.use_document_iceservers", false);>>"%1"
 echo user_pref("media.peerconnection.video.enabled", false);>>"%1"
 echo user_pref("media.peerconnection.identity.enabled", false);>>"%1"
 echo user_pref("media.peerconnection.identity.timeout", 1);>>"%1"
 echo user_pref("media.peerconnection.turn.disable", true);>>"%1"
 echo user_pref("media.peerconnection.ice.tcp", false);>>"%1"
 echo user_pref("media.peerconnection.ice.default_address_only", true);>>"%1"
 echo user_pref("media.peerconnection.ice.no_host", true);>>"%1"
 echo user_pref("dom.vr.enabled", false);>>"%1"
 echo user_pref("dom.vr.oculus.enabled", false);>>"%1"
 echo user_pref("dom.vr.osvr.enabled", false);>>"%1"
 echo user_pref("dom.vr.openvr.enabled", false);>>"%1"
 echo user_pref("device.sensors.enabled", false);>>"%1"
 echo user_pref("dom.webaudio.enabled", false);>>"%1"
 echo user_pref("xpinstall.signatures.required", false);>>"%1"
 echo user_pref("xpinstall.whitelist.required", false);>>"%1"
 echo.>>"%1"
 echo.>>"%1"
 echo user_pref("accessibility.support.url", "");>>"%1"
 echo user_pref("app.feedback.baseURL", "");>>"%1"
 echo user_pref("app.normandy.api_url", "");>>"%1"
 echo user_pref("app.normandy.shieldLearnMoreUrl", "");>>"%1"
 echo user_pref("app.releaseNotesURL", "");>>"%1"
 echo user_pref("app.support.baseURL", "");>>"%1"
 echo user_pref("app.update.url", "");>>"%1"
 echo user_pref("app.update.url.details", "");>>"%1"
 echo user_pref("app.update.url.manual", "");>>"%1"
 echo user_pref("breakpad.reportURL", "");>>"%1"
 echo user_pref("browser.chrome.errorReporter.infoURL", "");>>"%1"
 echo user_pref("browser.contentblocking.report.cookie.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.cryptominer.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.fingerprinter.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.lockwise.how_it_works.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.lockwise.mobile-android.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.lockwise.mobile-ios.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.lockwise.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.manage_devices.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.mobile-android.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.mobile-ios.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.monitor.how_it_works.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.monitor.sign_in_url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.monitor.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.proxy_extension.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.social.url", "");>>"%1"
 echo user_pref("browser.contentblocking.report.tracker.url", "");>>"%1"
 echo user_pref("browser.contentblocking.reportBreakage.url", "");>>"%1"
 echo user_pref("browser.geolocation.warning.infoURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.downloads.remote.url", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google.advisoryURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google.gethashURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google.reportMalwareMistakeURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google.reportPhishMistakeURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google.reportURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google.updateURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google4.advisoryURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google4.dataSharingURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google4.gethashURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google4.reportMalwareMistakeURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google4.reportPhishMistakeURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google4.reportURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.google4.updateURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");>>"%1"
 echo user_pref("browser.safebrowsing.reportPhishURL", "");>>"%1"
 echo user_pref("browser.search.geoSpecificDefaults.url", "");>>"%1"
 echo user_pref("browser.search.geoip.url", "");>>"%1"
 echo user_pref("browser.uitour.url", "");>>"%1"
 echo user_pref("browser.xr.warning.infoURL", "");>>"%1"
 echo user_pref("datareporting.healthreport.infoURL", "");>>"%1"
 echo user_pref("datareporting.policy.firstRunURL", "");>>"%1"
 echo user_pref("devtools.devices.url", "");>>"%1"
 echo user_pref("devtools.performance.recording.ui-base-url", "");>>"%1"
 echo user_pref("devtools.remote.adb.extensionURL", "");>>"%1"
 echo user_pref("dom.push.serverURL", "");>>"%1"
 echo user_pref("extensions.abuseReport.amoDetailsURL", "");>>"%1"
 echo user_pref("extensions.abuseReport.url", "");>>"%1"
 echo user_pref("extensions.blocklist.detailsURL", "");>>"%1"
 echo user_pref("extensions.blocklist.itemURL", "");>>"%1"
 echo user_pref("extensions.blocklist.url", "");>>"%1"
 echo user_pref("extensions.recommendations.privacyPolicyUrl", "");>>"%1"
 echo user_pref("extensions.recommendations.themeRecommendationUrl", "");>>"%1"
 echo user_pref("extensions.webservice.discoverURL", "");>>"%1"
 echo user_pref("geo.provider-country.network.url", "");>>"%1"
 echo user_pref("geo.provider.network.url", "");>>"%1"
 echo user_pref("identity.fxaccounts.service.monitorLoginUrl", "");>>"%1"
 echo user_pref("identity.fxaccounts.service.sendLoginUrl", "");>>"%1"
 echo user_pref("identity.sendtabpromo.url", "");>>"%1"
 echo user_pref("security.ssl.errorReporting.url", "");>>"%1"
 echo user_pref("signon.management.page.breachAlertUrl", "");>>"%1"
 echo user_pref("signon.management.page.mobileAndroidURL", "");>>"%1"
 echo user_pref("signon.management.page.mobileAppleURL", "");>>"%1"
 echo user_pref("toolkit.crashreporter.infoURL", "");>>"%1"
 echo user_pref("toolkit.datacollection.infoURL", "");>>"%1"
 echo user_pref("toolkit.telemetry.server", "");>>"%1"
 echo user_pref("webextensions.storage.sync.serverURL", "");>>"%1"
 echo user_pref("webchannel.allowObject.urlWhitelist", "");>>"%1"
 echo user_pref("browser.tabs.firefox-view", false);>>"%1"
 echo user_pref("browser.toolbars.bookmarks.visibility", "never");>>"%1"
 echo user_pref("browser.preferences.moreFromMozilla", false);>>"%1"
 echo user_pref("extensions.unifiedExtensions.enabled", false);>>"%1"
 echo user_pref("dom.block_download_insecure", false);>>"%1"
exit /b

:create_userChrome
 echo /*** Proton Tabs Tweaks ***/>"%1"
 echo.>>"%1"
 echo /* Adjust tab corner shape, optionally remove space below tabs */>>"%1"
 echo.>>"%1"
 REM Uncomment the line below by removing // chars
 REM if you want to hide unified extensions button
 echo // #unified-extensions-button { display: none; }>>"%1"
 echo.>>"%1"
 echo #tabbrowser-tabs {>>"%1"
 echo     --user-tab-rounding: 6px;>>"%1"
 echo }>>"%1"
 echo.>>"%1"
 echo .tab-background {>>"%1"
 echo     border-radius: var(--user-tab-rounding) var(--user-tab-rounding) 0px 0px !important;>>"%1"
 echo     margin-block: 1px 0 !important;>>"%1"
 echo }>>"%1"
 echo #scrollbutton-up, #scrollbutton-down { /* 6/10/2021 */>>"%1"
 echo     border-top-width: 1px !important;>>"%1"
 echo     border-bottom-width: 0 !important;>>"%1"
 echo }>>"%1"
 echo /* Container color bar visibility */>>"%1"
 echo .tabbrowser-tab[usercontextid] ^> .tab-stack ^> .tab-background ^> .tab-context-line {>>"%1"
 echo     margin: 0px max(calc(var(--user-tab-rounding) - 3px), 0px) !important;>>"%1"
 echo }>>"%1"
exit /b
