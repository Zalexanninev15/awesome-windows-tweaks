@echo off
echo Отключение dynamic tick
bcdedit /set disabledynamictick yes
echo Отключение synthetic timers
bcdedit /set useplatformtick yes
echo Успешно!
pause