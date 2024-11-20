@echo off
:dataQueueK
echo Keyboard Data Queue Sizes
echo This may affect stability and input latency. And if low enough may cause general keyboard issues like ghosting.
echo.
echo Windows Default: 100
echo Atlas Default: 50
echo Valid Value Range: 1-100
set /P c="Enter the size you want to set Keyboard Data Queue Size to: "
:: Filter to numbers only
echo %c%|findstr /r "[^0-9]" > nul
if errorlevel 1 goto dataQueueKSet
cls
echo Only values from 1-100 are allowed!
goto dataQueueK
:: Checks for invalid values
:dataQueueKSet
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "%c%" /f