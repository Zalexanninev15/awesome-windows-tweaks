@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

:: ---------------------------------------------------  !!! Incorrect Data Found !!!  -------------------------------------------------------------
:: HKEY_CURRENT_USER\Control Panel\Mouse --> SmoothMouseXCurve"=hex:\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 00,00,00,00,00,00,00,00,\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> C0,CC,0C,00,00,00,00,00,\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 80,99,19,00,00,00,00,00,\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 40,66,26,00,00,00,00,00,\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 00,33,33,00,00,00,00,00
:: HKEY_CURRENT_USER\Control Panel\Mouse --> SmoothMouseYCurve"=hex:\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 00,00,00,00,00,00,00,00,\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 00,00,38,00,00,00,00,00,\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 00,00,70,00,00,00,00,00,\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 00,00,A8,00,00,00,00,00,\
:: HKEY_CURRENT_USER\Control Panel\Mouse --> 00,00,E0,00,00,00,00,00
:: ------------------------------------------------------------------------------------------------------------------------------------------------

Reg.exe add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseSpeed" /t REG_SZ /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold1" /t REG_SZ /d "0" /f
Reg.exe add "HKU\.DEFAULT\Control Panel\Mouse" /v "MouseThreshold2" /t REG_SZ /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorSensitivity" /t REG_DWORD /d "10000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "CursorUpdateInterval" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed" /v "IRRemoteNavigationDelta" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "AttractionRectInsetInDIPS" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "DistanceThresholdInDIPS" /t REG_DWORD /d "40" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismDelayInMilliseconds" /t REG_DWORD /d "50" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "MagnetismUpdateIntervalInMilliseconds" /t REG_DWORD /d "16" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism" /v "VelocityInDIPSPerSecond" /t REG_DWORD /d "360" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "8" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "ThreadPriority" /t REG_DWORD /d "31" /f
Reg.exe add "HKCU\Control Panel\Mouse" /v "MouseSensitivity" /t REG_SZ /d "10" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
