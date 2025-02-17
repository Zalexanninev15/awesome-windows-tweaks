@echo off

:: ----------------------------------------------------------
:: ---------Clear Windows Product Key from Registry----------
:: ----------------------------------------------------------
echo --- Clear Windows Product Key from Registry
cscript.exe //nologo "%SystemRoot%\system32\slmgr.vbs" /cpky
cscript.exe //nologo "%SystemRoot%\system32\slmgr.vbs" /dlv
:: ----------------------------------------------------------

pause
exit /b 0