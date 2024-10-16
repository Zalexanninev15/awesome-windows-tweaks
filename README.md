# Awesome Windows Tweaks

[![](https://img.shields.io/badge/OS-Windows-informational?logo=windows)](https://github.com/Zalexanninev15/awesome-windows-tweaks)
[![](https://img.shields.io/badge/release-v1.7-blue.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks) 
[![](https://img.shields.io/github/last-commit/Zalexanninev15/awesome-windows-tweaks/main.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks/commits/main)
[![](https://img.shields.io/github/stars/Zalexanninev15/awesome-windows-tweaks.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks/stargazers)
[![](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![](https://img.shields.io/badge/Donate-FFDD00.svg?logo=buymeacoffee&logoColor=black)](https://teletype.in/@zalexanninev15/donate)

# Описание

Невероятно большое количество скриптов, твиков, программ и всего остального для первоначальной настройки Windows. Просто скачайте репозиторий как архив и вы будете всегда иметь под рукой всё что нужно для почти любой настройки Windows 11 &amp; 10!

Очень многие скрипты собрал лично сам, перерыл просто тонну информации.

## Важные шаги настройки, всё что не описано, но имеется в папке - можете использовать по своему усмотрению.

1. После установки включаем Интернет, обязательно!

2. Выключаем защиту от подделки Защитнике Windows

3. Открываем PowerShell от Администратора

3.1 ```Set-ExecutionPolicy -Scope LocalMachine Unrestricted -Force```

3.2 ```powershell -command "irm https://get.activated.win | iex"``` - активация системы / офиса

4. Устанавливаем драйвера для всех устройств. Для этого можете использовать Driver Booster (**Drivers.zip**)

5. Перезапускаем систему!

6. Обязательно скачиваем любой другой браузер, Microsoft Edge будет удалён в процессе! 

> хз, кто юзает это говно, да ещё и инфу, помимо с винды, сливает майкам, причём добровольно, эх...
> Мои рекомендации: Cent, Thorium, Selenium, Vivaldi, Brave, форки Firefox, остальное всё не стоит внимания!
> Я.Браузер, это говно сливает инфы много (+ куча рекламы, трекеров, просто дох\*\*), поэтому только для организаций и только из-за сертификатов в ру-сегменте.

7. Главный файл START.cmd - запускать строго от имени администратора

* после перезагрузки переключение языков - Ctrl+Shift

* включено отображение скрытых системных файлов, не пугайтесь

8. Далее рекомендую запустить из папки **DK_PASS_DK2024WT** файл **DefenderKiller.bat**

9. Остальное настраивайте на свой вкус. Для некоторых программ в папках уже имеются мои конфиги.

### Повышение скорости сети:

Если кто не знал, то Windows 10 резервирует 20% пропускной способности вашей скорости Интернета для загрузки различных обновлений, отправки статистики и т.п.

1. Мы можем отключить данное ограничение. Для этого нажмите WIN + R и выполните команду gpedit.msc для открытия Редактора локальной групповой политики.

2. Слева перейдите по пути Конфигурация компьютера — Административные шаблоны — Сеть — Планировщик пакетов QoS и откройте параметр Ограничить резервируемую пропускную способность.

3. Включите параметр и в качестве значения Ограничение пропускной способности (%) укажите 0. Примените изменения и перезагрузите ПК.
