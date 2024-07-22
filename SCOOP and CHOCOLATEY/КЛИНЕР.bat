@echo off
pwsh -CommandWithArgs "scoop list | foreach { scoop cleanup $_.Name }"
choco-cleaner