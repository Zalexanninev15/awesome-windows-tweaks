@echo off
pwsh -CommandWithArgs "scoop bucket add main"
pwsh -CommandWithArgs "scoop install git"
pwsh -CommandWithArgs "scoop bucket add games"
pwsh -CommandWithArgs "scoop bucket add nonportable"
pwsh -CommandWithArgs "scoop bucket add extras"
pwsh -CommandWithArgs "scoop bucket add versions"
pwsh -CommandWithArgs "scoop install adb far vivaldi apktool cacert vscode localsend jexiftoolgui cmake copyq extras/ayugram cowsay privacy.sexy handbrake cpufetch cygwin dark devd dnspyex fastfetch hugo-extended hokus ffmpeg github goggalaxy gpg exiftool epic-games-launcher fastfetch grep hashcheck obsidian nilesoft-shell heroic-games-launcher insomnia jcpicker kryptor masscode mc micro mingw minisign nextcloud nmap notion oh-my-posh painter pycharm resource-hacker Responsively sandboxie-plus-np screentogif jcpicker simplenote SQLiteStudio staxrip steam-achievement-manager ttyd rustrover ventoy vhs wget windhawk z webcopy autohotkey python docker"
pause
pwsh -CommandWithArgs "scoop install scoop-completion"