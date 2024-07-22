@echo off

:: Remove "Windows Security" app (`SecHealthUI`) (breaks Windows Security user interface) (revert)
echo --- Remove "Windows Security" app (`SecHealthUI`) (breaks Windows Security user interface) (revert)
PowerShell -ExecutionPolicy Unrestricted -Command "$package = Get-AppxPackage -AllUsers 'Microsoft.Windows.SecHealthUI'; if (!$package) {; Write-Error 'App could not be found' -ErrorAction Stop; }; $directories = @($package.InstallLocation, "^""$env:LOCALAPPDATA\Packages\$($package.PackageFamilyName)"^""); foreach($dir in $directories) {; if ( !$dir -Or !(Test-Path "^""$dir"^"") ) { continue; }; cmd /c ('takeown /f "^""' + $dir + '"^"" /r /d y 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; cmd /c ('icacls "^""' + $dir + '"^"" /grant administrators:F /t 1> nul'); if($LASTEXITCODE) { throw 'Failed to take ownership' }; $files = Get-ChildItem -File -Path "^""$dir\*.OLD"^"" -Recurse -Force; foreach($file in $files) {; $newName = $file.FullName.Substring(0, $file.FullName.Length - 4); Write-Host "^""Rename '$($file.FullName)' to '$newName'"^""; Move-Item -LiteralPath "^""$($file.FullName)"^"" -Destination "^""$newName"^"" -Force; }; }"
:: ----------------------------------------------------------


pause
exit /b 0