REM ; Отключить автообновление карт
Reg.exe add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d "0" /f
REM ; Prefetcher, Superfetch: 2 – ускорение только загрузки системы, 3 – ускорение загрузки системы и запуска приложений
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "2" /f
REM ; Разрешить гостевой вход (для доступа к расшаренным папкам)
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\LanmanWorkstation\Parameters" /v "AllowInsecureGuestAuth" /t REG_DWORD /d "1" /f
REM ; Не расширять динамические VHD до максимума
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t REG_DWORD /d "4" /f
REM ; Стандартная служба сборщика центра диагностики Microsoft
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f
REM ; Служба функциональных возможностей для подключенных пользователей и телеметрии
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f
REM ; Служба помощника по совместимости программ
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\PcaSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ; Служба демонстрации магазина
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\RetailDemo" /v "Start" /t REG_DWORD /d "4" /f
REM ; Служба Medic центра обновления Windows
Reg.exe add "HKLM\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d "4" /f

Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f
REM ; Удалить из панели навигации "Съёмные диски"
Reg.exe delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f
REM ; Удалить из панели навигации "Съёмные диски"
REM ; Отключить рекомендуемые приложения
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
REM ; Запретить эксперименты на этом компьтере
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
REM ; Отключить получение инсайдерских сборок Windows
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d "0" /f
REM ; Скрыть "Программа предварительной оценки"
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /v "HideInsiderPage" /t REG_DWORD /d "1" /f
REM ; Отключить программу по улучшению качества программного обеспечения Windows
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f
REM ; Разрешить установку неопубликованых приложений
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /v "AllowAllTrustedApps" /t REG_DWORD /d "1" /f
REM ; Разрешить приложения из любых источников
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AicEnabled" /t REG_SZ /d "Anywhere" /f
REM ; Прозрачность панели задач
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t REG_DWORD /d "1" /f
REM ; Запретить приложениям с других устройств открывать приложения на этом устройстве
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SmartGlass" /v "UserAuthPolicy" /t REG_DWORD /d "0" /f
REM ; Отключить автообновление плитко-приложений
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "2" /f
REM ; Отключить загрузку обновлений с других компьютеров
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode_BackCompat" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
REM ; Отключить загрузку обновлений с других компьютеров
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadModeProvider" /t REG_DWORD /d "8" /f
REM ; Отключить загрузку улучшеных значков устройств
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /t REG_DWORD /d "1" /f
REM ; Разрешить локальные сценарии и удалённые подписанные сценарии
Reg.exe add "HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "RemoteSigned" /f
REM ; Разрешить локальные сценарии и удалённые подписанные сценарии
Reg.exe add "HKLM\SOFTWARE\Wow6432Node\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "RemoteSigned" /f

