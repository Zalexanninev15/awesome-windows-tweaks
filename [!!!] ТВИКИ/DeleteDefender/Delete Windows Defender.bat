:Start
@ECHO OFF
reg query "HKU\S-1-5-19\Environment" >nul 2>&1 & cls
if "%Errorlevel%" NEQ "0" (
powershell.exe -windowstyle hidden -noprofile "Start-Process '%~dpnx0' -WindowStyle Minimized -Verb RunAs" && exit
)

if /i not "%USERNAME%"=="SYSTEM" "%~dp0WorkFiles\TI.exe" "%~f0" %* & exit

Rem Enable Delayed Expansion
setlocal EnableDelayedExpansion

REM Обнуляем значение переменных
set "sFreeSize="
set "sFreeSizePseudoMb1="
set "Freed="

cd /d "%~dp0WorkFiles"
Title DefenderKiller
@cmdow @ /SIZ 1000 700
set ch="cecho.exe"
qprocess "Win 10 Tweaker.exe">nul 2>&1 || nircmd.exe win center alltop
ConX.exe show

%ch% {0f}Запущено с правами: {04}%username%{\n #}
%ch% {0f}Delete Defender Версия: {0b}6 By Vlado Для W10T{\n #}
echo.
%ch% {0f}Windows Defender: 
if not exist "%ProgramFiles%\Windows Defender" (%ch% {2f}Удален из Windows{08} [папка Windows Defender отсутствует]{\n #}) else (%ch% {4f}Не удален^^^!{0c} [папка Windows Defender найдена]{\n #})

rem Отключен ли защитник
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" >nul 2>&1
if "%ERRORLEVEL%"=="0" (
%ch% {0f}Windows Defender: {0a}Защитник отключен {08}[через реестр: DisableAntiSpyware]{\n #}
)
if "%ERRORLEVEL%"=="1" (
%ch% {0f}Windows Defender: {0c}Защитник включен {08}[через реестр]{\n #}
)

echo.
%ch% {03}Процессы защитника:{\n #}

%ch% {0f}Процесс AntimalwareService:   {#} 
qprocess "MsMpEng.exe">nul 2>&1 && %ch% {04}Процесс запущен{\n #}|| %ch% {0a}Процесс не запущен{\n #}

%ch% {0f}Процесс SecurityHealthService:{#} 
qprocess "SecurityHealthService.exe">nul 2>&1 && %ch% {04}Процесс запущен{\n #}|| %ch% {0a}Процесс не запущен{\n #}

%ch% {0f}Процесс SecurityHealthSystray:{#} 
qprocess "SecurityHealthSystray.exe">nul 2>&1 && %ch% {04}Процесс запущен{\n #}|| %ch% {0a}Процесс не запущен{\n #}

%ch% {0f}Процесс SecurityHealthHost:   {#} 
qprocess "SecurityHealthHost.exe">nul 2>&1 && %ch% {04}Процесс запущен{\n #}|| %ch% {0a}Процесс не запущен{\n #}

%ch% {0f}Процесс SmartScreen Защитника:{#} 
qprocess "smartscreen.exe">nul 2>&1 && %ch% {04}Процесс запущен{\n #}|| %ch% {0a}Процесс не запущен{\n #}

%ch% {0f}Процесс брокер SgrmBroker:    {#} 
qprocess "SgrmBroker.exe">nul 2>&1 && %ch% {04}Процесс запущен{\n #}|| %ch% {0a}Процесс не запущен{\n #}

%ch% {0f}Процесс защитника SecHealthUI:{#} 
qprocess "SecHealthUI.exe">nul 2>&1 && %ch% {04}Процесс запущен{\n #}|| %ch% {0a}Процесс не запущен{\n #}

%ch% {0f}Процесс Update Health uhssvc: {#} 
qprocess "uhssvc.exe">nul 2>&1 && %ch% {04}Процесс запущен{\n #}|| %ch% {0a}Процесс не запущен{\n #}

echo.
rem Проверка служб и драйверов
%ch% {03}Службы защитника:{\n #}
%ch% {0f}WinDefend:     {#} 
sc query WinDefend >nul 2>&1
if ERRORLEVEL 1 (%ch% {0a}Не существует{\n #}) else (
sc query WinDefend | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключена{\n #}) ELSE (%ch% {04}Запущена{\n #}))

%ch% {0f}WdNisSvc:      {#} 
sc query WdNisSvc >nul 2>&1
if ERRORLEVEL 1 (%ch% {0a}Не существует{\n #}) else (
sc query WdNisSvc | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключена{\n #}) ELSE (%ch% {04}Запущена{\n #}))

%ch% {0f}Sense:         {#} 
sc query Sense >nul 2>&1
if ERRORLEVEL 1 (%ch% {0a}Не существует{\n #}) else (
sc query Sense | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключена{\n #}) ELSE (%ch% {04}Запущена{\n #}))

%ch% {0f}SecurityHealth:{#} 
sc query SecurityHealthService >nul 2>&1
if ERRORLEVEL 1 (%ch% {0a}Не существует{\n #}) else (
sc query SecurityHealthService | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключена{\n #}) ELSE (%ch% {04}Запущена{\n #}))

%ch% {0f}wscsvc:        {#} 
sc query wscsvc >nul 2>&1
if ERRORLEVEL 1 (%ch% {0a}Не существует{\n #}) else (
sc query wscsvc | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключена{\n #}) ELSE (%ch% {04}Запущена{\n #}))

%ch% {0f}SgrmBroker:     {#}
sc query SgrmBroker >nul 2>&1
if ERRORLEVEL 1 (%ch% {0a}Не существует{\n #}) else (
sc query SgrmBroker | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключена{\n #}) ELSE (%ch% {04}Запущена{\n #}))

echo.
%ch% {03}Драйверы защитника:{\n #}

%ch% {0f}WdNisDrv:{#} 
sc query WdNisDrv >nul 2>&1
if ERRORLEVEL 1 (%ch% {08}Не существует{#} ) else (
sc query WdNisDrv | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключен{#} ) ELSE (%ch% {04}Запущен{#} ))

%ch% {0f}WdBoot:{#} 
sc query WdBoot >nul 2>&1
if ERRORLEVEL 1 (%ch% {08}Не существует{#} ) else (
sc query WdBoot | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключен{#} ) ELSE (%ch% {04}Запущен{#} ))

%ch% {0f}WdFilter:{#} 
sc query WdFilter >nul 2>&1
if ERRORLEVEL 1 (%ch% {08}Не существует{#} ) else (
sc query WdFilter | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключен{#} ) ELSE (%ch% {04}Запущен{#} ))

%ch% {0f}MsSecFlt:{#} 
sc query MsSecFlt >nul 2>&1
if ERRORLEVEL 1 (%ch% {08}Не существует{#} ) else (
sc query MsSecFlt | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключен{#} ) ELSE (%ch% {04}Запущен{#} ))

%ch% {0f}SgrmAgent:{#} 
sc query SgrmAgent >nul 2>&1
if ERRORLEVEL 1 (%ch% {08}Не существует{\n #}) else (
sc query SgrmAgent | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (%ch% {0a}Отключен{\n #}) ELSE (%ch% {04}Запущен{\n #}))

rem Проверка задач
set "taskpathDef1=Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
set "taskpathDef2=Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
set "taskpathDef3=Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
set "taskpathDef4=Microsoft\Windows\Windows Defender\Windows Defender Verification"
for /f "delims=, tokens=3" %%I in (' 2^>nul SCHTASKS /QUERY /FO CSV /NH /TN "%taskpathDef1%" ') do set "replyTaskDef1=%%~I"
for /f "delims=, tokens=3" %%I in (' 2^>nul SCHTASKS /QUERY /FO CSV /NH /TN "%taskpathDef2%" ') do set "replyTaskDef2=%%~I"
for /f "delims=, tokens=3" %%I in (' 2^>nul SCHTASKS /QUERY /FO CSV /NH /TN "%taskpathDef3%" ') do set "replyTaskDef3=%%~I"
for /f "delims=, tokens=3" %%I in (' 2^>nul SCHTASKS /QUERY /FO CSV /NH /TN "%taskpathDef4%" ') do set "replyTaskDef4=%%~I"
if not "!replyTaskDef1!"=="" (
	if "!replyTaskDef1!"=="Отключена" ( set "TaskDefResult1={0a}Отключена{#}" ) else ( set "TaskDefResult1={04}Включена{#}" )
) else ( set "TaskDefResult1={0a}Не существует{#}" )
if not "!replyTaskDef2!"=="" (
	if "!replyTaskDef2!"=="Отключена" ( set "TaskDefResult2={0a}Отключена{#}" ) else ( set "TaskDefResult2={04}Включена{#}" )
) else ( set "TaskDefResult2={0a}Не существует{#}" )
if not "!replyTaskDef3!"=="" (
	if "!replyTaskDef3!"=="Отключена" ( set "TaskDefResult3={0a}Отключена{#}" ) else ( set "TaskDefResult3={04}Включена{#}" )
) else ( set "TaskDefResult3={0a}Не существует{#}" )
if not "!replyTaskDef4!"=="" (
	if "!replyTaskDef4!"=="Отключена" ( set "TaskDefResult4={0a}Отключена{#}" ) else ( set "TaskDefResult4={04}Включена{#}" )
) else ( set "TaskDefResult4={0a}Не существует{#}" )

echo.
%ch% {03}Задачи в планировщике:{\n #}
%ch% {0f}1. Windows Defender Cache Maintenance: %TaskDefResult1%{\n #}
%ch% {0f}2. Windows Defender Cleanup:           %TaskDefResult2%{\n #}
%ch% {0f}3. Windows Defender Scheduled Scan:    %TaskDefResult3%{\n #}
%ch% {0f}4. Windows Defender Verification:      %TaskDefResult4%{\n #}

rem Задачи защитника
if not exist "%SYSTEMROOT%\System32\Tasks\Microsoft\Windows\Windows Defender" (set "TasksDefender={0a}Задачи защитника удалены{#}") else (set "TasksDefender={4f}Задачи не удалены!{#}")
%ch% {04}^----^>{#} {0f}Задачи (папка Tasks): %TasksDefender% {\n #}

echo.
%ch% {0f} 1{#} - {0a}Удаление {08}[безвозвратно]{\n #}
%ch% {0f} 2{#} - {08}Отключение/включение {08}[в зависимости от состояния. требуется перезагрузка]{\n #}
%ch% {0f} 3{#} - {0c}Подробное состояние каталогов защитника{\n #}
%ch% {08} 4{#} - {08}ChangeLog{\n #}
echo.
set "input="
set /p input=*   Ваш выбор: 
if "%input%"=="1"    ( cls && goto DeleteDefender)
if "%input%"=="2"    ( cls && goto OnOffDefender)
if "%input%"=="3"    ( cls && goto Catalogs)
if "%input%"=="4"    ( cls && goto ChangeLog )

) else (
	cls & goto Start
)

:DeleteDefender
rem Считаем место на диске перед удалением
setlocal enableextensions enabledelayedexpansion
for /f "usebackq tokens=2 delims==" %%i in (`wmic.exe LogicalDisk where "Name='c:'" get FreeSpace /value`) do set sFreeSize=%%i
if defined sFreeSize (set sFreeSizePseudoMb=%sFreeSize:~0,-7%)

sc query WinDefend >nul 2>&1
if ERRORLEVEL 1 (
%ch% {0c} Кажется, защитник уже удален. Вы хотите все равно провести удаление?{\n #}
%ch% {08} 1{#} - {0c}Да{\n #}
%ch% {08} 2{#} - {08}Отмена{\n #}
choice /c 12 /n /m " "
if ERRORLEVEL 2 cls && goto Start
)

if not exist FuckDefender.exe (
%ch% {04} FuckDefender не обнаружен в рабочей папке{\n #}
echo  Скорее всего его удалил защитник ... 
echo  Будем выполнять удаление без него
echo  Однако, после удаления данной программой, необходимо дополнительно пройтись FuckDefender
echo  https://win10tweaker.ru/fwd
echo.
%ch% {08} Нажмите любую клавишу для продолжения && pause>nul && cls && goto NotFuckWD
)
cls

rem Поверх всех окон
@cmdow @ /TOP

rem Завершаем процессы защитника
%ch%    {0f} Завершаем процессы защитника ...{\n #}
powershell -command "Stop-Process -processname MsMpEng, SecurityHealthSystray, SecurityHealthService, SecurityHealthHost, smartscreen, SgrmBroker, SecHealthUI, uhssvc -Force" >nul

timeout /t 1 /nobreak>nul

taskkill /f /im MsMpEng.exe >nul 2>&1
taskkill /f /im SecurityHealthSystray.exe >nul 2>&1
taskkill /f /im SecurityHealthService.exe >nul 2>&1
taskkill /f /im SecurityHealthHost.exe >nul 2>&1
taskkill /f /im smartscreen.exe >nul 2>&1
taskkill /f /im SgrmBroker.exe >nul 2>&1
taskkill /f /im SecHealthUI.exe >nul 2>&1
taskkill /f /im uhssvc.exe >nul 2>&1

echo.
%ch%    {0e} Отключаем защитник и smartscreen ...{\n #}
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t reg_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t reg_DWORD /d 0 /f >nul
ren "%SystemRoot%\System32\smartscreen.exe" "smartscreen_fuck.exe" >nul 2>&1
echo.

if not exist "%SystemDrive%\Program Files\Windows Defender" (
%ch%    {0c} Пропустить удаление FuckDefender'ом ? {\n #}
%ch% {0f} 1 - Нет, не пропускать{\n #}
%ch% {0f} 2 - Да, я уже удалял 2 раза и точно уверен, что защитник удален и хочу удалить остальные компоненты{\n #}
choice /c 12 /n /m " "
if ERRORLEVEL 2 goto NotFuckWD
if ERRORLEVEL 1 echo>nul
)

rem Запускаем FuckDefender
start FuckDefender.exe
:#
(
for /f %%i in ('"tasklist| findstr /bilc:"FuckDefender.exe""') do (%ch%    {04} Началось удаление.{\n #} && echo. && %ch% {0e}    Выполняется удаление ...{\n #})
)|| goto #

timeout /t 1 /nobreak >nul
echo.
%ch%    {0f} Немного ожидания ...{\n #}
timeout /t 1 /nobreak>nul
:reload
tasklist | find "FuckDefender.exe" >nul 2>&1
if ERRORLEVEL 1 goto NoRecord
goto reload
:NoRecord
echo.
%ch%    {0a} Не закрывайте окно программы ...{\n #}
>nul 2>&1 taskkill /f /im Unlocker.exe
>nul 2>&1 taskkill /f /im FuckDefender.exe
>nul 2>&1 taskkill /f /im wscript.exe
echo.
start FuckDefender.exe
:#1
(
for /f %%i in ('"tasklist| findstr /bilc:"FuckDefender.exe""') do (echo>nul)
)|| goto #1
:reload1
tasklist | find "FuckDefender.exe" >nul 2>&1
if ERRORLEVEL 1 goto NoRecord1
goto reload1
:NoRecord1
>nul 2>&1 taskkill /f /im Unlocker.exe
>nul 2>&1 taskkill /f /im FuckDefender.exe
>nul 2>&1 taskkill /f /im wscript.exe


:NotFuckWD
%ch%    {0e} Удаляем службы Windows Defender ...{\n #}
sc delete SecurityHealthService >nul 2>&1
sc delete Sense >nul 2>&1
sc delete WdNisSvc >nul 2>&1
sc delete WinDefend >nul 2>&1
sc delete wscsvc >nul 2>&1
sc delete SgrmBroker >nul 2>&1
reg delete HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService /f >nul 2>&1
reg delete HKLM\SYSTEM\CurrentControlSet\Services\Sense /f >nul 2>&1
reg delete HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc /f >nul 2>&1
reg delete HKLM\SYSTEM\CurrentControlSet\Services\WinDefend /f >nul 2>&1
reg delete HKLM\SYSTEM\CurrentControlSet\Services\wscsvc /f >nul 2>&1
reg delete HKLM\SYSTEM\CurrentControlSet\Services\SgrmBroker /f >nul 2>&1

echo.
%ch%    {0e} Удаляем задания из планировщика ...{\n #}

powershell -command "Unregister-ScheduledTask -TaskName 'Windows Defender Cache Maintenance' -Confirm:$false" >nul
powershell -command "Unregister-ScheduledTask -TaskName 'Windows Defender Cleanup' -Confirm:$false" >nul
powershell -command "Unregister-ScheduledTask -TaskName 'Windows Defender Scheduled Scan' -Confirm:$false" >nul
powershell -command "Unregister-ScheduledTask -TaskName 'Windows Defender Verification' -Confirm:$false" >nul

schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /f >nul 2>&1
schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /f >nul 2>&1
schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /f >nul 2>&1
schtasks /Delete /TN "Microsoft\Windows\Windows Defender\Windows Defender Verification" /f >nul 2>&1

rd /s /q "%SystemRoot%\System32\Tasks\Microsoft\Windows\Windows Defender" >nul 2>&1

echo.
%ch%    {0e} Отключаем драйвера Windows Defender ...{\n #}
sc stop WdNisDrv >nul 2>&1
sc stop WdBoot >nul 2>&1
sc stop WdFilter >nul 2>&1
sc stop MsSecFlt >nul 2>&1
sc stop SgrmAgent >nul 2>&1

reg add HKLM\SYSTEM\CurrentControlSet\Services\WdNisDrv /v Start /t reg_DWORD /d 4 /f >nul
reg add HKLM\SYSTEM\CurrentControlSet\Services\WdBoot /v Start /t reg_DWORD /d 4 /f >nul
reg add HKLM\SYSTEM\CurrentControlSet\Services\WdFilter /v Start /t reg_DWORD /d 4 /f >nul
reg add HKLM\SYSTEM\CurrentControlSet\Services\MsSecFlt /v Start /t reg_DWORD /d 4 /f >nul
reg add HKLM\SYSTEM\CurrentControlSet\Services\SgrmAgent /v Start /t reg_DWORD /d 4 /f >nul

echo.
%ch%    {0e} Очищаем контекстное меню от Windows Defender ...{\n #}
reg delete "HKCR\*\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
reg delete "HKCR\Directory\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1
reg delete "HKCR\Drive\shellex\ContextMenuHandlers\EPP" /f >nul 2>&1

echo.
rem Удаляем все папки через CMD
%ch%    {0e} Удаляем папки и файлы Windows Defender ...{\n #}

RD /S /Q "%AllUsersProfile%\Microsoft\Windows Defender" >nul 2>&1
RD /S /Q "%AllUsersProfile%\Microsoft\Windows Defender Advanced Threat Protection" >nul 2>&1
RD /S /Q "%AllUsersProfile%\Microsoft\Windows Security Health" >nul 2>&1

RD /S /Q "%SystemDrive%\ProgramData\Microsoft\Windows Defender" >nul 2>&1
RD /S /Q "%SystemDrive%\ProgramData\Microsoft\Windows Security Health" >nul 2>&1

RD /S /Q "%SystemDrive%\Program Files\Windows Defender" >nul 2>&1
RD /S /Q "%SystemDrive%\Program Files\Windows Defender Advanced Threat Protection" >nul 2>&1
RD /S /Q "%SystemDrive%\Program Files\Windows Security" >nul 2>&1

RD /S /Q "%SystemDrive%\Program Files\PCHealthCheck" >nul 2>&1
RD /S /Q "%SystemDrive%\Program Files\Microsoft Update Health Tools" >nul 2>&1

RD /S /Q "%SystemDrive%\Program Files (x86)\Windows Defender" >nul 2>&1
RD /S /Q "%SystemDrive%\Program Files (x86)\Windows Defender Advanced Threat Protection" >nul 2>&1

RD /S /Q "%SystemRoot%\WinSxS\amd64_windows-defender-am-sigs_31bf3856ad364e35_10.0.19041.1_none_7275cb8fbafec5e1" >nul 2>&1

del /q /s "%SystemRoot%\Containers\WindowsDefenderApplicationGuard.wim" >nul 2>&1
del /q /s "%SystemRoot%\WinSxS\WindowsDefenderApplicationGuard.wim" >nul 2>&1

del /q "%SystemRoot%\security\database" >nul 2>&1

REM Удаление всех папок из WinSxS
REM For /F "usebackq delims=" %%d In (`2^>nul Dir "C:\Windows\WinSxS\*windows-defender*" /S /B /A:D`) Do Rd "%%d" /s /q

wmic os get caption /Format:List | find /i "11" >nul 2>&1
if "%ERRORLEVEL%"=="0" (
%ch%    {0b} Это - Windows 11. Удаляем защитник еще раз.
start /wait FuckDefender.exe
>nul 2>&1 taskkill /f /im Unlocker.exe
>nul 2>&1 taskkill /f /im FuckDefender.exe
>nul 2>&1 taskkill /f /im wscript.exe
)

rem Make window not always on top
@cmdow @ /NOT

rem Подсчет места на диске после удаления
for /f "usebackq tokens=2 delims==" %%i in (`wmic.exe LogicalDisk where "Name='c:'" get FreeSpace /value`) do set sFreeSize=%%i
if defined sFreeSize (set sFreeSizePseudoMb1=%sFreeSize:~0,-7%)
set /a Freed=!sFreeSizePseudoMb1! - !sFreeSizePseudoMb!
echo.
%ch%     {2f}!Freed! Мегабайт освобождено{\n #}
echo.
powershell -command "[Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms');[Windows.Forms.MessageBox]::show('Защитник Windows удален из системы. Требуется перезагрузка ПК .', 'DefenderKiller By Vlado')" >nul
%ch%    {0c} Любая клавиша для выхода.{\n #}
pause>nul
exit


:OnOffDefender
if not exist "%ProgramFiles%\Windows Defender" (
powershell -command "[Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms');[Windows.Forms.MessageBox]::show('Защитник удален, отключать нечего')" >nul
goto Start)

sc query SecurityHealthService | find /i "RUNNING" >nul 2>&1
IF ERRORLEVEL 1 (
%ch% {0e} Включаем защитник ...{\n #}
echo.
timeout /t 1 /nobreak>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /t reg_EXPAND_SZ /d "C:\Windows\system32\SecurityHealthSystray.exe" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t reg_DWORD /d "0x3" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\Sense" /v "Start" /t reg_DWORD /d "0x3" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WdBoot" /v "Start" /t reg_DWORD /d "0x0" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WdFilter" /v "Start" /t reg_DWORD /d "0x0" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WdNisDrv" /v "Start" /t reg_DWORD /d "0x3" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WdNisSvc" /v "Start" /t reg_DWORD /d "0x2" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WinDefend" /v "Start" /t reg_DWORD /d "0x2" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\wscsvc" /v "Start" /t reg_DWORD /d "0x2" /f >nul
reg delete "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /f >nul 2>&1
powershell -command "[Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms');[Windows.Forms.MessageBox]::show('Защитник Windows включен. Требуется перезагрузка ПК .', 'DefenderDisabler')" >nul
pause>nul && cls && goto Start
) else (
%ch% {0e} Отключаем защитник ...{\n #}
echo.
timeout /t 1 /nobreak>nul
reg add "HKLM\System\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t reg_DWORD /d "0x4" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\Sense" /v "Start" /t reg_DWORD /d "0x4" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WdBoot" /v "Start" /t reg_DWORD /d "0x4" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WdFilter" /v "Start" /t reg_DWORD /d "0x4" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WdNisDrv" /v "Start" /t reg_DWORD /d "0x4" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WdNisSvc" /v "Start" /t reg_DWORD /d "0x4" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\WinDefend" /v "Start" /t reg_DWORD /d "0x4" /f >nul
reg add "HKLM\System\CurrentControlSet\Services\wscsvc" /v "Start" /t reg_DWORD /d "0x4" /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t reg_DWORD /d 0 /f >nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f >nul 2>&1
powershell -command "[Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms');[Windows.Forms.MessageBox]::show('Защитник Windows отключен. Требуется перезагрузка ПК .', 'DefenderDisabler')" >nul
pause>nul && cls && goto Start
)


:ChangeLog
rem ChangeLog
%ch% {0c} v. 6{\n #}
echo -правильное удаление WindowsDefenderApplicationGuard.wim
echo -добавлена возможность увидеть текущее состояние каталогов защитника
echo -добавлены каталоги для удаления для последних версий Windows 10 и 11
echo -добавлено более тщательное удаление задач из планировщика и отключение процессов
echo -изменены проверки на наличие защитника
%ch% {0c} v. 5.2{\n #}
echo -добавлено отключение/включение защитника без удаления. требуется перезагрузка пк
%ch% {0c} v. 5.1{\n #}
echo -номера версий программы изменены с 26 на "адекватные" , начиная с 1 версии
echo -исправлен баг интерфейса, возникающий из-за одновременного запуска твикера и программы
%ch% {0c} v. 5{\n #}
echo -небольшие правки интерфейса и скрытие названия окна приложения
echo -smartscreen теперь отключается и через реестр
echo -учтена ситуация, когда FuckWD задетектился антивирусами и удаление необходимо производить без него
%ch% {0c} v. 4{\n #}
echo -поправлен changelog
echo -добавлена проверка перед удалением на наличие защитника в системе и вывод соответствующего сообщения
echo -изменен размер главного окна, поскольку не весь текст вмещался
echo -добавлено удаление папки с задачами защитника
echo -обезврежен smartscreen
echo -добавлена проверка на состояние защитника и отключение защитника, если не отключен
%ch% {0c} v. 3{\n #}
echo -добавлен ChangeLog
echo -добавлена проверка, если установлена Windows 11 - проходим дополнительный раз FuckDefender
echo -добавлена проверка на права TI перед удалением
echo -небольшие правки интерфейса, кода и описаний функций
echo -изменен способ получения информации о запущенных процессах защитника
echo -удалены лишние переменные
%ch% {0c} v. 2{\n #}
echo -добавлены цвета
echo -изменен подход к получению административных прав при запуске, если включен UAC
%ch% {0c} v. 1{\n #}
echo -создание и правки кода
echo.
%ch% {08} Любая клавиша для возврата{\n #}
pause>nul && cls && goto Start


:Catalogs
%ch% {0e} C:\Program Files:{\n #}
if not exist "%SystemDrive%\Program Files\Windows Defender" (
%ch% {0f}C:\Program Files\Windows Defender {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Program Files\Windows Defender {4f}НЕ УДАЛЕН{\n #}
)

if not exist "%SystemDrive%\Program Files\Windows Defender Advanced Threat Protection" (
%ch% {0f}C:\Program Files\Windows Defender Advanced Threat Protection {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Program Files\Windows Defender Advanced Threat Protection {04}НЕ УДАЛЕН{\n #}
)

if not exist "%SystemDrive%\Program Files\Windows Security" (
%ch% {0f}C:\Program Files\Windows Security {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Program Files\Windows Security {04}НЕ УДАЛЕН{\n #}
)

if not exist "%SystemDrive%\Program Files\PCHealthCheck" (
%ch% {0f}C:\Program Files\PCHealthCheck {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Program Files\PCHealthCheck {04}НЕ УДАЛЕН{\n #}
)

if not exist "%SystemDrive%\Program Files\Microsoft Update Health Tools" (
%ch% {0f}C:\Program Files\Microsoft Update Health Tools {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Program Files\Microsoft Update Health Tools {04}НЕ УДАЛЕН{\n #}
)

echo.
%ch% {0e} C:\Program Files (^x86^):{\n #}
if not exist "%ProgramFiles(x86)%\Windows Defender" (
%ch% {0f}C:\Program Files (^x86^)\Windows Defender {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Program Files (^x86^)\Windows Defender {04}НЕ УДАЛЕН{\n #}
)

if not exist "%ProgramFiles(x86)%\Windows Defender Advanced Threat Protection" (
%ch% {0f}C:\Program Files (^x86^)\Windows Defender Advanced Threat Protection {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Program Files (^x86^)\Windows Defender Advanced Threat Protection {04}НЕ УДАЛЕН{\n #}
)

echo.
%ch% {0e} C:\ProgramData\Microsoft:{\n #}

if not exist "%AllUsersProfile%\Microsoft\Windows Defender" (
%ch% {0f}C:\ProgramData\Microsoft\Windows Defender {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\ProgramData\Microsoft\Windows Defender {04}НЕ УДАЛЕН{\n #}
)

if not exist "%AllUsersProfile%\Microsoft\Windows Defender Advanced Threat Protection" (
%ch% {0f}C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection {04}НЕ УДАЛЕН{\n #}
)

if not exist "%AllUsersProfile%\Microsoft\Windows Security Health" (
%ch% {0f}C:\ProgramData\Microsoft\Windows Security Health {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\ProgramData\Microsoft\Windows Security Health {04}НЕ УДАЛЕН{\n #}
)
echo.

%ch% {0e} WindowsDefenderApplicationGuard.wim:{\n #}
if not exist "%SystemRoot%\Containers\WindowsDefenderApplicationGuard.wim" (
%ch% {0f}C:\Windows\Containers\WindowsDefenderApplicationGuard.wim {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Windows\Containers\WindowsDefenderApplicationGuard.wim {04}НЕ УДАЛЕН{\n #}
)

if not exist "%SystemRoot%\Containers\serviced\WindowsDefenderApplicationGuard.wim" (
%ch% {0f}C:\Windows\Containers\serviced\WindowsDefenderApplicationGuard.wim {0a}УДАЛЕН{\n #}
) else (
%ch% {0f}C:\Windows\Containers\serviced\WindowsDefenderApplicationGuard.wim {04}НЕ УДАЛЕН{\n #}
)

echo.
%ch% {08} Любая клавиша для возврата{\n #}

pause>nul && cls && goto Start