@echo off
echo Script By Adamx (youtube.com/Adamxx)
net stop wuauserv
net stop UsoSvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
pause