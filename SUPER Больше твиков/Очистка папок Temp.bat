:Start
@Echo off
cls
cd %userprofile%\AppData\Local\Temp\ >nul
rd /q /s %userprofile%\AppData\Local\Temp\ >nul
del /q /f /s %userprofile%\AppData\Local\Temp\*.* >nul
cd %windir%\Temp\ >nul
del /q /f /s %windir%\Temp\*.* >nul
rd /q /s %windir%\Temp\ >nul
