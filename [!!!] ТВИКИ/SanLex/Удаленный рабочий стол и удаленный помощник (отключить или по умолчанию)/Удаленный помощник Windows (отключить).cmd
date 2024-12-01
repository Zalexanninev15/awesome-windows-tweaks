@echo off

:: Отключить запрошенную удаленную помощь
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f

:: Требовать зашифрованные подключения RPC к удаленному рабочему столу
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fEncryptRPCTraffic" /t REG_DWORD /d 1 /f

:: Предотвращение совместного использования локальных дисков через узлы сеансов удаленных рабочих столов
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCdm" /t REG_DWORD /d 1 /f

:: Предотвращение нежелательных предложений удаленной помощи
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /t REG_DWORD /d 1 /f

pause
exit