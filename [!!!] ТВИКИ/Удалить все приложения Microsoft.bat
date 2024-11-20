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
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.3DBuilder | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.BingFinance | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.BingNews | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.Getstarted | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.MicrosoftOfficeHub | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.MicrosoftSolitaireCollection | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.Office.OneNote | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.SkypeApp | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.WindowsPhone | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.XboxApp | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.ZuneMusic | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxProvisionedPackage -Online | Where-Object DisplayName -eq Microsoft.ZuneVideo | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "Get-AppxPackage *Microsoft* | Remove-AppxPackage"
PowerShell -Command "Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage -online"
PowerShell -Command "Get-AppXPackage | Remove-AppxPackage"
PowerShell -Command "Get-AppXPackage -User  | Remove-AppxPackage"
PowerShell -Command "PowerShell -Command Get-AppxPackage -AllUsers | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bingsports* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
PowerShell -Command "Get-Package -Name "*Office*" | Uninstall-Package"
PowerShell -Command "Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowsalarms* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowsphone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bingfinance* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *soundrecorder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscalculator* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscamera* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowsmaps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.HEIFImageExtension* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.WebpImageExtension* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"
PowerShell -Command "get-appxpackage *feedback* | remove-appxpackage"
PowerShell -Command "Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "Internet-Explorer-Optional-amd64"
PowerShell -Command "get-appxpackage *Internet-Explorer* | remove-appxpackage"
sc stop windefend & sc config windefend start=disabled
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "off" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControl" /t REG_SZ /d "Anywhere" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v "ConfigureAppInstallControlEnabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f
setlocal enabledelayedexpansion

:: Get user SID
for /f "delims=" %%a in ('powershell "(New-Object System.Security.Principal.NTAccount($env:USERNAME)).Translate([System.Security.Principal.SecurityIdentifier]).Value"') do set "USER_SID=%%a"

:: Remove Edge Appx Packages
for /f "delims=" %%a in ('powershell -NoProfile -Command "PowerShell -Command Get-AppxPackage -AllUsers ^| Where-Object { $_.PackageFullName -like '*microsoftedge*' } ^| Select-Object -ExpandProperty PackageFullName"') do (
    if not "%%a"=="" (
        set "APP=%%a"
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\!USER_SID!\!APP!" /f >nul 2>&1
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\!APP!" /f >nul 2>&1
        reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Deprovisioned\!APP!" /f >nul 2>&1
        powershell -Command "Remove-AppxPackage -Package '!APP!'" 2>nul
        powershell -Command "Remove-AppxPackage -Package '!APP!' -AllUsers" 2>nul
    )
)

endlocal
:: DefenderKiller By Vlado -  https://win10tweaker.ru/forum/topic/defenderkiller
:: Thanks for test Eject - https://win10tweaker.ru/forum/profile/eject
:: StopDefender - https://github.com/lab52io/StopDefender
:: FuckDefender - http://win10tweaker.ru/fwd
:: NsudoLC - https://github.com/M2TeamArchived/NSudo/releases
:: nhmb - https://nhutils.ru/blog/nhmb/
:: LGPO - https://www.microsoft.com/en-us/download/details.aspx?id=55319
:: Last Version - https://pastebin.com/raw/dnENFgmC

:Start
	@echo off
	Title DK
	chcp 866 >nul
	SetLocal EnableDelayedExpansion
	Color 0f
	cd /d "%~dp0Work"
	reg query "HKU\S-1-5-19" >nul 2>&1
	
rem –ўҐв­®© вҐЄбв/lgpo
	set "ch=cecho.exe"
	set "LGPOtemp=LGPO-temp.txt"
	set "RepeatDel="
	
rem ‚ҐабЁп Їа®Ја ¬¬л/“¤ «пҐ¬ д ©«, Є®в®ал© ¬®¦Ґв ®бв ў вмбп Ї®б«Ґ ®Ў­®ў«Ґ­Ёп ў Є®а­Ґ ¤ЁбЄ 
	set Version=11.1.3
	set DateProgram=18.01.2024
	if exist "%SystemDrive%\latestVersion.bat" del /q "%SystemDrive%\latestVersion.bat"
		
rem …б«Ё ­Ґ бгйҐбвўгҐв WMIC/nhmb

rem Џ®«гзҐ­ЁҐ SID ЇҐаҐ¤ § ЇгбЄ®¬ ®в Ё¬Ґ­Ё TI
	for /f %%s in ('2^>nul wmic UserAccount where "Domain='%UserDomain%' and Name='%UserName%'" Get SID^|find "-"') do set SID=%%s
	
rem Џа®ўҐаЄ  а §ап¤­®бвЁ бЁбвҐ¬л
	set xOS=x64& (If "%PROCESSOR_ARCHITECTURE%"=="x86" If Not Defined PROCESSOR_ARCHITEW6432 Set xOS=x86)

rem ‡ ЇгбЄ ®в Ё¬Ґ­Ё TI
	
rem ђ §¬Ґа Їа®Ја ¬¬л ў § ўЁбЁ¬®бвЁ ®в ­ «ЁзЁп б«г¦Ўл, а бЇ®«®¦Ґ­ЁҐ Ї® жҐ­ваг нЄа ­  Ё ­ §ў ­ЁҐ
	set "serviceswebmask="
	for /f "usebackq delims=" %%n In (`2^>nul reg query "HKLM\System\CurrentControlSet\Services" /f "webthreatdefusersvc*" /k^|findstr ^H`) do set serviceswebmask=%%~nxn
	if defined serviceswebmask (Mode 82,45) else (Mode 80,45)
	nircmd win center process cmd.exe & nircmd win settext foreground "DK"

rem SmartScreen | Џа®жҐббл | ‘«г¦Ўл | „а ©ўҐа  | ‡ ¤ зЁ | Џа®ўҐаЄ  ­ «ЁзЁп GP [Home ўҐабЁп]
	set "ArgNsudo="
	reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" | find /i "0x0" >nul 2>&1 && set "ArgNsudo=C" || set "ArgNsudo=E"
	if not exist "%SystemRoot%\System32\smartscreen.exe" (set "SmartScreen=0a") else (set "SmartScreen=0c")
	if not exist "%SystemRoot%\System32\gpedit.msc" set "NoGP=Yes"
			
