@echo off

echo --- Enabling printing ---

echo Adding 'Print' to context menu...
reg delete "HKCR\SystemFileAssociations\image\shell\print" /v "ProgrammaticAccessOnly" /f
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
    reg delete "HKCR\%%~a\shell\print" /v "ProgrammaticAccessOnly" /f
)

reg delete "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print" /v "LegacyDisable" /f
reg delete "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print" /v "ProgrammaticAccessOnly" /f
reg delete "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\Print" /v "HideBasedOnVelocityId" /f
reg delete "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo" /v "LegacyDisable" /f
reg delete "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo" /v "ProgrammaticAccessOnly" /f
reg delete "HKCR\AppX4ztfk9wxr86nxmzzq47px0nh0e58b8fw\Shell\PrintTo" /v "HideBasedOnVelocityId" /f

echo Enabling services...
reg add "HKLM\System\ControlSet001\Services\Spooler" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\System\ControlSet001\Services\PrintWorkFlowUserSvc" /v "Start" /t REG_DWORD /d "3" /f

echo Enabling capabilities (this might take a while)...
Dism /Online /Add-Capability /CapabilityName:Print.Fax.Scan~~~~0.0.1.0
Dism /Online /Add-Capability /CapabilityName:Print.Management.Console~~~~0.0.1.0

echo Enabling features...
for %%a in (
    "Printing-Foundation-Features"
    "Printing-Foundation-InternetPrinting-Client"
    "Printing-XPSServices-Features"
    "Printing-PrintToPDFServices-Features"
) do (
    dism /Online /Enable-Feature /FeatureName:"%%a" /NoRestart
)

echo]
echo Finished, please reboot your device for changes to apply.
pause
exit /b