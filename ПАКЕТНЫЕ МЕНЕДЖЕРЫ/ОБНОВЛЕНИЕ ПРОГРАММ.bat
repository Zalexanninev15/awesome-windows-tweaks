@echo off
pwsh -CommandWithArgs "scoop update"
pwsh -CommandWithArgs "scoop list | foreach { scoop update $_.Name }"
pwsh -CommandWithArgs "winget upgrade --all"

pwsh -CommandWithArgs "scoop list | foreach { scoop cleanup $_.Name }"
pause