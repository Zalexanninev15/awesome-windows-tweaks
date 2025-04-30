## Рекомендуемые браузеры

1. [🧹 Ungoogled-chromium](https://ungoogled-software.github.io/ungoogled-chromium-binaries/) / [🪄 Thorium](https://thorium.rocks) — "чистые" Chromium-браузеры
2. [Zen Browser](https://github.com/zen-browser/desktop) (Firefox-based) — самый красивый и невероятно плавный браузер с вертикальным расположением вкладок
3. [Vivaldi](https://vivaldi.com) — один из самых кастомизируемых браузеров (пользуюсь в данный момент)
4. [Brave](https://brave.com) — браузер со встроенным Torrent-клиентом и Tor-клиентом, имеет множество функций по повышению защищённости в сети, однако не стоит на него возлагать большие надежды, нравится их [фирменный поисковик](https://search.brave.com)


Обязательно скачиваем любой другой браузер, не используем встроенный Edge! 

> хз, кто юзает это говно, да ещё и инфу, помимо с винды, сливает майкам, причём добровольно, эх...

Мои рекомендации: Ungoogled-chromium, Thorium, Vivaldi, Brave, форки Firefox, остальное всё не стоит внимания!
> Я.Браузер, это говно сливает инфы много (+ куча рекламы, трекеров, просто дох\*\*), поэтому только для организаций и только из-за сертификатов в ру-сегменте.

> Примечание в более профессиональной форме: избегайте браузеров с высоким уровнем трекинга, таких как Яндекс.Браузер, Google Chrome, Microsoft Edge и другие.

## Другие браузеры

1. Личная ~гордость~ сборка браузера Cent — Cent TEMP!

> Представляют вашему вниманию собственную сборку Cent браузера для Live-систем (WinPE 7/8/8.1/10/11 x64), как временное решение, а может и на постоянной основе. Да и вообще данная сборка крайне оптимизированная, вышло очень хорошо.
> Я лично использую такую сборку в [WinPE от Сергея](https://sergeistrelec.name/), в качестве "быстрого браузера", а также на постоянной основе (до 2025 года), т.к. браузер скоростной и имеет кучу плюшек. Отличий от оригинального браузера много, особенно в плане специфичных настроек.

2. [Z15-OperaCustomInstaller_2024.exe](https://github.com/Zalexanninev15/awesome-windows-tweaks/raw/refs/heads/main/%D0%A1%D0%B5%D1%82%D1%8C,%20%D0%98%D0%BD%D1%82%D0%B5%D1%80%D0%BD%D0%B5%D1%82%20%D0%B8%20%D0%91%D1%80%D0%B0%D1%83%D0%B7%D0%B5%D1%80/Z15-OperaCustomInstaller_2024.exe) — моя сборка установщика стандартного браузера Opera на базе SFX-архива с аргументами для отключения сбора данных и их отправки ещё до первого запуска браузера, убирание рекламы и закрепления браузера на панели задач, отключение персонализированного контента. Сборка создана для личных нужд, но я всё равно не рекомендую использовать оперу где-либо.

```batch
cmd /c start Opera.exe /server-tracking-data=0 /show-intro-overlay=0 /personalized-ads=0 /personalized-content=0 /general-interests=0 /run-at-startup=0 /runimmediately /launchopera=0 /pintotaskbar=0 /language=Russian /enable-stats=0 /desktopshortcut=1 /allusers=0 /startmenushortcut=1 /pin-additional-shortcuts=0
```

## Полезности для браузеров

1. Если не работает синхронизация в Chromium-браузерах (во всех) — `chrome://sync-internals`
2. [Твики для Brave](https://github.com/Zalexanninev15/awesome-windows-tweaks/tree/main/%D0%A1%D0%B5%D1%82%D1%8C%2C%20%D0%98%D0%BD%D1%82%D0%B5%D1%80%D0%BD%D0%B5%D1%82%20%D0%B8%20%D0%91%D1%80%D0%B0%D1%83%D0%B7%D0%B5%D1%80/Brave)
3. [Твики для Edge и де- и инсталляторы](https://github.com/Zalexanninev15/awesome-windows-tweaks/tree/main/%D0%A1%D0%B5%D1%82%D1%8C%2C%20%D0%98%D0%BD%D1%82%D0%B5%D1%80%D0%BD%D0%B5%D1%82%20%D0%B8%20%D0%91%D1%80%D0%B0%D1%83%D0%B7%D0%B5%D1%80/Edge)
