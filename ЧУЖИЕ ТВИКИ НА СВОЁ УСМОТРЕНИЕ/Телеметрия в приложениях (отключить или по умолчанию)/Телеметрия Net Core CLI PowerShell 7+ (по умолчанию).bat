@echo off

:: ----------------------------------------------------------
:: ---------Disable NET Core CLI telemetry----------
:: ----------------------------------------------------------
echo --- Disable NET Core CLI telemetry
setx DOTNET_CLI_TELEMETRY_OPTOUT 0
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable PowerShell 7+ telemetry---------
:: ----------------------------------------------------------
echo --- Disable PowerShell 7+ telemetry
setx POWERSHELL_TELEMETRY_OPTOUT 0
:: ----------------------------------------------------------


pause
exit /b 0