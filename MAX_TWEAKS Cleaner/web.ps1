# Введите команду в PowerShell от имени Администратора: irm https://clcr.me/mtc | iex
# Подробнее про данный скрипт: https://t.me/maxlife15/1678

$mtc_version = "11"

Write-Host "MAX_TWEAKS Cleaner V$mtc_version"

$ErrorActionPreference = "Stop"

$DownloadURL = "https://github.com/Zalexanninev15/awesome-windows-tweaks/raw/refs/heads/main/MAX_TWEAKS%20Cleaner/version%20$mtc_version.zip"

$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
$FilePath = if ($isAdmin) { "$env:SystemRoot\Temp" } else { "$env:TEMP" }

if (!(Test-Path -Path $FilePath -PathType Container)) {
    New-Item -Path $FilePath -ItemType Directory -Force | Out-Null
}

$DownloadPath = "$FilePath\mtc_tools.zip"

Invoke-WebRequest -Uri $DownloadURL -OutFile $DownloadPath
Expand-Archive -Path $DownloadPath -DestinationPath $FilePath -Force
powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy -Scope LocalMachine Unrestricted -Force"

$mtcScriptCDD = "$FilePath\CleanDriversDuplicates.ps1"

if (Test-Path -Path $mtcScriptCDD) {
    $scriptProcess = Start-Process -FilePath "powershell.exe" -ArgumentList "-Command", "`"$mtcScriptCDD`"" -PassThru
    $scriptProcess.WaitForExit()
} else {
    Write-Error "The script file '$mtcScriptCDD' was not found."
}

$mtcScript = "$FilePath\mtc_v$mtc_version.bat"

if (Test-Path -Path $mtcScript) {
    $scriptProcess = Start-Process -FilePath "cmd.exe" -ArgumentList "/c", "`"$mtcScript`"" -PassThru
    $scriptProcess.WaitForExit()
} else {
    Write-Error "The script file '$mtcScript' was not found."
}

$FilePaths = @(
    "$FilePath\nircmdc.exe",
    "$mtcScriptCDD",
	"$DownloadPath",
    "$mtcScript"
)

foreach ($FilePath in $FilePaths) {
    if (Test-Path -Path $FilePath) {
        Remove-Item -Path $FilePath -Force
        Write-Host "Deleting file: $FilePath"
    }
}

if ($scriptProcess.ExitCode -ne 0) {
    Write-Warning "CMD script execution was interrupted."
    Start-Process explorer.exe
}
