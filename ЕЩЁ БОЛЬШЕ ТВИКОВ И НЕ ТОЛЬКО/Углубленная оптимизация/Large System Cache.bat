@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

REM ; �� iosiph-a � ������� �� ��
REM ; ���������� ���������� ����. �������� �������� HDD.
REM ; ��� HDD ������ ����� ���� ����������� � ���
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
