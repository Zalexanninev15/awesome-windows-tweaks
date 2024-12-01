@echo off

:: ----------------------------------------------------------
:: ---------Disable visual studio telemetry---------
:: ----------------------------------------------------------
echo --- Disable visual studio telemetry
reg add "HKCU\Software\Microsoft\VisualStudio\Telemetry" /v "TurnOffSwitch" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Visual Studio feedback----------
:: ----------------------------------------------------------
echo --- Disable Visual Studio feedback
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableFeedbackDialog" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableEmailInput" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\VisualStudio\Feedback" /v "DisableScreenshotCapture" /t REG_DWORD /d 0 /f
:: ----------------------------------------------------------


:: Stop and disable Visual Studio Standard Collector Service
echo --- Stop and disable Visual Studio Standard Collector Service
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'VSStandardCollectorService150'; $defaultStartupMode = 'Automatic'; Write-Host "^""Enabling service: `"^""$serviceName`"^"" with `"^""$defaultStartupMode`"^"" start."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) {; Write-Warning "^""Service `"^""$serviceName`"^"" could not be not found, cannot enable it."^""; Exit 1; }; <# -- 2. Enable or skip if already enabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if(!$startupType) {; $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) {; $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if($startupType -eq "^""$defaultStartupMode"^"") {; Write-Host "^""`"^""$serviceName`"^"" is already enabled with `"^""$defaultStartupMode`"^"" start, no further action is needed."^""; } else {; try {; Set-Service -Name "^""$serviceName"^"" -StartupType "^""$defaultStartupMode"^"" -Confirm:$false -ErrorAction Stop; Write-Host "^""Enabled `"^""$serviceName`"^"" successfully with `"^""$defaultStartupMode`"^"" start, may require restarting your computer."^""; } catch {; Write-Error "^""Could not enable `"^""$serviceName`"^"": $_"^""; Exit 1; }; }; <# -- 4. Start if not running (must be enabled first) #>; if($defaultStartupMode -eq 'Automatic') {; if ($service.Status -ne [System.ServiceProcess.ServiceControllerStatus]::Running) {; Write-Host "^""`"^""$serviceName`"^"" is not running, starting it."^""; try {; Start-Service $serviceName -ErrorAction Stop; Write-Host "^""Started `"^""$serviceName`"^"" successfully."^""; } catch {; Write-Warning "^""Could not start `"^""$serviceName`"^"", requires restart, it will be started after reboot.`r`n$_"^""; }; } else {; Write-Host "^""`"^""$serviceName`"^"" is already running, no need to start."^""; }; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable SQM OS key----------------
:: ----------------------------------------------------------
echo --- Disable SQM OS key
if %PROCESSOR_ARCHITECTURE%==x86 ( REM is 32 bit?
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
) else (
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\14.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\15.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
    reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\VSCommon\16.0\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
)
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable SQM group policy-------------
:: ----------------------------------------------------------
echo --- Disable SQM group policy
reg add "HKLM\Software\Policies\Microsoft\VisualStudio\SQM" /v "OptIn" /t REG_DWORD /d 1 /f
:: ----------------------------------------------------------


pause
exit /b 0