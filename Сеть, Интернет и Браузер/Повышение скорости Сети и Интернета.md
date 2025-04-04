# Повышение скорости сети

## 1. Планировщик пакетов QoS

🤔 Если кто не знал, то Windows 11 &amp; 10 резервирует 20% пропускной способности вашей скорости Интернета для загрузки различных обновлений, отправки статистики и т.п. 🤬

1. Можно отключить данное ограничение. Для этого нажмите WIN + R и выполните команду `gpedit.msc`

2. Слева перейдите по пути:

`Конфигурация компьютера — Административные шаблоны — Сеть — Планировщик пакетов QoS`

3. Откройте параметр `Ограничить резервируемую пропускную способность`

4. Включите параметр и в качестве значения `Ограничение пропускной способности (%)` укажите **0**. 

5. Примените изменения и перезагрузите ПК.

## 2. Оптимизация сетевого адаптера

1. Правой кнопкой мыши по `TCPOptimizer.exe`, открыть от Администратора

2. Выбираем свой сетевой адаптер.

3. В программе меняем Connection Speed на значение скорости сети по тарифу Интернет-провайдера, снизу Choose Settings → Optimal.

4. Apply changes, не перезагружаемся.

5. В параметрах сетевого адаптера (смотреть здесь: Win+R  → `ncpa.cpl`) изменить параметры Разгрузка при большой отправке v2 (Large Send Offload) для IPv4 и IPv6 на Disabled (Выключено), ОК.

6. Перезагружаем ПК.

7. Можно также воспользоваться, после перезагрузки, утилитой *КфоСпид*, если имеются проблемы с потерей пакетов.

## 3. DNS

Можно воспользоваться утилитами из папки **DNS** для выбора наиболее лучшего DNS сервера. Далее следует пропинговать найденные DNS (ip адреса) и выбрать 2 с наиболее низкой задержкой и ввести их в параметрах сетевого адаптера.

## 4. Ограничения для программ

Также можно воспользоваться Firewall и *Лимитером*, чтобы ограничить доступ ненужным программам в сеть и, следовательно, ускорить работу. Можно также применить твики для браузеров Edge (или удалить его) и Brave.

## 5. А также...

Можно воспользоваться постом на сайте: https://oshibkis.ru/medlennaya-skorost-interneta-na-kompyutere-kak-ispravit

Я применяю также эти настройки: https://www.reddit.com/r/buildapc/comments/tft3u0/is_realtek_25gbe_lan_issue_fixed/

Настройки адаптера:

- Advanced EEE - Disabled

- ARP Offload - Disabled

- EEE Max Support Speed - 1.0 Gbps Full Duplex
Energy-Efficient Ethemet - Disabled

- Flow Control - Disabled

- Gigabit Lite - Disabled

- Green Ethemet - Disabled

- Interrupt Moderation - Disabled

- IPv4 Checksum Offload - Rx & Tx Enabled

- Jumbo Frame - Disabled

- Large Send Offload v2 (IPv4) (Разгрузка при большой отправке v2 IPv4) - Disabled

- Large Send Offload v2 (IPv6) (Разгрузка при большой отправке v2 IPv6) - Disabled

- Maximum Number of RSS Queues - 4 Queues

- Network Address - Not Present

- NS Offload - Disabled

- Power Saving Mode - Disabled

- Priority & VLAN - Disabled

- Receive Buffers - 512

- Receive Side Scaling - Enabled

- Shutdown Wake-On-Lan - Disabled

- Speed & Duplex - Auto

- TCP Checksum Offload (IPv4) - Disabled

- TCP Checksum Offload (IPv6) - Disabled

- Transmit Buffers - 1024 (/2048)

- UDP Checksum Offload (IPv4) - Disabled

- UDP Checksum Offload (IPv6) - Disabled

- VLAN ID - 0

- Wake on Magic Packet - Disabled

- Wake on magic packet when system is in the S0ix power state - Disabled

- Wake on pattern match - Disabled

- WOL & Shutdown Link Speed - Not Speed Down

If you have issues with still after these settings then here's the most recommended (in the context of addressing potential internet crashes) things I can suggest to do:

Flow Control: Enabling flow control is the most recommended setting because it helps manage network congestion and prevents packet loss, which can contribute to improved stability and reduced connectivity issues.

Receive Buffers and Transmit Buffers: Increasing buffer sizes (e.g., setting Receive Buffers to 1024 and Transmit Buffers to 2048) can help prevent packet loss and enhance network stability, making it the second most recommended adjustment.

Energy-Efficient Ethernet: Disabling Energy-Efficient Ethernet is a good practice to prevent potential connectivity issues, such as intermittent disconnections, making it the third most recommended setting.

Jumbo Frame: Leaving Jumbo Frame disabled unless you specifically require it is the fourth most recommended option. Enabling Jumbo Frame without proper support from your network infrastructure or devices can potentially lead to connectivity issues.

Priority & VLAN: If you don't have specific requirements for Quality of Service (QoS) prioritization or VLAN tagging, leaving this setting disabled is the fifth most recommended option. Enabling it without proper configuration or the need for these features may introduce complications.

Wake-on-LAN and Power Saving Mode: Disabling Wake-on-LAN and Power Saving Mode, if you don't require these features, is the sixth most recommended choice. These settings are generally unrelated to internet crashes, but disabling them helps prevent any potential issues related to waking the system or power management affecting network connectivity.

## В случае проблем

Использовать *Complete Internet Repair*