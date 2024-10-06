@echo off
echo Made by ios1ph
echo Старт раннее выключенных триггеров в планировщике задач...
schtasks /change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\ApplicationData\appuriverifierdaily" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\ApplicationData\appuriverifierinstall" /ENABLE > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /ENABLE > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /ENABLE > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Device Information\Device" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Diagnosis\Scheduled" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\DiskFootprint\StorageSense" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\International\Synchronize Language Settings" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\LanguageComponentsInstaller\Installation" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Maps\MapsUpdateTask" /ENABLE > NUL 2>&1
schtasks /Change /TN "Microsoft\Windows\Maps\MapsToastTask" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\PushToInstall\Registration" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Setup\SetupCleanupTask" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Speech\SpeechModelDownloadTask" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\WindowsColorSystem\Calibration Loader" /ENABLE > NUL 2>&1
schtasks /change /TN "Microsoft\Windows\Work Folders\Work Folders Logon Synchronization" /ENABLE > NUL 2>&1
echo Завершено!
pause