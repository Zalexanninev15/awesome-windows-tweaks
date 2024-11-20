@echo off
title process-lasso-installer
mode con: cols=82 lines=21
color F0
rem 32-bit version of processlasso works BOTH on 32-bit and 64-bit Windows.
rem 64-bit version of processlasso works ONLY on 64-bit Windows.
rem 64-bit version is faster and doesn't have the 2GB RAM per process limitation.

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
rem start processlassosetup32.exe
rem new code

cd %~dp0\_Files
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT
echo 32-bit OS start-processlassoinstaller 32bit
start processlassosetup32.exe
goto END
:64BIT
echo 64-bit OS start-processlassoinstaller 64bit
start processlassosetup64.exe
:END
pause


