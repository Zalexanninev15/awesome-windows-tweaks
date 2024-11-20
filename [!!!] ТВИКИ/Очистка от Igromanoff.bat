@echo off

:: Проверяем, существует ли папка Dismpp
if exist Dismpp (
    :: Если папка существует, переходим в нее и запускаем Dism++x64.exe
    cd Dismpp
    start Dism++x64.exe
) else (
    :: Если папки не существует, скачиваем архив, распаковываем его и запускаем Dism++x64.exe
    Utils\busybox.exe wget https://github.com/scode18/apps-for-all-tweaker/raw/main/For.gamers/Optimization/Dismpp.7z
    Utils\7za x Dismpp.7z
    cd Dismpp
    start Dism++x64.exe
)

:: Очищаем временные файлы и папки
:: Переходим в папку Temp в профиле пользователя
cd %userprofile%\AppData\Local\Temp\
:: Удаляем все файлы и папки в Temp
rd /q /s %userprofile%\AppData\Local\Temp\
del /q /f /s %userprofile%\AppData\Local\Temp\*.*
:: Переходим в папку Temp в системной директории
cd %windir%\Temp\
:: Удаляем все файлы и папки в Temp
del /q /f /s %windir%\Temp\*.*
rd /q /s %windir%\Temp\

:: Очищаем кеш NVIDIA
del /q /f /s %userprofile%\AppData\Local\NVIDIA\GLCache\*.*
rd /q /s %userprofile%\AppData\Local\NVIDIA\GLCache\

:: Очищаем папку WinSxS
Dism.exe /Online /Cleanup-Image /StartComponentCleanup