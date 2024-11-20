SC STOP edgeupdate
SC CONFIG edgeupdate start= disabled
SC DELETE edgeupdate

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
