@echo off

:: ----------------------------------------------------------
:: -------Do not send Windows Media Player statistics--------
:: ----------------------------------------------------------
echo --- Do not send Windows Media Player statistics
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable metadata retrieval----------------
:: ----------------------------------------------------------
echo --- Disable metadata retrieval
reg add "HKCU\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventCDDVDMetadataRetrieval" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventMusicFileMetadataRetrieval" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\WindowsMediaPlayer" /v "PreventRadioPresetsRetrieval" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\WMDRM" /v "DisableOnline" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


:: Disable Windows Media Player Network Sharing Service
echo --- Disable Windows Media Player Network Sharing Service
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'WMPNetworkSvc'; $defaultStartupMode = 'Manual'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


pause
exit /b 0