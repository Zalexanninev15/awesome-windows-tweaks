[Info]
Title=Windows Logs
Description=Clean-up Windows Log files
Author=Mirinsoft
AuthorURL=http://www.mirinsoft.com

[Files]
File1=DeleteFile|%SystemDrive%\*.log
File2=DeleteFile|%WinDir%\Directx.log
File3=DeleteFile|%WinDir%\SchedLgU.txt
File4=DeleteFile|%WinDir%\*.log
File5=DeleteFile|%WinDir%\SoftwareDistribution\DataStore\Logs\*.log
File6=DeleteFile|%WinDir%\SoftwareDistribution\DataStore\Logs\*.chk
File7=DeleteFile|%WinDir%\SoftwareDistribution\DataStore\Logs\*.jrs
File8=DeleteFile|%WinDir%\security\logs\*.old
File9=DeleteFile|%WinDir%\security\logs\*.log
File10=DeleteFile|%WinDir%\Debug\*.log
File11=DeleteFile|%WinDir%\Debug\UserMode\*.bak
File12=DeleteFile|%WinDir%\Debug\UserMode\*.log
File13=DeleteFile|%WinDir%\*.bak
File14=DeleteFile|%WinDir%\system32\wbem\Logs\*.log
File15=DeleteFile|%WinDir%\OEWABLog.txt
File16=DeleteFile|%WinDir%\setuplog.txt
File17=DeleteFile|%WinDir%\Logs\DISM\*.log
File18=DeleteFile|%WinDir%\*.log.txt
File19=DeleteFile|%WinDir%\APPLOG\*.*
File20=DeleteFile|%WinDir%\system32\wbem\Logs\*.log
File21=DeleteFile|%WinDir%\system32\wbem\Logs\*.lo_
File22=DeleteFile|%WinDir%\Logs\DPX\*.log
File23=DeleteFile|%WinDir%\ServiceProfiles\NetworkService\AppData\Local\Temp\*.log
File24=DeleteFile|%WinDir%\Logs\*.log
File25=DeleteFile|%LocalAppData%\Microsoft\Windows\WindowsUpdate.log
File26=DeleteFile|%LocalAppData%\Microsoft\Windows\WebCache\*.log
File27=DeleteFile|%WinDir%\Panther\cbs.log
File28=DeleteFile|%WinDir%\Panther\DDACLSys.log
File29=DeleteFile|%WinDir%\inf\setupapi.offline.log
File30=DeleteFile|%WinDir%\inf\setupapi.app.log
File31=DeleteFile|%AllUsersProfile%\Microsoft\Network\Downloader\*.*|RECURSE
File32=DeleteFile|%AllUsersProfile%\Microsoft\Windows Security Health\Logs\*.*|RECURSE
File33=DeleteFile|%WinDir%\System32\WDI\LogFiles\StartupInfo\*.*|RECURSE
File34=DeleteFile|%AllUsersProfile%\USOShared\Logs\*.*|RECURSE
File35=DeleteFile|%LocalAppData%\ConnectedDevicesPlatform\*.*
File36=DeleteFile|%LocalAppData%\Diagnostics\*.*|RECURSE
File37=DeleteFile|%ProgramFiles%\UNP\Logs\*.*|RECURSE
File38=DeleteFile|%SystemDrive%\PerfLogs\System\Diagnostics\*.*|RECURSE
File39=DeleteFile|%SystemDrive%\PerfLogs\System\Performance\*.*|RECURSE
File40=DeleteFile|%WinDir%\debug\WIA\*.log
File41=DeleteFile|%SystemDrive%\PerfLogs\System\Diagnostics\*.*
File42=DeleteFile|%WinDir%\Logs\CBS\*.cab
File43=DeleteFile|%WinDir%\Logs\dosvc\*.*|RECURSE
File44=DeleteFile|%WinDir%\Logs\NetSetup\*.*|RECURSE
File45=DeleteFile|%WinDir%\Logs\CBS\*.cab
File46=DeleteFile|%WinDir%\Logs\SIH\*.*|RECURSE
File47=DeleteFile|%WinDir%\Logs\WindowsBackup\*.etl
File48=DeleteFile|%WinDir%\Panther\FastCleanup\*.log|RECURSE
File49=DeleteFile|%WinDir%\Panther\Rollback\*.txt|RECURSE
File50=DeleteFile|%WinDir%\repair\setup.log
File51=DeleteFile|%WinDir%\security\logs\*.*|RECURSE
File52=DeleteFile|%WinDir%\System32\LogFiles\HTTPERR\*.*
File53=DeleteFile|%WinDir%\System32\LogFiles\Scm\*.*|RECURSE
File54=DeleteFile|%WinDir%\System32\LogFiles\setupcln\*.*|RECURSE
File55=DeleteFile|%WinDir%\System32\LogFiles\WMI\*.*|RECURSE
File56=DeleteFile|%WinDir%\SysNative\SleepStudy\*.etl
File57=DeleteFile|%WinDir%\SysNative\SleepStudy\ScreenOn\*.etl
File58=DeleteFile|%WinDir%\System32\SleepStudy\*.etl
File59=DeleteFile|%WinDir%\System32\SleepStudy\ScreenOn\*.etl
File60=DeleteDir|%WinDir%\Logs
File61=DeleteDir|%WinDir%\DISM
File62=DeleteFile|%WinDir%\Panther\UnattendGC\diagerr.xml
File63=DeleteFile|%WinDir%\Panther\UnattendGC\diagwrn.xml
File64=DeleteFile|%WinDir%\System32\catroot2\*.chk
File65=DeleteFile|%WinDir%\System32\catroot2\*.log
File66=DeleteFile|%WinDir%\System32\catroot2\.jrs
File67=DeleteFile|%WinDir%\System32\catroot2\*.txt
File68=DeleteRegKey|HKLM\Software\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications
File69=DeleteRegKey|HKLM\Software\Microsoft\Tracing
File70=DeleteRegKey|HKLM\Software\Wow6432Node\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications
File71=DeleteRegKey|HKLM\Software\Wow6432Node\Microsoft\Tracing
