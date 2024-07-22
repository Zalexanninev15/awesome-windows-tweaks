@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

:: -----------------------------------------------------  !!! Unsupported Reg Type Found !!!  -----------------------------------------------------
REM ~ Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\VFUProvider" /v "StartTime" /t REG_QWORD /d "0x3ae7ee104b6ada01" /f
REM ~ Reg.exe add "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Usage" /v "MemoryUsageKB" /t REG_QWORD /d "0xb40e000000000000" /f
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy\History\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\0" /v "Version" /t REG_DWORD /d "13566159" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy\Status\GPExtensions\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" /v "LastPolicyTime" /t REG_DWORD /d "23226553" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\TextInput" /v "AllowLinguisticDataCollection" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "AllowInputPersonalization" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\SQM" /v "DisableCustomerImprovementProgram" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy" /v "DisableQueryRemoteServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}" /v "ScenarioExecutionEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows Search\UsnNotifier\Windows\Catalogs\SystemIndex" /v "{5BE4A3F9-0000-0000-0000-E0503E000000}" /t REG_SZ /d "362659360" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Usage" /v "CPUpct" /t REG_SZ /d "0.004962" /f
Reg.exe add "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Usage" /v "NormalDownloadCount" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy\History\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\0" /v "Version" /t REG_DWORD /d "7471218" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy\Status\GPExtensions\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" /v "LastPolicyTime" /t REG_DWORD /d "23226553" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "SendSiteInfoToImproveServices" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "MetricsReportingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /t REG_DWORD /d "1" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "PaymentMethodQueryEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "LocalProvidersEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "SearchSuggestEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "ResolveNavigationErrorsUseWebService" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "PasswordManagerEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "SiteSafetyServicesEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "TyposquattingCheckerEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "AddressBarMicrosoftSearchInBingProviderEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "AutofillAddressEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "AutofillCreditCardEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "NetworkPredictionOptions" /t REG_DWORD /d "2" /f
Reg.exe add "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "0" /f
Reg.exe delete "HKU\S-1-5-21-467190835-1795634448-1402218043-1004\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
