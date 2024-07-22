@echo off & title Windows Tweaker & color 17
cd /d %~dp0

echo ======================================================
echo --------------- Compress WinSxS folder ---------------
echo ======================================================

sc query msiserver 
sc query TrustedInstaller
pause
sc config msiserver start= disabled
sc config TrustedInstaller start= disabled

sc stop msiserver
sc stop TrustedInstaller

icacls "%WINDIR%\WinSxS" /save "%WINDIR%\WinSxS.acl" /t
takeown /f "%WINDIR%\WinSxS" /r
icacls "%WINDIR%\WinSxS" /grant "%USERDOMAIN%\%USERNAME%":(F) /t
compact /s:"%WINDIR%\WinSxS" /u /a /i *
compact "%WINDIR%\WinSxS" /u /a /i

icacls "%WINDIR%\WxS" /setowner "NT SERVICE\TrustedInstaller" /t
icacls "%WINDIR%" /restore "%WINDIR%\WinSxS.acl"

sc config msiserver start= demand
sc config TrustedInstaller start= demand
rem sc start msiserver
rem sc start TrustedInstaller

echo ======================================================
taskkill /f /im explorer.exe & TIMEOUT /T 5 /NOBREAK
start explorer.exe & TIMEOUT /T 30 /NOBREAK
echo ********************** The End ***********************

pause
exit