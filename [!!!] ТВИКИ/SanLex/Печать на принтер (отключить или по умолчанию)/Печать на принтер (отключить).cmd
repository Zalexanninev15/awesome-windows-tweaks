@echo off

echo --- Disabling printing ---

echo Removing 'Print' from context menu...
reg add "HKCR\SystemFileAssociations\image\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
for %%a in (
    "batfile"
    "cmdfile"
    "docxfile"
    "fonfile"
    "htmlfile"
    "inffile"
    "inifile"
    "JSEFile"
    "otffile"
    "pfmfile"
    "regfile"
    "rtffile"
    "ttcfile"
    "ttffile"
    "txtfile"
    "VBEFile"
    "VBSFile"
    "WSFFile"
) do (
    reg add "HKCR\%%~a\shell\print" /v "ProgrammaticAccessOnly" /f
)

echo Disabling ProgrammaticAccessOnly...
reg add "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print" /v "HideBasedOnVelocityId" /t REG_DWORD /d "6527944" /f
reg add "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo" /v "LegacyDisable" /t REG_SZ /d "" /f
reg add "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f
reg add "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo" /v "HideBasedOnVelocityId" /t REG_DWORD /d "6527944" /f

echo Disabling services...
reg add "HKLM\System\ControlSet001\Services\Spooler" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\ControlSet001\Services\PrintWorkFlowUserSvc" /v "Start" /t REG_DWORD /d "4" /f

echo Disabling capabilities...
Dism /Online /Remove-Capability /CapabilityName:Print.Fax.Scan~~~~0.0.1.0
Dism /Online /Remove-Capability /CapabilityName:Print.Management.Console~~~~0.0.1.0

echo Disabling features...
for %%a in (
    "Printing-Foundation-Features"
    "Printing-Foundation-InternetPrinting-Client"
    "Printing-XPSServices-Features"
    "Printing-PrintToPDFServices-Features"
) do (
    dism /Online /Disable-Feature /FeatureName:"%%a" /NoRestart
)

if "%~1" == "/silent" exit /b

echo]
echo Finished, please reboot your device for changes to apply.
pause
exit /b