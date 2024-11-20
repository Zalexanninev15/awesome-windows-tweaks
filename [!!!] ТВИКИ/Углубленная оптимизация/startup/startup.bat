@echo off
echo Made by Amit
echo Modified by ios1ph
echo.
call :USER_DEFINED

:: поставить сходства, если не ставили оставить все как есть

:processaffinity
:: CREDIT TO SPDLL за самый быстрый код
if defined affinity (
	if not %affinity% GTR 0 goto INVALID_AFFINITY
	PowerShell -NoLogo -NoProfile -NonInteractive -Command "get-process dwm,audiosvchost,audiodg,lsass,svchost,WmiPrvSE | ForEach-Object {$_.ProcessorAffinity=%affinity%}"
)

:INVALID_AFFINITY
:: winlogon на нормальный приоритет / потому что по дефолту стоит высокий.
:: нормальный приоритет предотвращает наследование дочерними процессами с высоким приоритетом
wmic process where name="winlogon.exe" call setpriority 32

:: очистить
rd /s /q "%temp%" & mkdir "%userprofile%\AppData\Local\Temp"


:USER_DEFINED
wmic process where name="dwm.exe" call setpriority 32
wmic process where name="lsass.exe" call setpriority 64
wmic process where name="svchost.exe" call setpriority 64
wmic process where name="WmiPrvSE.exe" call setpriority 64

