@echo off

reg add "HKCU\System\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f

reg add "HKCU\System\GameBar" /v "GamePanelStartupTipIndex" /t REG_DWORD /d "3" /f
reg add "HKCU\System\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f

reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "__COMPAT_LAYER" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\xboxgip" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d "4" /f

echo Finished, FSO and Game Bar are now disabled.
echo Press any key to exit...
pause > nul
exit /b