:: ---------------------------------------------------  !!! Incorrect Data Found !!!  -------------------------------------------------------------
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> FriendlyTypeName"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> 77,00,73,00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> 00,65,00,72,00,5c,00,50,00,68,00,6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> 65,00,72,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,35,00,36,00,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap --> 00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command --> 00,31,00,00,00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> FriendlyTypeName"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> 77,00,73,00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> 00,65,00,72,00,5c,00,50,00,68,00,6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> 65,00,72,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,35,00,35,00,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF --> 00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open --> MuiVerb"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open --> 00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open --> 72,00,5c,00,70,00,68,00,6f,00,74,00,6f,00,76,00,69,00,65,00,77,00,65,00,72,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open --> 00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,34,00,33,00,00,00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command --> 00,31,00,00,00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> FriendlyTypeName"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> 77,00,73,00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> 00,65,00,72,00,5c,00,50,00,68,00,6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> 65,00,72,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,35,00,35,00,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg --> 00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open --> MuiVerb"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open --> 00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open --> 72,00,5c,00,70,00,68,00,6f,00,74,00,6f,00,76,00,69,00,65,00,77,00,65,00,72,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open --> 00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,34,00,33,00,00,00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command --> 00,31,00,00,00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> FriendlyTypeName"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> 77,00,73,00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> 00,65,00,72,00,5c,00,50,00,68,00,6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> 65,00,72,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,35,00,37,00,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png --> 00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command --> 00,31,00,00,00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open --> MuiVerb"=hex(2):40,00,25,00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open --> 00,20,00,50,00,68,00,6f,00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open --> 72,00,5c,00,70,00,68,00,6f,00,74,00,6f,00,76,00,69,00,65,00,77,00,65,00,72,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open --> 00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,33,00,30,00,34,00,33,00,00,00
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> @=hex(2):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 6e,00,64,00,6c,00,6c,00,33,00,32,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 00,50,00,72,00,6f,00,67,00,72,00,61,00,6d,00,46,00,69,00,6c,00,65,00,73,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 25,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,20,00,50,00,68,00,6f,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 00,74,00,6f,00,20,00,56,00,69,00,65,00,77,00,65,00,72,00,5c,00,50,00,68,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 6f,00,74,00,6f,00,56,00,69,00,65,00,77,00,65,00,72,00,2e,00,64,00,6c,00,6c,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 00,22,00,2c,00,20,00,49,00,6d,00,61,00,67,00,65,00,56,00,69,00,65,00,77,00,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 5f,00,46,00,75,00,6c,00,6c,00,73,00,63,00,72,00,65,00,65,00,6e,00,20,00,25,\
:: HKEY_LOCAL_MACHINE\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command --> 00,31,00,00,00
:: ------------------------------------------------------------------------------------------------------------------------------------------------

