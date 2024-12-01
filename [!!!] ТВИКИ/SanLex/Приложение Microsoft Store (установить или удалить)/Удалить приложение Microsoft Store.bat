@echo off

echo --- Remove Microsoft Store app ---
PowerShell -ExecutionPolicy Unrestricted -Command "Get-AppxPackage 'Microsoft.WindowsStore' | Remove-AppxPackage"

echo.
echo Finished.
echo.

pause
exit /b