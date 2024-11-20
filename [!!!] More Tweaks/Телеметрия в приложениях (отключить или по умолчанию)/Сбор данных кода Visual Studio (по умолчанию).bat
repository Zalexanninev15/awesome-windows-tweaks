@echo off

:: ----------------------------------------------------------
:: ------Disable Visual Studio Code telemetry-------
:: ----------------------------------------------------------
echo --- Disable Visual Studio Code telemetry
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('telemetry.enableTelemetry'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Disable Visual Studio Code crash reporting----
:: ----------------------------------------------------------
echo --- Disable Visual Studio Code crash reporting
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('telemetry.enableCrashReporter'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Do not run Microsoft online experiments-----
:: ----------------------------------------------------------
echo --- Do not run Microsoft online experiments
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('workbench.enableExperiments'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Choose manual updates over automatic updates---
:: ----------------------------------------------------------
echo --- Choose manual updates over automatic updates
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('update.mode'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: Show Release Notes from Microsoft online service after an update
echo --- Show Release Notes from Microsoft online service after an update
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('update.showReleaseNotes'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: Automatically check extensions from Microsoft online service
echo --- Automatically check extensions from Microsoft online service
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('extensions.autoCheckUpdates'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: Fetch recommendations from Microsoft only on demand
echo --- Fetch recommendations from Microsoft only on demand
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('extensions.showRecommendationsOnlyOnDemand'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: Automatically fetch git commits from remote repository
echo --- Automatically fetch git commits from remote repository
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('git.autofetch'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Fetch package information from NPM and Bower---
:: ----------------------------------------------------------
echo --- Fetch package information from NPM and Bower
PowerShell -ExecutionPolicy Unrestricted -Command "$jsonfile = "^""$env:APPDATA\Code\User\settings.json"^""; if (!(Test-Path $jsonfile -PathType Leaf)) {; Write-Error "^""Settings file could not be found at $jsonfile"^"" -ErrorAction Stop; }; $json = Get-Content $jsonfile | ConvertFrom-Json; $json.PSObject.Properties.Remove('npm.fetchOnlinePackageInfo'); $json | ConvertTo-Json | Set-Content $jsonfile"
:: ----------------------------------------------------------


pause
exit /b 0