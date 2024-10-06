@echo off
echo Уборка ненужных устройств...
"%cd%\devmanview\devmanview.exe" /disable "UMBus Root Bus Enumerator" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Root Print Queue" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "NDIS Virtual Network Adapter Enumerator" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Microsoft Virtual Drive Enumerator" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Microsoft Hyper-V Virtualization Infrastructure Driver" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Microsoft GS Wavetable Synth" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Microsoft Device Association Root Enumerator" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Composite Bus Enumerator" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Microsoft UEFI-Compliant System" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "System board" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "SM Bus Controller" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Motherboard resources" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "PCI Encryption/Decryption Controller" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Microsoft Windows Management Interface for ACPI" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "High precision event timer" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Base System Device" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "PCI Data Acquisition and Signal Processing Controller" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "PCI Simple Communications Controller" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "PCI Device" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Unknown Device" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "PCI Simple Communications Controller" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "PCI Memory Controller" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "PCI standard RAM Controller" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "ACPI Processor Aggregator" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "ACPI Wake Alarm" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "System Speaker" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "System Timer" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "WAN Miniport (IKEv2)" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "WAN Miniport (IP)" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "WAN Miniport (IPv6)" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "WAN Miniport (L2TP)" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "WAN Miniport (Network Monitor)" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "WAN Miniport (PPPOE)" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "WAN Miniport (PPTP)" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "WAN Miniport (SSTP)" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Programmable Interrupt Controller" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Numeric Data Processor" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Microsoft Kernel Debug Network Adapter" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "HID-compliant consumer control device" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Plug and Play Software Device Enumerator" > NUL 2>&1
"%cd%\devmanview\devmanview.exe" /disable "Direct memory access controller" > NUL 2>&1
echo Завершено!
pause