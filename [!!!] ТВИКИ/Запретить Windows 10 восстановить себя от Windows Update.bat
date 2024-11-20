REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing" /v "UseWindowsUpdate" /t REG_DWORD /d 2 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing" /v "LocalSourcePath" /t REG_EXPAND_SZ /d %NOURL% /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing" /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{7C0F6EBB-E44C-48D1-82A9-0561C4650831}Machine\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing" /v "UseWindowsUpdate" /t REG_DWORD /d 2 /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{7C0F6EBB-E44C-48D1-82A9-0561C4650831}Machine\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing" /v "LocalSourcePath" /t REG_EXPAND_SZ /d %NOURL% /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{7C0F6EBB-E44C-48D1-82A9-0561C4650831}Machine\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing" /v "**del.RepairContentServerSource" /t REG_SZ /d " " /f
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Group Policy Objects\{7C0F6EBB-E44C-48D1-82A9-0561C4650831}Machine\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing" /f
