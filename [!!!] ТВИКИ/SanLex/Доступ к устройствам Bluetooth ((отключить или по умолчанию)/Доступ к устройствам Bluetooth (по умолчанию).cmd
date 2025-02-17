@echo off

echo --- Bluetooth drivers and services (default) ---

reg add "HKLM\System\CurrentControlSet\Services\BluetoothUserService" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BTAGService" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\BTHUSB" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\Microsoft_Bluetooth_AvrcpTransport" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKLM\System\CurrentControlSet\Services\RFCOMM" /v "Start" /t REG_DWORD /d "3" /f

reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Connectivity\AllowBluetooth" /v "value" /t REG_DWORD /d "2" /f > nul

echo Finished, please reboot your device for changes to apply.
pause
exit /b