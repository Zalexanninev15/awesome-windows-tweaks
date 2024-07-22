@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

REM ; от iosiph-a с любовью жи ес
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "DisplayName" /t REG_SZ /d "@%%SystemRoot%%\system32\ClipSVC.dll,-103" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "ErrorControl" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "ImagePath" /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\svchost.exe -k wsappx" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Type" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Description" /t REG_SZ /d "@%%SystemRoot%%\system32\ClipSVC.dll,-104" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "DependOnService" /t REG_MULTI_SZ /d "rpcss" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "ObjectName" /t REG_SZ /d "LocalSystem" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "ServiceSidType" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "RequiredPrivileges" /t REG_MULTI_SZ /d "SeCreateGlobalPrivilege\0SeChangeNotifyPrivilege\0SeSystemEnvironmentPrivilege" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "FailureActions" /t REG_BINARY /d "84030000000000000000000001000000140000000000000000000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "LaunchProtected" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "InactivityShutdownDelay" /t REG_DWORD /d "300" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "RefreshRequired" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDll" /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\ClipSVC.dll" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDllUnloadOnStop" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ProcessBiosKey" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Security" /v "Security" /t REG_BINARY /d "01001480b8000000c4000000140000003000000002001c000100000002801400ff010f00010100000000000100000000020088000600000000001400ff01020001010000000000051200000000001800fd010f0001020000000000052000000020020000000014009d0102000101000000000005040000000000180094000000010200000000000f0200000001000000000014009d010200010100000000000506000000000014001400000001010000000000050b000000010100000000000512000000010100000000000512000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\0" /v "Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\0" /v "Action" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\0" /v "GUID" /t REG_BINARY /d "67d190bc70943941a9babe0bbbf5b74d" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\0" /v "Data0" /t REG_BINARY /d "360034004400310044003000340035002d0046003600370035002d0034003600300042002d0038004100390034002d003500370030003200340036004200330036004400410042000000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\0" /v "DataType0" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\1" /v "Type" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\1" /v "Action" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\1" /v "GUID" /t REG_BINARY /d "16287a2d5e0cfc459ce7570e5ecde9c9" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\1" /v "Data0" /t REG_BINARY /d "7508bca321078541" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\1" /v "DataType0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\2" /v "Type" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\2" /v "Action" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\2" /v "GUID" /t REG_BINARY /d "16287a2d5e0cfc459ce7570e5ecde9c9" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\2" /v "Data0" /t REG_BINARY /d "7510bca321078541" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\2" /v "DataType0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\3" /v "Type" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\3" /v "Action" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\3" /v "GUID" /t REG_BINARY /d "16287a2d5e0cfc459ce7570e5ecde9c9" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\3" /v "Data0" /t REG_BINARY /d "7518bca321078541" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\3" /v "DataType0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\4" /v "Type" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\4" /v "Action" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\4" /v "GUID" /t REG_BINARY /d "16287a2d5e0cfc459ce7570e5ecde9c9" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\4" /v "Data0" /t REG_BINARY /d "7520bca321078541" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\4" /v "DataType0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\5" /v "Type" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\5" /v "Action" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\5" /v "GUID" /t REG_BINARY /d "16287a2d5e0cfc459ce7570e5ecde9c9" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\5" /v "Data0" /t REG_BINARY /d "7528bca321078541" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\5" /v "DataType0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\6" /v "Type" /t REG_DWORD /d "7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\6" /v "Action" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\6" /v "GUID" /t REG_BINARY /d "16287a2d5e0cfc459ce7570e5ecde9c9" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\6" /v "Data0" /t REG_BINARY /d "7530bca321078541" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\TriggerInfo\6" /v "DataType0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\BFE" /v "Start" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\iphlpsvc" /v "Start" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\KeyIso" /v "Start" /t REG_DWORD /d "3" /f

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
)
Cls
goto:eof
