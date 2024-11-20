@echo off

cd /d "%~dp0"

TI.exe cmd.exe /c reg add "HKCR\CLSID\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f >nul 2>&1

taskkill /f /im explorer.exe >nul 2>&1
start explorer

timeout /t 2 /nobreak >nul

start explorer.exe

exit