# Awesome Windows Tweaks

[![](https://img.shields.io/badge/platform-Windows-informational)](https://github.com/Zalexanninev15/awesome-windows-tweaks)
[![](https://img.shields.io/badge/release-v1.10-blue.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks) 
[![](https://img.shields.io/github/last-commit/Zalexanninev15/awesome-windows-tweaks/main.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks/commits/main)
[![](https://img.shields.io/github/stars/Zalexanninev15/awesome-windows-tweaks.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks/stargazers)
[![](https://img.shields.io/github/forks/Zalexanninev15/awesome-windows-tweaks.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks/network/members)
[![](https://img.shields.io/github/issues/Zalexanninev15/awesome-windows-tweaks.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks/issues?q=is%3Aopen+is%3Aissue)
[![](https://img.shields.io/github/issues-closed/Zalexanninev15/awesome-windows-tweaks.svg)](https://github.com/Zalexanninev15/awesome-windows-tweaks/issues?q=is%3Aissue+is%3Aclosed)
[![](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![](https://img.shields.io/badge/Donate-FFDD00.svg?logo=buymeacoffee&logoColor=black)](https://z15.neocities.org/donate)

# Описание

Невероятно большое количество скриптов, твиков, программ и всего остального для первоначальной настройки Windows и не только. Просто скачайте репозиторий как архив и вы будете всегда иметь под рукой всё что нужно для почти любой настройки Windows 11 &amp; 10!

Очень многие скрипты собрал лично сам, перерыл просто тонну информации. Для некоторых программ в папках уже имеются мои конфиги, также ищите **Z15** и **Zalexanninev15** в названиях, это мои сборки.

##  Рекомендации автора после установки Windows

1. После установки включаем Интернет, обязательно!

2. Выключаем защиту от подделки Защитнике Windows. Можно удалить его используя **DefenderKiller** из папки `[!!!] APP_SETT`

3. Открываем PowerShell от Администратора

3.1 ```Set-ExecutionPolicy -Scope LocalMachine Unrestricted -Force```

3.2 ```powershell -command "irm https://get.activated.win | iex"``` - активация системы / офиса.

4. Устанавливаем драйвера для всех устройств. Для этого можете использовать Driver Booster (**InstallDrivers**`...`**.zip** из папки Драйвера)

5. Перезапускаем систему!

6. Обязательно скачиваем любой другой браузер, Microsoft Edge будет удалён в процессе! 

> хз, кто юзает это говно, да ещё и инфу, помимо с винды, сливает майкам, причём добровольно, эх...
> Мои рекомендации: Cent, Thorium, Selenium, Vivaldi, Brave, форки Firefox, остальное всё не стоит внимания!
> Я.Браузер, это говно сливает инфы много (+ куча рекламы, трекеров, просто дох\*\*), поэтому только для организаций и только из-за сертификатов в ру-сегменте.

> Примечание в более профессиональной форме: избегайте браузеров с высоким уровнем трекинга, таких как Яндекс.Браузер, Google Chrome, Microsoft Edge и другие.

7. Главный файл моей конфигурации `START.cmd` - запускать строго от Администратора. Рекомендуется посмотреть перед применением, всё таки делает много изменений.

* после перезагрузки переключение языков - Ctrl+Shift (возможно останется как и было)

* включено отображение скрытых системных файлов, не пугайтесь

8. Можно удалить Защитник Windows используя **DefenderKiller** из папки `[!!!] APP_SETT`

9. Устанавливаем системные компоненты (**DrectX Redist** и **Visual C Runtimes** (полностью))

1. Остальное настраивайте на свой вкус. Для некоторых программ в папках уже имеются мои конфиги, также ищите **Z15** и **Zalexanninev15** в названиях, это мои сборки.

## MAX_TWEAKS Cleaner

**MAX_TWEAKS Cleaner** – мой самописный клинер от мусора в Windows, браузерах и избавления от временных файлов и пустых папок. 

Запустить в PowerShell можно так:
```powershell
irm https://clcr.me/mtc | iex
```