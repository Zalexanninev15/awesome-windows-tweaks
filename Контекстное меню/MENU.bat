:ContextMenu
	@echo off
	setlocal EnableDelayedExpansion
rem ����஢��, ����, ���室 � ����� Work, �����⨥ �ࠢ �� �����������
	chcp 866 >nul
	Color 0f
	cd /d "%~dp0Work"
	reg query "HKU\S-1-5-19" >nul 2>&1
	if "%Errorlevel%" NEQ "0" nircmd elevate "%~f0" & exit
	
rem ����� �ணࠬ��, ������� ��६����� 梥⭮�� ⥪�� � ����᪠ ������ �� ����� TrustedInstaller
	set Version=1.3.7
	set ch=cecho.exe
	set "TI=nircmd execmd TrInstaller /c nircmd execmd"

rem ������ �ணࠬ��, �ᯮ������� �� 業��� �࠭� � �������� �ணࠬ��
	Mode 81,37 & nircmd win center foreground & nircmd win settext foreground "CMEditor"
	
rem �� ���窠 ������ ���� ���, ��᪮��� ��। ��� ������� ��६����� ch � 梥�� ⥪�⮬
	if /i "%USERNAME%"=="SYSTEM" %ch% {0c} ����᪠�� ���� �� ����� TI ����� ����{\n #}{0c} �㤥� �믮���� ��室{\n #}&& timeout /t 8 >nul && exit

rem �஢�ઠ ������ ��������� WMIC, ����� �� ������ ���� 㤠��� � ���� �� 㬮�砭�� � ��⮩ Windows
	if not exist "%SystemRoot%\System32\wbem\WMIC.exe" %ch% {04} � ��� 㤠��� ��������� WMIC, ����� � �ਣ����쭮� Windows ���� ��-㬮�砭��{\n #} �����ᯮᮡ����� ������ �⨫��� ���������� ��� ������ ������� ���������.{\n #}{04} �㤥� �믮���� ��室{\n #}&& timeout /t 10 >nul && exit

rem �஢�ઠ ���ᨨ Windows - 10/11
	wmic os get caption /Format:List | find /i "11" >nul 2>&1 && set "ThisWin11=Yes"
	if not defined ThisWin11 (set Win11Menu=08) else (set Win11Menu=0b)
	
rem �������� ���ᯮ��㥬��� 䠩��
	del /q TI.exe >nul 2>&1

rem �஢�ન
(
	reg query "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" && set "Acces=0c" || set "Acces=0a"
	reg query "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" && set "Lib=0c" || set "Lib=0a"
	reg query "HKLM\Software\Classes\Folder\shell\pintohome" && set "Pin=0c" || set "Pin=0a"
	reg query "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" && set "Comp=0c" || set "Comp=0a"
	reg query "HKLM\Software\Classes\exefile\shell\runasuser" /v "ProgrammaticAccessOnly" && set "RunUser=0a" || set "RunUser=0c"
	reg query "HKLM\Software\Classes\*\shellex\ContextMenuHandlers\ModernSharing" && set "Share=0c" || set "Share=0a"
	if defined ThisWin11 reg query "HKLM\Software\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" && set "Share=0c" || set "Share=0a"
	reg query "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" && set "Send=0c" || set "Send=0a"
	reg query "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}" && set "ToStart=0c" || set "ToStart=0a"
	reg query "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}" && set "Rest=0c" || set "Rest=0a"
	reg query "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" && set "SendTo=0c" || set "SendTo=0a"
	reg query "HKCR\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" && set "TaskBar=0c" || set "TaskBar=0a"
	reg query "HKLM\Software\Classes\Folder\shell\opennewprocess" && set "NewProc=0c" || set "NewProc=0a"
	reg query "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" && set "Rotate=0c" || set "Rotate=0a"
	reg query "HKLM\Software\Classes\txtfile\shell\print" /v "ProgrammaticAccessOnly" && set "Print=0a" || set "Print=0c"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Display" && set "DispSett=0c" || set "DispSett=0a"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "ProgrammaticAccessOnly" && set "Personaliz=0a" || set "Personaliz=0c"
	reg query "HKLM\Software\Classes\exefile\shell\runas" /v "ProgrammaticAccessOnly" && set "Admin=0a" || set "Admin=0c"
	reg query "HKCR\SystemFileAssociations\.jpeg\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" && set "WallPap=0a" || set "WallPap=0c"
	reg query "HKCR\DesktopBackground\shellex\ContextMenuHandlers\DesktopSlideshow" && set "NextWall=0c" || set "NextWall=0a"
	reg query "HKCR\DesktopBackground\Shell\Display" && set "DeleteFull=Yes" || set "DeleteFull=No"
	(
rem ������ ���� PowerShell �����
	reg query "HKLM\Software\Classes\Directory\shell\Powershell" /v "ProgrammaticAccessOnly" &&Set /A Directory=1 || Set /A Directory=0
	reg query "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "ProgrammaticAccessOnly" && Set /A BackGround=1 || Set /A BackGround=0
	reg query "HKLM\Software\Classes\Drive\shell\Powershell" /v "ProgrammaticAccessOnly" && Set /A Drive=1 || Set /A Drive=0
	set "PSHere=0c"
	reg query "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyAsPathMenu" && set "CopyPath=0c" || set "CopyPath=0a"
	If !Directory!==1 If !BackGround!==1 If !Drive!==1 set "PSHere=0a"
	)
	
	(
	rem ������ ���� �������
	set "CmdHere=0c"
	reg query "HKLM\Software\Classes\Directory\shell\cmd" /v "HideBasedOnVelocityId" &&Set /A CMDHEREBackGround=1 || Set /A CMDHEREBackGround=0
	reg query "HKLM\Software\Classes\Directory\background\shell\cmd" /v "HideBasedOnVelocityId" && Set /A CMDHEREBackInFolders=1 || Set /A CMDHEREBackInFolders=0
	If !CMDHEREBackGround!==1 If !CMDHEREBackInFolders!==1 set "CmdHere=0a"
	)
	
rem �������⥫�� ����ன�� �㭪� ��ࠢ���/���ᮭ�������
	if !Send!==0a (set AdditionalSend=08) else (set AdditionalSend=0e)
	if !Personaliz!==0a (set AdditionalPersonal=08) else (set AdditionalPersonal=0e)
	
rem ����ﭨ� ���⥪�⭮�� ���� ������ �����
	if not exist "%SystemRoot%\ru-RU\explorer.exe.mui_orig" (set "TskBarStatus={08}�⠭���⭮� ���⥪�⭮� ����") else (set "TskBarStatus={0a}����������筮� ���⥪�⭮� ����")
) >nul 2>&1

	%ch% {0a} ������ {08}梥⮬ - �㭪� 㤠���; {0c}����{08} - �����뢠����{\n #}{\n #}
	%ch% {%Win11Menu%} 0{#} {%Win11Menu%}Windows 11{\n #}
	%ch% {0f} 1{#} {%Acces%}�।��⠢��� �����{\n #}
	%ch% {0f} 2{#} {%Lib%}�������� � ������⥪�{\n #}
	%ch% {0f} 3{#} {%Pin%}���९��� �� ������ ����ண� ����㯠{\n #}
	%ch% {0f} 4{#} {%Comp%}��ࠢ����� �஡��� � ᮢ���⨬�����{\n #}
	%ch% {0f} 5{#} {%RunUser%}����� �� ����� ��㣮�� ���짮��⥫�{\n #}
	%ch% {0f} 6{#} {%Share%}��ࠢ��� [����������]{\n #}
	%ch% {0f} 7{#} {%Send%}��ࠢ��� [� �ணࠬ��]{#} {08}^| {%AdditionalSend%}70 - �������⥫�� ����ன��{\n #}
	%ch% {0f} 8{#} {%ToStart%}���९��� �� ��砫쭮� �࠭�{\n #}
	%ch% {0f} 9{#} {%Rest%}����⠭����� �०��� �����{\n #}
	%ch% {0f}10{#} {%SendTo%}��ࠢ��� �� ���ன�⢮{\n #}
	%ch% {0f}11{#} {%TaskBar%}���९��� �� ������ �����{\n #}
	%ch% {0f}12{#} {%NewProc%}������ � ����� �����{\n #}
	%ch% {0f}13{#} {%Rotate%}�������� �ࠢ�/�����{\n #}
	%ch% {0f}14{#} {%Print%}�����{\n #}
	%ch% {0f}15{#} {%DispSett%}��ࠬ���� �࠭�{\n #}
	%ch% {0f}16{#} {%Personaliz%}���ᮭ������� {#}{08}^| {%AdditionalPersonal%}60 - �������⥫�� ����ன��{\n #}
	%ch% {0f}17{#} {%Admin%}����� �� ����� ����������� {08}[bat/cmd/exe/lnk]{\n #}
	%ch% {0f}18{#} {%NextWall%}������饥 䮭���� ����ࠦ���� ࠡ�祣� �⮫�{\n #}
	%ch% {0f}19{#} {%WallPap%}������� 䮭��� ����ࠦ����� ࠡ�祣� �⮫�{\n #}
	%ch% {0f}20{#} {%CopyPath%}����஢��� ��� ����{\n #}
	%ch% {0f}21{#} {%PSHere%}������ ���� PowerShell �����{\n #}
	%ch% {0f}22{#} {%CmdHere%}������ ���� �������{\n #}
	if "%DeleteFull%"=="Yes" (%ch% {4f}77{04} ������ �� �㭪�� {4f}�� ࠧ{08} [1-18] [� ���⢥ত�����]{\n #}{\n #}) else (%ch% {4f}77{0e} ����⠭����� �� �㭪�� {4f}�� ࠧ{08} [1-18] [� ���⢥ত�����]{\n #}{\n #})
	%ch% {0f}23{#} {09}��㣮�{\n #}
	%ch% {0f}24{#} {0b}����稩 �⮫ � ���箪 ��������{\n #}
	%ch% {0f}25{#} {0b}���� �������{\n #}
	%ch% {0f}26{#} {0b}������ ����� {08}[ᥩ�� %TskBarStatus%]{\n #}
	%ch% {0f}27{#} {0b}Win + X{\n #}
	
	echo.
	%ch% {0f}30{#} {3f}�஢���� ����������{08} [{0e}⥪��� ����� - {09}%Version%{08}]{\n #}{\n #}

	set "input="
	set /p input=* ��� �롮�: 
	if not defined input   endlocal & cls & goto ContextMenu
	if "%input%"=="0"    goto Windows11Menu
	if "%input%"=="1"    goto GiveAcces
	if "%input%"=="2"    goto AddToLibrary
	if "%input%"=="3"    goto PinToFastAcces
	if "%input%"=="4"    goto Compatibility
	if "%input%"=="5"    goto RunFromUser
	if "%input%"=="6"    goto Share
	if "%input%"=="7"    goto SendTO
	if "%input%"=="70"  goto SendToAdditional
	if "%input%"=="8"    goto PinToStart
	if "%input%"=="9"    goto RestoreVersion
	if "%input%"=="10"  goto SendToDevice
	if "%input%"=="11"  goto PinTaskbar
	if "%input%"=="12"  goto OpenNewProcessAndTab
	if "%input%"=="13"  goto RotateImage
	if "%input%"=="14"  goto Print
	if "%input%"=="15"  goto DisplaySettings
	if "%input%"=="16"  goto Personalize
	if "%input%"=="60"  goto PersonalizeAdditional
	if "%input%"=="17"  goto RunAsAdmin
	if "%input%"=="18"  goto NextWallPaper
	if "%input%"=="19"  goto BackGroundImage
	if "%input%"=="20"  goto CopyAsPath
	if "%input%"=="21"  goto OpenPowerShellWhere
	if "%input%"=="22"  goto OpenCmdHere
	if "%input%"=="23"  goto Additional
	if "%input%"=="24"  goto DesktopAndPC
	if "%input%"=="25"  goto CreateItem
	if "%input%"=="26"  goto TaskBarMenu
	if "%input%"=="27"  goto WinX
	if "%input%"=="30"  goto CheckUpdate
	if "%input%"=="77"  goto FullContMenu
	) else (
		cls & %ch%    {04}����� �㭪樨 �� ������� {\n #} & echo.
		timeout /t 2 >nul & endlocal & cls & goto ContextMenu
	)

:CheckUpdate
rem Windows 8.1 �� �����ন���� �㭪樮��� ����������
	VER | FINDSTR /IL "6.3." > NUL && %ch% {0c} ������ ����� Windows �� �����ন���� ��� �㭪樮���{\n #}{0e} ��᫥���� ����㯭�� ����� ����㯭� �� ����襩�� ��뫪� - 䠩� "MENU.bat"{\n #}&& start https://github.com/oatmealcookiec/MyProgramm/releases/tag/DKILL && pause>nul && cls && goto ContextMenu

rem �஢��塞 ����稥 ���୥�-ᮥ�������
	ping www.google.nl -n 1 -w 1000 |>nul find /i "TTL=" && goto CheckForUp||cls
	%ch% {04} ���������� �஢���� ���������� �ணࠬ��, ��������� ���୥�{\n #}
	pause>nul&&cls&&goto ContextMenu

rem �஢�ઠ ���������� �ணࠬ��
	:CheckForUp
	curl -g -k -L -# -o "%temp%\latestVersion.bat" "https://pastebin.com/raw/nEePx4Cp" >nul 2>&1
	call "%temp%\latestVersion.bat"
	if "%Version%" lss "%latestVersion%" (cls) else (cls & %ch% {02} �� �ᯮ���� ��᫥���� ���㠫��� ����� �ணࠬ�� - {0e}%Version%{\n #}&timeout /t 5 >nul&goto ContextMenu)

rem ���������� �ணࠬ��
	%ch%  {0b} ������� ����� �����, ������ ���� ������� �⮡� �������� �ணࠬ��{\n #}
	pause>nul
	curl -g -k -L -# -o %0 "https://github.com/oatmealcookiec/MyProgramm/releases/latest/download/MENU.bat" >nul 2>&1
	call %0
	cls & exit

::     ----------------------------------------------------------------
rem �㭪�� ��� Windows 11
::     ----------------------------------------------------------------

:Windows11Menu
	if not defined ThisWin11 cls&&%ch% {04} ����� �㭪樮��� �।�����祭 ⮫쪮 ��� Windows 11{\n #}&&timeout /t 3 >nul&&cls&& goto ContextMenu
	cls
	reg query "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" >nul 2>&1 && set "OldMenu=0a" || set "OldMenu=0c"
	reg query "HKLM\Software\Classes\*\shell\pintohomefile" /v "ProgrammaticAccessOnly" >nul 2>&1 && set "Favourites=0a" || set "Favourites=0c"
	reg query "HKLM\Software\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" >nul 2>&1 && set "Share=0c" || set "Share=0a"
	%ch% {0f} 1{#} {%OldMenu%}������᪮� ���⥪�⭮� ����{\n #}
	%ch% {0f} 2{#} {%Favourites%}�������� � ���࠭���{\n #}{\n #}
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}

	set "input="
	set /p input=
	if not defined input   endlocal & cls & goto ContextMenu
	if "%input%"=="1"   goto OldWin11Menu
	if "%input%"=="2"   goto Favourites11
	) else (
	cls & goto Windows11Menu
	)

:OldWin11Menu
	reg query HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32 >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1
	call :RestartExplorer
	cls&goto Windows11Menu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /v "" /t REG_SZ /d "" /f >nul
	call :RestartExplorer
	cls&goto Windows11Menu
	)
	
:Favourites11
	reg query "HKLM\Software\Classes\*\shell\pintohomefile" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Classes\*\shell\pintohomefile" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	cls&goto Windows11Menu
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\*\shell\pintohomefile" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	cls&goto Windows11Menu
	)
	
::     ----------------------------------------------------------------
rem �᭮��� �㭪��
::     ----------------------------------------------------------------

:GiveAcces
rem �।��⠢��� ����� � | �������� � Ti
	cls
	reg query "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" >nul 2>&1
	if "%errorlevel%"=="0" (
	%TI% reg delete "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	sc query fdPHost | find /i "STOPPED" >nul 2>&1 && sc query LanmanServer | find /i "STOPPED" >nul 2>&1
	if "!errorlevel!"=="0" (
	%ch% {04} ����⠭������� �㭪� ��ᯮ�����, ⠪ ��� �� ����饭� �㦡� �����쭮� ��{\n #}
	
	%ch% {08} 1{#} - {08}�� ࠢ�� ����⠭�����{\n #}
	%ch% {08} 2{#} - {08}�������� ���⭮{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto ContextMenu
	if errorlevel 1 cls)
	%TI% reg add "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /v "" /t reg_SZ /d "Shell extensions for sharing" /f >nul
	%TI% reg add "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /v "ContextMenuOptIn" /t reg_SZ /d "" /f >nul
	%TI% reg add "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}\InProcServer32" /v "" /t reg_EXPAND_SZ /d "%%SystemRoot%%\system32\ntshrui.dll" /f >nul
	%TI% reg add "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}\InProcServer32" /v "ThreadingModel" /t reg_SZ /d "Apartment" /f >nul
	call :RestartExplorer
	cls&goto ContextMenu
	)

:AddToLibrary
rem �������� � ������⥪� | �������� � Ti
	reg query "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" /ve /t reg_SZ /d "{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" /f >nul
	cls&goto ContextMenu
	)
	
:PinToFastAcces
rem ���९��� �� ������ ����ண� ����㯠 | �������� ��� Ti
	reg query "HKLM\Software\Classes\Folder\shell\pintohome" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Classes\Folder\shell\pintohome" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\Folder\shell\pintohome" /v "AppliesTo" /t reg_SZ /d "System.ParsingName:<>\"::{679f85cb-0220-4080-b29b-5540cc05aab6}\" AND System.ParsingName:<>\"::{645FF040-5081-101B-9F08-00AA002F954E}\" AND System.IsFolder:=System.StructuredQueryType.Boolean#True" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\pintohome" /v "MUIVerb" /t reg_SZ /d "@shell32.dll,-51377" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\pintohome\command" /v "DelegateExecute" /t reg_SZ /d "{b455f46e-e4af-4035-b0a4-cf18d2f6f28e}" /f >nul
	cls&goto ContextMenu
	)

:Share
rem ���������� | �������� ��� Ti
	reg query "HKLM\Software\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Classes\*\shellex\ContextMenuHandlers\ModernSharing" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	if not defined ThisWin11 reg add "HKLM\Software\Classes\*\shellex\ContextMenuHandlers\ModernSharing" /v "" /t reg_SZ /d "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /f >nul
	reg add "HKLM\Software\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" /v "" /t REG_SZ /d "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /f >nul
	cls&goto ContextMenu
	)

:SendTO
rem ��ࠢ��� | �������� ��� Ti
	reg query "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /ve /t reg_SZ /d "{7BA4C740-9E81-11CF-99D3-00AA004AE837}" /f >nul
	cls&goto ContextMenu
	)
		
:SendToAdditional
rem �������⥫�� ����ன�� �㭪� ��ࠢ���
	reg query "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" >nul 2>&1
	if "%errorlevel%"=="1" (
	cls
	%ch% {0c} �㭪� ����{\n #}
	%ch% {08} ������ �㭪� {04}��ࠢ���?{\n #}
	%ch% {08} 1{#} - {08}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto ContextMenu
	if errorlevel 1 reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /ve /t reg_SZ /d "{7BA4C740-9E81-11CF-99D3-00AA004AE837}" /f >nul)
	
rem ��������� 27/01/23
	cls
	if exist "%AppData%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" (ATTRIB "%AppData%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" | find /i "H" >nul 2>&1 && set "MailAdress=0a" || set "MailAdress=0c") else (set "MailAdress=8f")
	if exist "%AppData%\Microsoft\Windows\SendTo\���㬥���.mydocs" (ATTRIB "%AppData%\Microsoft\Windows\SendTo\���㬥���.mydocs" | find /i "H" >nul 2>&1 && set "Document=0a" || set "Document=0c") else (set "Document=8f")
	if exist "%AppData%\Microsoft\Windows\SendTo\�����⥫� 䠪�.lnk" (ATTRIB "%AppData%\Microsoft\Windows\SendTo\�����⥫� 䠪�.lnk" | find /i "H" >nul 2>&1 && set "FaxSend=0a" || set "FaxSend=0c") else (set "FaxSend=8f")
	if exist "%AppData%\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" (ATTRIB "%AppData%\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" | find /i "H" >nul 2>&1 && set "ZipS=0a" || set "ZipS=0c") else (set "ZipS=8f")
	if exist "%AppData%\Microsoft\Windows\SendTo\��।�� 䠩��� �१ Bluetooth.LNK" (ATTRIB "%AppData%\Microsoft\Windows\SendTo\��।�� 䠩��� �१ Bluetooth.LNK" | findstr "H" >nul 2>&1 && set "BTSend=0a" || set "BTSend=0c") else (set "BTSend=8f")
	if exist "%AppData%\Microsoft\Windows\SendTo\Desktop (create shortcut).DeskLink" (ATTRIB "%AppData%\Microsoft\Windows\SendTo\Desktop (create shortcut).DeskLink" | findstr "H" >nul 2>&1 && set "DeskSend=0a" || set "DeskSend=0c") else (set "DeskSend=8f")
	reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrivesInSendToMenu" >nul 2>&1 && set "RemoveDrive={0a}�ਬ����� �⪫�祭�� �⮡ࠦ���� 䫥襪 � ��᪮� � ���� ��ࠢ���" || set "RemoveDrive={0c}�� �ਬ����� �⪫�祭�� �⮡ࠦ���� 䫥襪 � ��᪮� � ���� ��ࠢ���"

	%ch% {08} �⬥祭�� {0a}������ {08}梥⮬ - �����, {0c}����{08} - �⮡ࠦ�����, {8f}���{08} - ����������{\n #}{\n #}
	%ch% {08} �������� � �㭪� ��ࠢ���:{\n #}
	%ch%  {%MailAdress%}�����{\n #}
	%ch%  {%Document%}���㬥��{\n #}
	%ch%  {%FaxSend%}�����⥫� 䠪�{\n #}
	%ch%  {%ZipS%}����� Zip-�����{\n #}
	%ch%  {%BTSend%}���ன�⢮ Bluetooth{\n #}
	%ch%  {%DeskSend%}����稩 �⮫ (ᮧ���� ���){\n #}{\n #}
	
	%ch% {0f} 1{#} - {03}������ ����� � ��몠�� ��ࠢ���{\n #}
	%ch% {0f} 2{#} - {0a}�������{08}/{04}����⠭�����{08} [����/���㬥���/ZIP/��।�� 䠩��� �१ Bluetooth]{\n #}
	%ch% {0f} 3{#} - %RemoveDrive%{\n #}{\n #}
	
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}
	set "input="
	set /p input=
	
	if not defined input    ( cls && goto ContextMenu )
	if "%input%"=="1"    ( start %AppData%\Microsoft\Windows\SendTo & cls & goto SendToAdditional)
	if "%input%"=="2"    ( goto HideSendTo)
	if "%input%"=="3"    ( goto RemoveDriveFromSendTo)
	) else (
	cls & goto SendToAdditional
	)
	

:HideSendTo
rem ����⨥ �� �㭪� ��ࠢ��� ������ �㭪⮢	
	ATTRIB "%AppData%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" | find /i "H" >nul 2>&1
	if "%errorlevel%"=="0" (
	ATTRIB -H "%AppData%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" >nul 2>&1
	ATTRIB -H "%AppData%\Microsoft\Windows\SendTo\���㬥���.mydocs" >nul 2>&1
	ATTRIB -H "%AppData%\Microsoft\Windows\SendTo\Fax Recipient.lnk" >nul 2>&1
	ATTRIB -H "%AppData%\Microsoft\Windows\SendTo\�����⥫� 䠪�.lnk" >nul 2>&1
	ATTRIB -H "%AppData%\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" >nul 2>&1
	ATTRIB -H "%AppData%\Microsoft\Windows\SendTo\��।�� 䠩��� �१ Bluetooth.LNK" >nul 2>&1
	ATTRIB -H "%AppData%\Microsoft\Windows\SendTo\Desktop (create shortcut).DeskLink" >nul 2>&1
	cls&goto SendToAdditional
	)
	if "%errorlevel%"=="1" (
	ATTRIB +H "%AppData%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" >nul 2>&1
	ATTRIB +H "%AppData%\Microsoft\Windows\SendTo\���㬥���.mydocs" >nul 2>&1
	ATTRIB +H "%AppData%\Microsoft\Windows\SendTo\Fax Recipient.lnk" >nul 2>&1
	ATTRIB +H "%AppData%\Microsoft\Windows\SendTo\�����⥫� 䠪�.lnk" >nul 2>&1
	ATTRIB +H "%AppData%\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" >nul 2>&1
	ATTRIB +H "%AppData%\Microsoft\Windows\SendTo\��।�� 䠩��� �१ Bluetooth.LNK" >nul 2>&1
	cls
	%ch% {08} ������ �㭪� {04}"����稩 �⮫ (������� ���)" {08}?{\n #}
	%ch% {08} 1{#} - {08}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto SendToAdditional
	if errorlevel 1 ATTRIB +H "%AppData%\Microsoft\Windows\SendTo\Desktop (create shortcut).DeskLink" >nul 2>&1 & cls&goto SendToAdditional
	)
	
:RemoveDriveFromSendTo
rem ���誨 � ��᪨ � ���⥪�⭮� ���� ��ࠢ���
	reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrivesInSendToMenu" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrivesInSendToMenu" /f >nul 2>&1
	call :RestartExplorer
	cls&goto SendToAdditional
	) else (
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrivesInSendToMenu" /t reg_DWORD /d 1 /f >nul
	call :RestartExplorer
	cls&goto SendToAdditional
	)
	
:Compatibility
rem ��ࠢ����� �஡��� � ᮢ���⨬����� | �������� ��� TI
	reg query "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
	reg delete "HKCR\batfile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
	reg delete "HKCR\cmdfile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
	reg delete "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
	
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /ve /t reg_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
	reg add "HKCR\batfile\shellex\ContextMenuHandlers\Compatibility" /ve /t reg_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
	reg add "HKCR\cmdfile\shellex\ContextMenuHandlers\Compatibility" /ve /t reg_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
	reg add "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /ve /t reg_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
	cls&goto ContextMenu
	)

:PinToStart
rem ���९��� �� ��砫쭮� �࠭�
rem ��⠢��� ⮫쪮 �� .exe 䠩���. �� ������/� ��২��/� � ���窠 �� 㤠����:
	rem reg add "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /v "" /t REG_SZ /d "" /f
rem �� 㬮�砭��:
	rem reg add "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /v "" /t REG_SZ /d "{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f

rem ���९��� �� ��砫쭮� �࠭� | �������� � TI
	reg query "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}" >nul 2>&1
	if "%errorlevel%"=="0" (
	cls
	%ch% {03} ���९��� �� ��砫쭮� �࠭�{\n #}
	%ch% {08} 1{#} - {08}������ �����{\n #}
	%ch% {08} 2{#} - {08}��⠢��� ⮫쪮 �� exe 䠩���{\n #}
	choice /c 12 /n /m " "
rem ����⨥ �����, �஬� .exe
	if errorlevel 2 cls & reg add "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /v "" /t REG_SZ /d "" /f >nul & cls & goto ContextMenu
rem ����⨥ �����
	if errorlevel 1 cls & %TI% reg delete "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f >nul 2>&1 & cls & goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /ve /t reg_SZ /d "Pin To Start Screen verb handler" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}\InProcServer32" /ve /t reg_SZ /d "C:\Windows\System32\appresolver.dll" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}\InProcServer32" /v "ThreadingModel" /t reg_SZ /d "Both" /f >nul
	reg add "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /v "" /t REG_SZ /d "{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f >nul
	cls&goto ContextMenu
	)

:RestoreVersion
rem ����⠭����� �०��� ����� | �������� � TI
	reg query "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}" >nul 2>&1
	if "%errorlevel%"=="0" (
	%TI% reg delete "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /ve /t reg_SZ /d "Previous Versions Property Page" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /v "PageTitle" /t reg_EXPAND_SZ /d "@%%SystemRoot%%\system32\twext.dll,-1024" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}\InProcServer32" /ve /t reg_EXPAND_SZ /d "%%SystemRoot%%\system32\twext.dll" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}\InProcServer32" /v "ThreadingModel" /t reg_SZ /d "Apartment" /f >nul
	cls&goto ContextMenu
	)

:SendToDevice
rem ��।���/��ࠢ��� �� ���ன�⢮ | �������� � TI
	reg query "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" >nul 2>&1
	if "%errorlevel%"=="0" (
	%TI% reg delete "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /ve /t reg_SZ /d "Play To menu" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /v "ContextMenuOptIn" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}\InProcServer32" /ve /t reg_SZ /d "C:\Windows\System32\playtomenu.dll" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}\InProcServer32" /v "ThreadingModel" /t reg_SZ /d "Apartment" /f >nul
	cls&goto ContextMenu
	)

:PinTaskbar
rem ���९��� �� ������ ����� | �������� ��� TI
	reg query "HKCR\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" /ve /t reg_SZ /d "Taskband Pin" /f >nul
	cls&goto ContextMenu
	)

:RunFromUser
rem ����� �� ����� ��㣮�� ���짮��⥫�
	reg query "HKLM\Software\Classes\exefile\shell\runasuser" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Classes\exefile\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\batfile\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cmdfile\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\mscfile\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Msi.Package\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\exefile\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\batfile\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\cmdfile\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\mscfile\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Msi.Package\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	cls&goto ContextMenu
	)

:OpenNewProcessAndTab
rem ������ � ����� �����
	reg query "HKLM\Software\Classes\Folder\shell\opennewprocess" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Classes\Folder\shell\opennewprocess" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Folder\shell\opennewtab" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "ExplorerHost" /t reg_SZ /d "{ceff45ee-c862-41de-aee2-a022c81eda92}" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "Extended" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "LaunchExplorerFlags" /t reg_DWORD /d "0x3" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "MUIVerb" /t reg_SZ /d "@shell32.dll,-8518" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "MultiSelectModel" /t reg_SZ /d "Document" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess\command" /v "DelegateExecute" /t reg_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "LaunchExplorerFlags" /t reg_DWORD /d "0x21" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "MUIVerb" /t reg_SZ /d "@windows.storage.dll,-8519" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "MultiSelectModel" /t reg_SZ /d "Document" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "OnlyInBrowserWindow" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "OnlyInTabWindow" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab\command" /v "DelegateExecute" /t reg_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f >nul
	cls&goto ContextMenu
	)

:RotateImage
rem �������� �ࠢ�/�����
	reg query "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.gif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.heic\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.heif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.ico\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.jpe\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.jpeg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.jpg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.png\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	
rem ��������� 16.01.23
	reg delete "HKCR\SystemFileAssociations\.avci\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.avif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.dds\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.dib\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.jfif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.jxr\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.rle\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.tif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.tiff\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.wdp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.webp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.gif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.heic\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.heif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.ico\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpe\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpeg\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpg\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.png\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	
rem ��������� 16.01.23
	reg add "HKCR\SystemFileAssociations\.avci\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.avif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.dds\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.dib\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jfif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jxr\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.rle\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.tif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.tiff\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.wdp\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.webp\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	cls&goto ContextMenu
	)

:Print
rem �����
	reg query "HKLM\Software\Classes\txtfile\shell\print" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Classes\SystemFileAssociations\image\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\batfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cmdfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\docxfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\fonfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\htmlfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\inffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\inifile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\pfmfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\regfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\rtffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\ttcfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\ttffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\txtfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\VBEFile\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\VBSFile\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\WSFFile\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\JSEFile\Shell\Print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\JSFile\Shell\Print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Applications\photoviewer.dll\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\contact_wab_auto_file\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\emffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\fonfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\group_wab_auto_file\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\IE.AssocFile.HTM\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\IE.AssocFile.SVG\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\IE.AssocFile.XHT\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\odtfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\otffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\PBrush\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\rlefile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\svgfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\textfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\wdpfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\wmffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Wordpad.Document.1\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\xhtmlfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\zapfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\IE.AssocFile.URL\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.heic\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.avci\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.avcs\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.avif\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.avifs\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.heics\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.heif\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.heifs\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.hif\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	!TI! reg delete "HKLM\Software\Classes\InternetShortcut\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	cls&goto ContextMenu
	)
	
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\SystemFileAssociations\image\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\batfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\cmdfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\docxfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\fonfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\htmlfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\inffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\inifile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\pfmfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\regfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\rtffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\ttcfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\ttffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\txtfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\VBEFile\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\VBSFile\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\WSFFile\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\JSEFile\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\JSFile\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Applications\photoviewer.dll\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\contact_wab_auto_file\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\emffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\fonfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\group_wab_auto_file\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\IE.AssocFile.HTM\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\IE.AssocFile.SVG\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\IE.AssocFile.XHT\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul	
	reg add "HKLM\Software\Classes\odtfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\otffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\PBrush\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\rlefile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\svgfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\textfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\wdpfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\wmffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Wordpad.Document.1\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\xhtmlfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\zapfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\IE.AssocFile.URL\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.heic\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.avci\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.avcs\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.avif\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.avifs\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.heics\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.heif\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.heifs\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.hif\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	!TI! reg add "HKLM\Software\Classes\InternetShortcut\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	cls&goto ContextMenu
	)


:DisplaySettings
rem ��ࠬ���� �࠭� | �������� � TI
	reg query "HKCR\DesktopBackground\Shell\Display" >nul 2>&1
	if "%errorlevel%"=="0" (
	%TI% reg delete "HKCR\DesktopBackground\Shell\Display" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\DesktopBackground\Shell\Display" /v "" /t reg_EXPAND_SZ /d "@%%SystemRoot%%\System32\display.dll,-4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Display" /v "Icon" /t reg_EXPAND_SZ /d "%%SystemRoot%%\System32\display.dll,-1" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Display" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Display" /v "SettingsUri" /t reg_SZ /d "ms-settings:display" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Display\command" /v "DelegateExecute" /t reg_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f >nul
	cls&goto ContextMenu
	)

:Personalize
rem ���ᮭ������� | �������� � TI
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	%TI% reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "ProgrammaticAccessOnly" /f >nul
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	%TI% reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	cls&goto ContextMenu
	)
	
:PersonalizeAdditional
rem �������⥫�� ��ࠬ���� ���ᮭ�����樨
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	cls
	%ch% {0c} �㭪� ����{\n #}
	%ch% {08} ������ �㭪� {04}���ᮭ�������?{\n #}
	%ch% {08} 1{#} - {08}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto ContextMenu
	if errorlevel 1 %TI% reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "ProgrammaticAccessOnly" /f >nul)

cls
	%ch% {0b} ��ࠢ����� �㭪⮬ ���ᮭ�������{\n #}
	%ch% {08} �⬥祭�� {0a}������ {08}梥⮬ - �ਬ�����, {08}��� - ���������{\n #}{\n #}
	
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Windows settings" >nul 2>&1 && set "Settings=0a" || set "Settings=08"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Display" >nul 2>&1 && set "DisplaySet=0a" || set "DisplaySet=08"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\GodMode" >nul 2>&1 && set "GodMode=0a" || set "GodMode=08"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\LogOut" >nul 2>&1 && set "LogOut=0a" || set "LogOut=08"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Personalize" >nul 2>&1 && set "Personalize=0a" || set "Personalize=08"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Reboot" >nul 2>&1 && set "Reboot=0a" || set "Reboot=08"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Shutdown" >nul 2>&1 && set "Shutdown=0a" || set "Shutdown=08"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Cursors" >nul 2>&1 && set "Cursors=0a" || set "Cursors=08"
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\DesktopIcon" >nul 2>&1 && set "DesktopIcon=0a" || set "DesktopIcon=08"
		
	%ch% {0f} 1{#} - {%Settings%}��ࠬ���� Windows{\n #}
	%ch% {0f} 2{#} - {%DisplaySet%}��ࠬ���� ��࠭�{\n #}
	%ch% {0f} 3{#} - {%GodMode%}����� ����{\n #}
	%ch% {0f} 4{#} - {%LogOut%}��室{\n #}
	%ch% {0f} 5{#} - {%Personalize%}���ᮭ�������{\n #}
	%ch% {0f} 6{#} - {%Reboot%}��१���㧪�{\n #}
	%ch% {0f} 7{#} - {%Shutdown%}�몫�祭��{\n #}
	%ch% {0f} 8{#} - {%Cursors%}��ࠬ���� ����஢{\n #}
	%ch% {0f} 9{#} - {%DesktopIcon%}��ࠬ���� ���窮� ࠡ�祣� �⮫�{\n #}{\n #}
	
	%ch% {08} 77{#} - {04}������� �� �㭪��{\n #}{\n #}
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}
	set "input="
	set /p input=
	
	if not defined input    ( cls && goto ContextMenu )
	
	if "%input%"=="1"    (
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
		
	
	if "!Settings!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Windows settings" /v "" /t REG_SZ /d "��ࠬ���� Windows" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Windows settings" /v "Icon" /t REG_SZ /d "%%systemroot%%\ImmersiveControlPanel\SystemSettings.exe" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Windows settings\command" /v "" /t REG_SZ /d "explorer ms-settings:" /f >nul
	cls && goto PersonalizeAdditional )

	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Windows settings" /f >nul 2>&1
	cls && goto PersonalizeAdditional )
	
	if "%input%"=="2"    ( 
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	
	if "!DisplaySet!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Display" /v "" /t REG_SZ /d "@%%SystemRoot%%\System32\display.dll,-4" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Display" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\display.dll,-1" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Display" /v "SettingsUri" /t REG_SZ /d "ms-settings:display" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Display\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f >nul
	cls && goto PersonalizeAdditional )
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Display" /f >nul 2>&1
	cls && goto PersonalizeAdditional )
	
	if "%input%"=="3"    ( 
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	
	if "!GodMode!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\GodMode" /v "" /t REG_SZ /d "����� ����" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\GodMode" /v "Icon" /t REG_SZ /d "control.exe" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\GodMode\command" /v "" /t REG_SZ /d "explorer shell:::{ED7BA470-8E54-465E-825C-99712043E01C}" /f >nul
	cls && goto PersonalizeAdditional )
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\GodMode" /f >nul 2>&1
	cls && goto PersonalizeAdditional )
	
	if "%input%"=="4"    ( 
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	
	if "!LogOut!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Logout" /v "" /t REG_SZ /d "��室" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Logout" /v "Icon" /t REG_SZ /d "imageres.dll,255" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Logout\command" /v "" /t REG_EXPAND_SZ /d "mshta.exe vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c start /min shutdown /l\",0)(Window.Close)" /f >nul
	cls && goto PersonalizeAdditional )
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Logout" /f >nul 2>&1
	cls && goto PersonalizeAdditional )
	
	if "%input%"=="5"    ( 
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	
	if "!Personalize!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Personalize" /v "" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Personalize" /v "Icon" /t REG_SZ /d "%%systemroot%%\system32\themecpl.dll,-1" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Personalize" /v "SettingsUri" /t REG_SZ /d "ms-settings:personalization-background" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Personalize\command" /v "DelegateExecute" /t REG_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f >nul
	cls && goto PersonalizeAdditional )
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Personalize" /f >nul 2>&1
	cls && goto PersonalizeAdditional )
	
	if "%input%"=="6"    ( 
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	
	if "!Reboot!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Reboot" /v "" /t REG_SZ /d "��१���㧪�" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Reboot" /v "Icon" /t REG_SZ /d "imageres.dll,228" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Reboot\command" /v "" /t REG_EXPAND_SZ /d "mshta.exe vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c start /min shutdown.exe -r -t 0\",0)(Window.Close)" /f >nul
	cls && goto PersonalizeAdditional )
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Reboot" /f >nul 2>&1
	cls && goto PersonalizeAdditional )
	
	if "%input%"=="7"    ( 
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	if "!Shutdown!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Shutdown" /v "" /t REG_SZ /d "�몫�祭��" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Shutdown" /v "Icon" /t REG_SZ /d "imageres.dll,235" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Shutdown\command" /v "" /t REG_EXPAND_SZ /d "mshta.exe vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c start /min shutdown.exe -s -t 0\",0)(Window.Close)" /f >nul
	cls && goto PersonalizeAdditional )
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Shutdown" /f >nul 2>&1
	cls && goto PersonalizeAdditional )

	if "%input%"=="8"    ( 
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	if "!Cursors!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Cursors" /v "" /t REG_SZ /d "�����⥫� ���" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Cursors" /v "Icon" /t REG_SZ /d "main.cpl,8" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Cursors\command" /v "" /t REG_EXPAND_SZ /d "mshta.exe vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c main.cpl ,1\",0)(Window.Close)" /f >nul
	cls && goto PersonalizeAdditional )
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\Cursors" /f >nul 2>&1
	cls && goto PersonalizeAdditional )
	
	if "%input%"=="9"    ( 
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /f >nul 2>&1
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "MUIVerb" /t REG_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	if "!DesktopIcon!"=="08" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\DesktopIcon" /v "" /t REG_SZ /d "���窨 ࠡ�祣� �⮫�" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\DesktopIcon" /v "Icon" /t REG_SZ /d "control.exe" /f >nul
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\DesktopIcon\command" /v "" /t REG_EXPAND_SZ /d "mshta.exe vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c desk.cpl ,5\",0)(Window.Close)" /f >nul
	cls && goto PersonalizeAdditional )
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell\DesktopIcon" /f >nul 2>&1
	cls && goto PersonalizeAdditional )
	
	
	if "%input%"=="77" (
	reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "" /t REG_EXPAND_SZ /d "@%%systemroot%%\system32\themecpl.dll,-10" /f >nul
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize\Shell" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "subcommands" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "muiverb" /f >nul 2>&1

	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Display" /f >nul 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\GodMode" /f >nul 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Logout" /f >nul 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Personalize" /f >nul 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Reboot" /f >nul 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Shutdown" /f >nul 2>&1
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\CommandStore\shell\Windows settings" /f >nul 2>&1
	)


	) else (
	cls & goto PersonalizeAdditional
	)
	
	
:OpenPowerShellWhere
rem ������ ���� PowerShell �����
cls
		
	%ch% {0b} ��ࠢ����� �㭪⮬ ������ ���� PowerShell �����{\n #}
	%ch% {08} ����� �㭪� �⮡ࠦ����� �� ����⮩ ������ Shift{\n #}{\n #}
	reg query "HKLM\Software\Classes\Directory\shell\Powershell" /v "ProgrammaticAccessOnly" >nul 2>&1 && set "DirPW={0a}� ���⥪�⭮� ���� ����� - {02}����" || set "DirPW={0c}� ���⥪�⭮� ���� ����� - {04}�⮡ࠦ�����"
	reg query "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "ProgrammaticAccessOnly" >nul 2>&1 && set "BckPW={0a}� ���⥪�⭮� ���� ����� ����� � ࠡ�祣� �⮫� - {02}����" || set "BckPW={0c}� ���⥪�⭮� ���� ����� ����� � ࠡ�祣� �⮫� - {04}�⮡ࠦ�����"
	reg query "HKLM\Software\Classes\Drive\shell\Powershell" /v "ProgrammaticAccessOnly" >nul 2>&1 && set "DrPW={0a}� ���⥪�⭮� ���� ��᪮� - {02}����" || set "DrPW={0c}� ���⥪�⭮� ���� ��᪮� - {04}�⮡ࠦ�����"
	
	%ch% {0f} 1{#} - %DirPW%{\n #}
	%ch% {0f} 2{#} - %BckPW%{\n #}
	%ch% {0f} 3{#} - %DrPW%{\n #}
	echo.
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}
	set "input="
	set /p input=
	
	if not defined input    cls && goto ContextMenu
	if "%input%"=="1"   goto PWInFold
	if "%input%"=="2"   goto PWInnFold
	if "%input%"=="3"   goto PwInDr
	) else (
	cls & goto OpenPowerShellWhere
	)

:PWInFold
	reg query "HKLM\Software\Classes\Directory\shell\Powershell" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	!TI! reg delete "HKLM\Software\Classes\Directory\shell\Powershell" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	
	!TI! reg add "HKLM\Software\Classes\Directory\shell\Powershell" /v "" /t REG_SZ /d "@shell32.dll,-8508" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\Powershell" /v "Extended" /t REG_SZ /d "" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\Powershell" /v "Icon" /t REG_SZ /d "PowerShell.exe" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\Powershell" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\Powershell" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\Powershell\command" /v "" /t REG_SZ /d "powershell.exe -noexit -command Set-Location -literalPath '%%V'" /f
	
	timeout /t 1 /nobreak >nul
	cls&goto OpenPowerShellWhere
	)
	if "%errorlevel%"=="1" (
	!TI! reg add "HKLM\Software\Classes\Directory\shell\Powershell" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	timeout /t 1 /nobreak >nul
	cls&goto OpenPowerShellWhere
	)
	
:PWInnFold
	reg query "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	!TI! reg delete "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "" /t REG_SZ /d "@shell32.dll,-8508" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "Extended" /t REG_SZ /d "" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "ShowBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "Icon" /t REG_SZ /d "PowerShell.exe" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\Powershell\command" /v "" /t REG_SZ /d "powershell.exe -noexit -command Set-Location -literalPath '%%V'" /f
	
	timeout /t 1 /nobreak >nul
	cls&goto OpenPowerShellWhere
	)
	if "%errorlevel%"=="1" (
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\Powershell" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	timeout /t 1 /nobreak >nul
	cls&goto OpenPowerShellWhere
	)
	
:PwInDr
	reg query "HKLM\Software\Classes\Drive\shell\Powershell" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	!TI! reg delete "HKLM\Software\Classes\Drive\shell\Powershell" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	timeout /t 1 /nobreak >nul
	cls&goto OpenPowerShellWhere
	)
	if "%errorlevel%"=="1" (
	!TI! reg add "HKLM\Software\Classes\Drive\shell\Powershell" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	timeout /t 1 /nobreak >nul
	cls&goto OpenPowerShellWhere
	)
	
	
:OpenCmdHere
cls
	%ch% {0b} ��ࠢ����� �㭪⮬ ������ ���� ������{\n #}
	%ch% {08} ����� �㭪� �⮡ࠦ����� �� ����⮩ ������ Shift{\n #}{\n #}
	reg query "HKLM\Software\Classes\Directory\shell\cmd" /v "HideBasedOnVelocityId" >nul 2>&1 && set "DirCMD={0a}� ���⥪�⭮� ���� ����� - {02}����" || set "DirCMD={0c}� ���⥪�⭮� ���� ����� - {04}�⮡ࠦ�����"
	reg query "HKLM\Software\Classes\Directory\background\shell\cmd" /v "HideBasedOnVelocityId" >nul 2>&1 && set "BckCMD={0a}� ���⥪�⭮� ���� ����� ����� � ࠡ�祣� �⮫� - {02}����" || set "BckCMD={0c}� ���⥪�⭮� ���� ����� ����� � ࠡ�祣� �⮫� - {04}�⮡ࠦ�����"
	%ch% {0f} 1{#} - %DirCMD%{\n #}
	%ch% {0f} 2{#} - %BckCMD%{\n #}
	echo.
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}
	set "input="
	set /p input=
	
	if not defined input    cls && goto ContextMenu
	if "%input%"=="1"   goto CMDInFold
	if "%input%"=="2"   goto CMDInnFold
	) else (
	cls & goto OpenCmdHere
	)
	

:CMDInFold
	reg query "HKLM\Software\Classes\Directory\shell\cmd" /v "HideBasedOnVelocityId" >nul 2>&1
	if "%errorlevel%"=="0" (
	!TI! reg delete "HKLM\Software\Classes\Directory\shell\cmd" /v "HideBasedOnVelocityId" /f >nul 2>&1
	timeout /t 1 /nobreak >nul
	cls&goto OpenCmdHere
	)
	if "%errorlevel%"=="1" (
	!TI! reg add "HKLM\Software\Classes\Directory\shell\cmd" /v "" /t REG_SZ /d "@shell32.dll,-8506" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\cmd" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\cmd" /v "Extended" /t REG_SZ /d "" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\cmd" /v "Icon" /t REG_SZ /d "cmd.exe" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\cmd" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
	!TI! reg add "HKLM\Software\Classes\Directory\shell\cmd\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f
	timeout /t 1 /nobreak >nul
	cls&goto OpenCmdHere
	)

	
:CMDInnFold
	reg query "HKLM\Software\Classes\Directory\background\shell\cmd" /v "HideBasedOnVelocityId" >nul 2>&1
	if "%errorlevel%"=="0" (
	!TI! reg delete "HKLM\Software\Classes\Directory\background\shell\cmd" /v "HideBasedOnVelocityId" /f
	timeout /t 1 /nobreak >nul
	cls&goto OpenCmdHere
	)
	if "%errorlevel%"=="1" (
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\cmd" /v "" /t REG_SZ /d "@shell32.dll,-8506" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\cmd" /v "Extended" /t REG_SZ /d "" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\cmd" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\cmd" /v "Icon" /t REG_SZ /d "cmd.exe" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\cmd" /v "HideBasedOnVelocityId" /t REG_DWORD /d "0x639bc8" /f
	!TI! reg add "HKLM\Software\Classes\Directory\background\shell\cmd\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f
	timeout /t 1 /nobreak >nul
	cls&goto OpenCmdHere
	)
	
	
:RunAsAdmin
rem ����� �� ����� �����������
	reg query "HKLM\Software\Classes\exefile\shell\runas" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Classes\batfile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\batfile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	
	reg delete "HKLM\Software\Classes\cmdfile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cmdfile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	
	reg delete "HKLM\Software\Classes\exefile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\exefile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	
	reg delete "HKLM\Software\Classes\exefile\shell\runas2" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\exefile\shell\runas2" /v "HideBasedOnVelocityId" /f >nul 2>&1
	
	reg delete "HKLM\Software\Classes\cplfile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cplfile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	
	reg delete "HKLM\Software\Classes\mscfile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\mscfile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\batfile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\cmdfile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\exefile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\cplfile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\mscfile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	)
	
	reg query "HKLM\Software\Classes\dllfile\shell\runas" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg add "HKLM\Software\Classes\exefile\shell\runas2" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	)
	cls&goto ContextMenu
	
:NextWallPaper
rem ������饥 䮭���� ����ࠦ���� ࠡ�祣� �⮫� (०�� ᫠��-��)
	reg query "HKCR\DesktopBackground\shellex\ContextMenuHandlers\DesktopSlideshow" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\DesktopBackground\shellex\ContextMenuHandlers\DesktopSlideshow" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\DesktopBackground\shellex\ContextMenuHandlers\DesktopSlideshow" /v "" /t REG_SZ /d "{0bf754aa-c967-445c-ab3d-d8fda9bae7ef}" /f >nul
	cls&goto ContextMenu
	)
	
:BackGroundImage
rem ������� 䮭��� ����ࠦ����� ࠡ�祣� �⮫�
	reg query "HKCR\SystemFileAssociations\.jpeg\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\SystemFileAssociations\.gif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.bmp\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.jpeg\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.jpg\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.png\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
rem ��������� 16.01.23
	reg delete "HKCR\SystemFileAssociations\.avci\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.avcs\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.avif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.avifs\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.dib\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.heic\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.heics\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.heif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.heifs\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.jfif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.jpe\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.tif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.tiff\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.wdp\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	cls&goto ContextMenu
	)
	
	if "%errorlevel%"=="1" (
	reg add "HKCR\SystemFileAssociations\.gif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.bmp\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpeg\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpg\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.png\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
rem ��������� 16.01.23
	reg add "HKCR\SystemFileAssociations\.avci\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.avcs\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.avif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.avifs\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.dib\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.heic\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.heics\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.heif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.heifs\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.jfif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpe\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.tif\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.tiff\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\SystemFileAssociations\.wdp\Shell\setdesktopwallpaper" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	cls&goto ContextMenu
	)

	
:CopyAsPath
rem ����஢��� ��� ����
	reg query "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyAsPathMenu" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyAsPathMenu" /f >nul 2>&1
	cls&goto ContextMenu
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\CopyAsPathMenu" /v "" /t REG_SZ /d "{f3d06e7c-1e45-4a26-847e-f9fcdee59be0}" /f >nul
	cls&goto ContextMenu
	)
	
:Additional
rem �������⥫�� �㭪��
cls
	set "Installed="
	set "InstalledWinrar="
	(
rem ��������� .reg � .bat
	reg query "HKCR\regfile\shell\regconvert" && set "RegToBat=0a" || set "RegToBat=04"
rem �㭪� "��������" � NotePad++
	reg query "HKLM\Software\Classes\txtfile\shell\edit" && set "EditTXT=0a" || set "EditTXT=04"
	
rem ��⠭����� UWP
	reg query "HKCR\SystemFileAssociations\.Appx\shell\Install" && set "AppxInstall=0a" || set "AppxInstall=04"
	
rem ����ந�� �����
	reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCustomizeThisFolder" && set CustomFolder=0a||set CustomFolder=04
	
rem Unlocker
	reg query "HKCR\*\shell\����⮦���" && set KilledUnlocker=04||set KilledUnlocker=8f
	
rem StartIsBack
	reg query "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\StartIsBack" && set InstalledStartIsBack=1
	if defined InstalledStartIsBack (reg query "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c9}" && set "PinToStartStartIsBack=04" || set "PinToStartStartIsBack=0a") else (set PinToStartStartIsBack=8f)
	
rem WinRar	
	reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\WinRAR archiver" && set InstalledWinrar=1
	if defined InstalledWinrar (set "WinRarMenu=0a") else (set WinRarMenu=8f)
	
	) >nul 2>&1
	

	%ch% {0f} 1{#} - {%EditTXT%}Notepad++ {08}[�㭪� �������� ��� txt/inf/ini/ps1 � ��. �ଠ⮢ � Notepad ++]{\n #}
	%ch% {0f} 2{#} - {%RegToBat%}RegToBat  {08}[����஥ �������஢���� .reg � .bat 䠩��]{\n #}
	%ch% {0f} 3{#} - {%AppxInstall%}��⠭����� UWP {08}[��� .appx/appxbundle/msix/msixbundle]{\n #}
	%ch% {0f} 4{#} - {%PinToStartStartIsBack%}���९��� � ���� ���{08} [�㭪� �� �ணࠬ�� {0e}StartIsBack]{\n #}
	%ch% {0f} 5{#} - {%CustomFolder%}����ந�� �����{08} [�ࠢ� ���� � �஢������ � ������]{\n #}
	%ch% {0f} 6{#} - {%WinRarMenu%}����������筮� ���� WinRar {08}[��⠭���� ⮫쪮 ��������/�������]{\n #}
	%ch% {0f} 7{#} - {%KilledUnlocker%}�㭪� ����⮦���{0e} [�������/������� �� Shift] {08}[�� �ணࠬ�� Unlocker]{\n #}
	echo.
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}

	set "input="
	set /p input=
	if "%input%"=="1"  goto NotepadPlusPlus
	if "%input%"=="2"  goto RegToBat
	if "%input%"=="3"  goto AppxAppxBundle
	if "%input%"=="4"  goto StartIsBackStart
	if "%input%"=="5"  goto CustomizeFolder
	if "%input%"=="6"  goto WinRar
	if "%input%"=="7"  goto UnlockerXrist
	) else (
		cls && goto ContextMenu
	)

:NotepadPlusPlus
	reg query "HKLM\Software\Classes\txtfile\shell\edit\command" >nul 2>&1
	if "%errorlevel%"=="0" (
rem �� 㬮�砭�� ��� ��⮪ � Windows ���, ���⮬� 㤠�塞 ��
	reg delete "HKLM\Software\Classes\txtfile\shell\edit" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\inffile\shell\edit" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\inifile\shell\edit" /f >nul 2>&1
	
rem ��� ����⠭�������� ����⨥ �१ Notepad.exe
	reg add "HKLM\Software\Classes\batfile\Shell\Edit\Command" /ve /t reg_EXPAND_SZ /d "notepad.exe \"%%1\"" /f >nul
	reg delete "HKLM\Software\Classes\batfile\Shell\Edit" /v "Icon" /f >nul 2>&1
	
	reg add "HKLM\Software\Classes\cmdfile\Shell\Edit\Command" /ve /t reg_EXPAND_SZ /d "notepad.exe \"%%1\"" /f >nul
	reg delete "HKLM\Software\Classes\cmdfile\Shell\Edit" /v "Icon" /f >nul 2>&1
	
	reg add "HKLM\Software\Classes\regfile\Shell\Edit\Command" /ve /t reg_EXPAND_SZ /d "notepad.exe \"%%1\"" /f >nul
	reg delete "HKLM\Software\Classes\regfile\Shell\Edit" /v "Icon" /f >nul 2>&1
	
	reg add "HKLM\Software\Classes\SystemFileAssociations\.ps1\Shell\Edit\Command" /ve /t reg_EXPAND_SZ /d "\"%%systemroot%%\System32\WindowsPowerShell\v1.0\powershell_ise.exe\" \"%%1\"" /f >nul
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.ps1\Shell\Edit" /v "Icon" /f >nul 2>&1
	
	
	cls&goto Additional
	)
	
	Set PathFull=
	FOR /F "usebackq delims=" %%f In (`2^>nul Dir /B /S /A:-D "D:\notepad++.exe"`) DO Set "PathFull=%%f"
	If "%PathFull%"=="" (%ch% {0c} Notepad++ �� ������ �� ��᪥ D:\{\n #}&& pause>nul && cls && goto Additional)
	
	
	%ch% {08} 1{#} - {08}� �������{\n #}
	%ch% {08} 2{#} - {08}��� ������{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 set "WithIcon=" & goto Add
	if errorlevel 1 set "WithIcon=1"
:Add
	if defined WithIcon reg add "HKLM\Software\Classes\txtfile\Shell\Edit" /v "Icon" /t REG_EXPAND_SZ /d "\"%PathFull%"\" /f >nul
	reg add "HKLM\Software\Classes\txtfile\Shell\Edit\Command" /v "" /t REG_EXPAND_SZ /d "\"%PathFull%\" \"%%1\"" /f >nul
	
	if defined WithIcon reg add "HKLM\Software\Classes\inffile\Shell\Edit" /v "Icon" /t REG_EXPAND_SZ /d "\"%PathFull%"\" /f >nul
	reg add "HKLM\Software\Classes\inffile\Shell\Edit\Command" /v "" /t REG_EXPAND_SZ /d "\"%PathFull%\" \"%%1\"" /f >nul
	
	if defined WithIcon reg add "HKLM\Software\Classes\inifile\Shell\Edit" /v "Icon" /t REG_EXPAND_SZ /d "\"%PathFull%"\" /f >nul
	reg add "HKLM\Software\Classes\inifile\Shell\Edit\Command" /v "" /t REG_EXPAND_SZ /d "\"%PathFull%\" \"%%1\"" /f >nul
	
	if defined WithIcon reg add "HKLM\Software\Classes\batfile\Shell\Edit" /v "Icon" /t REG_EXPAND_SZ /d "\"%PathFull%"\" /f >nul
	reg add "HKLM\Software\Classes\batfile\Shell\Edit\Command" /v "" /t REG_EXPAND_SZ /d "\"%PathFull%\" \"%%1\"" /f >nul
	
	if defined WithIcon reg add "HKLM\Software\Classes\cmdfile\Shell\Edit" /v "Icon" /t REG_EXPAND_SZ /d "\"%PathFull%"\" /f >nul
	reg add "HKLM\Software\Classes\cmdfile\Shell\Edit\Command" /v "" /t REG_EXPAND_SZ /d "\"%PathFull%\" \"%%1\"" /f >nul
	
	if defined WithIcon reg add "HKLM\Software\Classes\regfile\Shell\Edit" /v "Icon" /t REG_EXPAND_SZ /d "\"%PathFull%"\" /f >nul
	reg add "HKLM\Software\Classes\regfile\Shell\Edit\Command" /v "" /t REG_EXPAND_SZ /d "\"%PathFull%\" \"%%1\"" /f >nul
	
	if defined WithIcon reg add "HKLM\Software\Classes\SystemFileAssociations\.ps1\Shell\Edit" /v "Icon" /t REG_EXPAND_SZ /d "\"%PathFull%"\" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.ps1\Shell\Edit\Command" /v "" /t REG_EXPAND_SZ /d "\"%PathFull%\" \"%%1\"" /f >nul
	
	cls&goto Additional
	

:RegToBat
	set "RegToScriptPath=%~dp0Work\RegToScript.exe"	
	reg query "HKCR\regfile\shell\regconvert" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\regfile\shell\regconvert" /f >nul
	cls&goto Additional
	)
	if "%errorlevel%"=="1" (
	if not exist "%RegToScriptPath%" %ch% {0c} �� ������ 䠩� RegToScript.exe � ����� Work �冷� � �ணࠬ���{\n #}&& pause>nul && cls && goto Additional
	reg add "HKCR\regfile\shell\regconvert" /v "Icon" /t REG_SZ /d "regedit.exe" /f >nul
	reg add "HKCR\regfile\shell\regconvert" /v "Position" /t REG_SZ /d "Middle" /f >nul
	reg add "HKCR\regfile\shell\regconvert" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKCR\regfile\shell\regconvert" /v "MUIVerb" /t REG_SZ /d "Convert to .bat" /f >nul
	reg add "HKCR\regfile\shell\regconvert\shell\001" /v "MUIVerb" /t REG_SZ /d "RegFile => BatFile" /f >nul
	reg add "HKCR\regfile\shell\regconvert\shell\001" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\imageres.dll,63" /f >nul
	reg add "HKCR\regfile\shell\regconvert\shell\001\command" /v "" /t REG_EXPAND_SZ /d "\"%RegToScriptPath%\" /bat \"%%1\" %%1.bat" /f >nul

	reg add "HKCR\regfile\shell\regconvert\shell\002" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\imageres.dll,241" /f >nul
	reg add "HKCR\regfile\shell\regconvert\shell\002" /v "MUIVerb" /t REG_SZ /d "RegFile => � ����" /f >nul
	reg add "HKCR\regfile\shell\regconvert\shell\002\command" /v "" /t REG_EXPAND_SZ /d "\"%RegToScriptPath%\" /bat /rh \"%%1\" /clbrd" /f >nul
	cls&goto Additional
	)


:AppxAppxBundle
cls
	reg query HKCR\SystemFileAssociations\.Appx\shell\Install >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\SystemFileAssociations\.Appx\shell\Install" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.AppxBundle\shell\Install" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.msix\shell\Install" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.msixbundle\shell\Install" /f >nul 2>&1
	cls&goto Additional
	)
	if "%errorlevel%"=="1" (
rem appx/appxbundle
	reg add "HKCR\SystemFileAssociations\.Appx\shell\Install" /v "MUIVerb" /t REG_SZ /d "��⠭����� Appx" /f >nul
	reg add "HKCR\SystemFileAssociations\.Appx\shell\Install" /v "Icon" /t REG_SZ /d "C:\Windows\System32\shell32.dll,296" /f >nul
	reg add "HKCR\SystemFileAssociations\.Appx\shell\Install\command" /v "" /t REG_SZ /d "PowerShell -ExecutionPolicy Bypass \"Add-AppxPackage '%%1'\";pause" /f >nul
	reg add "HKCR\SystemFileAssociations\.AppxBundle\shell\Install" /v "MUIVerb" /t REG_SZ /d "��⠭����� AppxBundle" /f >nul
	reg add "HKCR\SystemFileAssociations\.AppxBundle\shell\Install" /v "Icon" /t REG_SZ /d "C:\Windows\System32\shell32.dll,296" /f >nul
	reg add "HKCR\SystemFileAssociations\.AppxBundle\shell\Install\command" /v "" /t REG_SZ /d "PowerShell -ExecutionPolicy Bypass \"Add-AppxPackage '%%1'\";pause" /f >nul
	
rem msix/msixbundle
	reg add "HKCR\SystemFileAssociations\.msix\shell\Install" /v "MUIVerb" /t REG_SZ /d "��⠭����� msix" /f >nul
	reg add "HKCR\SystemFileAssociations\.msix\shell\Install" /v "Icon" /t REG_SZ /d "C:\Windows\System32\shell32.dll,296" /f >nul
	reg add "HKCR\SystemFileAssociations\.msix\shell\Install\command" /v "" /t REG_SZ /d "PowerShell -ExecutionPolicy Bypass \"Add-AppxPackage '%%1'\";pause" /f >nul
	reg add "HKCR\SystemFileAssociations\.msixbundle\shell\Install" /v "MUIVerb" /t REG_SZ /d "��⠭����� msixbundle" /f >nul
	reg add "HKCR\SystemFileAssociations\.msixbundle\shell\Install" /v "Icon" /t REG_SZ /d "C:\Windows\System32\shell32.dll,296" /f >nul
	reg add "HKCR\SystemFileAssociations\.msixbundle\shell\Install\command" /v "" /t REG_SZ /d "PowerShell -ExecutionPolicy Bypass \"Add-AppxPackage '%%1'\";pause" /f >nul
	
	cls&goto Additional
	)
	

:StartIsBackStart
	reg query "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\StartIsBack" >nul 2>&1 && set Installed=1
	
	if defined Installed (cls) else (%ch% {04} StartIsBack �� ��⠭�����{\n #}&&timeout /t 3 >nul&&cls&&goto Additional)

rem ������ � ��宦����� �襭�� �� - https://win10tweaker.ru/forum/topic/contexteditor?part=22#postid-88844

	reg query "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" >nul 2>&1
	if "%errorlevel%"=="0" (
rem �������� �⠭������ ����ᮢ Windows - "���९��� � ���� ���", �⫨稥 �� StartIsBack � ���� c8 - � Windows � c9 � StartIsBack
	reg delete HKCR\*\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8} /f >nul 2>&1
	reg delete HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8} /f >nul 2>&1
	reg delete HKCR\Folder\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8} /f >nul 2>&1
rem �⤥�쭮� 㤠����� �� ��뢠�� ��� �㭪�, �� ࠡ�⠥� � �離�, �᫨ 㤠���� �⠭����� ������ Windows (���)
	reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c9}" /f >nul 2>&1
	cls&goto Additional)

	if "%errorlevel%"=="1" (
rem ����⠭������� �⠭������ ����ᮢ (� ��⮩ Windows �� ࠧ���� ����!)
	reg add "HKCR\*\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" /v "" /t REG_SZ /d "Start Menu Pin" /f >nul
	reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" /v "" /t REG_SZ /d "Start Menu Pin" /f >nul
	reg add "HKCR\Folder\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c8}" /v "" /t REG_SZ /d "Start Menu Pin" /f >nul
rem ����⠭������� ����� �� StartIsBack (� ��⮩ Windows �⮣� ࠧ���� - ���, ᮧ������ �� ��⠭���� StartIsBack!)
	reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{a2a9545d-a0c2-42b4-9708-a0b2badd77c9}" /v "" /t REG_SZ /d "StartIsBack Menu Pin" /f >nul
	cls&goto Additional)

:CustomizeFolder
	reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCustomizeThisFolder" >nul 2>&1
	if "%errorlevel%"=="0" (
rem ����⠭����� �㭪� ����ந�� �����
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCustomizeThisFolder" /f >nul
	call :RestartExplorer
	cls & goto Additional)
	if "%errorlevel%"=="1" (
rem ������ �㭪� ����ந�� �����
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCustomizeThisFolder" /t REG_DWORD /d "1" /f >nul
	call :RestartExplorer
	cls & goto Additional)

:WinRar
	reg query "HKLM\Software\Classes\WinRAR" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "DragExtr" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "DragAdd" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "SFXOther" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "SFXNetwork" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "SFXLocal" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "NewZIP" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "NewRAR" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "Convert" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "Test" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "EmailOpt" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "EmailArc" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "AddArc" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "AddTo" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "OpenArc" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "OpenSFX" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "ExtrSep" /t REG_DWORD /d "1" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "Extr" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "ExtrHere" /t REG_DWORD /d "0" /f >nul
	reg add "HKCU\Software\WinRAR\Setup\MenuItems" /v "ExtrTo" /t REG_DWORD /d "1" /f >nul
	cls&goto Additional )
	if "%errorlevel%"=="1" (%ch% {04} WinRar �� ��⠭�����{\n #}&&timeout /t 3 >nul&&cls&&goto Additional )
	
	
:UnlockerXrist
	reg query "HKCR\*\shell\����⮦���" >nul 2>&1	
	
	if "%errorlevel%"=="0" (
	echo.
	%ch% {0c} �롥��, �� ᤥ���� � �㭪⮬ "����⮦���"?{\n #}
	%ch% {08} 1{#} - {08}�������{\n #}
	%ch% {08} 2{#} - {08}������� ����� �� Shift{\n #}
	%ch% {08} 3{#} - {08}�������� �����{\n #}
	choice /c 123 /n /m " "
	if errorlevel 3 cls & goto Additional
	if errorlevel 2 (
	reg add "HKCR\*\shell\����⮦���" /v "Extended" /t reg_SZ /d "" /f >nul
	reg add "HKCR\Directory\shell\����⮦���" /v "Extended" /t reg_SZ /d "" /f >nul
	%ch% {0a} ������ �㭪� �⮡ࠦ����� � ������ Shift{\n #}
	timeout /t 3 >nul
	cls & goto Additional
	)
	
	if errorlevel 1 ( 
	reg delete "HKCR\*\shell\����⮦���" /f >nul 2>&1
	reg delete "HKCR\Directory\shell\����⮦���" /f >nul 2>&1
	cls & goto Additional)
	)
	
	
	if "%errorlevel%"=="1" (%ch% {04} �㭪� �� �ਬ����{\n #}&&timeout /t 3 >nul&&cls&&goto Additional )

::     ----------------------------------------------------------------
rem ����� �ࠢ������ �᭮��묨 ��ࠬ��ࠬ� ���⥪�⭮�� ����
::     ----------------------------------------------------------------


:DesktopAndPC
cls
qprocess regedit.exe >nul 2>&1 && Mode 83,38 || Mode 83,38 && nircmd win center foreground

rem ====== �஢�ન ⥪�饣� ���ﭨ� �㭪⮢ ࠡ�祣� �⮫� ======
	
rem ��ࠢ���� � ...
	reg query "HKCR\DesktopBackground\Shell\Develop" >nul 2>&1 && set "ComeIn=0a" || set "ComeIn=08"

rem ������� ॥���
	reg query "HKCR\DesktopBackground\Shell\RegEdit" >nul 2>&1 && set "RegEdit=0a" || set "RegEdit=08"
	
rem ��������� ��ப�
	reg query "HKCR\DesktopBackground\Shell\Windows.cmd" >nul 2>&1 && set "CmdDesk=0a" || set "CmdDesk=08"
	
rem �������� ����� ���७�� 䠩���
	reg query "HKCR\*\shell\Windows.ShowFileExtensions" >nul 2>&1 && set "Extens=0a" || set "Extens=08"
	
rem TrustedInstaller
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\TrustedInstaller" >nul 2>&1 && set "TRI=0a" || set "TRI=08"
	
rem ����� 梥� ⥬�
	reg query "HKCR\DesktopBackground\Shell\AppMode" >nul 2>&1 && set "ColorWin=0a" || set "ColorWin=08"
	
rem ������ ��২��
	reg query "HKCR\DesktopBackground\Shell\EmptyBin" >nul 2>&1 && set "ClearRecycleBin=0a" || set "ClearRecycleBin=08"
	
rem �஬����� ����䮭�
	reg query "HKCR\DesktopBackground\Shell\MicrophoneSound" >nul 2>&1 && set "Microphone=0a" || set "Microphone=08"

rem ������� ��㯯���� ����⨪�
	reg query "HKCR\DesktopBackground\Shell\GPEdit" >nul 2>&1 && set "GPEditItem=0a" || set "GPEditItem=08"
	
rem ��१���� �஢������ � ᬥ�� �㤨�
	if exist "%SystemRoot%\RestExplorer.exe" (set "RestExplorer=0a") else (set "RestExplorer=08")
	if exist "%SystemRoot%\SoundChanger.exe" (set "ChangeSound=0a") else (set "ChangeSound=08")
	
	
rem ====== �஢�ન ⥪�饣� ���ﭨ� �㭪⮢ ���窠 �� ======
	
rem ��ࠢ�����
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Manage" /v "ProgrammaticAccessOnly" >nul 2>&1 && set "Manage=0a" || set "Manage=0c"
	
rem CMD
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\WinCmd" >nul 2>&1 && set "CmdItem=0a" || set "CmdItem=08"
	
rem �����஢騪 �������
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Taskschd" >nul 2>&1 && set "TaskSch=0a" || set "TaskSch=08"

rem ��ᬮ�� ᮡ�⨩
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\EventLog" >nul 2>&1 && set "Event=0a" || set "Event=08"

rem ���㠫�� ��䥪��
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\effects" >nul 2>&1 && set "effects=0a" || set "effects=08"
	
rem �����ய�⠭��
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PowerScheme" >nul 2>&1 && set "Scheme=0a" || set "Scheme=08"
	
rem ���� �����窨
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PageFile" >nul 2>&1 && set "PageFile=0a" || set "PageFile=08"
		
rem BitLocker
	reg query "HKLM\Software\Classes\Drive\shell\encrypt-bde-elev" /v "LegacyDisable" >nul 2>&1 && set "BitLck=0a" || set "BitLck=0c"

rem ���������/�⪫���� �⥢�� ���
	reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNetConnectDisconnect" >nul 2>&1 && set "LclDisk=0a" || set "LclDisk=0c"

rem ���箪 ��
	2>nul reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" | find /i "0x0" >nul 2>&1 && set "PcDesktop={2f}��������" || set "PcDesktop={08}���������"

		
	 %ch% {3f}�㭪�� ࠡ�祣� �⮫�{\n #}
	%ch% {0f} 1{#} - {%ComeIn%}��ࠢ����� � .. {08}[������ ���室 � ࠧ���� �����]{\n #}
	%ch% {0f} 2{#} - {%RegEdit%}������� ॥���{\n #}
	%ch% {0f} 3{#} - {%CmdDesk%}��������� ��ப�{\n #}
	%ch% {0f} 4{#} - {%RestExplorer%}��१���� �஢������ {08}[� ��࠭����� ������� �����]{\n #}
	%ch% {0f} 5{#} - {%Extens%}��������/����� ���७��{\n #}
	%ch% {0f} 6{#} - {%TRI%}TrustedInstaller {08}[��� ����᪠ �ᥣ� � ��� � ���ᨬ���묨 �ਢ�����ﬨ]{\n #}
	%ch% {0f} 7{#} - {%ColorWin%}����� 梥� ⥬�{\n #}
	%ch% {0f} 8{#} - {%ChangeSound%}����� �㤨����ன�⢠ {08}[����஥ ��४��祭�� ����� 2 �㤨����ன�⢠��]{\n #}
	%ch% {0f} 9{#} - {%ClearRecycleBin%}������ ��২��{\n #}
	%ch% {0f}10{#} - {%Microphone%}�஬����� ����䮭�{\n #}
	%ch% {0f}11{#} - {%GPEditItem%}������� ��㯯���� ����⨪�{\n #}
	echo.
	%ch% {3f}�㭪�� ���窠 ��{\n #}
	%ch% {0f}12{#} - {%Manage%}��ࠢ�����{\n #}
	%ch% {0f}13{#} - {%CmdItem%}��������� ��ப�{\n #}
	%ch% {0f}14{#} - {%TaskSch%}�����஢騪 �������{\n #}
	%ch% {0f}15{#} - {%Event%}��ᬮ�� ᮡ�⨩{\n #}
	%ch% {0f}16{#} - {%effects%}���㠫�� ��䥪��{\n #}
	%ch% {0f}17{#} - {%Scheme%}�����ய�⠭��{\n #}
	%ch% {0f}18{#} - {%PageFile%}���� �����窨{\n #}
	%ch% {0f}19{#} - {%LclDisk%}������ "���������/�⪫���� �⥢�� ���"{\n #}
	%ch% {0f}20{#} - {%BitLck%}������ "������� BitLocker"{\n #}
	%ch% {0f}33{#} - {5f}���箪 �� �� ࠡ�祬 �⮫�{#} - %PcDesktop%{\n #}
	
	%ch% {0e} ________________________________________________________________________________{\n #}
	%ch% {03} ������ ��⪨ ॥���{\n #}
	%ch% {05}00{#} - {0f}HKCR\DesktopBackground\Shell {09}[ࠡ�稩 �⮫]{\n #}
	%ch% {05}01{#} - {0f}HKCR\Directory\Background\shell {09}[ࠡ�稩 �⮫ � �����]{\n #}
	%ch% {05}02{#} - {0f}HKCR\Directory\Background\shellex\ContextMenuHandlers {09}[ࠡ�稩 �⮫ ���]{\n #}
	%ch% {05}03{#} - {0f}HKCR\CLSID\{{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell {09}[��� ��]{\n #}
	%ch% {05}04{#} - {0f}HKCU\Software\Classes\CLSID\{{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell {09}[��]{\n #}
	echo.
	%ch% {08} 77{#} - {04}������� �� �㭪�� ࠡ�祣� �⮫�{\n #}
	%ch% {08} 88{#} - {04}������� �� �㭪�� ���窠 ��{\n #}{\n #}
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}
	
	set "input="
	set /p input=
	if not defined input  cls && goto ContextMenu
	
	
	if "%input%"=="00" Call :OpenRegEdit "HKCR\DesktopBackground\Shell" && cls && goto DesktopAndPC
	if "%input%"=="01" Call :OpenRegEdit "HKCR\Directory\Background\shell" && cls && goto DesktopAndPC
	if "%input%"=="02" Call :OpenRegEdit "HKCR\Directory\Background\shellex\ContextMenuHandlers" && cls && goto DesktopAndPC
	if "%input%"=="03" Call :OpenRegEdit "HKCR\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell" && cls && goto DesktopAndPC
	if "%input%"=="04" Call :OpenRegEdit "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell" && cls && goto DesktopAndPC
	
	if "%input%"=="0"   goto GotoRegEdit
	if "%input%"=="1"   goto Develop
	if "%input%"=="2"   goto RegEditDeskTop
	if "%input%"=="3"   goto CMDItem
	if "%input%"=="4"   goto RestExplorer
	if "%input%"=="5"   goto Extension
	if "%input%"=="6"   goto TrustedInstaller
	if "%input%"=="7"   goto ColorThemeChange
	if "%input%"=="8"   goto ChangeSound
	if "%input%"=="9"   goto ClearRecycle
	if "%input%"=="10" goto MicrophoneSound
	if "%input%"=="11" goto GpeEdit
	if "%input%"=="12"  goto Manage
	if "%input%"=="13"  goto CMD
	if "%input%"=="14"  goto ShTasks
	if "%input%"=="15"  goto EventLog
	if "%input%"=="16"  goto VisualEffect
	if "%input%"=="17"  goto PowerScheme
	if "%input%"=="18"  goto PageFile
	if "%input%"=="19"  goto NetworkDisk
	if "%input%"=="20"  goto BitLocker
	if "%input%"=="33"  goto PcItemDesktop
	if "%input%"=="77"  goto DefaultDesktopAndPC
	if "%input%"=="88"  reg delete "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f >nul 2>&1 && cls && goto DesktopAndPC

	) else (
		cls && goto DesktopAndPC
	)


:OpenRegEdit
	set "KeyToGo=%~1"
	taskkill /f /im regedit.exe >nul 2>&1
	reg query "%KeyToGo%" >nul 2>&1 && cls || %ch% {0c} ������ ࠧ���� �� �������{\n #}&& timeout /t 2 >nul && cls && set "KeyToGo=" && exit /b
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /v "LastKey" /t REG_SZ /d "%KeyToGo%" /f >nul
	start regedit
	set "KeyToGo="
	exit /b


:PcItemDesktop
rem ����������/㤠����� ���窠 �� �� ࠡ�稩 �⮫
cls
	if "%PcDesktop%"=="{2f}��������" (
rem �������� ���窠 ��
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /f >nul 2>&1 & nircmd shellrefresh & cls & goto DesktopAndPC)
rem ���������� ���窠 �� � ���������� ࠡ�祣� �⮫�
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f >nul & nircmd shellrefresh & cls & goto DesktopAndPC


:Develop
rem ��ࠢ���� � ...
	reg query "HKCR\DesktopBackground\Shell\Develop" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\DesktopBackground\Shell\Develop" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	cls
	%ch% {0c} �롥��, ��� �㤥� ��室����� �㭪� � ���⥪�⭮� ���� ࠡ�祣� �⮫�{\n #}
	%ch% {08} 1{#} - {08}������{\n #}
	%ch% {08} 2{#} - {08}�����{\n #}
	%ch% {08} 3{#} - {08}�� 業���{\n #}
	choice /c 123 /n /m " "
	if errorlevel 3 reg add "HKCR\DesktopBackground\Shell\Develop" /v "Position" /t reg_SZ /d "Center" /f >nul
	if errorlevel 2 reg add "HKCR\DesktopBackground\Shell\Develop" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	if errorlevel 1 reg add "HKCR\DesktopBackground\Shell\Develop" /v "Position" /t reg_SZ /d "Top" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop" /v "Icon" /t reg_SZ /d "imageres.dll,251" /f >nul
rem �᫨ Windows 11 ��㣮� ����� ������
	wmic os get caption /Format:List | find /i "11" >nul 2>&1 && reg add "HKCR\DesktopBackground\Shell\Develop" /v "Icon" /t reg_SZ /d "imageres.dll,252" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop" /v "MUIVerb" /t reg_SZ /d "��ࠢ�����" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop" /v "Subcommands" /t reg_SZ /d "" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\AppData" /ve /t reg_SZ /d "AppData" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\AppData" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\AppData\command" /ve /t reg_SZ /d "explorer %USERPROFILE%\AppData" /f >nul

	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrFiles" /ve /t reg_SZ /d "Program Files" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrFiles" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrFiles\command" /ve /t reg_SZ /d "explorer %ProgramFiles%" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrFiles86" /ve /t reg_SZ /d "Program Files x86" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrFiles86" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrFiles86\command" /ve /t reg_SZ /d "explorer %ProgramFiles(x86)%" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrgData" /ve /t reg_SZ /d "C:\ProgramData" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrgData" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\PrgData\command" /ve /t reg_SZ /d "explorer %ProgramData%" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Windows" /ve /t reg_SZ /d "C:\Windows" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Windows" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Windows\command" /ve /t reg_SZ /d "explorer %SystemRoot%" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Sys32" /ve /t reg_SZ /d "System32" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Sys32" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Sys32\command" /ve /t reg_SZ /d "explorer %SystemRoot%\System32" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\StartMenu1" /ve /t reg_SZ /d "��� 1" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\StartMenu1" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\StartMenu1\command" /ve /t reg_SZ /d "explorer %AppData%\Microsoft\Windows\Start Menu\Programs" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\StartMenu2" /ve /t reg_SZ /d "��� 2" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\StartMenu2" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\StartMenu2\command" /ve /t reg_SZ /d "explorer %ProgramData%\Microsoft\Windows\Start Menu\Programs" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\SendToo" /ve /t reg_SZ /d "��ࠢ��� (SendTo)" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\SendToo" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\SendToo\command" /ve /t reg_SZ /d "explorer %APPDATA%\Microsoft\Windows\SendTo" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Temp" /ve /t reg_SZ /d "Temp" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Temp" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\Temp\command" /ve /t reg_SZ /d "explorer %Temp%" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\WApps" /ve /t reg_SZ /d "WindowsApps (UWP)" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\WApps" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\WApps\command" /ve /t reg_SZ /d "explorer %ProgramFiles%\WindowsApps" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\WinX" /ve /t reg_SZ /d "Win + X" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\WinX" /v "Icon" /t REG_SZ /d "C:\Windows\System32\imageres.dll,4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Develop\Shell\WinX\command" /ve /t reg_SZ /d "explorer %LocalAppData%\Microsoft\Windows\WinX" /f >nul
	
	cls&goto DesktopAndPC
	)


:RegEditDeskTop
rem ������� ॥���
	reg query "HKCR\DesktopBackground\Shell\RegEdit" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\DesktopBackground\Shell\RegEdit" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\DesktopBackground\Shell\RegEdit" /v "" /t REG_SZ /d "������" /f >nul 2>&1
	reg add "HKCR\DesktopBackground\Shell\RegEdit" /v "Icon" /t REG_SZ /d "%%Windir%%\regedit.exe" /f >nul 2>&1
	reg add "HKCR\DesktopBackground\Shell\RegEdit" /v "Position" /t REG_SZ /d "Bottom" /f >nul 2>&1
	reg add "HKCR\DesktopBackground\Shell\RegEdit\command" /v "" /t REG_SZ /d "RegEdit" /f >nul 2>&1
	cls&goto DesktopAndPC
	)

:CMDItem
rem ��������� ��ப�
	reg query "HKCR\DesktopBackground\Shell\Windows.cmd" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\DesktopBackground\Shell\Windows.cmd" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "CanonicalName" /t REG_SZ /d "{858B5A19-A5CE-40CE-9FA7-44C4254BA4A0}" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "Description" /t REG_SZ /d "@shell32.dll,-37416" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "Icon" /t REG_SZ /d "imageres.dll,-5323" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "ImpliedSelectionModel" /t REG_DWORD /d "0x1" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "InvokeCommandOnSelection" /t REG_DWORD /d "0x1" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "ResolveLinksQueryBehavior" /t REG_DWORD /d "0x0" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "StaticVerbOnly" /t REG_SZ /d "" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "" /t REG_SZ /d "CMD" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Windows.cmd" /v "Position" /t REG_SZ /d "Bottom" /f >nul
	cls&goto DesktopAndPC
	)
	
:RestExplorer
rem ��१���� �஢������ � ������� RestExplorer > https://www.sordum.org/9192/restart-explorer-v1-6/
	if exist "%SystemRoot%\RestExplorer.exe" (
	del /q "%SystemRoot%\RestExplorer.exe" >nul
	reg delete "HKCR\DesktopBackground\Shell\RestartExplorer" /f >nul 2>&1
	cls&goto DesktopAndPC
	) else (
	cls
	copy /y RestExplorer.exe "%SystemRoot%" >nul 2>&1
	%ch% {0f} ��१���� �஢������{\n #}
	%ch% {0c} �롥��, ��� �㤥� ��室����� �㭪� � ���⥪�⭮� ���� ࠡ�祣� �⮫�{\n #}{\n #}
	%ch% {08} 1{#} - {08}������{\n #}
	%ch% {08} 2{#} - {08}�����{\n #}
	%ch% {08} 3{#} - {08}�� 業���{\n #}
	choice /c 123 /n /m " "
	if errorlevel 3 reg add "HKCR\DesktopBackground\Shell\RestartExplorer" /v "Position" /t reg_SZ /d "Center" /f >nul
	if errorlevel 2 reg add "HKCR\DesktopBackground\Shell\RestartExplorer" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	if errorlevel 1 reg add "HKCR\DesktopBackground\Shell\RestartExplorer" /v "Position" /t reg_SZ /d "Top" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\RestartExplorer" /v "Icon" /t reg_SZ /d "imageres.dll,228" /f >nul
rem �᫨ Windows 11 ��㣮� ����� ������
	wmic os get caption /Format:List | find /i "11" >nul 2>&1 && reg add "HKCR\DesktopBackground\Shell\RestartExplorer" /v "Icon" /t reg_SZ /d "imageres.dll,229" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\RestartExplorer" /v "MUIVerb" /t reg_SZ /d "�஢�����" /f >nul
	reg add "HKCR\DesktopBackground\Shell\RestartExplorer\command" /ve /t reg_EXPAND_SZ /d "RestExplorer" /f >nul
	echo.
	%ch% {0c} �����뢠�� � ������ Shift?{\n #}
	%ch% {08} 1{#} - {0c}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto DesktopAndPC
	if errorlevel 1 reg add "HKCR\DesktopBackground\Shell\RestartExplorer" /t reg_SZ /v "Extended" /d "" /f >nul &&cls&goto DesktopAndPC
	)

:Extension
rem �����뢠��/��뢠�� ���७�� 䠩���
	reg query "HKCR\*\shell\Windows.ShowFileExtensions" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\*\shell\Windows.ShowFileExtensions" /f >nul 2>&1
	reg delete "HKCR\Folder\shell\Windows.ShowFileExtensions" /f >nul 2>&1
	reg delete "HKCR\Directory\Background\shell\Windows.ShowFileExtensions" /f >nul 2>&1
	cls&goto DesktopAndPC
	) else (
	cls
	reg add "HKCR\*\shell\Windows.ShowFileExtensions" /v "CommandStateSync" /t reg_SZ /d "" /f >nul
	reg add "HKCR\*\shell\Windows.ShowFileExtensions" /v "Description" /t reg_SZ /d "@shell32.dll,-37571" /f >nul
	reg add "HKCR\*\shell\Windows.ShowFileExtensions" /v "ExplorerCommandHandler" /t reg_SZ /d "{4ac6c205-2853-4bf5-b47c-919a42a48a16}" /f >nul
	reg add "HKCR\*\shell\Windows.ShowFileExtensions" /v "MUIVerb" /t reg_SZ /d "����७��" /f >nul
	reg add "HKCR\*\shell\Windows.ShowFileExtensions" /v "Icon" /t reg_SZ /d "shell32.dll,169" /f >nul
	
	reg add "HKCR\Folder\shell\Windows.ShowFileExtensions" /v "CommandStateSync" /t reg_SZ /d "" /f >nul
	reg add "HKCR\Folder\shell\Windows.ShowFileExtensions" /v "Description" /t reg_SZ /d "@shell32.dll,-37571" /f >nul
	reg add "HKCR\Folder\shell\Windows.ShowFileExtensions" /v "ExplorerCommandHandler" /t reg_SZ /d "{4ac6c205-2853-4bf5-b47c-919a42a48a16}" /f >nul
	reg add "HKCR\Folder\shell\Windows.ShowFileExtensions" /v "MUIVerb" /t reg_SZ /d "����७��" /f >nul
	reg add "HKCR\Folder\shell\Windows.ShowFileExtensions" /v "Icon" /t reg_SZ /d "shell32.dll,169" /f >nul
	
	reg add "HKCR\Directory\Background\shell\Windows.ShowFileExtensions" /v "CommandStateSync" /t reg_SZ /d "" /f >nul
	reg add "HKCR\Directory\Background\shell\Windows.ShowFileExtensions" /v "Description" /t reg_SZ /d "@shell32.dll,-37571" /f >nul
	reg add "HKCR\Directory\Background\shell\Windows.ShowFileExtensions" /v "ExplorerCommandHandler" /t reg_SZ /d "{4ac6c205-2853-4bf5-b47c-919a42a48a16}" /f >nul
	reg add "HKCR\Directory\Background\shell\Windows.ShowFileExtensions" /v "MUIVerb" /t reg_SZ /d "����७��" /f >nul
	reg add "HKCR\Directory\Background\shell\Windows.ShowFileExtensions" /v "Icon" /t reg_SZ /d "shell32.dll,169" /f >nul
	
	
	%ch% {0c} �����뢠�� � ������ Shift?{\n #}
	%ch% {08} 1{#} - {0c}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto DesktopAndPC
	if errorlevel 1 (
	reg add "HKCR\*\shell\Windows.ShowFileExtensions" /v "Extended" /t reg_SZ /d "" /f >nul
	reg add "HKCR\Folder\shell\Windows.ShowFileExtensions" /v "Extended" /t reg_SZ /d "" /f >nul
	reg add "HKCR\Directory\Background\shell\Windows.ShowFileExtensions" /v "Extended" /t reg_SZ /d "" /f >nul
	cls&goto DesktopAndPC
	))

:TrustedInstaller
rem ����� �� TrustedInstaller
	reg query "HKLM\Software\Classes\DesktopBackground\Shell\TrustedInstaller" >nul 2>&1
	if "%errorlevel%"=="0" (
	del /q "%SystemRoot%\TrInstaller.exe" >nul 2>&1
	reg delete "HKCR\exefile\shell\AsTi" /f >nul 2>&1
	reg delete "HKCR\batfile\shell\AsTi" /f >nul 2>&1
	reg delete "HKCR\cmdfile\shell\AsTi" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\TrustedInstaller" /f >nul 2>&1
	cls&goto DesktopAndPC)
	if "%errorlevel%"=="1" (
	cls
	copy /y TrInstaller.exe "%SystemRoot%" >nul 2>&1
	%ch% {0f} ����� �� ����� TrustedInstaller{\n #}
	%ch% {0f} ��� 䠩��� .exe, .bat, .cmd ����� �㭪� �⮡ࠦ����� {04}� ������ Shift{\n #}{\n #}
	%ch% {0c} �롥��, ��� �㤥� ��室����� �㭪� � ���⥪�⭮� ���� ࠡ�祣� �⮫�{\n #}
	%ch% {08} 1{#} - {08}������{\n #}
	%ch% {08} 2{#} - {08}�����{\n #}
	%ch% {08} 3{#} - {08}�� 業���{\n #}
	choice /c 123 /n /m " "
	if errorlevel 3 reg add "HKCR\DesktopBackground\Shell\TrustedInstaller" /v "Position" /t reg_SZ /d "Center" /f >nul
	if errorlevel 2 reg add "HKCR\DesktopBackground\Shell\TrustedInstaller" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	if errorlevel 1 reg add "HKCR\DesktopBackground\Shell\TrustedInstaller" /v "Position" /t reg_SZ /d "Top" /f >nul
	
rem ����� �ᯮ�짮���� ������� nircmd execmd TrInstaller /c, ������ ��� ࠡ�⠥� ⮫쪮 � �몫�祭�� UAC, ��⮬� �� �ॡ���� ����� �ࠢ nircmd, ���⮬� �ᯮ��㥬 mshta, ���� ࠡ�⠫� ��� � ����祭�� UAC, ⠪ � � �몫�祭�� ��� ������� ���� CMD


rem ��ਠ�� � TI.exe - reg add "HKCR\exefile\Shell\AsTi\command" /v "" /t reg_SZ /d "TI \"%%1\"" /f >nul
	reg add "HKCR\exefile\shell\AsTi" /v "" /t reg_SZ /d "����� �� ����� TrustedInstaller" /f >nul
	reg add "HKCR\exefile\shell\AsTi" /v "Icon" /t reg_SZ /d "imageres.dll,-107" /f >nul
	reg add "HKCR\exefile\shell\AsTi" /v "Extended" /t reg_SZ /d "" /f >nul
	reg add "HKCR\exefile\Shell\AsTi\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"TrInstaller /c \"\"%%1\"\"\",0)(Window.Close)" /f >nul

	reg add "HKCR\batfile\shell\AsTi" /v "" /t reg_SZ /d "����� �� ����� TrustedInstaller" /f >nul
	reg add "HKCR\batfile\shell\AsTi" /v "Icon" /t reg_SZ /d "imageres.dll,-107" /f >nul
	reg add "HKCR\batfile\shell\AsTi" /v "Extended" /t reg_SZ /d "" /f >nul
	reg add "HKCR\batfile\Shell\AsTi\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"TrInstaller /c \"\"%%1\"\"\",0)(Window.Close)" /f >nul
	
	reg add "HKCR\cmdfile\shell\AsTi" /v "" /t reg_SZ /d "����� �� ����� TrustedInstaller" /f >nul
	reg add "HKCR\cmdfile\shell\AsTi" /v "Icon" /t reg_SZ /d "imageres.dll,-107" /f >nul
	reg add "HKCR\cmdfile\shell\AsTi" /v "Extended" /t reg_SZ /d "" /f >nul
	reg add "HKCR\cmdfile\Shell\AsTi\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"TrInstaller /c \"\"%%1\"\"\",0)(Window.Close)" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller" /v "Icon" /t reg_SZ /d "imageres.dll,-107" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller" /v "MUIVerb" /t reg_SZ /d "TI" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller" /v "Subcommands" /t reg_SZ /d "" /f >nul
	
rem ��������� ��ப�
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\CMD" /ve /t reg_SZ /d "��������� ��ப�" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\CMD" /v "Icon" /t reg_SZ /d "cmd.exe,0" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\CMD\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"TrInstaller /c cmd.exe /k cd /d %%%%SystemRoot%%%% ^& ^Title TICMD ^& color 04 ^& echo This CMD Running From System\",0)(Window.Close)" /f >nul
rem TI cmd.exe /k Title TICMD & cd /d "%%SystemRoot%%" & color 04 & echo This Cmd Was Runned From %%UserName%%

rem ������� ॥���
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\regEdit" /ve /t reg_SZ /d "������� ॥���" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\regEdit" /v "Icon" /t reg_SZ /d "regedit.exe,0" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\regEdit\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"TrInstaller /c regedit\",0)(Window.Close)" /f >nul
rem reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\regEdit\command" /v "" /t reg_SZ /d "nircmd execmd TrInstaller /c regedit" /f >nul
	
rem ��ᯥ��� �����
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\TaskMgr" /ve /t reg_SZ /d "��ᯥ��� �����" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\TaskMgr" /v "Icon" /t reg_SZ /d "taskmgr.exe" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\TaskMgr\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"TrInstaller /c taskmgr\",0)(Window.Close)" /f >nul
	
rem ��㦡�
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\Services" /ve /t reg_SZ /d "��㦡�" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\Services" /v "Icon" /t reg_SZ /d "filemgmt.dll" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\Services\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"TrInstaller /c mmc /s services.msc\",0)(Window.Close)" /f >nul
rem reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\Services\command" /v "" /t reg_SZ /d "TI \"C:\Windows\System32\mmc.exe\" /s services.msc" /f >nul
	
rem �஢�����
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\Explorer" /ve /t reg_SZ /d "�஢�����" /f >nul
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\Explorer" /v "Icon" /t reg_SZ /d "imageres.dll,203" /f >nul
	
	for /f "tokens=3" %%I in (' reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" 2^>nul ') do set /a "UAC=%%I"
	if "!UAC!"=="0" (
rem ��ਠ�� ��� �����饣� ����, � ������� nircmd, ��� �⪫��񭭮�� UAC
	copy /y nircmd.exe "!SystemRoot!" >nul 2>&1
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\Explorer\command" /v "" /t REG_SZ /d "nircmd execmd TrInstaller /c nircmd execmd reg delete \"HKCR\AppID\{CDCBCFCA-3CDC-436f-A4E2-0E02075250C2}\" /v RunAs /f & nircmd execmd TrInstaller /c nircmd execmd explorer shell:MyComputerFolder & timeout /t 2 /nobreak >nul & nircmd execmd TrInstaller /c nircmd execmd reg add \"HKCR\AppID\{CDCBCFCA-3CDC-436f-A4E2-0E02075250C2}\" /v \"RunAs\" /t REG_SZ /d \"Interactive User\" /f" /f >nul
	cls&goto DesktopAndPC
	) else (
rem ��ਠ��, �᫨ UAC ������
	reg add "HKCR\DesktopBackground\Shell\TrustedInstaller\Shell\Explorer\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c TrInstaller /c reg delete HKCR\AppID\{CDCBCFCA-3CDC-436f-A4E2-0E02075250C2} /v RunAs /f ^& TrInstaller /c cmd /c explorer= ^& timeout /t 2 /nobreak >nul ^& TrInstaller /c reg add HKCR\AppID\{CDCBCFCA-3CDC-436f-A4E2-0E02075250C2} /v RunAs /t REG_SZ /d \"\"Interactive User\"\" /f\",0)(Window.Close)" /f >nul
	cls&goto DesktopAndPC
		)
	)
	
:ColorThemeChange
rem ����� 梥� ⥬�
	reg query "HKCR\DesktopBackground\Shell\AppMode" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\Directory\Background\shell\AppMode" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\AppMode" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCR\DesktopBackground\Shell\AppMode" /v "MUIVerb" /t REG_SZ /d "����" /f >nul
	reg add "HKCR\DesktopBackground\Shell\AppMode" /v "Icon" /t REG_SZ /d "loghours.dll,1" /f >nul
	reg add "HKCR\DesktopBackground\Shell\AppMode" /v "SubCommands" /t REG_SZ /d "" /f >nul
	reg add "HKCR\DesktopBackground\Shell\AppMode" /v "Position" /t REG_SZ /d "bottom" /f >nul
	
	wmic os get caption /Format:List | find /i "11" >nul
	if "!errorlevel!"=="0" (
rem ������ ��� 11
	reg add "HKCR\DesktopBackground\Shell\AppMode\shell\Dark" /v "Icon" /t REG_SZ /d "imageres.dll,333" /f >nul
	reg add "HKCR\DesktopBackground\Shell\AppMode\shell\Light" /v "Icon" /t REG_SZ /d "imageres.dll,332" /f >nul
	)
	if "!errorlevel!"=="1" (
rem ������ ��� 10
	reg add "HKCR\DesktopBackground\Shell\AppMode\shell\Dark" /v "Icon" /t REG_SZ /d "imageres.dll,332" /f >nul
	reg add "HKCR\DesktopBackground\Shell\AppMode\shell\Light" /v "Icon" /t REG_SZ /d "imageres.dll,331" /f >nul
	)
	
	reg add "HKCR\DesktopBackground\Shell\AppMode\shell\Dark" /v "" /t REG_SZ /d "������" /f >nul	
	reg add "HKCR\DesktopBackground\Shell\AppMode\shell\Dark\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 0 /f ^&^& reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 0 /f\",0)(Window.Close)" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\AppMode\shell\Light" /v "" /t REG_SZ /d "���⫠�" /f >nul
	reg add "HKCR\DesktopBackground\Shell\AppMode\shell\Light\command" /v "" /t REG_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 1 /f ^&^& reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 1 /f\",0)(Window.Close)" /f >nul
	cls&goto DesktopAndPC
	)

:ChangeSound
rem ������ ����� ��㪮���� ���ன�⢠ �� 㬮�砭��
	del SoundChange\DefSound.cmd >nul 2>&1
	del SoundChange\DefSound-x32.exe >nul 2>&1
	del /q "%SystemRoot%\ChangeSound.bat" >nul 2>&1
	del /q "%SystemRoot%\DefSound.cmd" >nul 2>&1
	del /q "%SystemRoot%\DefSound.exe" >nul 2>&1
	del /q "%SystemRoot%\DefSound64.exe" >nul 2>&1
	del /q "%SystemRoot%\DefSound-x32.exe" >nul 2>&1


	reg query "HKCR\DesktopBackground\Shell\SoundChange" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\DesktopBackground\Shell\SoundChange" /f >nul 2>&1
	reg delete "HKCU\Software\SoundChanger" /f >nul 2>&1
	del /q "%SystemRoot%\SoundChanger.exe" >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	copy /y SoundChanger.exe "%SystemRoot%" >nul 2>&1
	reg add "HKCR\DesktopBackground\Shell\SoundChange" /v "Icon" /t reg_SZ /d "mmres.dll,6" /f >nul
	reg add "HKCR\DesktopBackground\Shell\SoundChange" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	reg add "HKCR\DesktopBackground\Shell\SoundChange" /v "MUIVerb" /t reg_SZ /d "����� �㤨�" /f >nul
	reg add "HKCR\DesktopBackground\Shell\SoundChange\command" /v "" /t REG_EXPAND_SZ /d "SoundChanger.exe" /f
	cls&goto DesktopAndPC
	)
	
rem reg add "HKCR\DesktopBackground\Shell\SoundChange" /v "SubCommands" /t REG_SZ /d "" /f >nul
REM start control mmsys.cpl ,0
REM set /p "Name1Device=������ ��� ��ࢮ�� ���ன�⢠: "&echo.
REM if not defined Name1Device (%ch% {0c}�� ��祣� �� �����...{\n #}&&pause&&goto DesktopAndPC)

REM reg add "HKCR\DesktopBackground\Shell\SoundChange\shell\Device1" /v "" /t REG_SZ /d "���ன�⢮ 1" /f >nul
REM reg add "HKCR\DesktopBackground\Shell\SoundChange\shell\Device1\command" /v "" /t REG_EXPAND_SZ /d "nircmd setdefaultsounddevice \"!Name1Device!\"" /f >nul

REM set /p "Name2Device=������ ��� ��ண� ���ன�⢠: "&echo.
REM if not defined Name2Device (%ch% {0c}�� ��祣� �� �����...{\n #}&&pause&&goto DesktopAndPC)

REM reg add "HKCR\DesktopBackground\Shell\SoundChange\shell\Device2" /v "" /t REG_SZ /d "���ன�⢮ 2" /f >nul
REM reg add "HKCR\DesktopBackground\Shell\SoundChange\shell\Device2\command" /v "" /t REG_EXPAND_SZ /d "nircmd setdefaultsounddevice \""!Name2Device!\"" /f >nul
	

:ClearRecycle
rem ���⪠ ��২�� � ������� NirCmd > https://www.nirsoft.net/utils/nircmd.html - nircmd emptybin
rem PowerShell - Clear-RecycleBin -Force
rem CMD - rd /s /q %systemdrive%\$Recycle.bin

	reg query "HKCR\DesktopBackground\Shell\EmptyBin" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\DesktopBackground\Shell\EmptyBin" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	cls
	reg add "HKCR\DesktopBackground\Shell\EmptyBin" /v "Icon" /t reg_SZ /d "imageres.dll,49" /f >nul
	reg add "HKCR\DesktopBackground\Shell\EmptyBin" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	reg add "HKCR\DesktopBackground\Shell\EmptyBin" /v "MUIVerb" /t reg_SZ /d "������ ��২��" /f >nul
	reg add "HKCR\DesktopBackground\Shell\EmptyBin\command" /v "" /t REG_EXPAND_SZ /d "mshta vbscript:CreateObject(\"WScript.Shell\").Run(\"PowerShell \"\"Clear-RecycleBin -Force\"\"\",0)(Window.Close)" /f >nul
	%ch% {0c} �����뢠�� � ������ Shift?{\n #}
	%ch% {08} 1{#} - {0c}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto DesktopAndPC
	if errorlevel 1 reg add "HKCR\DesktopBackground\Shell\EmptyBin" /v "Extended" /t reg_SZ /d "" /f >nul &cls&goto DesktopAndPC
	)
	
	
:MicrophoneSound
rem ��������� �஬���� ����䮭�
	reg query "HKCR\DesktopBackground\Shell\MicrophoneSound" >nul 2>&1
	if "%errorlevel%"=="0" (
	del /q "%SystemRoot%\nircmd.exe" >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\MicrophoneSound" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	cls
	copy /y nircmd.exe "%SystemRoot%" >nul 2>&1
	
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound" /v "Icon" /t reg_SZ /d "mmres.dll,5" /f >nul
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound" /v "MUIVerb" /t reg_SZ /d "����䮭" /f >nul
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound" /v "SubCommands" /t REG_SZ /d "" /f >nul
		
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound\shell\SoundSett" /v "" /t REG_SZ /d "��ࠬ���� ����䮭�" /f >nul
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound\shell\SoundSett\command" /v "" /t REG_EXPAND_SZ /d "control mmsys.cpl ,1" /f >nul	
		
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound\shell\0Percent" /v "" /t REG_SZ /d "0%%" /f >nul
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound\shell\0Percent\command" /v "" /t REG_EXPAND_SZ /d "mshta.exe vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c nircmd mutesysvolume 1 default_record ^&^& nircmd infobox \"\"����䮭 �⪫�祭\"\" \"\"Microphone\"\"\",0)(Window.Close)" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound\shell\70Percent" /v "" /t REG_SZ /d "70%%" /f >nul
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound\shell\70Percent\command" /v "" /t REG_EXPAND_SZ /d "mshta.exe vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c nircmd mutesysvolume 0 default_record ^&^& nircmd setsysvolume 46000 default_record ^&^& nircmd infobox \"\"�஬����� ����䮭� ���⠢���� �� 70%%%%\"\" \"\"Microphone\"\"\",0)(Window.Close)" /f >nul
	
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound\shell\100Percent" /v "" /t REG_SZ /d "100%%" /f >nul
	reg add "HKCR\DesktopBackground\Shell\MicrophoneSound\shell\100Percent\command" /v "" /t REG_EXPAND_SZ /d "mshta.exe vbscript:CreateObject(\"WScript.Shell\").Run(\"cmd /c nircmd mutesysvolume 0 default_record ^&^& nircmd setsysvolume 65535 default_record ^&^& nircmd infobox \"\"�஬����� ����䮭� ���⠢���� �� 100%%%%\"\" \"\"Microphone\"\"\",0)(Window.Close)" /f >nul
	
	%ch% {0c} �����뢠�� � ������ Shift?{\n #}
	%ch% {08} 1{#} - {0c}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto DesktopAndPC
	if errorlevel 1 reg add "HKCR\DesktopBackground\Shell\MicrophoneSound" /v "Extended" /t reg_SZ /d "" /f >nul &cls&goto DesktopAndPC
	)
	
:GpeEdit
	reg query "HKCR\DesktopBackground\Shell\GPEdit" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\DesktopBackground\Shell\GPEdit" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	cls
	reg add "HKCR\DesktopBackground\Shell\GPEdit" /v "Icon" /t reg_SZ /d "gpedit.dll" /f >nul
	reg add "HKCR\DesktopBackground\Shell\GPEdit" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	reg add "HKCR\DesktopBackground\Shell\GPEdit" /v "MUIVerb" /t reg_SZ /d "��㯯��� ����⨪�" /f >nul
	reg add "HKCR\DesktopBackground\Shell\GPEdit\command" /v "" /t REG_SZ /d "mmc /s gpedit.msc" /f >nul
	%ch% {0c} �����뢠�� � ������ Shift?{\n #}
	%ch% {08} 1{#} - {0c}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls&goto DesktopAndPC
	if errorlevel 1 reg add "HKCR\DesktopBackground\Shell\GPEdit" /v "Extended" /t reg_SZ /d "" /f >nul &cls&goto DesktopAndPC
	)
	
	
:Manage
rem �㭪� "��ࠢ�����"
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Manage" /v "ProgrammaticAccessOnly" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Manage" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Manage" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	cls&goto DesktopAndPC
	)

:CMD
rem ��������� ��ப�
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\WinCmd" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\WinCmd" /f >nul
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\WinCmd" /v "" /t REG_EXPAND_SZ /d "��������� ��ப�" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\WinCmd" /v "HasLUAShield" /t REG_SZ /d "" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\WinCmd" /v "Icon" /t REG_EXPAND_SZ /d "cmd.exe" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\WinCmd\command" /v "" /t REG_EXPAND_SZ /d "cmd" /f >nul
	cls&goto DesktopAndPC
	)

:ShTasks
rem �����஢騪 �������
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Taskschd" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Taskschd" /f >nul
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Taskschd" /v "" /t REG_SZ /d "�����஢騪 �������" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Taskschd" /v "HasLUAShield" /t REG_SZ /d "" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Taskschd" /v "Icon" /t REG_SZ /d "%%windir%%\system32\miguiresource.dll,1" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Taskschd\command" /v "" /t REG_SZ /d "control schedtasks" /f >nul
rem mmc.exe /s taskschd.msc
	cls&goto DesktopAndPC
	)
	
:EventLog
rem ��ᬮ�� ᮡ�⨩
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\EventLog" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\EventLog" /f >nul
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\EventLog" /v "" /t REG_SZ /d "��ᬮ�� ᮡ�⨩" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\EventLog" /v "HasLUAShield" /t REG_SZ /d "" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\EventLog" /v "Icon" /t REG_SZ /d "mmc.exe,0" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\EventLog\command" /v "" /t REG_SZ /d "mmc.exe /s eventvwr.msc /s" /f >nul
	cls&goto DesktopAndPC
	)
	
:VisualEffect
rem ���㠫�� ��䥪��
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\effects" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\effects" /f >nul
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\effects" /v "" /t REG_SZ /d "���㠫�� ��䥪��" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\effects" /v "Icon" /t REG_SZ /d "SystemPropertiesPerformance.exe" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\effects\command" /v "" /t REG_SZ /d "SystemPropertiesPerformance" /f >nul
	cls&goto DesktopAndPC
	)

:PowerScheme
rem �����ய�⠭��
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PowerScheme" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PowerScheme" /f >nul
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PowerScheme" /v "" /t REG_SZ /d "�����ய�⠭��" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PowerScheme" /v "Icon" /t REG_SZ /d "C:\Windows\System32\powercpl.dll" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PowerScheme\command" /v "" /t REG_SZ /d "control powercfg.cpl" /f >nul
	cls&goto DesktopAndPC
	)

:PageFile
rem ���� �����窨
	reg query "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PageFile" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PageFile" /f >nul
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PageFile" /v "" /t REG_SZ /d "���� �����窨" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PageFile" /v "Icon" /t REG_SZ /d "shell32.dll,-13" /f >nul
	reg add "HKCU\Software\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\PageFile\command" /v "" /t REG_SZ /d "SystemPropertiesPerformance /pagefile" /f >nul
	cls&goto DesktopAndPC
	)

:NetworkDisk
rem ���������/�⪫���� �⥢�� ���
	reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNetConnectDisconnect" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNetConnectDisconnect" /f >nul 2>&1
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNetConnectDisconnect" /f >nul 2>&1
	call :RestartExplorer
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNetConnectDisconnect" /t REG_DWORD /d "1" /f >nul 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoNetConnectDisconnect" /t REG_DWORD /d "1" /f >nul 2>&1
	call :RestartExplorer
	cls&goto DesktopAndPC
	)
	
:BitLocker
rem BitLocker
	reg query "HKLM\Software\Classes\Drive\shell\encrypt-bde-elev" /v "LegacyDisable" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKLM\Software\Classes\Drive\shell\change-passphrase" /v "LegacyDisable" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Drive\shell\change-pin" /v "LegacyDisable" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Drive\shell\encrypt-bde" /v "LegacyDisable" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Drive\shell\encrypt-bde-elev" /v "LegacyDisable" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Drive\shell\manage-bde" /v "LegacyDisable" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Drive\shell\resume-bde" /v "LegacyDisable" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Drive\shell\resume-bde-elev" /v "LegacyDisable" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Drive\shell\unlock-bde" /v "LegacyDisable" /f >nul 2>&1
	cls&goto DesktopAndPC
	)
	if "%errorlevel%"=="1" (
	reg add "HKLM\Software\Classes\Drive\shell\change-passphrase" /v "LegacyDisable" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Drive\shell\change-pin" /v "LegacyDisable" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Drive\shell\encrypt-bde" /v "LegacyDisable" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Drive\shell\encrypt-bde-elev" /v "LegacyDisable" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Drive\shell\manage-bde" /v "LegacyDisable" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Drive\shell\resume-bde" /v "LegacyDisable" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Drive\shell\resume-bde-elev" /v "LegacyDisable" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Drive\shell\unlock-bde" /v "LegacyDisable" /t REG_SZ /d "" /f >nul
	cls&goto DesktopAndPC
	)
	
	
	

:DefaultDesktopAndPC
rem �������� ��� �㭪⮢ ࠡ�祣� �⮫�
cls
	%ch%  {4f}������� �� �㭪�� ࠡ�祣� �⮫�?{\n #}
	%ch% {08} 1{#} - {08}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls && goto DesktopAndPC
	if errorlevel 1 cls
	del /q "%SystemRoot%\RestExplorer.exe" >nul 2>&1
	del /q "%SystemRoot%\nircmd.exe" >nul 2>&1
	del /q "%SystemRoot%\TrInstaller.exe" >nul 2>&1
	del /q "%SystemRoot%\ChangeSound.bat" >nul 2>&1
	del /q "%SystemRoot%\DefSound.cmd" >nul 2>&1
	del /q "%SystemRoot%\DefSound.exe" >nul 2>&1
	del /q "%SystemRoot%\DefSound64.exe" >nul 2>&1
	del /q "%SystemRoot%\DefSound-x32.exe" >nul 2>&1
	del /q "%SystemRoot%\SoundChanger.exe" >nul 2>&1

	reg delete "HKCR\DesktopBackground\Shell\Develop" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\RegEdit" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\Windows.cmd" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\RestartExplorer" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\TrustedInstaller" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\AppMode" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\SoundChange" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\EmptyBin" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\DesktopBackground\Shell\TrustedInstaller" /f >nul 2>&1
	reg delete "HKCR\*\shell\Windows.ShowFileExtensions" /f >nul 2>&1
	reg delete "HKCR\Folder\shell\Windows.ShowFileExtensions" /f >nul 2>&1
	reg delete "HKCR\Directory\Background\shell\Windows.ShowFileExtensions" /f >nul 2>&1
	reg delete "HKCR\exefile\shell\runastrustedinstaller" /f >nul 2>&1
	reg delete "HKCR\batfile\shell\runastrustedinstaller" /f >nul 2>&1
	reg delete "HKCR\cmdfile\shell\runastrustedinstaller" /f >nul 2>&1
	reg delete "HKCR\exefile\shell\AsTi" /f >nul 2>&1
	reg delete "HKCR\batfile\shell\AsTi" /f >nul 2>&1
	reg delete "HKCR\cmdfile\shell\AsTi" /f >nul 2>&1
	reg delete "HKCR\Directory\Background\shell\AppMode" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\GPEdit" /f >nul 2>&1
	reg delete "HKCR\DesktopBackground\Shell\MicrophoneSound" /f >nul 2>&1
	reg delete "HKCU\Software\SoundChanger" /f >nul 2>&1
	cls&goto DesktopAndPC
	
	
		
rem                                                                   =================================

:FullContMenu
	reg query "HKCR\DesktopBackground\Shell\Display" >nul 2>&1	
	if "%errorlevel%"=="0" (
	cls
	%ch%  {4f}������ �� �㭪�� ���⥪�⭮�� ���� ?{\n #}
	%ch% {08} 1{#} - {0a}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls && goto ContextMenu
	if errorlevel 1 cls
	
rem �������� ��� �㭪⮢
	
rem 1. �।��⠢��� ����� �
rem 2. ���९��� �� ��砫쭮� �࠭�
rem 3. ����⠭����� �०��� �����
rem 4. ��।���/��ࠢ��� �� ���ன�⢮
rem 5. ��ࠬ���� �࠭�
rem 6. ���ᮭ�������
	
	%TI% reg delete "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f >nul 2>&1
	%TI% reg delete "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f >nul 2>&1
	%TI% reg delete "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f >nul 2>&1
	%TI% reg delete "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /f >nul 2>&1
	%TI% reg delete "HKCR\DesktopBackground\Shell\Display" /f >nul 2>&1
	
rem ���ᮭ�������
	%TI% reg add "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
		
rem �������� � ������⥪�
	reg delete "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" /f >nul 2>&1
	
rem ������饥 䮭���� ����ࠦ���� ࠡ�祣� �⮫�
	reg delete "HKCR\DesktopBackground\shellex\ContextMenuHandlers\DesktopSlideshow" /f >nul 2>&1

rem ���९��� �� ������ ����ண� ����㯠
	reg delete "HKLM\Software\Classes\Folder\shell\pintohome" /f >nul 2>&1

rem ����������
	reg delete "HKLM\Software\Classes\*\shellex\ContextMenuHandlers\ModernSharing" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" /f >nul 2>&1
	
rem ��ࠢ���
	reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /f >nul 2>&1

rem ��ࠢ����� �஡��� � ᮢ���⨬�����
	reg delete "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
	reg delete "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
rem ��������� 16.01.23
	reg delete "HKCR\batfile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
	reg delete "HKCR\cmdfile\shellex\ContextMenuHandlers\Compatibility" /f >nul 2>&1
	
rem ���९��� �� ������ �����
	reg delete "HKCR\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" /f >nul 2>&1

rem ������ � ����� �����/�������
	reg delete "HKLM\Software\Classes\Folder\shell\opennewprocess" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Folder\shell\opennewtab" /f >nul 2>&1
	
rem �������� ��ࠢ� �����
	reg delete "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.gif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.heic\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.heif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.ico\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.jpe\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.jpeg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.jpg\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.png\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul 2>&1
	reg delete "HKCR\SystemFileAssociations\.avci\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.avif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.dds\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.dib\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.jfif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.jxr\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.rle\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.tif\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.tiff\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.wdp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	reg delete "HKCR\SystemFileAssociations\.webp\ShellEx\ContextMenuHandlers\ShellImagePreview" /f >nul
	
rem �����
	reg add "HKLM\Software\Classes\SystemFileAssociations\image\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\batfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\cmdfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\docxfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\fonfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\htmlfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\inffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\inifile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\pfmfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\regfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\rtffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\ttcfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\ttffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\txtfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\VBEFile\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\VBSFile\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\WSFFile\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\JSEFile\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\JSFile\Shell\Print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Applications\photoviewer.dll\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\contact_wab_auto_file\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\emffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\fonfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\group_wab_auto_file\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\IE.AssocFile.HTM\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\IE.AssocFile.SVG\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\IE.AssocFile.XHT\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul	
	reg add "HKLM\Software\Classes\odtfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\otffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\PBrush\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\rlefile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\svgfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\textfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\wdpfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\wmffile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Wordpad.Document.1\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\xhtmlfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\zapfile\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\IE.AssocFile.URL\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.heic\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.avci\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.avcs\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.avif\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.avifs\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.heics\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.heif\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.heifs\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\SystemFileAssociations\.hif\Shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	%TI% reg add "HKLM\Software\Classes\InternetShortcut\shell\print" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul

rem ����� �� ����� ��㣮�� ���짮��⥫�
	reg add "HKLM\Software\Classes\exefile\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\batfile\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\cmdfile\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\mscfile\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Msi.Package\shell\runasuser" /v "ProgrammaticAccessOnly" /t reg_SZ /d "" /f >nul
	
rem �㭪� �������� � ������� "���"
	reg query "HKCU\Software\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc" >nul 2>&1 && reg add "HKCU\Software\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul && reg add "HKCU\Software\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellCreateVideo" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
		
rem ����� �� ����� �����������
	reg add "HKLM\Software\Classes\batfile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\cmdfile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\exefile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\cplfile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\mscfile\shell\runas" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul
	
	reg query "HKLM\Software\Classes\dllfile\shell\runas" >nul 2>&1
	if "!errorlevel!"=="0" (
	reg add "HKLM\Software\Classes\exefile\shell\runas2" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul)
	
	call :RestartExplorer
	cls&goto ContextMenu
	)
	
rem ����⠭������� ��� �㭪⮢

	if "%errorlevel%"=="1" (
	cls
	%ch%  {2f}����⠭����� �� �㭪�� ���⥪�⭮�� ���� ?{\n #}
	%ch% {08} 1{#} - {04}��{\n #}
	%ch% {08} 2{#} - {08}���{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 cls && goto ContextMenu
	if errorlevel 1 cls
rem ���ᮭ�������
	%TI% reg delete "HKLM\Software\Classes\DesktopBackground\Shell\Personalize" /v "ProgrammaticAccessOnly" /f >nul
	
rem �।��⠢��� ����� �
	reg add "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /v "" /t reg_SZ /d "Shell extensions for sharing" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /v "ContextMenuOptIn" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}\InProcServer32" /v "" /t reg_EXPAND_SZ /d "%%SystemRoot%%\system32\ntshrui.dll" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}\InProcServer32" /v "ThreadingModel" /t reg_SZ /d "Apartment" /f >nul

rem ���९��� �� ��砫쭮� �࠭�
	reg add "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /ve /t reg_SZ /d "Pin To Start Screen verb handler" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}\InProcServer32" /ve /t reg_SZ /d "C:\Windows\System32\appresolver.dll" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{470C0EBD-5D73-4d58-9CED-E91E22E23282}\InProcServer32" /v "ThreadingModel" /t reg_SZ /d "Both" /f >nul

rem ����⠭����� �०��� �����
	reg add "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /ve /t reg_SZ /d "Previous Versions Property Page" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /v "PageTitle" /t reg_EXPAND_SZ /d "@%%SystemRoot%%\system32\twext.dll,-1024" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}\InProcServer32" /ve /t reg_EXPAND_SZ /d "%%SystemRoot%%\system32\twext.dll" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{596AB062-B4D2-4215-9F74-E9109B0A8153}\InProcServer32" /v "ThreadingModel" /t reg_SZ /d "Apartment" /f >nul
	
rem ������饥 䮭���� ����ࠦ���� ࠡ�祣� �⮫�
	reg add "HKCR\DesktopBackground\shellex\ContextMenuHandlers\DesktopSlideshow" /v "" /t REG_SZ /d "{0bf754aa-c967-445c-ab3d-d8fda9bae7ef}" /f >nul

rem ��।���/��ࠢ��� �� ���ன�⢮
	reg add "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /ve /t reg_SZ /d "Play To menu" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}" /v "ContextMenuOptIn" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}\InProcServer32" /ve /t reg_SZ /d "C:\Windows\System32\playtomenu.dll" /f >nul
	reg add "HKLM\Software\Classes\CLSID\{7AD84985-87B4-4a16-BE58-8B72A5B390F7}\InProcServer32" /v "ThreadingModel" /t reg_SZ /d "Apartment" /f >nul

rem ��ࠬ���� �࠭�
	reg add "HKCR\DesktopBackground\Shell\Display" /v "" /t reg_EXPAND_SZ /d "@%%SystemRoot%%\System32\display.dll,-4" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Display" /v "Icon" /t reg_EXPAND_SZ /d "%%SystemRoot%%\System32\display.dll,-1" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Display" /v "Position" /t reg_SZ /d "Bottom" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Display" /v "SettingsUri" /t reg_SZ /d "ms-settings:display" /f >nul
	reg add "HKCR\DesktopBackground\Shell\Display\command" /v "DelegateExecute" /t reg_SZ /d "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}" /f >nul

rem �������� � ������⥪� 
	reg add "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" /ve /t reg_SZ /d "{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" /f >nul

rem ���९��� �� ������ ����ண� ����㯠
	reg add "HKLM\Software\Classes\Folder\shell\pintohome" /v "AppliesTo" /t reg_SZ /d "System.ParsingName:<>\"::{679f85cb-0220-4080-b29b-5540cc05aab6}\" AND System.ParsingName:<>\"::{645FF040-5081-101B-9F08-00AA002F954E}\" AND System.IsFolder:=System.StructuredQueryType.Boolean#True" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\pintohome" /v "MUIVerb" /t reg_SZ /d "@shell32.dll,-51377" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\pintohome\command" /v "DelegateExecute" /t reg_SZ /d "{b455f46e-e4af-4035-b0a4-cf18d2f6f28e}" /f >nul

rem ����������
	reg add "HKLM\Software\Classes\*\shellex\ContextMenuHandlers\ModernSharing" /v "" /t reg_SZ /d "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /f >nul
	reg add "HKLM\Software\Classes\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" /v "" /t REG_SZ /d "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /f >nul
	
rem ��ࠢ���
	reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /ve /t reg_SZ /d "{7BA4C740-9E81-11CF-99D3-00AA004AE837}" /f >nul

rem ��ࠢ����� �஡��� � ᮢ���⨬�����
	reg add "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /ve /t reg_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
	reg add "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /ve /t reg_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
	reg add "HKCR\batfile\shellex\ContextMenuHandlers\Compatibility" /ve /t reg_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
	reg add "HKCR\cmdfile\shellex\ContextMenuHandlers\Compatibility" /ve /t reg_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f >nul
	
rem ���९��� �� ������ �����
	reg add "HKCR\*\shellex\ContextMenuHandlers\{90AA3A4E-1CBA-4233-B8BB-535773D48449}" /ve /t reg_SZ /d "Taskband Pin" /f >nul

rem ������ � ����� �����/�������
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "ExplorerHost" /t reg_SZ /d "{ceff45ee-c862-41de-aee2-a022c81eda92}" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "Extended" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "LaunchExplorerFlags" /t reg_DWORD /d "0x3" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "MUIVerb" /t reg_SZ /d "@shell32.dll,-8518" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess" /v "MultiSelectModel" /t reg_SZ /d "Document" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewprocess\command" /v "DelegateExecute" /t reg_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "LaunchExplorerFlags" /t reg_DWORD /d "0x21" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "MUIVerb" /t reg_SZ /d "@windows.storage.dll,-8519" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "MultiSelectModel" /t reg_SZ /d "Document" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "OnlyInBrowserWindow" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab" /v "OnlyInTabWindow" /t reg_SZ /d "" /f >nul
	reg add "HKLM\Software\Classes\Folder\shell\opennewtab\command" /v "DelegateExecute" /t reg_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f >nul

rem �������� ��ࠢ�/�����
	reg add "HKCR\SystemFileAssociations\.bmp\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.gif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.heic\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.heif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.ico\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpe\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpeg\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jpg\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.png\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
rem ��������� 16.01.23
	reg add "HKCR\SystemFileAssociations\.avci\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.avif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.dds\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.dib\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jfif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.jxr\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.rle\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.tif\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.tiff\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.wdp\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul
	reg add "HKCR\SystemFileAssociations\.webp\ShellEx\ContextMenuHandlers\ShellImagePreview" /v "" /t reg_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f >nul

rem �����
	reg delete "HKLM\Software\Classes\SystemFileAssociations\image\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\batfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cmdfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\docxfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\fonfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\htmlfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\inffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\inifile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\pfmfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\regfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\rtffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\ttcfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\ttffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\txtfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\VBEFile\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\VBSFile\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\WSFFile\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\JSEFile\Shell\Print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\JSFile\Shell\Print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Applications\photoviewer.dll\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\contact_wab_auto_file\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\emffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\fonfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\group_wab_auto_file\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\IE.AssocFile.HTM\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\IE.AssocFile.SVG\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\IE.AssocFile.XHT\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\odtfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\otffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\PBrush\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\rlefile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\svgfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\textfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\wdpfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\wmffile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Wordpad.Document.1\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\xhtmlfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\zapfile\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\IE.AssocFile.URL\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.heic\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.avci\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.avcs\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.avif\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.avifs\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.heics\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.heif\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.heifs\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\SystemFileAssociations\.hif\Shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	%TI% reg delete "HKLM\Software\Classes\InternetShortcut\shell\print" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	
rem ����� �� ����� ��㣮�� ���짮��⥫�
	reg delete "HKLM\Software\Classes\exefile\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\batfile\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cmdfile\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\mscfile\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\Msi.Package\shell\runasuser" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	
rem �㭪� �������� � ������� "���"
	reg delete "HKCU\Software\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKCU\Software\Classes\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellCreateVideo" /v "ProgrammaticAccessOnly" /f >nul 2>&1
		
rem ����� �� ����� �����������
	reg delete "HKLM\Software\Classes\batfile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cmdfile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\exefile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\exefile\shell\runas2" /v "HideBasedOnVelocityId" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cplfile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\mscfile\shell\runas" /v "HideBasedOnVelocityId" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\batfile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cmdfile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\exefile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\exefile\shell\runas2" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\cplfile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	reg delete "HKLM\Software\Classes\mscfile\shell\runas" /v "ProgrammaticAccessOnly" /f >nul 2>&1
	call :RestartExplorer
	cls&goto ContextMenu
	)
	
	
::     ----------------------------------------------------------------
rem ���⥪�⭮� ���� ������ �����
::     ----------------------------------------------------------------

:TaskBarMenu
	cls
	
rem �஢�ન
	VER | FINDSTR /IL "6.3." > NUL && %ch% {0c} ������ ����� Windows �� �����ন���� ��� �㭪樮���{\n #}&&pause>nul&&cls&&goto ContextMenu
	wmic os get caption /Format:List | find /i "11" >nul && %ch% {08} ����� �㭪樮��� �।���祭 ⮫쪮 ��� Windows 10{\n #}&&pause>nul&&cls&& goto ContextMenu
	if not exist "%SystemRoot%\ru-RU\explorer.exe.mui" (%ch% {08} ����� �㭪樮��� �।�����祭 ⮫쪮 ��� ���᪮� ��������樨 Windows{\n #}&&pause>nul&&cls&& goto ContextMenu)
	if not exist "explorer.exe.mui" (%ch% {0c} �� ������ 䠩� explorer.exe.mui, �������騩 ������ �����{\n #} && pause>nul && cls && goto ContextMenu)
	
	rem PowerShell -Command "Get-AppxPackage *LanguageExperiencePackru-RU*" | find /i "PackageFullName" >nul
	rem if "%errorlevel%"=="0" (%ch% {03} ����� ���. ����䥩� �� ���᪮� {4f}�� 㤠����{\n #}{\n #})
	rem if "%errorlevel%"=="1" (%ch% {03} ����� ���. ����䥩� �� ���᪮� {2f}㤠����{\n #}{\n #})
	rem nircmd win settext foreground "CMEditor"
	
	if not exist "%SystemRoot%\ru-RU\explorer.exe.mui_orig" (
	%ch% {08} 1{#} - {0e}������� ������������� ������ �����{\n #}{\n #}
	) else (
	%ch% {08} 1{#} - {0e}�ਣ����쭠� ������ �����{\n #}{\n #}
	)

	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}
	
	set "input="
	set /p input=
	if not defined input   ( cls && goto ContextMenu )
	if "%input%"=="1"   ( goto TskBarMenu)
	) else (
		cls && goto TaskBarMenu
	)
	
	
:TskBarMenu
	cls
	taskkill /f /im explorer.exe >nul 2>&1
	timeout /t 1 /nobreak >nul

rem �� ��ன ���ᨨ
	if exist "explorer.exe.mui_orig" (
	timeout /t 1 /nobreak >nul
	%ch% {0b} ����⠭�������� �ਣ������� ������ �����{\n #}
	nircmd execmd TrInstaller /c nircmd execmd xcopy "explorer.exe.mui_orig" C:\Windows\ru-RU\explorer.exe.mui /q /y >nul
rem ����⠭������� �㭪� "������"
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoToolbarsOnTaskbar" /f >nul 2>&1
	timeout /t 2 /nobreak >nul
	start explorer.exe
	del /q "explorer.exe.mui_orig" >nul 2>&1
	cls && goto TaskBarMenu
	)
	
	
	if exist "%SystemRoot%\ru-RU\explorer.exe.mui_orig" (
	%ch% {04} ����⠭����� �ਣ������� ������ �����?{\n #}
	%ch% {0f} 1 - {08}��{\n #}
	%ch% {0f} 2 - {08}�⬥��, �������� ���⭮{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 start explorer & cls && goto TaskBarMenu
	if errorlevel 1 cls

rem �஢��塞 �� �� ࠭�� ��⠭����� LanguageExperiencePackRU
	if not exist Location.txt goto LanguagePackNotInstall
	echo ����⠭�������� ࠭�� 㤠����� LanguageExperiencePackRU
	for /f "tokens=* delims=" %%a in (Location.txt) do (set "LocationPath=%%a")
	PowerShell -Command "Add-AppxPackage -Register -DisableDevelopmentMode '!LocationPath!\AppxManifest.xml'"
	
:LanguagePackNotInstall
	%ch% {0b} ����⠭�������� �ਣ������� ������ �����{\n #}
	nircmd execmd TrInstaller /c nircmd execmd del /q "%SystemRoot%\ru-RU\explorer.exe.mui"
	timeout /t 1 /nobreak >nul
	if exist "%SystemRoot%\ru-RU\explorer.exe.mui" echo ������ ������ ... & pause & start explorer & cls & goto TaskBarMenu
	nircmd execmd TrInstaller /c nircmd execmd rename "%SystemRoot%\ru-RU\explorer.exe.mui_orig" explorer.exe.mui"
	
rem ����⠭������� �㭪� "������"
	reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoToolbarsOnTaskbar" /f >nul 2>&1
	timeout /t 2 /nobreak >nul
	start explorer
	cls && goto TaskBarMenu
	
	) else (
	
	%ch% {0a} �ਬ����� ������������� ������ �����?{\n #}
	%ch% {0f} 1 - {08}��{\n #}
	%ch% {0f} 2 - {08}�⬥��, �������� ���⭮{\n #}
	choice /c 12 /n /m " "
	if errorlevel 2 start explorer & cls && goto TaskBarMenu
	if errorlevel 1 cls
	
	%ch% {0b} �ਬ��塞 ������������� ������ �����{\n #}
	
rem �஢��塞 ��⠭����� �� LanguageExperiencePackRU
	PowerShell -Command "Get-AppxPackage -AllUsers *LanguageExperiencePackru-RU*" | find /i "PackageFullName" >nul || goto NotLangPack
rem ����砥� ����
	for /f "tokens=* delims=" %%a in ('powershell -executionpolicy bypass -command "(Get-AppxPackage *Microsoft.LanguageExperiencePackru-RU*).InstallLocation"') do (set "InstallLocation=%%a")
rem ��襬 ���� � 䠩�...
	echo !InstallLocation!>Location.txt
	%ch% {0c} ����塞 LanguageExperiencePackRU - ������������� ����� ���᪮�� �몠{\n #}
	PowerShell -Command "Get-AppxPackage *Microsoft.LanguageExperiencePackru-RU* | Remove-AppxPackage" >nul

:NotLangPack
	nircmd execmd TrInstaller /c nircmd execmd rename "%SystemRoot%\ru-RU\explorer.exe.mui" "explorer.exe.mui_orig"
	
	timeout /t 1 /nobreak >nul
	
	if not exist "%SystemRoot%\ru-RU\explorer.exe.mui_orig" echo ������ ������ ... & pause & start explorer & cls & goto TaskBarMenu

	nircmd execmd TrInstaller /c nircmd execmd xcopy "explorer.exe.mui" %SystemRoot%\ru-RU /q /y >nul
rem ���뢠�� �㭪� "������"
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoToolbarsOnTaskbar" /t reg_DWORD /d "1" /f >nul
	timeout /t 1 /nobreak >nul
	start explorer
	cls && goto TaskBarMenu
	)


::     ----------------------------------------------------------------
rem ���⥪�⭮� ���� "�������"
::     ----------------------------------------------------------------
	
:CreateItem
cls
rem �㭪�� �. ����
	(
	reg query "HKCR\.bmp\ShellNew" && set "bmp=0c" || set "bmp=08"
	reg query "HKCR\.contact\ShellNew" && set "contact=0c" || set "contact=08"
	reg query "HKCR\.rtf\ShellNew" && set "rtf=0c" || set "rtf=08"
	reg query "HKCR\.lnk\ShellNew" /v "NullFile" && set "Lnk=0a" || set "Lnk=08"
	reg query "HKCR\.reg\ShellNew" && set "reg=0a" || set "reg=08"
	reg query "HKCR\.bat\ShellNew" && set "bat=0a" || set "bat=08"
	reg query "HKCR\.cmd\ShellNew" && set "cmd=0a" || set "cmd=08"
	reg query "HKCR\.ps1\ShellNew" && set "ps1=0a" || set "ps1=08"
	reg query "HKCR\.vbs\ShellNew"&& set "vbs=0a" || set "vbs=08"
	reg query "HKCR\.rar\ShellNew" /v "FileName" && set "rar=0a" || set "rar=08"
	reg query "HKCR\.zip\ShellNew" /v "FileName" && set "zip=0a" || set "zip=08"
	set "RarPathMenu="
	set "ZipPathMenu="
	for /f "usebackq tokens=3*" %%A IN (`2^>nul reg query "HKCR\.rar\ShellNew" /v "FileName"`) do set RarPathMenu=%%A %%B
	for /f "usebackq tokens=3*" %%A IN (`2^>nul reg query "HKCR\.zip\ShellNew" /v "FileName"`) do set ZipPathMenu=%%A %%B
	
	) >nul 2>&1
	
	
	rem reg query "HKCR\.docx\ShellNew" /v "NullFile" && set "docx=0a" || set "docx=0c"
	rem reg query "HKCR\.xlsx\ShellNew" /v "NullFile" && set "xlsx=0a" || set "xlsx=0c"

	%ch%  {3f}���⥪�⭮� ���� ᮧ����{\n #}{\n #}
	%ch% {0a} ������ {08}梥⮬ - �㭪� �⮡ࠦ�����; {08}��� - ���������{\n #}
	%ch%  1 - {%Lnk%}Lnk {08}[���]{\n #}
	%ch%  2 - {%reg%}Reg {08}[䠩� ॥���]{\n #}
	%ch%  3 - {%bat%}Bat {08}[������ 䠩� Windows]{\n #}
	%ch%  4 - {%cmd%}Cmd {08}[�業�਩ windows]{\n #}
	%ch%  5 - {%ps1%}Ps1 {08}[�業�਩ windows powershell]{\n #}
	%ch%  6 - {%vbs%}Vbs {08}[䠩� �業��� vbscript]{\n #}
	%ch%  7 - {%rar%}Rar {08}[��娢 WinRar] %RarPathMenu%{\n #}
	%ch%  8 - {%zip%}Zip {08}[ZIP - WinRar] %ZipPathMenu%{\n #}
	%ch%  9 - ��������/㤠���� ᢮� ���७��{\n #}{\n #}
	%ch% 10 - {0f}������� ����� �㭪�� {%bmp%}����� ��㭮� {#}^| {%contact%}���⠪� {#}^| {%rtf%}���㬥�� � �ଠ� RTF{\n #}
	
	echo.
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}
	
	set "input="
	set /p input=
	if not defined input   cls && goto ContextMenu
		
	if "%input%"=="1"   (reg query "HKCR\.lnk\ShellNew" /v "NullFile" && reg delete "HKCR\.lnk\ShellNew" /v "NullFile" /f && goto CheckVers || reg add "HKCR\.lnk\ShellNew" /v "NullFile" /t REG_SZ /d "" /f && goto CheckVers) >nul 2>&1
	
	if "%input%"=="2" (reg query "HKCR\.reg\ShellNew" /v "Data" && reg delete "HKCR\.reg\ShellNew" /f && cls && goto CheckVers || reg add "HKCR\.reg\ShellNew" /v "NullFile" /t reg_SZ /d "1" /f && reg add "HKCR\.reg\ShellNew" /v "Data" /t reg_SZ /d "Windows Registry Editor Version 5.00" /f && cls && goto CheckVers) >nul 2>&1

	if "%input%"=="3" (reg query "HKCR\.bat\ShellNew" /v "Data" && reg delete "HKCR\.bat\ShellNew" /f && cls && goto CheckVers || reg add "HKCR\.bat\ShellNew" /v "NullFile" /t reg_SZ /d "1" /f && reg add "HKCR\.bat\ShellNew" /v "Data" /t reg_SZ /d "@echo off" /f && cls && goto CheckVers) >nul 2>&1

	if "%input%"=="4" (reg query "HKCR\.cmd\ShellNew" /v "Data" && reg delete "HKCR\.cmd\ShellNew" /f && cls && goto CheckVers || reg add "HKCR\.cmd\ShellNew" /v "NullFile" /t reg_SZ /d "1" /f && reg add "HKCR\.cmd\ShellNew" /v "Data" /t reg_SZ /d "@echo off" /f && cls && goto CheckVers) >nul 2>&1

	if "%input%"=="5" (reg query "HKCR\.ps1\ShellNew" /v "NullFile" && reg delete "HKCR\.ps1\ShellNew" /f && cls && goto CheckVers || reg add "HKCR\.ps1\ShellNew" /v "NullFile" /t reg_SZ /d "1" /f && cls && goto CheckVers) >nul 2>&1
	
	if "%input%"=="6" (reg query "HKCR\.vbs\ShellNew" /v "NullFile" && reg delete "HKCR\.vbs\ShellNew" /f && cls && goto CheckVers || reg add "HKCR\.vbs\ShellNew" /v "NullFile" /t reg_SZ /d "1" /f && cls && goto CheckVers) >nul 2>&1
	
	if "%input%"=="7" goto RARCreate
	if "%input%"=="8" goto ZipCreate
	if "%input%"=="9" goto YourExtension
	if "%input%"=="10" goto CreateTrash

	
	) else (
		cls && goto CreateItem
	)
	
	
:RARCreate
	set "PathToRestoreRar="
	set "RarPath="
	for /f "usebackq tokens=3*" %%A IN (`2^>nul reg query "HKCU\Software\ContextEditor" /v "PathArchive"`) do set PathToRestoreRar=%%A %%B
	if defined PathToRestoreRar (
	if not exist "!PathToRestoreRar!" (echo !PathToRestoreRar! & echo ������� ��� 㦥 �� �������, �஢���� �ࠢ��쭮��� �ᯮ������� WinRAR & pause & cls & goto CreateItem) 
	reg add "HKCR\.rar\ShellNew" /v "FileName" /t reg_SZ /d "!PathToRestoreRar!" /f >nul
	reg delete "HKCU\Software\ContextEditor" /v "PathArchive" /f >nul 2>&1
	cls && goto CreateItem
	)
	
	for /f "usebackq tokens=3*" %%A IN (`2^>nul reg query "HKCR\.rar\ShellNew" /v "FileName"`) do set RarPath=%%A %%B
	if defined RarPath (
	reg add "HKCU\Software\ContextEditor" /v "PathArchive" /t reg_SZ /d "!RarPath!" /f >nul
	reg delete "HKCR\.rar\ShellNew" /v "FileName" /f >nul 2>&1
	cls && goto CreateItem
	) else (
	echo.
	echo  �� ������ �㭪� WinRar � ���⥪�⭮� ����
	timeout /t 2 >nul && cls && goto CreateItem
	)
	
:ZipCreate
	set "PathToRestoreZip="
	set "ZipPath="
	for /f "usebackq tokens=3*" %%A IN (`2^>nul reg query "HKCU\Software\ContextEditor" /v "PathArchiveZip"`) do set PathToRestoreZip=%%A %%B
	if defined PathToRestoreZip (
	if not exist "!PathToRestoreZip!" (echo !PathToRestoreZip! & echo ������� ��� 㦥 �� �������, �஢���� �ࠢ��쭮��� �ᯮ������� WinRAR & pause & cls & goto CreateItem) 
	reg add "HKCR\.zip\ShellNew" /v "FileName" /t reg_SZ /d "!PathToRestoreZip!" /f >nul
	reg delete "HKCU\Software\ContextEditor" /v "PathArchiveZip" /f >nul 2>&1
	cls && goto CreateItem
	)
	
	for /f "usebackq tokens=3*" %%A IN (`2^>nul reg query "HKCR\.zip\ShellNew" /v "FileName"`) do set ZipPath=%%A %%B
	if defined ZipPath (
	reg add "HKCU\Software\ContextEditor" /v "PathArchiveZip" /t reg_SZ /d "!ZipPath!" /f >nul
	reg delete "HKCR\.zip\ShellNew" /v "FileName" /f >nul 2>&1
	cls && goto CreateItem
	) else (
	echo.
	echo  �� ������ �㭪� WinRar � ���⥪�⭮� ����
	timeout /t 2 >nul && cls && goto CreateItem
	)



:YourExtension
cls
	set InputExtension=
	%ch% {0c} ������ ���७��, ���஥ ��� ��������/㤠���� � ������ Enter{\n #}{0f} ���ਬ��:{\n #}
	%ch% {0e} docx ^> ���㬥�� word{\n #}
	echo.
	%ch% {0b} [Enter]{#} - {04}�������� ���⭮{\n #}
	
	set /p InputExtension=: 
	if not defined InputExtension goto CreateItem
	echo.
	
	reg query "HKCR\.%InputExtension%\ShellNew" /v "NullFile" >nul 2>&1 && reg delete "HKCR\.%InputExtension%\ShellNew" /v "NullFile" /f >nul 2>&1 && echo  ����७�� %InputExtension% 㤠���� �� ���� ᮧ����||reg add "HKCR\.%InputExtension%\ShellNew" /v "NullFile" /t reg_SZ /d "1" /f >nul && echo  ����७�� %InputExtension% ��������� � ���� ᮧ����
	pause>nul
	cls && goto CheckVers
	

:CreateTrash
rem ������ ����� �㭪��
	reg query "HKCR\.contact\ShellNew" >nul 2>&1
	if "%errorlevel%"=="0" (
	reg delete "HKCR\.bmp\ShellNew" /f >nul 2>&1
	reg delete "HKCR\.contact\ShellNew" /f >nul 2>&1
	reg delete "HKCR\.rtf\ShellNew" /f >nul 2>&1
	cls&goto CheckVers)
	if "%errorlevel%"=="1" (
rem ����⠭����� ����� �㭪��
	reg add "HKCR\.bmp\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@%%systemroot%%\system32\mspaint.exe,-59414" /f >nul
	reg add "HKCR\.bmp\ShellNew" /v "NullFile" /t REG_SZ /d "" /f >nul
	reg add "HKCR\.contact\ShellNew" /v "command" /t REG_EXPAND_SZ /d "\"%%programFiles%%\Windows Mail\Wab.exe\" /CreateContact \"%%1\"" /f >nul
	reg add "HKCR\.contact\ShellNew" /v "iconpath" /t REG_EXPAND_SZ /d "%%ProgramFiles%%\Windows Mail\wab.exe,1" /f >nul
	reg add "HKCR\.contact\ShellNew" /v "MenuText" /t REG_EXPAND_SZ /d "@%%CommonProgramFiles%%\system\wab32res.dll,-10203" /f >nul
	reg add "HKCR\.rtf\ShellNew" /v "Data" /t REG_SZ /d "{\rtf1}" /f >nul
	reg add "HKCR\.rtf\ShellNew" /v "ItemName" /t REG_EXPAND_SZ /d "@%%ProgramFiles%%\Windows NT\Accessories\WORDPAD.EXE,-213" /f >nul
	cls&goto CheckVers)
	
:CheckVers
rem �᫨ Windows 11 > ��१���� �஢������
	wmic os get caption /Format:List | find /i "11" >nul 2>&1 && call :RestartExplorer && cls && goto CreateItem || cls && goto CreateItem

::     ----------------------------------------------------------------
rem ���⥪�⭮� ���� "Win + X"
::     ----------------------------------------------------------------
		
:WinX
cls
	%ch% {08} 1 - {03}������ ����� Win+X {08}[%localappdata%\Microsoft\Windows\WinX]{\n #}
	%ch% {0f} 2 - {0c}������/�������� ��{\n #}{\n #}
	%ch% {0f} 3 - {0b}��१������� �஢����� ��� �ਬ������ ���������{\n #}{\n #}
	%ch% {0e} [Enter]{#} - {08}�������� � ������� ����{\n #}
	set "input="
	set /p input=
	if not defined input   cls && goto ContextMenu
	if "%input%"=="1"   explorer "%localappdata%\Microsoft\Windows\WinX" & goto WinX
	if "%input%"=="2"   (
	echo.
	%ch% {0f} 1 - {0c}������ �� �㭪�� �� ���� Win+X{\n #}
	%ch% {0f} 2 - {08}�������� �� �㭪�� �� ���� Win+X{\n #}
	%ch% {0f} 3 - {08}�⬥��, �������� ���⭮{\n #}
	choice /c 123 /n /m " "
	if errorlevel 3 cls && goto WinX
	if errorlevel 2 cls && goto ShowWinX
	if errorlevel 1 cls && goto HideWinX )
	if "%input%"=="3"   RestExplorer & goto WinX
	) else (
		cls && goto WinX
	)
	

:HideWinX
	attrib +H "%localappdata%\Microsoft\Windows\WinX\Group1"
	attrib +H "%localappdata%\Microsoft\Windows\WinX\Group2"
	attrib +H "%localappdata%\Microsoft\Windows\WinX\Group3"
	call :RestartExplorer
	goto WinX
	
:ShowWinX
(
	attrib -H "%localappdata%\Microsoft\Windows\WinX\Group1"
	attrib -H "%localappdata%\Microsoft\Windows\WinX\Group2"
	attrib -H "%localappdata%\Microsoft\Windows\WinX\Group3"
	attrib -H /S "%localappdata%\Microsoft\Windows\WinX\Group1\*"
	attrib -H /S "%localappdata%\Microsoft\Windows\WinX\Group2\*"
	attrib -H /S "%localappdata%\Microsoft\Windows\WinX\Group3\*"
) >nul 2>&1
	call :RestartExplorer
	goto WinX
	
	
:RestartExplorer
	(
	taskkill /f /im explorer.exe
	start explorer
	) >nul 2>&1
	exit /b