@echo off
mode con: cols=106 
title Run Command  for windows 7,8 and 10
color 1f
:menu
cls
echo.
echo  ========================================================================================================
echo  =                                                                                                      =
echo  =  Run Command: A Complete List for Windows 7, 8, 8.1, 10, 11                                          =
echo  =                                                                                                      =
echo  ========================================================================================================
echo.
echo Select a task:
echo ==============
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 1 /f >nul
echo "01"  Add Hardware Wizard                               / hdwwiz
echo "02"  Adding a new Device                               / devicepairingwizard
echo "03"  Advanced User Accounts                            / azman.msc
echo "04"  Advanced User Accounts                            / netplwiz
echo "05"  Backup and Restore                                / sdclt
echo "06"  Calculator                                        / calc)
echo "07"  Certificates                                      / certmgr.msc
echo "08"  Character Map                                     / charmap
echo "09"  ClearType Tuner                                   / cttune
echo "10"  Color Management                                  / colorcpl
echo "11"  Command Prompt                                    / cmd
echo "12"  Component Services                                / comexp.msc
echo "13"  Component Services                                / dcomcnfg
echo "14"  Computer Management                               / compmgmt.msc
echo "15"  Computer Management                               / compmgmtlauncher
echo "16"  Connect to a Projector                            / displayswitch
echo "17"  Control Panel                                     / control
echo "18"  Credential Backup Restore                         / credwiz
echo "19"  Data Execution Prevention                         / systempropertiesdataexecutionprevention
echo "20"  Date and Time                                     / timedate.cpl
echo "21"  Device Manager                                    / hdwwiz.cpl
echo "22"  Diagnostics Troubleshooting                       / msdt
echo "23"  Digitizer Calibration Tool                        / tabcal
echo "24"  DirectX Diagnostic Tool                           / dxdiag
echo "25"  Disk Cleanup                                      / cleanmgr
echo "26"  Disk Defragmenter                                 / dfrgui
echo "27"  Disk Management                                   / diskmgmt.msc
echo "28"  Display                                           / dpiscaling
echo "29"  Display Color Calibration                         / dccw
echo "30"  DPAPI Key Migration Wizard                        / dpapimig
echo "31"  Driver Verifier Manager                           / verifier
echo "32"  Ease of Access Center                             / utilman
echo "33"  Event Viewer                                      / eventvwr.msc
echo "34"  Fax Cover Page Editor                             / fxscover
echo "35"  Game Controllers                                  / joy.cpl
echo "36"  Getting Started                                   / irprops.cpl
echo "37"  IExpress Wizard                                   / iexpress
echo "38"  Internet Explorer                                 / iexplore
echo "39"  Internet Options                                  / inetcpl.cpl
echo "40"  Language Pack Installer                           / lpksetup
echo "41"  Local Users and Groups                            / lusrmgr.msc
echo "42"  Magnifier                                         / magnify
echo "43"  Malicious Software Removal Tool                   / mrt
echo "44"  Math Input Panel                                  / mip
echo "45"  Microsoft Management Console                      / mmc
echo "46"  Mouse                                             / main.cpl
echo "47"  NAP Client Configuration                          / napclcfg.msc
echo "48"  Narrator                                          / narrator
echo "49"  Network Connections                               / ncpa.cpl
echo "50"  New Scan Wizard                                   / wiaacmgr
echo "51"  Notepad                                           / notepad
echo "52"  ODBC Data Source Administrator                    / odbcad32
echo "53"  On-Screen Keyboard                                / osk
echo "54"  Open Documents Folder                             / documents
echo "55"  Open Downloads Folder                             / downloads
echo "56"  Open Favorites Folder                             / favorites
echo "57"  Open Pictures Folder                              / pictures
echo "58"  Open Recent Folder                                / recent
echo "59"  Open Videos folder                                / videos
echo "60"  Paint                                             / mspaint
echo "61"  Pen and Touch                                     / tabletpc.cpl
echo "62"  People Near Me                                    / collab.cpl
echo "63"  Performance Monitor                               / perfmon.msc
echo "64"  Performance Options                               / systempropertiesperformance
echo "65"  Phone and Modem                                   / telephon.cpl
echo "66"  Phone Dialer                                      / dialer
echo "67"  Power Options                                     / powercfg.cpl
echo "68"  Printer User Interface                            / printui
echo "69"  Private Character Editor                          / eudcedit
echo "70"  Problem Steps Recorder                            / psr
echo "71"  Programs and Features                             / appwiz.cpl
echo "72"  Region and Language                               / intl.cpl
echo "73"  Registry Editor                                   / regedit
echo "74"  Remote Access Phonebook                           / rasphone
echo "75"  Remote Desktop Connection                         / mstsc
echo "76"  Resource Monitor                                  / resmon
echo "77"  SAM Lock Tool                                     / syskey
echo "78"  Screen Resolution                                 / desk.cpl
echo "79"  Services                                          / services.msc
echo "80"  Set Program Access Computers Default              / computerdefaults
echo "81"  Share Creation Wizard                             / shrpubw
echo "82"  Shared Folder Wizard                              / shrpubw
echo "83"  Shared Folders                                    / fsmgmt.msc
echo "84"  Snipping Tool                                     / snippingtool
echo "85"  Sound                                             / mmsys.cpl
echo "86"  Sound recorder                                    / soundrecorder
echo "87"  SQL Server Client Network Utilites                / cliconfg
echo "88"  Sticky Notes                                      / stikynot
echo "89"  Sync Center                                       / mobsync
echo "90"  System Configuration                              / msconfig
echo "91"  System Configuration Editor                       / sysedit
echo "92"  System Information                                / msinfo32
echo "93"  System Properties                                 / sysdm.cpl
echo "94"  System Properties (Advanced Tab)                  / systempropertiesadvanced
echo "95"  System Properties (Hardware Tab)                  / systempropertieshardware
echo "96"  System Properties(Remote Tab)                     / systempropertiesremote
echo "97"  System Properties (System Protection Tab          / systempropertiesprotection
echo "98"  System Restore                                    / rstrui
echo "99"  Task Manager                                      / taskmgr
echo "100" Task Scheduler                                    / taskschd.msc
echo "101" Taskbar and Start Menu                            / control.exe /name Microsoft.TaskbarandStartMenu
echo "102" Troubleshooting                                   / control.exe /name Microsoft.Troubleshooting
echo "103" Trusted Platform Module (TPM)                     / tpm.msc
echo "104" User Account Control Settings                     / useraccountcontrolsettings
echo "105" User Accounts                                     / control.exe /name Microsoft.UserAccounts
echo "106" Utility Manager                                   / utilman
echo "107" Version Reporter Applet                           / winver
echo "108" Volume Mixer                                      / sndvol
echo "109" Windows Action Center                             / wscui.cpl
echo "110" Windows Activation Client                         / slui
echo "111" Windows Anytime Upgrade                           / WindowsAnytimeUpgradeui
echo "112" Windows Anytime Upgrade Results                   / windowsanytimeupgraderesults
echo "113" Windows Disc Image Burning Tool                   / isoburn
echo "114" Windows DVD Maker                                 / dvdmaker
echo "115" Windows Easy Transfer                             / migwiz
echo "116" Windows Explorer                                  / explorer
echo "117" Windows Fax and Scan                              / wfs
echo "118" Windows Features                                  / optionalfeatures
echo "119" Windows Firewall                                  / firewall.cpl
echo "120" Windows Journal                                   / journal
echo "121" Windows Media Player                              / wmplayer
echo "122" Windows Memory Diagnostic Scheduler               / mdsched
echo "123" Windows Mobility Center                           / mblctr
echo "124" Windows PowerShell                                / powershell
echo "125" Windows PowerShell ISE                            / powershell_ise
echo "126" Windows Remote Assistance                         / msra
echo "127" Windows Repair Disc                               / recdisc
echo "128" Windows Script Host                               / wscript
echo "129" Windows Update                                    / wuapp
echo "130" Windows Update Standalone Installer               / wusa
echo "131" WMI Management                                    / wmimgmt.msc
echo "132" WordPad                                           / write
echo "133" XPS Viewer                                        / xpsrchvw
echo "134" Calculator Old                                    / win32calc
echo.
echo "0" Exit This Program
echo.
set /p run-cmd=Type option:
if "%run-cmd%"=="01" hdwwiz
if "%run-cmd%"=="02" devicepairingwizard
if "%run-cmd%"=="03" azman.msc
if "%run-cmd%"=="04" netplwiz
if "%run-cmd%"=="05" sdclt
if "%run-cmd%"=="06" calc
if "%run-cmd%"=="07" certmgr.msc
if "%run-cmd%"=="08" charmap
if "%run-cmd%"=="09" cttune
if "%run-cmd%"=="10" colorcpl
if "%run-cmd%"=="11" cmd
if "%run-cmd%"=="12" comexp.msc
if "%run-cmd%"=="13" dcomcnfg
if "%run-cmd%"=="14" compmgmt.msc
if "%run-cmd%"=="15" compmgmtlauncher
if "%run-cmd%"=="16" displayswitch
if "%run-cmd%"=="17" control
if "%run-cmd%"=="18" credwiz
if "%run-cmd%"=="19" systempropertiesdataexecutionprevention
if "%run-cmd%"=="20" timedate.cpl
if "%run-cmd%"=="21" hdwwiz.cpl
if "%run-cmd%"=="22" msdt
if "%run-cmd%"=="23" tabcal
if "%run-cmd%"=="24" dxdiag
if "%run-cmd%"=="25" cleanmgr
if "%run-cmd%"=="26" dfrgui
if "%run-cmd%"=="27" diskmgmt.msc
if "%run-cmd%"=="28" dpiscaling
if "%run-cmd%"=="29" dccw
if "%run-cmd%"=="30" dpapimig
if "%run-cmd%"=="31" verifier
if "%run-cmd%"=="32" utilman
if "%run-cmd%"=="33" eventvwr.msc
if "%run-cmd%"=="34" fxscover
if "%run-cmd%"=="35" joy.cpl
if "%run-cmd%"=="36" irprops.cpl
if "%run-cmd%"=="37" iexpress
if "%run-cmd%"=="38" iexplore
if "%run-cmd%"=="39" inetcpl.cpl
if "%run-cmd%"=="40" lpksetup
if "%run-cmd%"=="41" lusrmgr.msc
if "%run-cmd%"=="42" magnify
if "%run-cmd%"=="43" mrt
if "%run-cmd%"=="44" mip
if "%run-cmd%"=="45" mmc
if "%run-cmd%"=="46" main.cpl
if "%run-cmd%"=="47" napclcfg.msc
if "%run-cmd%"=="48" narrator
if "%run-cmd%"=="49" ncpa.cpl
if "%run-cmd%"=="50" wiaacmgr
if "%run-cmd%"=="51" notepad
if "%run-cmd%"=="52" odbcad32
if "%run-cmd%"=="53" osk
if "%run-cmd%"=="54" documents
if "%run-cmd%"=="55" downloads
if "%run-cmd%"=="56" favorites
if "%run-cmd%"=="57" pictures
if "%run-cmd%"=="58" recent
if "%run-cmd%"=="59" videos
if "%run-cmd%"=="60" mspaint
if "%run-cmd%"=="61" tabletpc.cpl
if "%run-cmd%"=="62" collab.cpl
if "%run-cmd%"=="63" perfmon.msc
if "%run-cmd%"=="64" systempropertiesperformance
if "%run-cmd%"=="65" telephon.cpl
if "%run-cmd%"=="66" dialer
if "%run-cmd%"=="67" powercfg.cpl
if "%run-cmd%"=="68" printui
if "%run-cmd%"=="69" eudcedit
if "%run-cmd%"=="70" psr
if "%run-cmd%"=="71" appwiz.cpl
if "%run-cmd%"=="72" intl.cpl
if "%run-cmd%"=="73" regedit
if "%run-cmd%"=="74" rasphone
if "%run-cmd%"=="75" mstsc
if "%run-cmd%"=="76" resmon
if "%run-cmd%"=="77" syskey
if "%run-cmd%"=="78" desk.cpl
if "%run-cmd%"=="79" services.msc
if "%run-cmd%"=="80" computerdefaults
if "%run-cmd%"=="81" shrpubw
if "%run-cmd%"=="82" shrpubw
if "%run-cmd%"=="83" fsmgmt.msc
if "%run-cmd%"=="84" snippingtool
if "%run-cmd%"=="85" mmsys.cpl
if "%run-cmd%"=="86" soundrecorder
if "%run-cmd%"=="87" cliconfg
if "%run-cmd%"=="88" stikynot
if "%run-cmd%"=="89" mobsync
if "%run-cmd%"=="90" msconfig
if "%run-cmd%"=="91" sysedit
if "%run-cmd%"=="92" msinfo32
if "%run-cmd%"=="93" sysdm.cpl
if "%run-cmd%"=="94" systempropertiesadvanced
if "%run-cmd%"=="95" systempropertieshardware
if "%run-cmd%"=="96" systempropertiesremote
if "%run-cmd%"=="97" systempropertiesprotection
if "%run-cmd%"=="98" rstrui
if "%run-cmd%"=="99" taskmgr
if "%run-cmd%"=="100" taskschd.msc
if "%run-cmd%"=="101" control.exe /name Microsoft.TaskbarandStartMenu
if "%run-cmd%"=="102" control.exe /name Microsoft.Troubleshooting
if "%run-cmd%"=="103" tpm.msc
if "%run-cmd%"=="104" useraccountcontrolsettings
if "%run-cmd%"=="105" control.exe /name Microsoft.UserAccounts
if "%run-cmd%"=="106" utilman
if "%run-cmd%"=="107" winver
if "%run-cmd%"=="108" sndvol
if "%run-cmd%"=="109" wscui.cpl
if "%run-cmd%"=="110" slui
if "%run-cmd%"=="111" WindowsAnytimeUpgradeui
if "%run-cmd%"=="112" windowsanytimeupgraderesults
if "%run-cmd%"=="113" isoburn
if "%run-cmd%"=="114" dvdmaker
if "%run-cmd%"=="115" migwiz
if "%run-cmd%"=="116" explorer
if "%run-cmd%"=="117" wfs
if "%run-cmd%"=="118" optionalfeatures
if "%run-cmd%"=="119" firewall.cpl
if "%run-cmd%"=="120" journal
if "%run-cmd%"=="121" wmplayer
if "%run-cmd%"=="122" mdsched
if "%run-cmd%"=="123" mblctr
if "%run-cmd%"=="124" powershell
if "%run-cmd%"=="125" powershell_ise
if "%run-cmd%"=="126" msra
if "%run-cmd%"=="127" recdisc
if "%run-cmd%"=="128" wscript
if "%run-cmd%"=="129" wuapp
if "%run-cmd%"=="130" wusa
if "%run-cmd%"=="131" wmimgmt.msc
if "%run-cmd%"=="132" write
if "%run-cmd%"=="133" xpsrchvwr
if "%run-cmd%"=="134" win32calc
if "%run-cmd%"=="0" exit
goto menu
Pause
goto menu
