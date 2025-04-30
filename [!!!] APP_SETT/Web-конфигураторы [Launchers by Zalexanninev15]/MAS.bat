@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "if (-Not ([Security.Principal.WindowsPrincipal]([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { exit 1 } else { exit 0 }"

if %errorlevel% equ 1 (
    echo Run as Administrator!
    pause
	exit
)

powershell -c "Set-ExecutionPolicy -Scope LocalMachine Unrestricted -Force"
powershell -c "irm https://get.activated.win | iex"
exit /b