(
	qprocess "MsMpEng.exe" && set "MsMpEng=0c" || set "MsMpEng=0a"
	qprocess "SgrmBroker.exe" && set "SgrmBroker=0c" || set "SgrmBroker=0a"
	qprocess "uhssvc.exe" && set "uhssvc=0c" || set "uhssvc=0a"
	qprocess "NisSrv.exe" && set "NisSrv=0c" || set "NisSrv=0a"
	qprocess "MpCmdRun.exe" && set "MpCmdRun=0c" || set "MpCmdRun=0a"
	qprocess "MPSigStub.exe" && set "MPSigStub=0c" || set "MPSigStub=0a"
	qprocess "SecHealthUI.exe" && set "SecHealthUI=0c" || set "SecHealthUI=0a"
	qprocess "SecurityHealthSystray.exe" && set "SecurityHealthSystray=0c" || set "SecurityHealthSystray=0a"
	qprocess "SecurityHealthService.exe" && set "SecurityHealthService=0c" || set "SecurityHealthService=0a"
	qprocess "SecurityHealthHost.exe" && set "SecurityHealthHost=0c" || set "SecurityHealthHost=0a"

	sc query WinDefend && set "WinDefend=0c" || set "WinDefend=0a"
	sc query WdNisSvc && set "WdNisSvc=0c" || set "WdNisSvc=0a"
	sc query Sense && set "Sense=0c" || set "Sense=0a"
	sc query wscsvc && set "wscsvc=0c" || set "wscsvc=0a"
	sc query SgrmBroker && set "SgrmBroker=0c" || set "SgrmBroker=0a"
	sc query SecurityHealthService && set "SecurityHealthService=0c" || set "SecurityHealthService=0a"
	sc query webthreatdefsvc && set "webthreatdefsvc=0c" || set "webthreatdefsvc=0a"
	sc query webthreatdefusersvc && set "webthreatdefusersvc=0c" || set "webthreatdefusersvc=0a"
	
	sc query WdNisDrv && set "WdNisDrv=0c" || set "WdNisDrv=0a"
	sc query WdBoot && set "WdBoot=0c" || set "WdBoot=0a"
	sc query WdFilter && set "WdFilter=0c" || set "WdFilter=0a"
	sc query SgrmAgent && set "SgrmAgent=0c" || set "SgrmAgent=0a"
	sc query wtd && set "wtd=0c" || set "wtd=0a"
	sc query MsSecWfp && set "MsSecWfp=0c" || set "MsSecWfp=0a"
	sc query MsSecFlt && set "MsSecFlt=0c" || set "MsSecFlt=0a"
	sc query MsSecCore && set "MsSecCore=0c" || set "MsSecCore=0a"
) >nul 2>&1

	set PathTask=%SystemRoot%\System32\Tasks\Microsoft\Windows\Windows Defender
	if not exist "%PathTask%\Windows Defender Cache Maintenance" (set "Maintenance=0a") else (set "Maintenance=0c")
	if not exist "%PathTask%\Windows Defender Scheduled Scan" (set "Scan=0a") else (set "Scan=0c")
	if not exist "%PathTask%\Windows Defender Verification" (set "Verification=0a") else (set "Verification=0c")
	if not exist "%PathTask%\Windows Defender Cleanup" (set "Cleanup=0a") else (set "Cleanup=0c")
	if not exist "%SystemRoot%\System32\Tasks\Microsoft\Windows\AppID\SmartScreenSpecific" (set "SmartScreenSpecific=0a") else (set "SmartScreenSpecific=0c")

	%ch% {03}‘®бв®п­ЁҐ Їа®жҐбб®ў § йЁв­ЁЄ :{\n #}
	%ch% {%SmartScreen%}SmartScreen{\n #}
	%ch% {%MsMpEng%}MsMpEng{#}   {08} [Antimalware Service Executable]{\n #}
	%ch% {%SgrmBroker%}SgrmBroker{#} {08}[Ѓа®ЄҐа баҐ¤л ўлЇ®«­Ґ­Ёп System Guard]{\n #}
	%ch% {%uhssvc%}uhssvc{#}    {08} [Microsoft Update Health Service]{\n #}
	%ch% {%NisSrv%}NisSrv{#}    {08} [Network Realtime Inspection]{\n #}
	%ch% {%MpCmdRun%}MpCmdRun{#}  {08} [Microsoft malware protection]{\n #}
	%ch% {%MPSigStub%}MPSigStub{#}{08}  [Malware Protection Signature Update Stub]{\n #}
	%ch% {%SecHealthUI%}SHealthUI{#}{08}  [ЃҐ§®Ї б­®бвм Windows]{\n #}
	%ch% {%SecurityHealthSystray%}HealthTray{#}{08} [SecurityHealthSystray ЁЄ®­Є  ў ваҐҐ]{\n #}
	%ch% {%SecurityHealthService%}HealthServ{#}{08} [SecurityHealthService]{\n #}
	%ch% {%SecurityHealthHost%}HealthHost{#}{08} [SecurityHealthHost]{\n #}{\n #}

	%ch% {03}‘®бв®п­ЁҐ б«г¦Ў Ё ¤а ©ўҐа®ў § йЁв­ЁЄ :{\n #}
	%ch% {%webthreatdefsvc%}webthreat{#}  {08}[‘«г¦Ў  § йЁвл ®в ‚ҐЎ-гЈа®§ - webthreatdefsvc]{\n #}
	if defined serviceswebmask (
	%ch% {%webthreatdefusersvc%}webthreatu{#} {08}[‘«г¦Ў  § йЁвл Ї®«м§®ў в. ®в ‚ҐЎ-гЈа®§ - {04}%serviceswebmask%{08}]{\n #}
	) else (
	%ch% {%webthreatdefusersvc%}webthreatu{#} {08}[‘«г¦Ў  § йЁвл Ї®«м§®ў в. ®в ‚ҐЎ-гЈа®§ - webthreatdefusersvc]{\n #}
	)
	%ch% {%WinDefend%}WinDefend{#} {08} [‘«г¦Ў  Ђ­вЁўЁагб­ п Їа®Ја ¬¬  ‡ йЁв­ЁЄ  Windows]{\n #}
	%ch% {%WdNisSvc%}WdNisSvc{#} {08}  [‘«г¦Ў  Їа®ўҐаЄЁ бҐвЁ Windows Defender Antivirus]{\n #}
	%ch% {%Sense%}Sense{#}     {08} [‘«г¦Ў  Advanced Threat Protection]{\n #}
	%ch% {%wscsvc%}wscsvc{#}     {08}[‘«г¦Ў  –Ґ­ва ®ЎҐбЇҐзҐ­Ёп ЎҐ§®Ї б­®бвЁ]{\n #}
	%ch% {%SgrmBroker%}SgrmBroker{#} {08}[‘«г¦Ў  Ѓа®ЄҐа ¬®­Ёв®аЁ­Ј  баҐ¤л ўлЇ®«­Ґ­Ёп System Guard]{\n #}

	%ch% {%SecurityHealthService%}SHealthSer{#} {08}[‘«г¦Ў  –Ґ­ва ЎҐ§®Ї б­®бвЁ ‡ йЁв­ЁЄ  Windows]{\n #}
	%ch% {%WdNisDrv%}WdNisDrv{#}   {08}[„а ©ўҐа WD Network Inspection Driver]{\n #}
	%ch% {%WdBoot%}WdBoot{#}     {08}[„а ©ўҐа WD Antivirus Boot Driver]{\n #}
	%ch% {%WdFilter%}WdFilter{#}{08}   [„а ©ўҐа WD Antivirus Mini-Filter Driver]{\n #}
	%ch% {%SgrmAgent%}SgrmAgent{#}{08}  [„а ©ўҐа System Guard Runtime Monitor Agent Driver]{\n #}
	%ch% {%wtd%}wtd{#}{08}        [„а ©ўҐа WTD Driver]{\n #}
	%ch% {%MsSecWfp%}MsSecWfp{#}{08}   [„а ©ўҐа Microsoft Security WFP Callout Driver]{\n #}
	%ch% {%MsSecFlt%}MsSecFlt{#}{08}   [„а ©ўҐа Security Events Component Minifilter]{\n #}
	%ch% {%MsSecCore%}MsSecCore{#}{08}  [„а ©ўҐа Microsoft Security Core Boot Driver]{\n #}
	
	echo.

	%ch% {03}‘®бв®п­ЁҐ § ¤ ­Ё© ў Ї« ­Ёа®ўйЁЄҐ:{\n #}
	%ch% {%Maintenance%}Windows Defender Cache Maintenance{\n #}
	%ch% {%Scan%}Windows Defender Scheduled Scan{\n #}
	%ch% {%Verification%}Windows Defender Verification{\n #}
	%ch% {%Cleanup%}Windows Defender Cleanup{\n #}
	%ch% {%SmartScreenSpecific%}SmartScreenSpecific{\n #}

	echo.
	%ch% {0f}1{#} - {0c}“¤ «Ёвм ‡ йЁв­ЁЄ Windows{\n #}
	%ch% {0f}2{#} - {0f}‘®бв®п­ЁҐ Ї Ї®Є Ё д ©«®ў{\n #}
	%ch% {0f}3{#} - {03}Џа®ўҐаЁвм ®Ў­®ў«Ґ­Ёп DK {08}[вҐЄгй п  {09}%Version% {08}®в {03}%DateProgram% {08}^| By {02}Vlado{08}]{\n #}
	%ch% {0f}4{#} - {08}‚®ббв ­®ўЁвм ‡ йЁв­ЁЄ Windows{\n #}
	%ch% {0f}5{#} - {08}€­д®а¬ жЁп ® DK{\n #}
	
	set "input="
	set /p input=
	if not defined input cls && goto Start
	if "%input%"=="1"  cls && goto DeleteDefender
	if "%input%"=="2"  cls && goto Catalogs
	if "%input%"=="3"  cls && goto CheckUpdate
	if "%input%"=="4"  cls && goto RestoreDefender
	if "%input%"=="5"  cls && goto Information 
	) else (
	cls & %ch%    {0c}’ Є®© дг­ЄжЁЁ ­Ґ бгйҐбвўгҐв{\n #}
	timeout /t 1 >nul & endlocal & goto Start
	)


:DeleteDefender
rem Џа®ўҐаЄ  ¬Ґбв  ­  ¤ЁбЄҐ ЇҐаҐ¤ г¤ «Ґ­ЁҐ¬
	set "sFreeSize="
	set "sFreeSizePseudoMb="
	set "sFreeSizePseudoMb1="
	set "Freed="
	set "NameSecHealth="
	set "NotChangeUAC="
	
	for /f "usebackq tokens=2 delims==" %%i in (`wmic.exe LogicalDisk where "Name='c:'" get FreeSpace /value`) do set sFreeSize=%%i
	if defined sFreeSize set sFreeSizePseudoMb=%sFreeSize:~0,-7%

rem …б«Ё бгйҐбвўгҐв Ї ЇЄ  § йЁв­ЁЄ  ...
	if exist "%AllUsersProfile%\Microsoft\Windows Defender" (
rem Џа®ўҐапҐ¬ г¤ «п«бп «Ё § йЁв­ЁЄ а ­ҐҐ Ї® ўҐвЄҐ аҐҐбва , Є®в®а п г¤ «пҐвбп ў Їа®жҐббҐ г¤ «Ґ­Ёп. …б«Ё § йЁв­ЁЄ ­Ґ г¤ «с­ - Їа®ўҐапҐ¬ б®бв®п­ЁҐ ‡ йЁвл ®в Ї®¤¤Ґ«ЄЁ.
	reg query "HKLM\Software\Microsoft\Windows Defender\Features" >nul 2>&1 && echo >nul || goto NotTamper
		
rem Џа®ўҐапҐ¬ ­ «ЁзЁҐ ЇаЁ«®¦Ґ­Ёп ЃҐ§®Ї б­®бвм Windows
	for /F "usebackq delims=" %%n In (`2^>nul reg query "HKU\!SID!\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*SecHealthUI*" /k^|findstr ^H`) do set NameSecHealth=%%~nxn
	
rem …б«Ё ЇаЁ«®¦Ґ­ЁҐ ЃҐ§®Ї б­®бвм ­Ґ г¤ «Ґ­®, Їа®ўҐапҐ¬ б®бв®п­ЁҐ § йЁвл ®в Ї®¤¤Ґ«ЄЁ
	if defined NameSecHealth (
	reg query "HKLM\Software\Microsoft\Windows Defender\Features" /v "TamperProtection" | find /i "0x4" >nul 2>&1 && (
	%ch%    {0a} ‡ йЁв  ®в Ї®¤¤Ґ«ЄЁ ®вЄ«озҐ­ ^^!{\n #}{\n #}
	) || (
	%ch%    {04} Ѓг¤гв ўлЄ«озҐ­л ўбҐ Ї а ¬Ґвал Defender ў  ўв®¬ вЁзҐбЄ®¬ аҐ¦Ё¬Ґ.{\n #}
	%ch%    {08} …б«Ё зв®-в® ­Ґ ®вЄ«озЁ«®бм - ®вЄ«озЁвҐ ўагз­го.{\n #}
	%ch%    {08} ѓ« ў­®Ґ, зв® ­Ґ®Ўе®¤Ё¬® ®вЄ«озЁвм - {04}‡ йЁв  ®в Ї®¤¤Ґ«ЄЁ{\n #}{\n #}
	%ch%    {0c} …б«Ё г ‚ б Windows 10 - ­Ґ®Ўе®¤Ё¬® ўагз­го ®вЄ«озЁвм "‡ йЁвг ®в Ї®¤¤Ґ«ЄЁ"{\n #}{\n #}
	%ch%    {08} Ќ ¦¬ЁвҐ «оЎго Є« ўЁиг ¤«п Їа®¤®«¦Ґ­Ёп{\n #}

rem ЋвЄ«оз Ґ¬ ўбЇ«лў ойҐҐ ®Є­® UAC, Ґб«Ё UAC ­Ґ ®вЄ«оз «бп а ­ҐҐ, зв®Ўл nircmd sendkeypress а Ў®в «® ЎҐ§ ®Є­  UAC
	reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" | find /i "0x0" >nul && set "NotChangeUAC=Yes"
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f >nul

rem ‡ ЇгбЄ Ґ¬ Ї а ¬Ґвал
	explorer windowsdefender://ThreatSettings
	timeout /t 2 /nobreak >nul
rem ‚лЄ«оз Ґ¬ ўбҐ Ї а ¬Ґвал б Ї®¬®ймо nircmd
	nircmd sendkeypress 0x20 0x09 0x20 0x09 0x20 0x09 0x09 0x20
	
:TamperProtectionStatus
rem Џа®ўҐапҐ¬ ­ «ЁзЁҐ Їа®жҐбб  ®Є­  ЎҐ§®Ї б­®бвЁ, Ґб«Ё Їа®жҐбб бгйҐбвўгҐв, Їа®ўҐапҐ¬ ®вЄ«озЁ« бм «Ё § йЁв  ®в Ї®¤¤Ґ«ЄЁ. …б«Ё Їа®жҐбб  ­Ґв - ўлў®¤Ё¬ б®®ЎйҐ­ЁҐ.
	qprocess SecHealthUI.exe >nul 2>&1 && (
	echo>nul) || (
	%ch%    {0c} ‡ йЁв  ®в Ї®¤¤Ґ«ЄЁ {4f}­Ґ{0c} ®вЄ«озҐ­ ^^!{\n #}{\n #}
	%ch%    {08} 1 - {0c}џ ­Ґ ¬®Јг ®вЄ«озЁвм § йЁвг ®в Ї®¤¤Ґ«ЄЁ{\n #}
	%ch%    {04} €бЇ®«м§г©вҐ, Ґб«Ё ¤Ґ©бвўЁвҐ«м­® ­Ґ ¬®¦ҐвҐ ®вЄ«озЁвм ¤ ­­го дг­ЄжЁо{\n #}{\n #}
	%ch%    {0c} ‚›ЏЋ‹Ќџџ ќ’Ћ’ Ђѓ, ‚› ЏђЋЏ“‘ЉЂ…’… ‘Ћ‡„ЂЌ€… ђ…‡…ђ‚ЌЋ‰ ЉЋЏ€€ ‡Ђ™€’Ќ€ЉЂ{\n #}{\n #}
	%ch%    {08} 2 - ‚Ґа­гвмбп ®Ўа в­®{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls && goto Start
	if errorlevel 1 cls && goto NotTamper)

rem Џа®ўҐаЄ  § йЁвл ®в Ї®¤¤Ґ«ЄЁ Ї®б«Ґ nircmd sendkeypress
	reg query "HKLM\Software\Microsoft\Windows Defender\Features" /v "TamperProtection" | find /i "0x4" >nul 2>&1 && cls && %ch%    {0a} ‡ йЁв  ®в Ї®¤¤Ґ«ЄЁ ®вЄ«озҐ­ ^^!{\n #}{\n #}|| goto TamperProtectionStatus
		)
	)
	
rem ”®Єгб ­  Їа®Ја ¬¬г
	nircmd win activate process cmd.exe

rem ‚®Їа®б ® б®§¤ ­ЁЁ аҐ§. Є®ЇЁЁ
	nhmb "‚л е®вЁвҐ б®§¤ вм аҐ§Ґаў­го Є®ЇЁо Windows Defender ЇҐаҐ¤ ўлЇ®«­Ґ­ЁҐ¬ г¤ «Ґ­Ёп?\nђҐ§Ґаў­ п Є®ЇЁп Ї®§ў®«пҐв ў®ббв ­®ўЁвм § йЁв­ЁЄ Ї®б«Ґ г¤ «Ґ­Ёп.\n‚®ббв ­®ў«Ґ­ЁҐ ¬®¦Ґв Ї®ваҐЎ®ў вмбп, Ґб«Ё ‚л ®Ў­®ў«пҐвҐ Windows.\n\n‚лЎЁа ©вҐ ­Ґв, в®«мЄ® ў в®¬ б«гз Ґ, Ґб«Ё ‚ ¬ Ќ… ­г¦­л ®Ў­®ў«Ґ­Ёп Windows, «ЁЎ® г ‚ б г¦Ґ Ґбвм аҐ§Ґаў­ п Є®ЇЁп § йЁв­ЁЄ  б нв®© ўҐабЁЁ Windows." "BackupDefender" "Warning|YesNo|DefButton2"
	if errorlevel 7 goto NotTamper
	if errorlevel 6 call :CreateBackupDefender
	
:NotTamper
rem ‚®ббв ­ ў«Ёў Ґ¬ Ї® г¬®«з ­Ёо, Ґб«Ё Ї а ¬Ґва ConsentPromptBehaviorAdmin ­Ґ Ё§¬Ґ­п«бп а ­ҐҐ [ў §­ зҐ­ЁҐ 5 Ї®-г¬®«з ­Ёо]
	if not defined NotChangeUAC reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 5 /f >nul
	
rem …б«Ё ­Ґв GP - Їа®ЇгбЄ [Home ўҐабЁп]
	if defined NoGP %ch%    {08}Џа®ЇгбЄ ®вЄ«озҐ­Ёп ѓЏ, в.Є. ­Ґ ­ ©¤Ґ­® ѓЏ{\n #}&&goto NotGP
	
	%ch%    {03} ЋвЄ«оз Ґ¬ § йЁв­ЁЄ [ѓЏ] ^>
rem €­д®а¬ жЁп Ї® Ї®«ЁвЁЄ ¬ : https://learn.microsoft.com/ru-ru/windows/client-management/mdm/policy-csp-admx-microsoftdefenderantivirus
rem ‚лЄ«озЁвм  ­вЁўЁагб­го Їа®Ја ¬¬г Microsoft Defender (ўЄ«озҐ­ ) [DisableAntiSpyware]
rem ђ §аҐиЁвм Ї®бв®п­­го а Ў®вг б«г¦Ўл § йЁвл ®в ўаҐ¤®­®б­ле Їа®Ја ¬¬ (®вЄ«озҐ­ ) [ServiceKeepAlive]
rem ‚лЄ«озЁвм Ї« ­®ў®Ґ ЁбЇа ў«Ґ­ЁҐ (ўЄ«озҐ­®) [DisableRoutinelyTakingAction]
rem ђ §аҐиЁвм § ЇгбЄ б«г¦Ўл § йЁвл ®в ўаҐ¤®­®б­ле Їа®Ја ¬¬ б ®Ўлз­л¬ ЇаЁ®аЁвҐв®¬ (®вЄ«озҐ­®) [AllowFastServiceStartup]
rem ‚лЄ«озЁвм § йЁвг ў аҐ «м­®¬ ўаҐ¬Ґ­Ё (ўЄ«озҐ­®) [DisableRealtimeMonitoring]
rem Џа®ўҐапвм ўбҐ § Јаг¦Ґ­­лҐ д ©«л Ё ў«®¦Ґ­Ёп (®вЄ«озҐ­®) [DisableIOAVProtection]
rem ‚Є«озЁвм ­ Ў«о¤Ґ­ЁҐ §  Ї®ўҐ¤Ґ­ЁҐ¬ (®вЄ«озҐ­®) [DisableBehaviorMonitoring]
rem ‚Є«озЁвм Їа®ўҐаЄг Їа®жҐбб®ў, Ґб«Ё ўЄ«озҐ­  § йЁв  ў аҐ¦Ё¬Ґ аҐ «м­®Ј® ўаҐ¬Ґ­Ё (®вЄ«озҐ­®) [DisableScanOnRealtimeEnable]
rem Ћвб«Ґ¦Ёў вм  ЄвЁў­®бвм Їа®Ја ¬¬ Ё д ©«®ў ­  Є®¬ЇмовҐаҐ (®вЄ«озҐ­®) [DisableOnAccessProtection]
rem Ќ бва®Ёвм «®Є «м­®Ґ ЇҐаҐ®ЇаҐ¤Ґ«Ґ­ЁҐ ¤«п ўЄ«озҐ­Ёп § йЁвл ў аҐ¦Ё¬Ґ аҐ «м­®Ј® ўаҐ¬Ґ­Ё (®вЄ«озҐ­®) [LocalSettingOverrideDisableRealtimeMonitoring]
rem Ќ бва®Ёвм «®Є «м­®Ґ ЇҐаҐ®ЇаҐ¤Ґ«Ґ­ЁҐ ¤«п ўЄ«озҐ­Ёп Є®­ва®«п Ї®ўҐ¤Ґ­Ёп (®вЄ«озҐ­®) [LocalSettingOverrideDisableBehaviorMonitoring]
rem Ќ бва®Ёвм «®Є «м­®Ґ ЇҐаҐ®ЇаҐ¤Ґ«Ґ­ЁҐ ¤«п Їа®ўҐаЄЁ ўбҐе § Јаг¦Ґ­­ле д ©«®ў Ё ў«®¦Ґ­Ё© (®вЄ«озҐ­®) [LocalSettingOverrideDisableIOAVProtection]
rem Ќ бва®Ёвм «®Є «м­®Ґ ЇҐаҐ®ЇаҐ¤Ґ«Ґ­ЁҐ ¤«п ®вЇа ўЄЁ ®взсв®ў ў MAPS (®вЄ«озҐ­®) [LocalSettingOverrideSpynetReporting]
rem ЏаЁб®Ґ¤Ё­Ёвбп Є Microsoft MAPS (®вЄ«озҐ­®) [**del.SpynetReporting]
rem ЋвЇа ў«пвм ®Ўа §жл д ©«®ў, Ґб«Ё ваҐЎгҐвбп ¤ «м­Ґ©иЁ©  ­ «Ё§ (ўЄ«озҐ­®) [SubmitSamplesConsent]
rem ђ §аҐиЁвм ®Ў­®ў«Ґ­Ёп б«г¦Ўл ЎҐ§®Ї б­®бвЁ ў аҐ «м­®¬ ўаҐ¬Ґ­Ё ­  ®б­®ўҐ ®взсв®ў ў Microsoft MAPS (®вЄ«озҐ­®) [RealtimeSignatureDelivery]
rem ‡ ЇгбЄ вм ®Ў­®ў«Ґ­Ёп б«г¦Ўл  ­ «Ё§  ЎҐ§®Ї б­®бвЁ ЇаЁ § ЇгбЄҐ (®вЄ«озҐ­®) [DisableUpdateOnStartupWithoutEngine]
rem Џа®ўҐапвм ­ «ЁзЁҐ Ї®б«Ґ¤­Ґ© ўҐабЁЁ б«г¦Ўл § йЁвл ЇаЁ § ЇгбЄҐ (®вЄ«озҐ­®) [UpdateOnStartUp]
rem ‚Є«озЁвм Їа®ўҐаЄг Ї®б«Ґ ®Ў­®ў«Ґ­Ёп б«г¦Ўл  ­ «Ё§  ЎҐ§®Ї б­®бвЁ (®вЄ«озҐ­®) [DisableScanOnUpdate]
rem Ќ бва®Ёвм б®ЎлвЁп Їа®Ја ¬¬л "„®Єв®а ‚ вб®­" (®вЇа ўЄ  ¤ ­­ле бЎ®айЁЄ®¬ ®иЁЎ®Є) (®вЄ«озҐ­®) [DisableGenericRePorts]
rem ‚Є«озЁвм ¤®Ї®«­ЁвҐ«м­го Їа®ўҐаЄг ¤«п Ї®«­ле/Ўлбвале Їа®ўҐа®Є (®вЄ«озҐ­®) [DisableCatchupFullScan/DisableCatchupQuickScan]
rem Џа®ўҐапвм бкҐ¬­лҐ ­®бЁвҐ«Ё ў® ўаҐ¬п Ўлбва®Ј® бЄ ­Ёа®ў ­Ёп (®вЄ«озҐ­®) [DisableRemovableDriveScanning]
rem Џа®ўҐапвм бҐвҐўлҐ д ©«л (®вЄ«озҐ­®) [DisableScanningNetworkFiles]
rem ‚лЇ®«­пвм Ї®«­го Їа®ўҐаЄг ­  Ї®¤Є«озҐ­­ле бҐвҐўле ¤ЁбЄ е (®вЄ«озҐ­®) [DisableScanningMappedNetworkDrivesForFullScan]
rem Џа®ўҐапвм  аеЁў­лҐ д ©«л (®вЄ«озҐ­®) [DisableArchiveScanning]

rem Ќ бва®Ёвм дг­ЄжЁо SmartScreen ‡ йЁв­ЁЄ  Windows (3 Ї®«ЁвЁЄЁ) (®вЄ«озҐ­л)
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableRealtimeMonitoring" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableBehaviorMonitoring" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableIOAVProtection" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "**del.SpynetReporting" /t REG_SZ /d " " /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "2" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "RealtimeSignatureDelivery" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "DisableUpdateOnStartupWithoutEngine" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "UpdateOnStartUp" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "DisableScanOnUpdate" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericRePorts" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableCatchupFullScan" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableCatchupQuickScan" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableRemovableDriveScanning" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableScanningNetworkFiles" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableScanningMappedNetworkDrivesForFullScan" /t REG_DWORD /d "1" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableArchiveScanning" /t REG_DWORD /d "1" /f
	
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "**del.ShellSmartScreenLevel" /t REG_SZ /d " " /f
	call :LGPOFILE reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d "0" /f
	call :LGPO_APPLY

:NotGP
rem ”®Єгб ­  Їа®Ја ¬¬г
	nircmd win activate process cmd.exe

rem SmartScreen BX
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f >nul
	NSudoLC -U:%ArgNsudo% -ShowWindowMode:Hide cmd.exe /c reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f >nul
	
rem “ўҐ¤®¬«Ґ­Ёп ®в жҐ­ва  ЎҐ§®Ї б­®бвЁ
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t REG_DWORD /d "0" /f >nul

rem MSRT - ‘аҐ¤бвў® г¤ «Ґ­Ёп ўаҐ¤®­®б­ле Їа®Ја ¬¬ ®в Microsoft. [ЌҐ ®вЇа ў«пвм ®взҐвл ®в MSRT/ЋвЄ«озЁвм Ї®«гзҐ­ЁҐ ®Ў­®ў«Ґ­Ё© ¤«п MSRT]
	reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f >nul
	reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f >nul
	)

rem Џа®ЇгбЄ Unlocker; DefenderStop, Ґб«Ё § йЁв­ЁЄ г¦Ґ г¤ «с­
	if not exist "%AllUsersProfile%\Microsoft\Windows Defender" goto NotFuckWD
	if not exist "%SystemDrive%\Program Files\Windows Defender" goto NotFuckWD

rem                                                                   =================================

rem …б«Ё нв® ўв®а п [Ї®ўв®а­ п] Їа®е®¤Є  г¤ «Ґ­Ёп, в® Їа®ЇгбЄ Ґ¬ ¤®Ў ў«Ґ­ЁҐ ў ЁбЄ«озҐ­Ёп
	if not defined RepeatDel (
	%ch%    {03} „®Ў ў«пҐ¬ Unlocker/DefenderStop ў ЁбЄ«озҐ­Ёп{\n #}{\n #}
	NSudoLC -U:%ArgNsudo% -ShowWindowMode:Hide -Wait PowerShell "Add-MpPreference -ExclusionPath '%~dp0Work', '%LocalAppData%\Temp\RarSFX0', '%LocalAppData%\Temp\RarSFX1', '%LocalAppData%\Temp\RarSFX2', '%Temp%\RarSFX0', '%Temp%\RarSFX1', '%Temp%\RarSFX2'" >nul 2>&1)

rem ‡ ўҐаи Ґ¬ Їа®жҐббл ‡ йЁв­ЁЄ 
	nircmd killprocess MpCmdRun.exe
	nircmd killprocess MsMpEng.exe
	nircmd killprocess SecurityHealthSystray.exe
	nircmd killprocess SecurityHealthService.exe
	nircmd killprocess SecurityHealthHost.exe
	nircmd killprocess smartscreen.exe
	nircmd killprocess SgrmBroker.exe
	nircmd killprocess SecHealthUI.exe
	nircmd killprocess uhssvc.exe
	nircmd killprocess NisSrv.exe
	nircmd killprocess MPSigStub.exe

	if not exist DefenderStop.exe (
	ping www.google.nl -n 1 -w 1000 |>nul find /i "TTL=" && curl -g -k -L -# -o "DefenderStop.exe" "https://i.getspace.eu/cloud/s/GXAtGk7qLbHj2CS/download" >nul 2>&1
	) || %ch%    {0c} ЌҐў®§¬®¦­® бЄ з вм DefenderStop/Unlocker. ЌҐв Ї®¤Є«озҐ­Ёп Є Ё­вҐа­Ґвг{\n #}{\n #}&& goto NotFuckWD

	%ch%    {03} €бЇ®«м§гҐ¬ DefenderStop{\n #}{\n #}
	nircmd exec hide DefenderStop.exe
	nircmd wait 3000
	nircmd exec hide DefenderStop.exe


rem                                                                   =================================
	if "%xOS%"=="x86" (
	%ch%    {04} Unlocker ­Ґ а Ў®в Ґв ­  x32 бЁбвҐ¬Ґ.{\n #}
	%ch%    {04} Џ®б«Ґ ЇҐаҐ§ Јаг§ЄЁ ЏЉ ­Ґ®Ўе®¤Ё¬® Ї®ўв®а­®Ґ г¤ «Ґ­ЁҐ.{\n #}
	goto NotFuckWD)
	
	if not exist FuckDefender.exe curl -g -k -L -# -o "FuckDefender.exe" "https://i.getspace.eu/cloud/s/Eb3sKTfwiamRAnt/download" >nul 2>&1
	%ch%    {0c} ‚лЇ®«­пҐвбп г¤ «Ґ­ЁҐ б Ї®¬®ймо Unlocker{\n #}
	%ch%    {08} ‚аҐ¬п ®¦Ё¤ ­Ёп - 20 бҐЄ.{\n #}{\n #}
	
rem By XpucT/Vlado/Eject
	start FuckDefender
	timeout /t 3 /nobreak >nul
	qprocess Unlocker.exe >nul 2>&1 && echo >nul || goto NotFuckWD
	
rem †¤с¬ 20 бҐЄг­¤, Ґб«Ё Unlocker б¬®Ј § ЇгбвЁвмбп
(
	timeout /t 20 /nobreak
	taskkill /f /im Unlocker.exe
	taskkill /f /im FuckDefender.exe
	taskkill /f /im wscript.exe
	nircmd killprocess Unlocker.exe & nircmd killprocess FuckDefender.exe & nircmd killprocess wscript.exe

rem “¤ «пҐ¬ Unlocker Ё ¤а ©ўҐа. ‚®ббв ­®ўЁвбп б ¬, Ґб«Ё ЁбЇ®«м§гҐвбп IObitUnlocker - https://cdn.discordapp.com/attachments/1099332280629084163/1196482117383766138/IObitUnlocker_Test.mp4
	del /q FuckDefender.exe
	sc delete IObitUnlocker
	reg delete HKLM\System\CurrentControlset\Services\IObitUnlocker /f	
) >nul 2>&1

rem                                                                   =================================
:NotFuckWD
	%ch%    {03} “¤ «пҐ¬ Ї ЇЄЁ Ё д ©«л WD{\n #}{\n #}
(
rem ProgramData
	rmdir /s /q "%AllUsersProfile%\Microsoft\Windows Defender"
	rmdir /s /q "%AllUsersProfile%\Microsoft\Windows Defender Advanced Threat Protection"
	rmdir /s /q "%AllUsersProfile%\Microsoft\Windows Security Health"
	rmdir /s /q "%AllUsersProfile%\Microsoft\Storage Health"

rem SystemDrive - Program Files
	rmdir /s /q "%SystemDrive%\Program Files\Windows Defender"
	rmdir /s /q "%SystemDrive%\Program Files\Windows Defender Sleep"
	rmdir /s /q "%SystemDrive%\Program Files\Windows Defender Advanced Threat Protection"
	rmdir /s /q "%SystemDrive%\Program Files\Windows Security"
	rmdir /s /q "%SystemDrive%\Program Files\PCHealthCheck"
	rmdir /s /q "%SystemDrive%\Program Files\Microsoft Update Health Tools"

rem SystemDrive - Program Files 86
	rmdir /s /q "%SystemDrive%\Program Files (x86)\Windows Defender"
	rmdir /s /q "%SystemDrive%\Program Files (x86)\Windows Defender Advanced Threat Protection"

rem Windows
	rmdir /s /q "%SystemRoot%\security\database"

rem Windows - System32
	rmdir /s /q "%SystemRoot%\System32\HealthAttestationClient"
	rmdir /s /q "%SystemRoot%\System32\SecurityHealth"
	rmdir /s /q "%SystemRoot%\System32\WebThreatDefSvc"
	rmdir /s /q "%SystemRoot%\System32\Sgrm"
	rmdir /s /q "%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\Defender"
	rmdir /s /q "%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\DefenderPerformance"
	rmdir /s /q "%SystemRoot%\System32\Tasks_Migrated\Microsoft\Windows\Windows Defender"
	rmdir /s /q "%SystemRoot%\System32\drivers\wd"
	
rem Windows - SysWOW64
	rmdir /s /q "%SystemRoot%\SysWOW64\WindowsPowerShell\v1.0\Modules\Defender"
	rmdir /s /q "%SystemRoot%\SysWOW64\WindowsPowerShell\v1.0\Modules\DefenderPerformance"
	
rem ЏҐаҐЁ¬Ґ­®ў ­ЁҐ д ©«®ў Є®в®алҐ ¬®Јгв ¬Ґи вм г¤ «Ґ­Ёо
	if exist "%AllUsersProfile%\Microsoft\Windows Defender\Platform" (
	for /r "%AllUsersProfile%\Microsoft\Windows Defender\Platform" %%i in ("MpOAV.dll") do ren "%%i" "MpOAV.dll_fuck" >nul 2>&1
	for /r "%AllUsersProfile%\Microsoft\Windows Defender\Platform" %%i in ("MpClient.dll") do ren "%%i" "MpClient.dll_fuck" >nul 2>&1
	for /r "%AllUsersProfile%\Microsoft\Windows Defender\Platform" %%i in ("MsMpEng.exe") do ren "%%i" "MsMpEng.exe_fuck" >nul 2>&1)
	
	if exist "%SystemDrive%\Program Files\Windows Defender" (
	ren "%SystemDrive%\Program Files\Windows Defender\MpOAV.dll" "MpOAV.dll_fuck" >nul 2>&1
	ren "%SystemDrive%\Program Files\Windows Defender\MpClient.dll" "MpClient.dll_fuck" >nul 2>&1
	ren "%SystemDrive%\Program Files\Windows Defender\MsMpEng.exe" "MsMpEng.exe_fuck" >nul 2>&1)

	ren "%SystemRoot%\System32\SecurityHealthService.exe" "SecurityHealthService.exe_fuck"
	ren "%SystemRoot%\System32\smartscreenps.dll" smartscreenps.dll_fuck
	ren "%SystemRoot%\System32\wscapi.dll" wscapi.dll_fuck

rem WindowsDefenderApplicationGuard.wim
	del /f /q "%SystemRoot%\Containers\WindowsDefenderApplicationGuard.wim"
	del /f /q "%SystemRoot%\Containers\serviced\WindowsDefenderApplicationGuard.wim"
	
rem “¤ «Ґ­ЁҐ д ©«®ў System32
	del /f /q "%SystemRoot%\System32\SecurityHealthService.exe"
	del /f /q "%SystemRoot%\System32\SecurityHealthService.exe_fuck"
	del /f /q "%SystemRoot%\System32\SecurityHealthSystray.exe"
	del /f /q "%SystemRoot%\System32\SecurityHealthHost.exe"
	del /f /q "%SystemRoot%\System32\SecurityHealthAgent.dll"
	del /f /q "%SystemRoot%\System32\SecurityHealthSSO.dll"
	del /f /q "%SystemRoot%\System32\SecurityHealthProxyStub.dll"
	del /f /q "%SystemRoot%\System32\LogFiles\WMI\RtBackup\EtwRTDefenderApiLogger.etl"
	del /f /q "%SystemRoot%\System32\LogFiles\WMI\RtBackup\EtwRTDefenderAuditLogger.etl"
	del /f /q "%SystemRoot%\System32\smartscreen.dll"
	del /f /q "%SystemRoot%\System32\wscisvif.dll"
	del /f /q "%SystemRoot%\System32\wscproxystub.dll"
	del /f /q "%SystemRoot%\System32\smartscreenps.dll"
	del /f /q "%SystemRoot%\System32\smartscreenps.dll_fuck"
	del /f /q "%SystemRoot%\System32\wscapi.dll"
	del /f /q "%SystemRoot%\System32\wscapi.dll_fuck"
	del /f /q "%SystemRoot%\System32\windowsdefenderapplicationguardcsp.dll"
	del /f /q "%SystemRoot%\System32\wscsvc.dll"
	del /f /q "%SystemRoot%\System32\SecurityHealthCore.dll"
	del /f /q "%SystemRoot%\System32\SecurityHealthSsoUdk.dll"
	del /f /q "%SystemRoot%\System32\SecurityHealthUdk.dll"
	
rem “¤ «Ґ­ЁҐ SmartScreen.exe
	taskkill /f /im smartscreen.exe
	ren "%SystemRoot%\System32\smartscreen.exe" "smartscreen.exedel"
	del /f /q "%SystemRoot%\System32\smartscreen.exe"
	del /f /q "%SystemRoot%\System32\smartscreen.exedel"
	
rem “¤ «Ґ­ЁҐ д ©«®ў SysWOW64
	del /f /q "%SystemRoot%\SysWOW64\smartscreen.dll"
	del /f /q "%SystemRoot%\SysWOW64\wscisvif.dll"
	del /f /q "%SystemRoot%\SysWOW64\wscproxystub.dll"
	del /f /q "%SystemRoot%\SysWOW64\smartscreenps.dll"
	del /f /q "%SystemRoot%\SysWOW64\wscapi.dll"
	del /f /q "%SystemRoot%\SysWOW64\windowsdefenderapplicationguardcsp.dll"
	
) >nul 2>&1
	
rem                                                                   =================================

	%ch%    {03} “¤ «пҐ¬ б«г¦Ўл{\n #}
	%ch%    {0a} WinDefend, SecurityHealthService, Sense, WdNisSvc, wscsvc, webthreatdefsvc{\n #}
	%ch%    {0a} webthreatdefusersvc{\n #}{\n #}

	if exist DefenderStop.exe nircmd exec hide DefenderStop.exe
	
(
rem Ћбв ­®ўЄ  б«г¦Ў
	sc stop WinDefend
	sc stop SecurityHealthService
	sc stop Sense
	sc stop WdNisSvc
	sc stop wscsvc
	sc stop SgrmBroker
	sc stop webthreatdefsvc
	sc stop webthreatdefusersvc
	sc stop %serviceswebmask%
	
rem “¤ «Ґ­ЁҐ б«г¦Ў
	sc delete WinDefend
	sc delete SecurityHealthService
	sc delete Sense
	sc delete WdNisSvc
	sc delete wscsvc
	sc delete SgrmBroker
	sc delete webthreatdefsvc
	sc delete webthreatdefusersvc
	sc delete %serviceswebmask%

	reg delete HKLM\System\ControlSet001\Services\EventLog\System\WinDefend /f 
	reg delete HKLM\System\ControlSet001\Services\SecurityHealthService /f
	reg delete HKLM\System\ControlSet001\Services\Sense /f
	reg delete HKLM\System\ControlSet001\Services\WdNisSvc /f
	reg delete HKLM\System\ControlSet001\Services\WinDefend /f
	reg delete HKLM\System\ControlSet001\Services\wscsvc /f
	reg delete HKLM\System\ControlSet001\Services\SgrmBroker /f
	reg delete HKLM\System\ControlSet001\Services\webthreatdefsvc /f
	reg delete HKLM\System\ControlSet001\Services\webthreatdefusersvc /f

	reg delete HKLM\System\CurrentControlSet\Services\EventLog\System\WinDefend /f
	reg delete HKLM\System\CurrentControlset\Services\SecurityHealthService /f
	reg delete HKLM\System\CurrentControlset\Services\Sense /f
	reg delete HKLM\System\CurrentControlset\Services\WdNisSvc /f
	reg delete HKLM\System\CurrentControlset\Services\WinDefend /f
	reg delete HKLM\System\CurrentControlset\Services\wscsvc /f
	reg delete HKLM\System\CurrentControlset\Services\SgrmBroker /f
	reg delete HKLM\System\CurrentControlset\Services\webthreatdefsvc /f
	reg delete HKLM\System\CurrentControlset\Services\webthreatdefusersvc /f
	
	del /q DefenderStop.exe
) >nul 2>&1

rem                                                                   =================================

	%ch%    {03} “¤ «пҐ¬ ¤а ©ўҐа {\n #}
	%ch%    {0a} WdNisDrv, WdBoot, WdFilter, SgrmAgent, wtd, MsSecWfp, MsSecFlt, MsSecCore{\n #}{\n #}
(
rem ЋвЄ«озҐ­ЁҐ Ё г¤ «Ґ­ЁҐ ¤а ©ўҐа®ў
	sc stop WdNisDrv
	sc stop WdBoot
	sc stop WdFilter
	sc stop SgrmAgent
	sc stop wtd
	sc stop MsSecWfp
	sc stop MsSecFlt
	sc stop MsSecCore
	
	sc delete WdNisDrv
	sc delete WdBoot
	sc delete WdFilter
	sc delete SgrmAgent
	sc delete wtd
	sc delete MsSecWfp
	sc delete MsSecFlt
	sc delete MsSecCore
	
	reg delete "HKLM\System\CurrentControlset\Services\WdNisDrv" /f
	reg delete "HKLM\System\CurrentControlset\Services\WdBoot" /f
	reg delete "HKLM\System\CurrentControlset\Services\WdFilter" /f
	reg delete "HKLM\System\CurrentControlset\Services\SgrmAgent" /f
	reg delete "HKLM\System\CurrentControlset\Services\wtd" /f
	
	reg delete "HKLM\System\CurrentControlset\Services\MsSecWfp" /f
	reg delete "HKLM\System\CurrentControlset\Services\MsSecFlt" /f
	reg delete "HKLM\System\CurrentControlset\Services\MsSecCore" /f
	
) >nul 2>&1

rem                                                                   =================================
	%ch%    {03} “¤ «пҐ¬ § ¤ ­Ёп Ё§ Ї« ­Ёа®ўйЁЄ {\n #}
	rmdir /s /q "%SystemRoot%\System32\Tasks\Microsoft\Windows\Windows Defender" >nul 2>&1
	schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /f >nul 2>&1 & %ch% {0a}    Windows Defender Cache Maintenance{\n #}
	schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /f >nul 2>&1 & %ch% {0a}    Windows Defender Cleanup{\n #}
	schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /f >nul 2>&1 & %ch% {0a}    Windows Defender Scheduled Scan{\n #}
	schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /f >nul 2>&1 & %ch% {0a}    Windows Defender Verification{\n #}
	schtasks /Delete /TN "Microsoft\Windows\AppID\SmartScreenSpecific" >nul 2>&1 & %ch% {0a}    SmartScreenSpecific{\n #}{\n #}

rem                                                                   =================================
(
rem ЋзЁбвЄ  Є®­вҐЄбв­®Ј® ¬Ґ­о
	reg delete "HKCR\*\shellex\ContextMenuHandlers\EPP" /f
	reg delete "HKCR\Directory\shellex\ContextMenuHandlers\EPP" /f
	reg delete "HKCR\Drive\shellex\ContextMenuHandlers\EPP" /f
	reg delete "HKLM\Software\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" /v "{09A47860-11B0-4DA5-AFA5-26D86198A780}" /f

rem “¤ «Ґ­ЁҐ Ё§  ўв®§ ЇгбЄ 
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "SecurityHealth" /f
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender" /f

rem “¤ «Ґ­ЁҐ Windows Defender Ё§ аҐҐбва 
	reg delete "HKLM\System\CurrentControlset\Control\WMI\Autologger\DefenderApiLogger" /f
	reg delete "HKLM\System\CurrentControlset\Control\WMI\Autologger\DefenderAuditLogger" /f

	reg delete "HKLM\Software\Microsoft\Windows Defender" /f
	reg delete "HKLM\Software\Microsoft\Windows Defender Security Center" /f
	reg delete "HKLM\Software\Microsoft\Windows Advanced Threat Protection" /f
	reg delete "HKLM\Software\Microsoft\Windows Security Health" /f
	
rem “¤ «Ґ­ЁҐ ­ ¤ЇЁбЁ ў Ї а ¬Ґва е
	reg delete "HKLM\Software\Microsoft\SystemSettings\SettingId\SystemSettings_WindowsDefender_UseWindowsDefender" /f
	
rem “¤ «Ґ­ЁҐ ¦га­ «®ў б®ЎлвЁ©
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Windows Defender/WHC" /f
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\NIS-Driver-WFP/Diagnostic" /f
	
) >nul 2>&1

rem                                                                   =================================

rem …б«Ё г¤ «п« бм нв  ўҐвЄ  а ­ҐҐ, Їа®ЇгбЄ Ґ¬ г¤ «Ґ­ЁҐ Ї Ї®Є Ё§ WinSxS
	reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Windows Defender/Operational" >nul 2>&1 && (
	%ch%    {03} “¤ «пҐ¬ Ї ЇЄЁ Ё§ WinSxS{\n #}{\n #}
	For /F "usebackq delims=" %%d In (`2^>nul Dir "%SystemRoot%\WinSxS\*windows-defender*" /S /B /A:D`) do rmdir "%%d" /s /q >nul 2>&1
	For /F "usebackq delims=" %%d In (`2^>nul Dir "%SystemRoot%\WinSxS\*windows-senseclient-service*" /S /B /A:D`) do rmdir "%%d" /s /q >nul 2>&1
	For /F "usebackq delims=" %%d In (`2^>nul Dir "%SystemRoot%\WinSxS\*windows-dynamic-image*" /S /B /A:D`) do rmdir "%%d" /s /q >nul 2>&1
	)
rem ” ©«л Ё§ WinSxS ­Ґ«м§п г¤ «пвм, «®¬ Ґвбп бЄ зЁў ­ЁҐ ®Ў­®ў«Ґ­Ё© Windows!
rem del /q /s %SystemRoot%\WinSxS\*defender* >nul 2>&1

rem “¤ «Ґ­ЁҐ ўҐвЄЁ Ї®б«Ґ г¤ «Ґ­Ёп Ї Ї®Є Ё§ WinSxS , ўлЇ®«­пҐвбп ‘’ђЋѓЋ Ї®б«Ґ г¤ «Ґ­Ёп Ї Ї®Є Ё§ WinSxS зв®Ўл 1 а § г¤ «Ґ­ЁҐ Ї Ї®Є Їа®Ё§®и«®, ­® Ї®б«Ґ¤гойЁҐ г¤ «Ґ­Ёп Їа®ЇгбЄ «®бм
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Windows Defender/Operational" /f >nul 2>&1
	
rem                                                                   =================================

:SecHealthUI
	VER | FINDSTR /IL "6.3." > NUL && %ch%    {0c} Windows 8.1 ­Ґ ­г¦¤ Ґвбп ў г¤ «Ґ­ЁЁ ЇаЁ«®¦Ґ­Ёп 'ЃҐ§®Ї б­®бвм' Ё 'SmartScreen'{\n #}&&goto FinishDelete

rem Џа®ўҐапҐ¬ б®§¤ ў «бп «Ё ЎҐЄ Ї, Ґб«Ё ¤  - Їа®ЇгбЄ Ґ¬ г¤ «Ґ­ЁҐ ЇаЁ«®¦Ґ­Ё©
	reg query "HKLM\Software\DefenderKiller" >nul 2>&1 && 	%ch%    {0e} Ѓл«® ўлЎа ­® б®§¤ ­ЁҐ аҐ§Ґаў­®© Є®ЇЁЁ, Їа®ЇгбЄ Ґ¬ г¤ «Ґ­ЁҐ ЇаЁ«®¦Ґ­Ё©{\n #}{\n #}&&goto FinishDelete
	
rem Џа®ўҐаЄ  зҐаҐ§ PS
	rem PowerShell "PowerShell -Command Get-AppxPackage -AllUsers *SecHealth*" | find /i "PackageFullName" >nul
	
	%ch%    {09} ЃҐ§®Ї б­®бвм Windows{\n #}
	set "NameSecHealth="
rem Џ®«гз Ґ¬ Ё¬п ЇаЁ«®¦Ґ­Ёп ЃҐ§®Ї б­®бвм
	for /F "usebackq delims=" %%n In (`2^>nul reg query "HKU\%SID%\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*SecHealthUI*" /k^|findstr ^H`) do set NameSecHealth=%%~nxn
	if not defined NameSecHealth %ch%    {02} ЏаЁ«®¦Ґ­ЁҐ ЃҐ§®Ї б­®бвм Windows г¤ «Ґ­®{\n #}{\n #}&goto AppRepSys

	%ch%    {0b} “¤ «пҐ¬ ЇаЁ«®¦Ґ­ЁҐ ЃҐ§®Ї б­®бвм Windows{\n #}
	%ch%    {08} %NameSecHealth%{\n #}{\n #}
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\%NameSecHealth%" /f >nul
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\%SID%\%NameSecHealth%" /f >nul
	NSudoLC -U:%ArgNsudo% -ShowWindowMode:Hide -Wait PowerShell "PowerShell -Command Get-AppxPackage -AllUsers *SecHealthUI* | Remove-AppxPackage"	
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications\%NameSecHealth%" /f >nul 2>&1
rem ќвЁ Ї ЇЄЁ ¬®¦­® г¤ «пвм. ‚®ббв ­ ў«Ёў овбп б ¬Ё, Ґб«Ё ў®ббв ­®ўЁвм ЇаЁ«®¦Ґ­ЁҐ ЃҐ§®Ї б­®бвм.
	For /F "usebackq delims=" %%d In (`2^>nul Dir "%ProgramData%\Microsoft\Windows\AppRepository\Packages\*SecHealth*" /S /B /A:D`) Do rmdir "%%d" /s /q
	For /F "usebackq delims=" %%d In (`2^>nul Dir "%LocalAppData%\Packages\*SecHealth*" /S /B /A:D`) Do rmdir "%%d" /s /q

		
rem                                                                   =================================
:AppRepSys
	%ch%    {09} SmartScreen § йЁв­ЁЄ  Windows{\n #}
	set "NameAppRep="
rem Џ®«гз Ґ¬ Ё¬п ЇаЁ«®¦Ґ­Ёп AppRep
	for /F "usebackq delims=" %%n In (`2^>nul reg query "HKU\%SID%\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\Repository\Packages" /f "*Apprep.ChxApp*" /k^|findstr ^H`) do set NameAppRep=%%~nxn
	if not defined NameAppRep %ch%    {02} ЏаЁ«®¦Ґ­ЁҐ SmartScreen § йЁв­ЁЄ  Windows г¤ «Ґ­®{\n #}&goto FinishDelete

	%ch%    {0b} “¤ «пҐ¬ ЇаЁ«®¦Ґ­ЁҐ SmartScreen § йЁв­ЁЄ  Windows{\n #}
	%ch%    {08} %NameAppRep%{\n #}
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\S-1-5-18\%NameAppRep%" /f >nul
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\EndOfLife\%SID%\%NameAppRep%" /f >nul
	NSudoLC -U:%ArgNsudo% -ShowWindowMode:Hide -Wait PowerShell "PowerShell -Command Get-AppxPackage -AllUsers *Apprep.ChxApp* | Remove-AppxPackage"	
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\InboxApplications\%NameAppRep%" /f >nul 2>&1
rem ќвЁ Ї ЇЄЁ ¬®¦­® г¤ «пвм, ў®ббв ­ ў«Ёў овбп б ¬Ё, Ґб«Ё ў®ббв ­®ўЁвм ЇаЁ«®¦Ґ­ЁҐ Apprep.ChxApp
	For /F "usebackq delims=" %%d In (`2^>nul Dir "%ProgramData%\Microsoft\Windows\AppRepository\Packages\*Apprep.ChxApp*" /S /B /A:D`) Do rmdir "%%d" /s /q
	For /F "usebackq delims=" %%d In (`2^>nul Dir "%LocalAppData%\Packages\*Apprep.ChxApp*" /S /B /A:D`) Do rmdir "%%d" /s /q


rem                                                                   =================================
:FinishDelete
rem Ћбў®Ў®¦¤с­­®Ґ ¬Ґбв® ­  ¤ЁбЄҐ
	for /f "usebackq tokens=2 delims==" %%i in (`wmic.exe LogicalDisk where "Name='c:'" get FreeSpace /value`) do set sFreeSize=%%i
	if defined sFreeSize (set sFreeSizePseudoMb1=%sFreeSize:~0,-7%)
	set /a Freed=%sFreeSizePseudoMb1% - %sFreeSizePseudoMb%
	echo.
	%ch%    {06} %Freed% ЊҐЈ Ў ©в ¬Ґбв  ®бў®Ў®¦¤Ґ­® Ї®б«Ґ г¤ «Ґ­Ёп{\n #}
	if not exist "%AllUsersProfile%\Microsoft\Windows Defender" (
	%ch%    {02} ‡ йЁв­ЁЄ Windows г¤ «Ґ­{\n #}{\n #}
	%ch%    {08} ЋаЁҐ­вЁаг©вҐбм ­  б®бв®п­ЁҐ Ї Ї®Є [2]{\n #}   {08} …б«Ё зв®-в® ®бв «®бм, ЇҐаҐ§ Јаг§ЁвҐ ЏЉ Ё Ї®ўв®аЁвҐ г¤ «Ґ­ЁҐ{\n #}
	%ch%    {08} Ќ ¦¬ЁвҐ «оЎго Є« ўЁиг ¤«п Їа®¤®«¦Ґ­Ёп{\n #}{\n #}
	) else (
	echo.
	nhmb "‡ йЁв­ЁЄ Windows Ќ… г¤ «Ґ­.\nЏ®ўв®аЁвм г¤ «Ґ­ЁҐ § йЁв­ЁЄ ?\n\n…б«Ё Ї®б«Ґ ­ҐбЄ®«мЄЁе Ї®Їлв®Є г¤ «Ґ­Ёп § йЁв­ЁЄ ­Ґ г¤ «пҐвбп Ё Ї®пў«пҐвбп нв® б®®ЎйҐ­ЁҐ, ўлЇ®«­ЁвҐ ЇҐаҐ§ Јаг§Єг Є®¬ЇмовҐа  Ё Ї®ўв®аЁвҐ Ї®ЇлвЄг г¤ «Ґ­Ёп." "DK" "Information|YesNo"
	if errorlevel 7 cls && goto Start
	if errorlevel 6 cls && set "RepeatDel=Yes" && goto DeleteDefender
	)
		
rem                                                                   =================================

:Catalogs
rem ђ §¬Ґа ®Є­  ў § ўЁбЁ¬®бвЁ ®в ­ «ЁзЁп б«г¦Ўл
	if defined serviceswebmask (Mode 82,45) else (Mode 80,45)
	
	%ch% {3f}%SystemRoot%\System32{\n #}
rem 14.03.23
	if not exist "%SystemRoot%\System32\HealthAttestationClient" (%ch% {0a} %SystemRoot%\System32\HealthAttestationClient{\n #}) else (%ch%  {0c}%SystemRoot%\System32\HealthAttestationClient{\n #})
	if not exist "%SystemRoot%\System32\SecurityHealth" (%ch% {0a} %SystemRoot%\System32\SecurityHealth{\n #}) else (%ch%  {0c}%SystemRoot%\System32\SecurityHealth{\n #})
	if not exist "%SystemRoot%\System32\WebThreatDefSvc" (%ch% {0a} %SystemRoot%\System32\WebThreatDefSvc{\n #}) else (%ch%  {0c}%SystemRoot%\System32\WebThreatDefSvc{\n #})
	if not exist "%SystemRoot%\System32\Sgrm" (%ch% {0a} %SystemRoot%\System32\Sgrm{\n #}) else (%ch%  {0c}%SystemRoot%\System32\Sgrm{\n #})
	if not exist "%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\Defender" (%ch% {0a} %SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\Defender{\n #}) else (%ch%  {0c}%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\Defender{\n #})
	if not exist "%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\DefenderPerformance" (%ch% {0a} %SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\DefenderPerformance{\n #}) else (%ch%  {0c}%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\DefenderPerformance{\n #})
	if not exist "%SystemRoot%\System32\Tasks_Migrated\Microsoft\Windows\Windows Defender" (%ch% {0a} %SystemRoot%\System32\Tasks_Migrated\Microsoft\Windows\Windows Defender{\n #}) else (%ch%  {0c}%SystemRoot%\System32\Tasks_Migrated\Microsoft\Windows\Windows Defender{\n #})
	echo.
	%ch% {3f}C:\Program Files{\n #}
	if not exist "%SystemDrive%\Program Files\Windows Defender" (%ch% {0a} C:\Program Files\Windows Defender {08}- ®б­®ў­ п Ї ЇЄ  § йЁв­ЁЄ  1{\n #}) else (%ch%  {4f}C:\Program Files\Windows Defender{08} - ®б­®ў­ п Ї ЇЄ  § йЁв­ЁЄ  1{\n #})
	if not exist "%SystemDrive%\Program Files\Windows Defender Sleep" (%ch% {0a} C:\Program Files\Windows Defender Sleep {\n #}) else (%ch%  {4f}C:\Program Files\Windows Defender Sleep{\n #})
	if not exist "%SystemDrive%\Program Files\Windows Defender Advanced Threat Protection" (%ch% {0a} C:\Program Files\Windows Defender Advanced Threat Protection{\n #}) else (%ch%  {0c}C:\Program Files\Windows Defender Advanced Threat Protection{\n #})
	if not exist "%SystemDrive%\Program Files\Windows Security" (%ch% {0a} C:\Program Files\Windows Security{\n #}) else (%ch%  {0c}C:\Program Files\Windows Security{\n #})
	if not exist "%SystemDrive%\Program Files\PCHealthCheck" (%ch% {0a} C:\Program Files\PCHealthCheck{\n #}) else (%ch%  {0c}C:\Program Files\PCHealthCheck{\n #})
	if not exist "%SystemDrive%\Program Files\Microsoft Update Health Tools" (%ch% {0a} C:\Program Files\Microsoft Update Health Tools{\n #}) else (%ch%  {0c}C:\Program Files\Microsoft Update Health Tools{\n #})
	echo.
	%ch% {3f}C:\Program Files (^x86^){\n #}
	if not exist "%ProgramFiles(x86)%\Windows Defender" (%ch% {0a} C:\Program Files (^x86^)\Windows Defender{\n #}) else (%ch%  {0c}C:\Program Files (^x86^)\Windows Defender{\n #})
	if not exist "%ProgramFiles(x86)%\Windows Defender Advanced Threat Protection" (%ch% {0a} C:\Program Files (^x86^)\Windows Defender Advanced Threat Protection{\n #}) else (%ch%  {0c}C:\Program Files (^x86^)\Windows Defender Advanced Threat Protection{\n #})
	echo.
	%ch% {3f}C:\ProgramData{\n #}
	if not exist "%AllUsersProfile%\Microsoft\Windows Defender" (%ch% {0a} C:\ProgramData\Microsoft\Windows Defender {08}- ®б­®ў­ п Ї ЇЄ  § йЁв­ЁЄ  2{\n #}) else (%ch%  {4f}C:\ProgramData\Microsoft\Windows Defender{08} - ®б­®ў­ п Ї ЇЄ  § йЁв­ЁЄ  2{\n #})
	if not exist "%AllUsersProfile%\Microsoft\Windows Defender Advanced Threat Protection" (%ch% {0a} C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection{\n #}) else (%ch%  {0c}C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection{\n #})
	if not exist "%AllUsersProfile%\Microsoft\Windows Security Health" (%ch% {0a} C:\ProgramData\Microsoft\Windows Security Health{\n #}) else (%ch%  {0c}C:\ProgramData\Microsoft\Windows Security Health{\n #})
	if not exist "%AllUsersProfile%\Microsoft\Storage Health" (%ch% {0a} C:\ProgramData\Microsoft\Storage Health{\n #}) else (%ch%  {0c}C:\ProgramData\Microsoft\Storage Health{\n #})
	echo.
	%ch% {3f}Џ ЇЄ  § ¤ з Ї« ­Ёа®ўйЁЄ  § йЁв­ЁЄ {\n #}
	if not exist "%SYSTEMROOT%\System32\Tasks\Microsoft\Windows\Windows Defender" (%ch% {0a} C:\Windows\System32\Tasks\Microsoft\Windows\Windows Defender{\n #}) else (%ch%  {0c}C:\Windows\System32\Tasks\Microsoft\Windows\Windows Defender{\n #})
	echo.
	%ch% {3f}Ћбв «м­лҐ д ©«л{\n #}
	
	if not exist "%SystemRoot%\Containers\WindowsDefenderApplicationGuard.wim" (%ch% {0a} C:\Windows\Containers\WindowsDefenderApplicationGuard.wim{\n #}) else (%ch%  {0c}C:\Windows\Containers\WindowsDefenderApplicationGuard.wim{\n #})
	if not exist "%SystemRoot%\Containers\serviced\WindowsDefenderApplicationGuard.wim" (%ch% {0a} C:\Windows\Containers\serviced\WindowsDefenderApplicationGuard.wim{\n #}) else (%ch%  {0c}C:\Windows\Containers\serviced\WindowsDefenderApplicationGuard.wim{\n #})
	echo.
	
	if not exist "%SystemRoot%\System32\SecurityHealthService.exe" (%ch% {02} SecurityHealthService.exe{#} ^| ) else (%ch% {0c} SecurityHealthService.exe {#}^| )
	if not exist "%SystemRoot%\System32\SecurityHealthSystray.exe" (%ch% {02}SecurityHealthSystray.exe{#} ^| ) else (%ch% {0c}SecurityHealthSystray.exe {#}^| )
	if not exist "%SystemRoot%\System32\SecurityHealthHost.exe" (%ch% {02}SecurityHealthHost.exe{\n #}) else (%ch% {0c}SecurityHealthHost.exe{\n #})
	if not exist "%SystemRoot%\System32\SecurityHealthAgent.dll" (%ch% {02} SecurityHealthAgent.dll{#} ^| ) else (%ch% {0c} SecurityHealthAgent.dll{#} ^| )
	if not exist "%SystemRoot%\System32\SecurityHealthSSO.dll" (%ch% {02}SecurityHealthSSO.dll{#} ^| ) else (%ch% {0c}SecurityHealthSSO.dll{#} ^| )
	if not exist "%SystemRoot%\System32\SecurityHealthProxyStub.dll" (%ch% {02}SecurityHealthProxyStub.dll{\n #}) else (%ch% {0c}SecurityHealthProxyStub.dll{\n #})
	if not exist "%SystemRoot%\System32\smartscreen.dll" (%ch% {02} smartscreen.dll{#} ^| ) else (%ch% {0c} smartscreen.dll{#} ^| )
	if not exist "%SystemRoot%\System32\wscisvif.dll" (%ch% {02}wscisvif.dll{#} ^| ) else (%ch% {0c}wscisvif.dll{#} ^| )
	if not exist "%SystemRoot%\System32\wscproxystub.dll" (%ch% {02}wscproxystub.dll{#} ^| ) else (%ch% {0c}wscproxystub.dll{#} ^| )
	if not exist "%SystemRoot%\System32\smartscreenps.dll" (%ch% {02}smartscreenps.dll{\n #}) else (%ch% {0c}smartscreenps.dll{\n #})
	if not exist "%SystemRoot%\System32\wscapi.dll" (%ch% {02} wscapi.dll{#} ^| ) else (%ch% {0c} wscapi.dll{#} ^| )
	if not exist "%SystemRoot%\System32\windowsdefenderapplicationguardcsp.dll" (%ch% {02} windowsdefenderapplicationguardcsp.dll{#} ^| ) else (%ch% {0c} windowsdefenderapplicationguardcsp.dll{#} ^| )
	if not exist "%SystemRoot%\System32\wscsvc.dll" (%ch% {02}wscsvc.dll{\n #}) else (%ch% {0c}wscsvc.dll{\n #})
	if not exist "%SystemRoot%\System32\SecurityHealthCore.dll"  (%ch% {02} SecurityHealthCore.dll{\n #}) else (%ch% {0c} SecurityHealthCore.dll{\n #})
	if not exist "%SystemRoot%\System32\SecurityHealthSsoUdk.dll"  (%ch% {02} SecurityHealthSsoUdk.dll{\n #}) else (%ch% {0c} SecurityHealthSsoUdk.dll{\n #})
	if not exist "%SystemRoot%\System32\SecurityHealthUdk.dll" (%ch% {02} SecurityHealthUdk.dll{\n #}) else (%ch% {0c} SecurityHealthUdk.dll{\n #})
	if not exist "%SystemRoot%\System32\SecurityHealthAgent.dll"  (%ch% {02} SecurityHealthAgent.dll{\n #}) else (%ch% {0c} SecurityHealthAgent.dll{\n #})
	
rem                                                                   =================================

:CreateBackupDefender

rem Џа®ўҐапҐ¬ ­ «ЁзЁҐ Ё­вҐа­Ґв , зв®Ўл ЁбЇ®«м§®ў вм DefenderStop ЇҐаҐ¤ б®§¤ ­ЁҐ¬ аҐ§Ґаў­®© Є®ЇЁЁ [­г¦Ґ­, в.Є. ЎҐ§ ­ҐЈ® ­Ґ Є®ЇЁагҐвбп Ї ЇЄ  § йЁв­ЁЄ , Ё§-§  ўЄ«озс­­ле б«г¦Ў]
	if not exist DefenderStop.exe (
	ping www.google.nl -n 1 -w 1000 |>nul find /i "TTL=" && curl -g -k -L -# -o "DefenderStop.exe" "https://i.getspace.eu/cloud/s/GXAtGk7qLbHj2CS/download" >nul 2>&1
	) || (
	%ch%    {0c} ЌҐў®§¬®¦­® б®§¤ вм аҐ§Ґаў­го Є®ЇЁо, ­Ґв Ї®¤Є«озҐ­Ёп Є Ё­вҐа­Ґвг{\n #}
	%ch%    {0c} ЌҐў®§¬®¦­® бЄ з вм DefenderStop{\n #}{\n #}
	%ch%    {08} https://i.getspace.eu/cloud/s/GXAtGk7qLbHj2CS/download{\n #}

rem €бЇ®«м§гҐ¬ ­ҐбЄ®«мЄ® а § ¤«п гўҐаҐ­­®бвЁ ўлЇ®«­Ґ­Ёп
	%ch%    {03} €бЇ®«м§гҐ¬ DefenderStop ¤«п ®вЄ«озҐ­Ёп б«г¦Ў § йЁв­ЁЄ {\n #}{\n #}
	nircmd exec hide DefenderStop.exe
	nircmd wait 3000
	nircmd exec hide DefenderStop.exe
	nircmd exec hide DefenderStop.exe
		
	%ch%    {02} ‘®§¤ с¬ аҐ§Ґаў­го Є®ЇЁо Ї Ї®Є Ё§ %AllUsersProfile%{\n #}
(
    xcopy /s /e /h /y /i "%AllUsersProfile%\Microsoft\Windows Defender" "%SystemDrive%\WDefenderBackup\Folder\ProgramData\Microsoft\Windows Defender"
    xcopy /s /e /h /y /i "%AllUsersProfile%\Microsoft\Windows Defender Advanced Threat Protection" "%SystemDrive%\WDefenderBackup\Folder\ProgramData\Microsoft\Windows Defender Advanced Threat Protection"
    xcopy /s /e /h /y /i "%AllUsersProfile%\Microsoft\Windows Security Health" "%SystemDrive%\WDefenderBackup\Folder\ProgramData\Microsoft\Windows Security Health"
    xcopy /s /e /h /y /i "%AllUsersProfile%\Microsoft\Storage Health" "%SystemDrive%\WDefenderBackup\Folder\ProgramData\Microsoft\Storage Health"
) >nul 2>&1

rem Џа®ўҐаЄ  Ї®б«Ґ Є®ЇЁа®ў ­Ёп Ј« ў­®© Ї ЇЄЁ, бЄ®ЇЁа®ў « бм «Ё ...
	dir /b "%SystemDrive%\WDefenderBackup\Folder\ProgramData\Microsoft\Windows Defender" | findstr /r "^" >nul && (
	echo >nul
	) || (
	%ch% {04} Џ ЇЄг "%AllUsersProfile%\Microsoft\Windows Defender" бЄ®ЇЁа®ў вм ­Ґ г¤ «®бм{\n #}
	%ch% {04} ’ Є®Ґ ў®§¬®¦­®, Ґб«Ё г ‚ б ­Ґ ®ва Ў®в « DefenderStop Ё ­Ґ ®вЄ«озЁ«Ёбм б«г¦Ўл § йЁв­ЁЄ {\n #}
	%ch% {04} ‚л ЁбЇ®«м§гҐвҐ «ЁЎ® Win 11 Dev/Beta ўҐабЁо, «ЁЎ® Microsoft зв®-в® Ё§¬Ґ­Ё« {\n #}{\n #}
	%ch% {08} Џ®Їа®Ўг©вҐ ҐйҐ а § Ї®ўв®аЁвм Ї®ЇлвЄг...{\n #}
	rd /s /q "%SystemDrive%\WDefenderBackup" >nul 2>&1
	cls && goto Start
	)
	

	%ch%    {02} ‘®§¤ с¬ аҐ§Ґаў­го Є®ЇЁо Ї Ї®Є Ё§ %ProgramFiles% Ё %ProgramFiles(x86)%{\n #}
(
rem ‘®§¤ с¬ а §¤Ґ« ў аҐҐбваҐ Ї® Є®в®а®¬г Ўг¤Ґ¬ Їа®ўҐапвм, зв® аҐ§Ґаў­ п Є®ЇЁп б®§¤ ­ . ’аҐЎгҐвбп ¤«п Їа®ЇгбЄ  г¤ «Ґ­Ёп SysApps [ЃҐ§®Ї б­®бвм/AppRep]
	reg add "HKLM\Software\DefenderKiller" /f

    xcopy /s /e /h /y /i "%SystemDrive%\Program Files\Windows Defender" "%SystemDrive%\WDefenderBackup\Folder\Program Files\Windows Defender"
    xcopy /s /e /h /y /i "%SystemDrive%\Program Files\Windows Defender Sleep" "%SystemDrive%\WDefenderBackup\Folder\Program Files\Windows Defender Sleep"
    xcopy /s /e /h /y /i "%SystemDrive%\Program Files\Windows Defender Advanced Threat Protection" "%SystemDrive%\WDefenderBackup\Folder\Program Files\Windows Defender Advanced Threat Protection"
    xcopy /s /e /h /y /i "%SystemDrive%\Program Files\Windows Security" "%SystemDrive%\WDefenderBackup\Folder\Program Files\Windows Security"
    xcopy /s /e /h /y /i "%SystemDrive%\Program Files\PCHealthCheck" "%SystemDrive%\WDefenderBackup\Folder\Program Files\PCHealthCheck"
    xcopy /s /e /h /y /i "%SystemDrive%\Program Files\Microsoft Update Health Tools" "%SystemDrive%\WDefenderBackup\Folder\Program Files\Microsoft Update Health Tools"
	
rem ProgramFiles X86	
    xcopy /s /e /h /y /i "%SystemDrive%\Program Files (x86)\Windows Defender" "%SystemDrive%\WDefenderBackup\Folder\Program Files (x86)\Windows Defender"
    xcopy /s /e /h /y /i "%SystemDrive%\Program Files (x86)\Windows Defender Advanced Threat Protection" "%SystemDrive%\WDefenderBackup\Folder\Program Files (x86)\Windows Defender Advanced Threat Protection"
		
) >nul 2>&1


	%ch%    {02} ‘®§¤ с¬ аҐ§Ґаў­го Є®ЇЁо Ї Ї®Є Ё§ System32 Ё SysWOW64{\n #}
(

rem Windows - System32
    xcopy /s /e /h /y /i "%SystemRoot%\security\database" "%SystemDrive%\WDefenderBackup\Folder\Windows\security\database"
    xcopy /s /e /h /y /i "%SystemRoot%\System32\HealthAttestationClient" "%SystemDrive%\WDefenderBackup\Folder\System32\HealthAttestationClient"
    xcopy /s /e /h /y /i "%SystemRoot%\System32\SecurityHealth" "%SystemDrive%\WDefenderBackup\Folder\System32\SecurityHealth"
    xcopy /s /e /h /y /i "%SystemRoot%\System32\WebThreatDefSvc" "%SystemDrive%\WDefenderBackup\Folder\System32\WebThreatDefSvc"
    xcopy /s /e /h /y /i "%SystemRoot%\System32\Sgrm" "%SystemDrive%\WDefenderBackup\Folder\System32\Sgrm"
    xcopy /s /e /h /y /i "%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\Defender" "%SystemDrive%\WDefenderBackup\Folder\System32\WindowsPowerShell\v1.0\Modules\Defender"
    xcopy /s /e /h /y /i "%SystemRoot%\System32\WindowsPowerShell\v1.0\Modules\DefenderPerformance" "%SystemDrive%\WDefenderBackup\Folder\System32\WindowsPowerShell\v1.0\Modules\DefenderPerformance"
    xcopy /s /e /h /y /i "%SystemRoot%\System32\Tasks_Migrated\Microsoft\Windows\Windows Defender" "%SystemDrive%\WDefenderBackup\Folder\System32\Tasks_Migrated\Microsoft\Windows\Windows Defender"
    xcopy /s /e /h /y /i "%SystemRoot%\System32\drivers\wd" "%SystemDrive%\WDefenderBackup\Folder\System32\drivers\wd"

rem ‡ ¤ зЁ § йЁв­ЁЄ 
	xcopy /s /e /h /y /i "%SystemRoot%\System32\Tasks\Microsoft\Windows\Windows Defender" "%SystemDrive%\WDefenderBackup\Folder\System32\Tasks\Microsoft\Windows\Windows Defender"

rem SysWOW64
    xcopy /s /e /h /y /i "%SystemRoot%\SysWOW64\WindowsPowerShell\v1.0\Modules\Defender" "%SystemDrive%\WDefenderBackup\Folder\SysWOW64\WindowsPowerShell\v1.0\Modules\Defender"
    xcopy /s /e /h /y /i "%SystemRoot%\SysWOW64\WindowsPowerShell\v1.0\Modules\DefenderPerformance" "%SystemDrive%\WDefenderBackup\Folder\SysWOW64\WindowsPowerShell\v1.0\Modules\DefenderPerformance"
	
) >nul 2>&1

	%ch%    {02} ‘®§¤ с¬ аҐ§Ґаў­го Є®ЇЁо д ©«®ў Ё§ System32 Ё SysWOW64{\n #}

(
	md "%SystemDrive%\WDefenderBackup\Files"
	md "%SystemDrive%\WDefenderBackup\Files\System32"
	md "%SystemDrive%\WDefenderBackup\Files\SysWOW64"
	md "%SystemDrive%\WDefenderBackup\Files\Windows\Containers"
	md "%SystemDrive%\WDefenderBackup\Files\Windows\Containers\serviced"
	
rem Љ®ЇЁа®ў ­ЁҐ д ©«®ў Ё§ System32
	copy /Y "%SystemRoot%\System32\SecurityHealthService.exe" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\SecurityHealthSystray.exe" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\SecurityHealthHost.exe" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\SecurityHealthAgent.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\SecurityHealthSSO.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\SecurityHealthProxyStub.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\LogFiles\WMI\RtBackup\EtwRTDefenderApiLogger.etl" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\LogFiles\WMI\RtBackup\EtwRTDefenderAuditLogger.etl" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\smartscreen.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\wscisvif.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\wscproxystub.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\smartscreenps.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\wscapi.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\windowsdefenderapplicationguardcsp.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\wscsvc.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\SecurityHealthCore.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\SecurityHealthSsoUdk.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\SecurityHealthUdk.dll" "%SystemDrive%\WDefenderBackup\Files\System32\"
	copy /Y "%SystemRoot%\System32\smartscreen.exe" "%SystemDrive%\WDefenderBackup\Files\System32\"

rem Љ®ЇЁа®ў ­ЁҐ д ©«®ў Ё§ SysWow64
	copy /Y "%SystemRoot%\SysWOW64\smartscreen.dll" "%SystemDrive%\WDefenderBackup\Files\SysWow64\"
	copy /Y "%SystemRoot%\SysWOW64\wscisvif.dll" "%SystemDrive%\WDefenderBackup\Files\SysWow64\"
	copy /Y "%SystemRoot%\SysWOW64\wscproxystub.dll" "%SystemDrive%\WDefenderBackup\Files\SysWow64\"
	copy /Y "%SystemRoot%\SysWOW64\smartscreenps.dll" "%SystemDrive%\WDefenderBackup\Files\SysWow64\"
	copy /Y "%SystemRoot%\SysWOW64\wscapi.dll" "%SystemDrive%\WDefenderBackup\Files\SysWow64\"
	copy /Y "%SystemRoot%\SysWOW64\windowsdefenderapplicationguardcsp.dll" "%SystemDrive%\WDefenderBackup\Files\SysWow64\"
		
	copy /Y "%SystemRoot%\Containers\WindowsDefenderApplicationGuard.wim" "%SystemDrive%\WDefenderBackup\Files\Windows\Containers\"
	copy /Y "%SystemRoot%\Containers\serviced\WindowsDefenderApplicationGuard.wim" "%SystemDrive%\WDefenderBackup\Files\Windows\Containers\serviced"
	
) >nul 2>&1
	

	%ch%    {02} ‘®§¤ с¬ аҐ§Ґаў­го Є®ЇЁо Ї Ї®Є Ё§ WinSxS{\n #}
(
	md "%SystemDrive%\WDefenderBackup\Folder\WinSxS"
	for /d %%i in ("%SystemRoot%\WinSxS\*windows-defender*") do xcopy "%%i" "%SystemDrive%\WDefenderBackup\Folder\WinSxS\%%~nxi" /I /E /H /Y
	for /d %%i in ("%SystemRoot%\WinSxS\*windows-senseclient-service*") do xcopy "%%i" "%SystemDrive%\WDefenderBackup\Folder\WinSxS\%%~nxi" /I /E /H /Y
	for /d %%i in ("%SystemRoot%\WinSxS\*windows-dynamic-image*") do xcopy "%%i" "%SystemDrive%\WDefenderBackup\Folder\WinSxS\%%~nxi" /I /E /H /Y
) >nul 2>&1


	md "%SystemDrive%\WDefenderBackup\ServicesDrivers"
	md "%SystemDrive%\WDefenderBackup\RegEdit"
	set "PathServDrive=%SystemDrive%\WDefenderBackup\ServicesDrivers"
	set "PathRegedit=%SystemDrive%\WDefenderBackup\RegEdit"
(	
rem ‘«г¦Ўл
	reg export "HKLM\System\CurrentControlSet\Services\EventLog\System\WinDefend" "%PathServDrive%\WinDefendEvent.reg"
	reg export "HKLM\System\CurrentControlSet\Services\SecurityHealthService" "%PathServDrive%\SecurityHealthService.reg"
	reg export "HKLM\System\CurrentControlSet\Services\Sense" "%PathServDrive%\Sense.reg"
	reg export "HKLM\System\CurrentControlSet\Services\WdNisSvc" "%PathServDrive%\WdNisSvc.reg"
	reg export "HKLM\System\CurrentControlSet\Services\WinDefend" "%PathServDrive%\WinDefend.reg"
	reg export "HKLM\System\CurrentControlSet\Services\wscsvc" "%PathServDrive%\wscsvc.reg"
	reg export "HKLM\System\CurrentControlSet\Services\SgrmBroker" "%PathServDrive%\SgrmBroker.reg"
	reg export "HKLM\System\CurrentControlSet\Services\webthreatdefsvc" "%PathServDrive%\webthreatdefsvc.reg"
	reg export "HKLM\System\CurrentControlSet\Services\webthreatdefusersvc" "%PathServDrive%\webthreatdefusersvc.reg"
	
rem „а ©ўҐа 
	reg export "HKLM\System\CurrentControlSet\Services\WdNisDrv" "%PathServDrive%\WdNisDrv.reg"
	reg export "HKLM\System\CurrentControlSet\Services\WdBoot" "%PathServDrive%\WdBoot.reg"
	reg export "HKLM\System\CurrentControlSet\Services\WdFilter" "%PathServDrive%\WdFilter.reg"
	reg export "HKLM\System\CurrentControlSet\Services\SgrmAgent" "%PathServDrive%\SgrmAgent.reg"
	reg export "HKLM\System\CurrentControlSet\Services\wtd" "%PathServDrive%\wtd.reg"
	reg export "HKLM\System\CurrentControlSet\Services\MsSecWfp" "%PathServDrive%\MsSecWfp.reg"
	reg export "HKLM\System\CurrentControlSet\Services\MsSecFlt" "%PathServDrive%\MsSecFlt.reg"
	reg export "HKLM\System\CurrentControlSet\Services\MsSecCore" "%PathServDrive%\MsSecCore.reg"
	
rem ќЄбЇ®ав ўҐв®Є аҐҐбва 
	reg export "HKCR\*\shellex\ContextMenuHandlers\EPP" "%PathRegedit%\1.reg"
	reg export "HKCR\Directory\shellex\ContextMenuHandlers\EPP" "%PathRegedit%\2.reg"
	reg export "HKCR\Drive\shellex\ContextMenuHandlers\EPP" "%PathRegedit%\3.reg"
	reg export "HKLM\Software\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}" "%PathRegedit%\4.reg"
	reg export "HKLM\Software\Microsoft\Windows\CurrentVersion\Shell Extensions\Approved" "%PathRegedit%\5.reg"
	reg export "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" "%PathRegedit%\6.reg"
	reg export "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" "%PathRegedit%\7.reg"
	reg export "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender" "%PathRegedit%\8.reg"
	reg export "HKLM\System\CurrentControlset\Control\WMI\Autologger\DefenderApiLogger" "%PathRegedit%\9.reg"
	reg export "HKLM\System\CurrentControlset\Control\WMI\Autologger\DefenderAuditLogger" "%PathRegedit%\10.reg"
	reg export "HKLM\Software\Microsoft\Windows Defender" "%PathRegedit%\11.reg"
	reg export "HKLM\Software\Microsoft\Windows Defender Security Center" "%PathRegedit%\12.reg"
	reg export "HKLM\Software\Microsoft\Windows Advanced Threat Protection" "%PathRegedit%\13.reg"
	reg export "HKLM\Software\Microsoft\Windows Security Health" "%PathRegedit%\14.reg"
	reg export "HKLM\Software\Microsoft\SystemSettings\SettingId\SystemSettings_WindowsDefender_UseWindowsDefender" "%PathRegedit%\15.reg"
	reg export "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Windows Defender/Operational" "%PathRegedit%\16.reg"
	reg export "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Windows Defender/WHC" "%PathRegedit%\17.reg"
	reg export "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\NIS-Driver-WFP/Diagnostic" "%PathRegedit%\18.reg"
	
) >nul 2>&1

	%ch%    {08} ђҐ§Ґаў­ п Є®ЇЁп б®§¤ ­  ў {0b}%SystemDrive%\WDefenderBackup{\n #}{\n #}
	
	
:RestoreDefender
rem „«п Є®ааҐЄв­®Ј® ®в®Ўа ¦Ґ­Ёп ¤Ё «®Ј®ў®Ј® ®Є­ , в.Є. Їа®Ја ¬¬  § ЇгйҐ­  ®в TI
	if not exist "%SystemRoot%\System32\config\systemprofile\Desktop" md "%SystemRoot%\System32\config\systemprofile\Desktop"
	
	set "BackupFolder="
	for /f %%A in ('powershell -c "(New-Object -COM 'Shell.Application').BrowseForFolder(0, '‚лЎҐаЁвҐ Ї ЇЄг б а ­ҐҐ б®§¤ ­­®© аҐ§Ґаў­®© Є®ЇЁҐ© Windows Defender', 0, 0).Self.Path"') do set "BackupFolder=%%A"
	echo.
	if not defined BackupFolder cls && goto Start
	if not exist "%BackupFolder%\Folder" %ch%    {04} ЌҐўҐа­ п аҐ§Ґаў­ п Є®ЇЁп. ‚лЎҐаЁвҐ Їа ўЁ«м­го аҐ§Ґаў­го Є®ЇЁо{\n #}&&timeout /t 3 >nul && cls && goto RestoreDefender
	if not exist "%BackupFolder%\ServicesDrivers" %ch%    {04} ЌҐўҐа­ п аҐ§Ґаў­ п Є®ЇЁп. ‚лЎҐаЁвҐ Їа ўЁ«м­го аҐ§Ґаў­го Є®ЇЁо{\n #}&&timeout /t 3 >nul && cls && goto RestoreDefender

rem ‡ ¤ с¬ ў®Їа®б ® ў®ббв ­®ў«Ґ­ЁЁ § йЁв­ЁЄ 
	%ch% {0f} ђҐ§Ґаў­ п Є®ЇЁп ўлЎа ­  - {04}%BackupFolder%{\n #}
	echo  1 - ‚®ббв ­®ўЁвм § йЁв­ЁЄ
	echo  2 - Ћв¬Ґ­  
	choice /c 12 /n /m " "
	if errorlevel 2 cls && goto Start
	
rem ‚®ббв ­®ў«Ґ­ЁҐ Ї®«ЁвЁЄ
	if not defined NoGP (
	%ch% {03} ‚®ббв ­®ў«Ґ­ЁҐ ЈагЇЇ®ўле Ї®«ЁвЁЄ{\n #}
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableRealtimeMonitoring" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableBehaviorMonitoring" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "LocalSettingOverrideDisableIOAVProtection" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "LocalSettingOverrideSpynetReporting" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "**del.SpynetReporting" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Spynet" /v "**del.SubmitSamplesConsent" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "RealtimeSignatureDelivery" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "DisableUpdateOnStartupWithoutEngine" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "UpdateOnStartUp" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Signature Updates" /v "DisableScanOnUpdate" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v "DisableGenericRePorts" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableCatchupFullScan" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableCatchupQuickScan" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableRemovableDriveScanning" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableScanningNetworkFiles" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableScanningMappedNetworkDrivesForFullScan" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows Defender\Scan" /v "DisableArchiveScanning" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "**del.ShellSmartScreenLevel" /f
	call :LGPOFILE reg delete "HKLM\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /f
	nircmd win activate process cmd.exe
	call :LGPO_APPLY
	nircmd win activate process cmd.exe
	)
	
rem ‚®ббв ­®ў«Ґ­ЁҐ Ї а ¬Ґва®ў аҐҐбва 
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /f >nul 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /f >nul 2>&1
	reg delete "HKLM\Software\Policies\Microsoft\MRT" /f >nul 2>&1
	NSudoLC -U:%ArgNsudo% -ShowWindowMode:Hide cmd.exe /c reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /f >nul 2>&1

	%ch% {03} ‚®ббв ­®ў«Ґ­ЁҐ д ©«®ў/Ї Ї®Є{\n #}{\n #}
	pushd "%BackupFolder%"
(
	copy /y "Files\System32" %SystemRoot%\System32
	copy /y "Files\SysWOW64" %SystemRoot%\SysWOW64
	copy /y "Files\Windows\Containers\WindowsDefenderApplicationGuard.wim" "%SystemRoot%\Containers\"
	copy /y "Files\Windows\Containers\serviced\WindowsDefenderApplicationGuard.wim" "%SystemRoot%\Containers\serviced"
	
	xcopy "Folder\Program Files\*" "%ProgramFiles%\" /E /H /K /Y
	xcopy "Folder\Program Files (x86)\*" "%ProgramFiles(x86)%\" /E /H /K /Y
	xcopy "Folder\ProgramData\*" "%ProgramData%\" /E /H /K /Y
	xcopy "Folder\System32\*" "%SystemRoot%\System32" /E /H /K /Y
	xcopy "Folder\SysWow64\*" "%SystemRoot%\SysWow64" /E /H /K /Y
	xcopy "Folder\Windows\*" "%SystemRoot%\" /E /H /K /Y
	xcopy "Folder\WinSxS\*" "%SystemRoot%\WinSxS\" /E /H /K /Y

rem ‚®ббв ­®ў«Ґ­ЁҐ аҐҐбва /б«г¦Ў, ¤а ©ўҐа®ў
	for %%f in ("RegEdit\*.reg") do reg import "%%f"
	for %%f in ("ServicesDrivers\*.reg") do reg import "%%f"

rem ‚®ббв ­®ў«Ґ­ЁҐ SmartScreen.exe
	if exist "%SystemRoot%\System32\smartscreen_disabled.exe" rename "%SystemRoot%\System32\smartscreen_disabled.exe" "smartscreen.exe"

rem “¤ «пҐ¬ а §¤Ґ« Ї® Є®в®а®¬г Їа®ўҐапҐвбп б®§¤ ­  «Ё аҐ§Ґаў­ п Є®ЇЁп. ’ҐЇҐам SysApps Ўг¤гв г¤ «пвмбп.
	reg delete "HKLM\Software\DefenderKiller" /f
	
) >nul 2>&1

	popd
	nhmb "’аҐЎгҐвбп ЇҐаҐ§ ЇгбЄ ЏЉ" "DK" "Information|Ok"
	cls && goto Start
	
	
rem                                                                   =================================
:CheckUpdate
rem Windows 8.1 ­Ґ Ї®¤¤Ґа¦Ёў Ґв дг­ЄжЁ®­ « ®Ў­®ў«Ґ­Ё©

rem “¤ «пҐ¬ д ©«, Ґб«Ё в®в ®бв «бп...
	del /q "%SystemDrive%\latestVersion.bat" >nul 2>&1
	
rem Џа®ўҐапҐ¬ ­ «ЁзЁҐ Ё­вҐа­Ґв-б®Ґ¤Ё­Ґ­Ёп
	ping www.google.nl -n 1 -w 1000 |>nul find /i "TTL="||cls&&%ch% {04} ЌҐў®§¬®¦­® Їа®ўҐаЁвм ®Ў­®ў«Ґ­Ёп Їа®Ја ¬¬л, ®вбгвбвўгҐв Ё­вҐа­Ґв{\n #}&&timeout /t 3 >nul&&cls&&goto Start

rem Џа®ўҐаЄ  ®Ў­®ў«Ґ­Ё© Їа®Ја ¬¬л
	curl -g -k -L -# -o "%SystemDrive%\latestVersion.bat" "https://pastebin.com/raw/dnENFgmC" >nul 2>&1
	call "%SystemDrive%\latestVersion.bat"
	if "%Version%" lss "%latestVersion%" (cls) else (cls & %ch% {0a} ‚л ЁбЇ®«м§гҐвҐ Ї®б«Ґ¤­оо  Євг «м­го ўҐабЁо Їа®Ја ¬¬л - {0e}%Version%{\n #}&timeout /t 4 >nul&goto Start)

rem ЋЎ­®ў«Ґ­ЁҐ Їа®Ја ¬¬л
	%ch%  {0f} Ќ ©¤Ґ­  ­®ў п ўҐабЁп, ­ ¦¬ЁвҐ «оЎго Є« ўЁиг зв®Ўл ®Ў­®ўЁвм Їа®Ја ¬¬г{\n #}
	curl -g -k -L -# -o %0 "https://github.com/oatmealcookiec/MyProgramm/releases/latest/download/DefenderKiller.bat" >nul 2>&1
	call %0



:Information
	nhmb "DefenderKiller - Їа®Ја ¬¬  ¤«п г¤ «Ґ­Ёп § йЁв­ЁЄ  Windows Ё ҐЈ® Є®¬Ї®­Ґ­в®ў.\n‚ Їа®Ја ¬¬Ґ Ё¬ҐҐвбп ў®§¬®¦­®бвм ў®ббв ­®ў«Ґ­Ёп (Ґб«Ё б®§¤ ­  аҐ§Ґаў­ п Є®ЇЁп)\nЉа б­л¬ жўҐв®¬ ў ¬Ґ­о - ­Ґ г¤ «Ґ­®. ‡Ґ«Ґ­л¬ жўҐв®¬ - г¤ «Ґ­®.\n\nЏаЁ ­ ¦ вЁЁ ­  Є­®ЇЄг ЋЉ Ўг¤Ґв ®вЄалв б ©в Їа®Ја ¬¬л, Ј¤Ґ ¬®¦­® ¤Ґв «м­® ®§­ Є®¬Ёвмбп б Їа®Ја ¬¬®©, § ¤ вм ў®Їа®б, ўлбЄ § вм ЇаҐ¤«®¦Ґ­ЁҐ Ё«Ё б®®ЎйЁвм ®Ў ®иЁЎЄҐ.\n\nBy Vlado." "DK" "Information|Ok"
	NSudoLC -U:%ArgNsudo% -ShowWindowMode:Hide cmd.exe /c start https://win10tweaker.ru/forum/topic/defenderkiller 
	cls & goto Start


rem ‘®§¤ ­® WestLife AutoSettings
:LGPOFILE
	setlocal
	if /i "%~2" NEQ "delete" if /i "%~2" NEQ "add" (
	 
	if /i "%~2" EQU "delete" if "%~7" NEQ "" (
	 
	set "RegType=%~7:"
	set "RegType=%RegType:REG=%"
	set "RegType=%RegType:_=%"
	set "RegType=%RegType:PAND=%"
	if "%~3" NEQ "" for /f "tokens=1* delims=\" %%I in ("%~3") do ( set "RegKey=%%J"
	 if /i "%%I" EQU "HKEY_LOCAL_MACHINE" (set Config=Computer) else if /i "%%I" EQU "HKLM" (set Config=Computer
	 ) else if /i "%%I" EQU "HKEY_CURRENT_USER" (set Config=User) else if /i "%%I" EQU "HKCU" (set Config=User
	 
	if "%~9" NEQ "" set "Action=%RegType%%~9"
	if /i "%~6" EQU "/d" set "Action=SZ:%~7"
	if /i "%~2" EQU "delete" set "Action=DELETE"
	if "%~5" EQU "" ( set "Action=DELETEALLVALUES" & set "ValueName=*" ) else ( set "ValueName=%~5" )
	if /i "%~2" EQU "add" if /i "%~4" EQU "/f" set "Action=CREATEKEY" & set "ValueName=*"
	(echo.%Config%& echo.%RegKey%& echo.%ValueName%& echo.%Action%& echo.)>>"%LGPOtemp%"
) else (
%ch% {0f}C:\Program Files\Microsoft Update Health Tools {04}Ќ… “„Ђ‹…Ќ{\n #}
)

echo.
%ch% {0e} C:\Program Files (^x86^):{\n #}
if not exist "%ProgramFiles(x86)%\Windows Defender" (
%ch% {0f}C:\Program Files (^x86^)\Windows Defender {0a}“„Ђ‹…Ќ{\n #}
) else (
%ch% {0f}C:\Program Files (^x86^)\Windows Defender {04}Ќ… “„Ђ‹…Ќ{\n #}
)

if not exist "%ProgramFiles(x86)%\Windows Defender Advanced Threat Protection" (
%ch% {0f}C:\Program Files (^x86^)\Windows Defender Advanced Threat Protection {0a}“„Ђ‹…Ќ{\n #}
) else (
%ch% {0f}C:\Program Files (^x86^)\Windows Defender Advanced Threat Protection {04}Ќ… “„Ђ‹…Ќ{\n #}
)

echo.
%ch% {0e} C:\ProgramData\Microsoft:{\n #}

if not exist "%AllUsersProfile%\Microsoft\Windows Defender" (
%ch% {0f}C:\ProgramData\Microsoft\Windows Defender {0a}“„Ђ‹…Ќ{\n #}
) else (
%ch% {0f}C:\ProgramData\Microsoft\Windows Defender {04}Ќ… “„Ђ‹…Ќ{\n #}
)

if not exist "%AllUsersProfile%\Microsoft\Windows Defender Advanced Threat Protection" (
%ch% {0f}C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection {0a}“„Ђ‹…Ќ{\n #}
) else (
%ch% {0f}C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection {04}Ќ… “„Ђ‹…Ќ{\n #}
)

if not exist "%AllUsersProfile%\Microsoft\Windows Security Health" (
%ch% {0f}C:\ProgramData\Microsoft\Windows Security Health {0a}“„Ђ‹…Ќ{\n #}
) else (
%ch% {0f}C:\ProgramData\Microsoft\Windows Security Health {04}Ќ… “„Ђ‹…Ќ{\n #}
)
echo.

%ch% {0e} WindowsDefenderApplicationGuard.wim:{\n #}
if not exist "%SystemRoot%\Containers\WindowsDefenderApplicationGuard.wim" (
%ch% {0f}C:\Windows\Containers\WindowsDefenderApplicationGuard.wim {0a}“„Ђ‹…Ќ{\n #}
) else (
%ch% {0f}C:\Windows\Containers\WindowsDefenderApplicationGuard.wim {04}Ќ… “„Ђ‹…Ќ{\n #}
)

if not exist "%SystemRoot%\Containers\serviced\WindowsDefenderApplicationGuard.wim" (
%ch% {0f}C:\Windows\Containers\serviced\WindowsDefenderApplicationGuard.wim {0a}“„Ђ‹…Ќ{\n #}
) else (
%ch% {0f}C:\Windows\Containers\serviced\WindowsDefenderApplicationGuard.wim {04}Ќ… “„Ђ‹…Ќ{\n #}
)