REM ; Отключить Кортану
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
REM ; Отключить историю поиска
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f
REM ; Отключить автоматическое скрытие полос прокрутки
Reg.exe add "HKCU\Control Panel\Accessibility" /v "DynamicScrollbars" /t REG_DWORD /d "0" /f
REM ; Ускорить проводник и завершение процессов
Reg.exe add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t REG_SZ /d "3000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "100" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t REG_SZ /d "3000" /f
Reg.exe add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t REG_SZ /d "3000" /f
REM ; Разрешить исправлять размытость DPI
Reg.exe add "HKCU\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d "1" /f
REM ; Использование 100% качества картинки
Reg.exe add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "100" /f
REM ; Запретить веб-сайтам доступ к списку языков
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
REM ; Отключить предложение настроить Интернет
Reg.exe add "HKCU\Software\Microsoft\Internet Connection Wizard" /v "Completed" /t REG_DWORD /d "1" /f
REM ; Запретить приложениям работать в фоновом режиме
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
REM ; Ускорить автозагрузку программ
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f
REM ; Запретить отслеживать запуски приложений
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d "0" /f
REM ; Отключить индетификатор рекламы
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
REM ; Отключить советы и рекомендации от Microsoft
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
REM ; Получать обновления только от Microsoft
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownLoadMode" /t REG_DWORD /d "1" /f
REM ; Отключить автозапуск
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t REG_DWORD /d "1" /f
REM ; Отключить GameDVR
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
REM ; Отключить GameDVR
Reg.exe add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
REM ; Отключить GameDVR
Reg.exe add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "0" /f
REM ; Отключить встроенную проверку подлинности Windows
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "EnableNegotiate" /t REG_DWORD /d "0" /f
REM ; Отключить предупреждение о просмотре веб-страницы через безопасное соединение
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnonZoneCrossing" /t REG_DWORD /d "0" /f
REM ; Отключить предупреждение "Информация переданная через Интернет..."
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v "1601" /t REG_DWORD /d "0" /f
REM ; Отключить сихронизацию
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f
REM ; Отключить сихронизацию
Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync" /v "Enabled" /t REG_DWORD /d "0" /f
REM ; Скрыть текст инструкций в ножницах
Reg.exe add "HKCU\Software\Microsoft\Windows\TabletPC\Snipping Tool" /v "DisplaySnipInstructions" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Windows\TabletPC\Snipping Tool" /v "IsScreenSketchBannerExpanded" /t REG_DWORD /d "0" /f
REM ; Отключить персонализацию рукописного ввода
Reg.exe add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "0" /f
REM ; Отключить телеметрию и сбор данных
Reg.exe add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f
REM ; Отключить формирование отзывов
Reg.exe add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f
REM ; Запретить приложеним использовать голосовую активацию
Reg.exe add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v "AgentActivationOnLockScreenEnabled" /t REG_DWORD /d "0" /f
REM ; Скрыть вкладку "Предыдущие версии"
Reg.exe add "HKCU\Software\Policies\Microsoft\PreviousVersions" /v "DisableLocalPage" /t REG_DWORD /d "1" /f
REM ; Отключить возможность участия в программе по улучшению справки
Reg.exe add "HKCU\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Software\Policies\Microsoft\Assistance\Client\1.0" /v "NoImplicitFeedback" /t REG_DWORD /d "1" /f
REM ; Отключить "Ознакомиться с другими результами поиска..."
Reg.exe add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f
REM ; Показывать полностью имена длинных файлов в проводнике
Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "IconTitleWrap" /t REG_SZ /d "0" /f
REM ;  Отключить автоматическое обучение
Reg.exe add "HKCU\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
REM ; Отключить автозапуск диктора
Reg.exe add "HKCU\Control Panel\Accessibility\SlateLaunch" /v "LaunchAT" /t REG_DWORD /d "0" /f
Reg.exe add "HKCU\Control Panel\Accessibility\SlateLaunch" /v "ATapp" /t REG_SZ /d "" /f
REM ; Отключить залипание SHIFT
Reg.exe add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
REM ;[HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys]
REM ; Включить звук переключения CAPS
REM ;"Flags"="63"
REM ; Включить "NumLock"
Reg.exe add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpg" /t REG_SZ /d "PhotoViewer.FileAssoc.Jpeg" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".wdp" /t REG_SZ /d "PhotoViewer.FileAssoc.Wdp" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jfif" /t REG_SZ /d "PhotoViewer.FileAssoc.JFIF" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".dib" /t REG_SZ /d "PhotoViewer.FileAssoc.Bitmap" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".png" /t REG_SZ /d "PhotoViewer.FileAssoc.Png" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".tiff" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jxr" /t REG_SZ /d "PhotoViewer.FileAssoc.Wdp" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".bmp" /t REG_SZ /d "PhotoViewer.FileAssoc.Bitmap" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpe" /t REG_SZ /d "PhotoViewer.FileAssoc.Jpeg" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".jpeg" /t REG_SZ /d "PhotoViewer.FileAssoc.Jpeg" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".gif" /t REG_SZ /d "PhotoViewer.FileAssoc.Gif" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows Photo Viewer\Capabilities\FileAssociations" /v ".tif" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap" /v "ImageOptionFlags" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\imageres.dll,-70" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\command" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Bitmap\shell\open\DropTarget" /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF" /v "EditFlags" /t REG_DWORD /d "65536" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF" /v "ImageOptionFlags" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\imageres.dll,-72" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\command" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.JFIF\shell\open\DropTarget" /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg" /v "EditFlags" /t REG_DWORD /d "65536" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg" /v "ImageOptionFlags" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\imageres.dll,-72" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\command" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Jpeg\shell\open\DropTarget" /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png" /v "ImageOptionFlags" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\imageres.dll,-71" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\command" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Png\shell\open\DropTarget" /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp" /v "EditFlags" /t REG_DWORD /d "65536" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp" /v "ImageOptionFlags" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\DefaultIcon" /ve /t REG_SZ /d "%%SystemRoot%%\System32\wmphoto.dll,-400" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\command" /f
Reg.exe add "HKLM\SOFTWARE\Classes\PhotoViewer.FileAssoc.Wdp\shell\open\DropTarget" /v "Clsid" /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\upfc.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f
