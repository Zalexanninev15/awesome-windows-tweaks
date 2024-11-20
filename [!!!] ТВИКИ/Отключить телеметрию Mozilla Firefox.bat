SC STOP MozillaMaintenance
SC CONFIG MozillaMaintenance start= disabled
SC DELETE MozillaMaintenance

Reg.exe add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableTelemetry" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableDefaultBrowserAgent" /t REG_DWORD /d "1" /f
