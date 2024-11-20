net stop wuauserv
cd /d %SystemRoot%\SoftwareDistribution
del /s /q /f Download
net start wuauserv