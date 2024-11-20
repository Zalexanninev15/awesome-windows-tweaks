@echo off
echo Batch File By ios1ph

mkdir "C:\Program Files\startupoptimizer"
echo.
xcopy /s "%CD%\startup\startup.bat" "C:\Program Files\startupoptimizer"
echo.
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\startup.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\Program Files\startupoptimizer\startup.bat" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
echo.
echo Оптимизация при старте системы успешно установлена!
