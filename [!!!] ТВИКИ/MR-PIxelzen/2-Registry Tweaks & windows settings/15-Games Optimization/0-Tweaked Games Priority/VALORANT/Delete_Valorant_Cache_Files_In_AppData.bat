@echo off
echo Batch File By ADEX
@echo
del /s /f /q "%localappdata%\VALORANT"\*.*
@echo
rd /s /q "%localappdata%\VALORANT"
echo Deleted Folder Successfully, Open Valorant To Regenerate Files
pause