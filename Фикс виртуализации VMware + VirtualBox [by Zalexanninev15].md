## Фикс виртуализации

1. Отключить Песочиницу + Hyper-V в компонентах Windows
> Быстро попасть в окно управления компонентами Windows: `optionalfeatures`
2. `bcdedit /set hypervisorlaunchtype off`
3. Перезагрузить ПК
4. `gpedit.msc` → **Enter** → Конфигурация компьютера → Административные шаблоны → Система → Device Guard → Включить средство обеспечения безопасности на основе виртуализации → Отключено
5. Перезагрузить ПК

## Дополнительная настройка:

### VirtualBox (Nested VT-x/AMD-V)

1. `cmd` → `cd C:\Program Files\Oracle\VirtualBox` → `VBoxManage.exe list vms`
2. `VBoxManage.exe modifyvm "x" --nested-hw-virt on`

Где x - выбранная виртуалка (имя) из списка (напр.: Win10, ISP)

### VMware (3D-ускорение)

[Читать инструкцию](https://wiki.archlinux.org/title/VMware#Enable_3D_graphics_on_Intel,_Optimus_and_AMD)

Если кратко — нужно добавить в VMX файл виртуальной машины (открыть можно тем же Notepad++) строчку `mks.gl.allowBlacklistedDrivers = "TRUE`

Можно также добавить в файл `C:\Users\%username%\AppData\Roaming\VMware\preferences.ini` строчку `mks.vk.allowUnsupportedDevices = "TRUE"`
