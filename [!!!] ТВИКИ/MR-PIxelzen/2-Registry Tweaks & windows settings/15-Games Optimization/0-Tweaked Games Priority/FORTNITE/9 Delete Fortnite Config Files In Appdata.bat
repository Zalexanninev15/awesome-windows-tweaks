@echo off
echo Batch File By Adamx (youtube.com/AdamxYT)
@echo
del /s /f /q "%localappdata%\FortniteGame"\*.*
@echo
rd /s /q "%localappdata%\FortniteGame"
echo Deleted Folder Successfully, Open Fortnite To Regenerate Files..
pause