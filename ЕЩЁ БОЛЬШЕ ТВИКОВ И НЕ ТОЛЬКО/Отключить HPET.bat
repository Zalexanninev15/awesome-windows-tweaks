@echo off

:: HPET - High Precision Event Timer - Высокоточный таймер событий
:: Потанциально ускоряет запуск ОС. Предотвращает загруженность процесса "Системные прерывания"

bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
bcdedit /deletevalue useplatformclock