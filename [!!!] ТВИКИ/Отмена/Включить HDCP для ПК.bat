@echo off
echo Made by ios1ph
FOR /F "usebackq tokens=2,* skip=2" %%L IN (`reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v ProviderName`) DO SET Provider1=%%M
FOR /F "usebackq tokens=2,* skip=2" %%L IN (`reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v ProviderName`) DO SET Provider2=%%M
FOR /F "usebackq tokens=2,* skip=2" %%L IN (`reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0002" /v ProviderName`) DO SET Provider3=%%M

if "%Provider1%" equ "NVIDIA" goto prov1
if "%Provider2%" equ "NVIDIA" goto prov2
if "%Provider3%" equ "NVIDIA" goto prov3

:prov1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyglobZero" /f
echo HDCP успешно включено!
echo.
goto end

:prov2
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0001" /v "RMHdcpKeyglobZero" /f
echo HDCP успешно включено!
goto end

:prov3
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0003" /v "RMHdcpKeyglobZero" /f
echo HDCP успешно включено!
echo.
goto end2

:end2
echo amd govno)))
goto end
:end
