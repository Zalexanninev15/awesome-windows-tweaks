[Info]
Title=Windows Defender
Description=Clean-up non critical files used by Windows Defender.
Author=Mirinsoft
AuthorURL=http://www.mirinsoft.com

[Files]
File1=DeleteFile|%ProgramData%\Microsoft\Windows Defender\Network Inspection System\Support\*.txt
File2=DeleteFile|%ProgramData%\Microsoft\Windows Defender\Scans\*.bin*
File3=DeleteDir|%ProgramData%\Microsoft\Windows Defender\Scans\History\CacheManager
File4=DeleteDir|%ProgramData%\Microsoft\Windows Defender\Scans\History\ReportLatency\Latency
File6=DeleteFile|%ProgramData%\Microsoft\Windows Defender\Scans\History\Service\*.log
File6=DeleteDir|%ProgramData%\Microsoft\Windows Defender\Scans\MetaStore
File7=DeleteDir|%ProgramData%\Microsoft\Windows Defender\Support












