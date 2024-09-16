@echo off
pwsh -CommandWithArgs "choco upgrade all -y --ignore-checksums"
pwsh -CommandWithArgs "scoop update"
pwsh -CommandWithArgs "scoop list | foreach { scoop update $_.Name }"

pwsh -CommandWithArgs "scoop list | foreach { scoop cleanup $_.Name }"
choco-cleaner
pause