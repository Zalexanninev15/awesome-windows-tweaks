@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{36fc9e60-c465-11cf-8056-444553540000}" /v "LowerFilters" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{36fc9e60-c465-11cf-8056-444553540000}" /v "UpperFilters" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{36fc9e60-c465-11cf-8056-444553540000}" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e965-e325-11ce-bfc1-08002be10318}" /v "LowerFilters" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e965-e325-11ce-bfc1-08002be10318}" /v "UpperFilters" /f
REM ;--------------------------------------------------------------------------------------------------
REM ;;Если проблемы с мышью
REM ;[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96f-e325-11ce-bfc1-08002be10318}]
REM ;"UpperFilters"=hex(7):6d,00,6f,00,75,00,63,00,6c,00,61,00,73,00,73,00,00,00,00,\
REM ;  00
REM ;--------------------------------------------------------------------------------------------------
REM ;;Если проблемы с клавиатурой
REM ;[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}]
REM ;"UpperFilters"=hex(7):6b,00,62,00,64,00,63,00,6c,00,61,00,73,00,73,00,00,00,00,\
REM ;  00
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e965-e325-11ce-bfc1-08002be10318}" /f

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
)
Cls
goto:eof
