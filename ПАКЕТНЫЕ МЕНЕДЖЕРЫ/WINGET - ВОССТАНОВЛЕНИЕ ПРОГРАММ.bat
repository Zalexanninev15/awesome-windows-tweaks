@echo off
pwsh -c ^
$packagesMachine = @( ^
    'Microsoft.PowerShell', ^
    'DEVCOM.JetBrainsMonoNerdFont', ^
    'Sandboxie.Plus', ^
    'Microsoft.VCRedist.2015+.x86', ^
    'Microsoft.VCRedist.2015+.x64', ^
    'Microsoft.VCRedist.2010.x64', ^
    'Microsoft.VCRedist.2012.x86', ^
    'Microsoft.VCRedist.2005.x86', ^
    'Microsoft.VCRedist.2008.x64', ^
    'Microsoft.VCRedist.2008.x86', ^
    'Microsoft.VCRedist.2005.x64', ^
    'Microsoft.VCRedist.2013.x86', ^
    'Microsoft.VCRedist.2010.x86', ^
    'Microsoft.VCRedist.2012.x64', ^
    'Microsoft.VCRedist.2013.x64', ^
    'Rustlang.Rust.GNU', ^
    'Microsoft.VisualStudio.2022.Community', ^
    'Implbits.HashTab', ^
    'chrisant996.Clink' ^
); ^
$packagesUser = @( ^
    'Microsoft.PowerToys', ^
    'lin-ycv.EverythingPowerToys', ^
    'Microsoft.DevHome', ^
    'DevToys-app.DevToys', ^
    'Microsoft.Sysinternals.RDCMan', ^
    'Microsoft.Sysinternals.ProcessMonitor', ^
    'Microsoft.Sysinternals.Autoruns', ^
    'Microsoft.Sysinternals.BGInfo', ^
    'Microsoft.Sysinternals.ProcessExplorer', ^
    'Microsoft.Sysinternals.TCPView', ^
    'Microsoft.WindowsTerminal', ^
    'AdrienAllard.FileConverter', ^
    'JustArchiNET.ArchiSteamFarm', ^
    'calendulish.SteamToolsNG', ^
    'Codeusa.SteamCleaner', ^
    'TravisLane.SteamArtManager', ^
    'StefansTools.SKTimeStamp', ^
    'Ubisoft.Connect', ^
    'GnuPG.Gpg4win', ^
    'Proton.ProtonVPN', ^
    'DuongDieuPhap.ImageGlass', ^
    'Automattic.Simplenote' ^
); ^
foreach ($package in $packagesMachine) { ^
    winget install --id=$package -e -h --scope 'machine' ^
}; ^
foreach ($package in $packagesUser) { ^
    winget install --id=$package -e -h --scope 'user' ^
}
pause