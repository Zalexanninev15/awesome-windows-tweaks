[Info]
Title=Windows Update Logs
Description=Clean-up Windows Update Logs
Author=Mirinsoft
AuthorURL=http://www.mirinsoft.com

[Files]
File1=Detect|HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\WindowsUpdate
File2=DeleteDir|%WinDir%\Logs\waasmedic
File3=DeleteDir|%WinDir%\Logs\WindowsUpdate
File4=DeleteDir|%WinDir%\SoftwareDistribution\DataStore\Logs























