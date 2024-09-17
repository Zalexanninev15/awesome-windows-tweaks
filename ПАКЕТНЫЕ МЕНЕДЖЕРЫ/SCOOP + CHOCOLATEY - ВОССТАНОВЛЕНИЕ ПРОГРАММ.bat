@echo off
:: choco
pwsh -CommandWithArgs "choco install apkshellext choco-cleaner cyotek-webcopy dotnet-8.0-desktopruntime dotnet-8.0-runtime exiftool hashtab hugo jcpicker privaxy python312 runinbash vcredist140 ubisoft-connect rustrover visualstudio2022community choco-protocol-support docker autohotkey.portable -y"
:: imageglass
:: --ignore-checksums"

:: scoop
pwsh -CommandWithArgs "scoop bucket add main"
pwsh -CommandWithArgs "scoop install git"
pwsh -CommandWithArgs "scoop bucket add games"
pwsh -CommandWithArgs "scoop bucket add nonportable"
pwsh -CommandWithArgs "scoop bucket add extras"
pwsh -CommandWithArgs "scoop bucket add versions"
pwsh -CommandWithArgs "scoop install main/scoop-search"
pwsh -CommandWithArgs "scoop install main/adb far vivaldi apktool cacert vscode localsend cmake copyq extras/ayugram cowsay privacy.sexy handbrake cpufetch cygwin dark devd dnspyex windows-terminal DS4Windows fastfetch ffmpe github goggalaxy gpg epic-games-launcher fastfetch grep hashcheck obsidian nilesoft-shell heroic-games-launcher insomnia jcpicker kryptor masscode mc micro mingw minisign nextcloud nmap notion oh-my-posh painter pycharm resource-hacker Responsively sandboxie-plus-np screentogif simplenote SQLiteStudio staxrip steam-achievement-manager ttyd ventoy vhs wget windhawk z"
pause
pwsh -CommandWithArgs "scoop install scoop-completion"