@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "if (-Not ([Security.Principal.WindowsPrincipal]([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { exit 1 } else { exit 0 }"

if %errorlevel% equ 1 (
    echo Run as Administrator!
    pause
	exit
)

echo Setting up the scoop
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop install git"
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop bucket add main"
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop bucket add games"
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop bucket add nonportable"
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop bucket add extras"
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop bucket add versions"

echo $packages = @( > install-packages.ps1
echo     'aria2', >> install-packages.ps1
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
echo     'dark', >> install-packages.ps1
echo     'devd', >> install-packages.ps1
echo     'dnspyex', >> install-packages.ps1
echo     'fastfetch', >> install-packages.ps1
echo     'hugo-extended', >> install-packages.ps1
echo     'hokus', >> install-packages.ps1
echo     'ffmpeg', >> install-packages.ps1
echo     'github', >> install-packages.ps1
echo     'gpg', >> install-packages.ps1
echo     'exiftool', >> install-packages.ps1
echo     'grep', >> install-packages.ps1
echo     'hashcheck', >> install-packages.ps1
echo     'obsidian', >> install-packages.ps1
echo     'heroic-games-launcher', >> install-packages.ps1
echo     'jcpicker', >> install-packages.ps1
echo     'kryptor', >> install-packages.ps1
echo     'masscode', >> install-packages.ps1
echo     'micro', >> install-packages.ps1
echo     'mingw', >> install-packages.ps1
echo     'wireshark', >> install-packages.ps1
echo     'minisign', >> install-packages.ps1
echo     'nextcloud', >> install-packages.ps1
echo     'nmap', >> install-packages.ps1
echo     'oh-my-posh', >> install-packages.ps1
echo     'painter', >> install-packages.ps1
echo     'pycharm', >> install-packages.ps1
echo     'resource-hacker', >> install-packages.ps1
echo     'Responsively', >> install-packages.ps1
echo     'screentogif', >> install-packages.ps1
echo     'SQLiteStudio', >> install-packages.ps1
echo     'staxrip', >> install-packages.ps1
echo     'steam-achievement-manager', >> install-packages.ps1
echo     'ttyd', >> install-packages.ps1
echo     'ventoy', >> install-packages.ps1
echo     'vhs', >> install-packages.ps1
echo     'wget', >> install-packages.ps1
echo     'windhawk', >> install-packages.ps1
echo     'z', >> install-packages.ps1
echo     'docker' >> install-packages.ps1
echo     'docker-compose' >> install-packages.ps1
echo ); >> install-packages.ps1

echo foreach ($package in $packages) { >> install-packages.ps1
echo     Write-Host "=> Package: $package" >> install-packages.ps1
echo     scoop install $package >> install-packages.ps1
echo } >> install-packages.ps1

powershell -NoProfile -ExecutionPolicy Bypass -File install-packages.ps1

del install-packages.ps1 /q /f

pause
exit /b