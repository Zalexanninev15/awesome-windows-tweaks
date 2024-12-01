@echo off

echo $packagesMachine = @( > install-machine-packages.ps1
echo     'Microsoft.PowerShell', >> install-machine-packages.ps1
echo     'Sandboxie.Plus', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2005.x64', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2005.x86', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2008.x64', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2008.x86', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2010.x64', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2010.x86', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2012.x64', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2012.x86', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2013.x64', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2013.x86', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2015+.x64', >> install-machine-packages.ps1
echo     'Microsoft.VCRedist.2015+.x86', >> install-machine-packages.ps1
echo     'Microsoft.DotNet.Framework.DeveloperPack_4', >> install-machine-packages.ps1
echo     'Microsoft.XNARedist', >> install-machine-packages.ps1
echo     'Nilesoft.Shell', >> install-machine-packages.ps1
echo     'Anaconda.Miniconda3', >> install-machine-packages.ps1
echo     'Rustlang.Rust.GNU', >> install-machine-packages.ps1
echo     'Microsoft.VisualStudio.2022.Community', >> install-machine-packages.ps1
echo     'Implbits.HashTab', >> install-machine-packages.ps1
echo     'IObit.IObitUnlocker', >> install-machine-packages.ps1
echo     'EliasFotinis.DeskPins', >> install-machine-packages.ps1
echo     'Guru3D.Afterburner', >> install-machine-packages.ps1
echo     'Guru3D.RTSS', >> install-machine-packages.ps1
echo     'chrisant996.Clink' >> install-machine-packages.ps1
echo     'Canonical.Ubuntu.2404' >> install-machine-packages.ps1
echo     'Canonical.Ubuntu.2204' >> install-machine-packages.ps1
echo     'OffSec.KaliLinux' >> install-machine-packages.ps1
echo     'Microsoft.DevHome' >> install-machine-packages.ps1
echo ); >> install-machine-packages.ps1

echo foreach ($package in $packagesMachine) { >> install-machine-packages.ps1
echo     Write-Host "=> Package for machine: $package" >> install-machine-packages.ps1
echo     winget install --id=$package -e -h --scope 'machine' >> install-machine-packages.ps1
echo } >> install-machine-packages.ps1

echo $packagesUser = @( > install-user-packages.ps1
echo     'DEVCOM.JetBrainsMonoNerdFont', >> install-user-packages.ps1
echo     'Microsoft.PowerToys', >> install-user-packages.ps1
echo     'lin-ycv.EverythingPowerToys', >> install-user-packages.ps1
echo     'Microsoft.DevHome', >> install-user-packages.ps1
echo     'DevToys-app.DevToys', >> install-user-packages.ps1
echo     'qBittorrent.qBittorrent', >> install-user-packages.ps1
echo     'WinsiderSS.SystemInformer', >> install-user-packages.ps1
echo     'Microsoft.Sysinternals.RDCMan', >> install-user-packages.ps1
echo     'Microsoft.Sysinternals.RDCMan', >> install-user-packages.ps1
echo     'Microsoft.Sysinternals.ProcessMonitor', >> install-user-packages.ps1
echo     'Microsoft.Sysinternals.Autoruns', >> install-user-packages.ps1
echo     'Microsoft.Sysinternals.BGInfo', >> install-user-packages.ps1
echo     'Microsoft.Sysinternals.ProcessExplorer', >> install-user-packages.ps1
echo     'Microsoft.Sysinternals.TCPView', >> install-user-packages.ps1
echo     'Microsoft.WindowsTerminal', >> install-user-packages.ps1
echo     'Proton.ProtonVPN', >> install-user-packages.ps1
echo     'Windscribe.Windscribe', >> install-user-packages.ps1
echo     'Cyotek.WebCopy', >> install-user-packages.ps1
echo     'dev47apps.DroidCam', >> install-user-packages.ps1
echo     'AdrienAllard.FileConverter', >> install-user-packages.ps1
echo     'HydraLauncher.Hydra', >> install-user-packages.ps1
echo     'calendulish.SteamToolsNG', >> install-user-packages.ps1
echo     'Insomnia.Insomnia, >> install-user-packages.ps1
echo     'Codeusa.SteamCleaner', >> install-user-packages.ps1
echo     'GOG.Galaxy', >> install-user-packages.ps1
echo     'TravisLane.SteamArtManager', >> install-user-packages.ps1
echo     'StefansTools.SKTimeStamp', >> install-user-packages.ps1
echo     'Ubisoft.Connect', >> install-user-packages.ps1
echo     'GnuPG.Gpg4win', >> install-user-packages.ps1
echo     'Python.Python.3.13', >> install-user-packages.ps1
echo     'Flydigi.FlydigiSpaceStation', >> install-user-packages.ps1
echo     'DuongDieuPhap.ImageGlass', >> install-user-packages.ps1
echo     'Automattic.Simplenote' >> install-user-packages.ps1
echo     'Anthropic.Claude' >> install-user-packages.ps1
echo ); >> install-user-packages.ps1

echo foreach ($package in $packagesUser) { >> install-user-packages.ps1
echo     Write-Host "=> Package for user: $package" >> install-user-packages.ps1
echo     winget install --id=$package -e -h --scope 'user' >> install-user-packages.ps1
echo } >> install-user-packages.ps1

pwsh -ExecutionPolicy Bypass -File install-machine-packages.ps1
pwsh -ExecutionPolicy Bypass -File install-user-packages.ps1

del install-machine-packages.ps1
del install-user-packages.ps1
pause
