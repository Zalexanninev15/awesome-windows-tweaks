NET STOP wuauserv
SCHTASKS /Change /TN "MicrosoftWindowsWindowsUpdateAutomatic App Update" /DISABLE
REG ADD "HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdateAU" /v "AutoInstallMinorUpdates" /t REG_DWORD /d 0 /f
REG ADD "HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdateAU" /v "AUOptions" /t REG_DWORD /d %AutoUpdateN% /f
REG ADD "HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdateAU" /v "NoAutoUpdate" /t REG_DWORD /d 0 /f
REG ADD "HKLMSOFTWAREMicrosoftWindowsCurrentVersionWindowsUpdateAuto Update" /v "AUOptions" /t REG_DWORD /d %AutoUpdateN% /f
NET START wuauserv

SCHTASKS /Change /TN "MicrosoftWindowsUpdateOrchestratorReboot" /Disable
ren "%WinDir%System32TasksMicrosoftWindowsUpdateOrchestratorReboot" "Reboot.bak"
md "%WinDir%System32TasksMicrosoftWindowsUpdateOrchestratorReboot"
SCHTASKS /Change /TN "MicrosoftWindowsUpdateOrchestratorReboot" /Disable
