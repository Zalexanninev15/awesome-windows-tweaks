:Start
@Echo off
cls
net stop wuauserv >nul
cd %windir%\SoftwareDistribution\Download\ >nul
del /q /f /s %windir%\SoftwareDistribution\Download\*.* >nul
rd /q /s %windir%\SoftwareDistribution\Download\ >nul
net start wuauserv >nul
