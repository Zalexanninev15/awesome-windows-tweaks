@echo off
echo Made by ios1ph
echo.
echo Ищем в реестре видеокарту...
FOR /F "usebackq tokens=2,* skip=2" %%L IN (`reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v ProviderName`) DO SET Provider1=%%M
FOR /F "usebackq tokens=2,* skip=2" %%L IN (`reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v ProviderName`) DO SET Provider2=%%M
FOR /F "usebackq tokens=2,* skip=2" %%L IN (`reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v ProviderName`) DO SET Provider3=%%M

if "%Provider1%" equ "NVIDIA" goto prov1
if "%Provider2%" equ "NVIDIA" goto prov2
if "%Provider3%" equ "NVIDIA" goto prov3

:prov1
echo Нашел!
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyglobZero" /t REG_DWORD /d 1 /f
echo HDCP успешно выключено!
echo.
goto end

:prov2
echo Нашел!
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "RMHdcpKeyglobZero" /t REG_DWORD /d 1 /f
echo HDCP успешно выключено!
goto end

:prov3
echo Нашел!
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "RMHdcpKeyglobZero" /t REG_DWORD /d 1 /f
echo HDCP успешно выключено!
echo.
goto end2

:end2
echo У тебя AMD.
echo AMD говно)))
goto end
:end
