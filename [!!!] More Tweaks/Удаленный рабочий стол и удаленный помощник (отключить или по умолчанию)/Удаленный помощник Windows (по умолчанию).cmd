@echo off

:: Отключить запрошенную удаленную помощь
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowToGetHelp" /f

:: Требовать зашифрованные подключения RPC к удаленному рабочему столу
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fEncryptRPCTraffic" /f

:: Предотвращение совместного использования локальных дисков через узлы сеансов удаленных рабочих столов
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCdm" /f

:: Предотвращение нежелательных предложений удаленной помощи
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v "fAllowUnsolicited" /f

pause
exit