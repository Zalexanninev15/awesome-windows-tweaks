@echo off
:dataQueueM
echo Mouse Data Queue Sizes
echo This may affect stability and input latency. And if low enough may cause mouse skipping/mouse stutters.
echo.
echo Windows Default: 100
echo Atlas Default: 50
echo Valid Value Range: 1-100
set /P c="Enter the size you want to set Mouse Data Queue Size to: "
:: Filter to numbers only
echo %c%|findstr /r "[^0-9]" > nul
if errorlevel 1 goto dataQueueMSet
cls
echo Only values from 1-100 are allowed!
goto dataQueueM
:: Checks for invalid values
:dataQueueMSet
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "%c%" /f

goto finish
