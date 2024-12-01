@echo off

echo Setting up the scoop
pwsh -CommandWithArgs "scoop install git"
pwsh -CommandWithArgs "scoop bucket add main"
pwsh -CommandWithArgs "scoop bucket add games"
pwsh -CommandWithArgs "scoop bucket add nonportable"
pwsh -CommandWithArgs "scoop bucket add extras"
pwsh -CommandWithArgs "scoop bucket add versions"

echo $packages = @( > install-packages.ps1
echo     'adb', >> install-packages.ps1
echo     'far', >> install-packages.ps1
echo     'vivaldi', >> install-packages.ps1
echo     'apktool', >> install-packages.ps1
echo     'cacert', >> install-packages.ps1
echo     'vscode', >> install-packages.ps1
echo     'localsend', >> install-packages.ps1
echo     'jexiftoolgui', >> install-packages.ps1
echo     'cmake', >> install-packages.ps1
echo     'copyq', >> install-packages.ps1
echo     'extras/ayugram', >> install-packages.ps1
echo     'cowsay', >> install-packages.ps1
echo     'privacy.sexy', >> install-packages.ps1
echo     'handbrake', >> install-packages.ps1
echo     'cpufetch', >> install-packages.ps1
echo     'cygwin', >> install-packages.ps1
echo     'dark', >> install-packages.ps1
echo     'devd', >> install-packages.ps1
echo     'dnspyex', >> install-packages.ps1
echo     'fastfetch', >> install-packages.ps1
echo     'hugo-extended', >> install-packages.ps1
echo     'hokus', >> install-packages.ps1
echo     'simplewall', >> install-packages.ps1
echo     'ffmpeg', >> install-packages.ps1
echo     'github', >> install-packages.ps1
echo     'goggalaxy', >> install-packages.ps1
echo     'gpg', >> install-packages.ps1
echo     'exiftool', >> install-packages.ps1
echo     'epic-games-launcher', >> install-packages.ps1
echo     'grep', >> install-packages.ps1
echo     'hashcheck', >> install-packages.ps1
echo     'obsidian', >> install-packages.ps1
echo     'nilesoft-shell', >> install-packages.ps1
echo     'heroic-games-launcher', >> install-packages.ps1
echo     'insomnia', >> install-packages.ps1
echo     'jcpicker', >> install-packages.ps1
echo     'kryptor', >> install-packages.ps1
echo     'masscode', >> install-packages.ps1
echo     'mc', >> install-packages.ps1
echo     'micro', >> install-packages.ps1
echo     'mingw', >> install-packages.ps1
echo     'wireshark', >> install-packages.ps1
echo     'minisign', >> install-packages.ps1
echo     'nextcloud', >> install-packages.ps1
echo     'nmap', >> install-packages.ps1
echo     'notion', >> install-packages.ps1
echo     'oh-my-posh', >> install-packages.ps1
echo     'painter', >> install-packages.ps1
echo     'pycharm', >> install-packages.ps1
echo     'resource-hacker', >> install-packages.ps1
echo     'Responsively', >> install-packages.ps1
echo     'sandboxie-plus-np', >> install-packages.ps1
echo     'screentogif', >> install-packages.ps1
echo     'simplenote', >> install-packages.ps1
echo     'SQLiteStudio', >> install-packages.ps1
echo     'staxrip', >> install-packages.ps1
echo     'steam-achievement-manager', >> install-packages.ps1
echo     'ttyd', >> install-packages.ps1
echo     'ventoy', >> install-packages.ps1
echo     'vhs', >> install-packages.ps1
echo     'wget', >> install-packages.ps1
echo     'windhawk', >> install-packages.ps1
echo     'z', >> install-packages.ps1
echo     'webcopy', >> install-packages.ps1
echo     'python', >> install-packages.ps1
echo     'docker' >> install-packages.ps1
echo ); >> install-packages.ps1

echo foreach ($package in $packages) { >> install-packages.ps1
echo     Write-Host "=> Package: $package" >> install-packages.ps1
echo     scoop install $package >> install-packages.ps1
echo } >> install-packages.ps1

pwsh -ExecutionPolicy Bypass -File install-packages.ps1

del install-packages.ps1
pause
