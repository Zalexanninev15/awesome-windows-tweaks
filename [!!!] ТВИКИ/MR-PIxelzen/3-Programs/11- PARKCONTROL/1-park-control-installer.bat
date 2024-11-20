@echo off
title park control setup.bat
mode con: cols=82 lines=21
color F0
rem if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
rem old  code
rem ... script logic here ...
echo Detecting OS processor type
rem start "%~dp0" "myfile.exe"
rem @echo off
rem pushd "%~dp0"
rem set scriptPath=%CD%
rem echo Batch Script Path: %scriptPath%
rem popd
rem cd %~dp0\
rem start parkcontrolsetup32.exe
rem new code

cd %~dp0\_Files
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
echo 32-bit OS start-parkcontrol-installer 32bit
start parkcontrolsetup32.exe
goto END
:64BIT
echo 64-bit OS start-parkcontrol-installer 64bit
start parkcontrolsetup64.exe
:END
pause


