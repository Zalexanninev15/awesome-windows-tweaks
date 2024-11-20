@echo off
move "Balanced.pow" "C:\"
move "High Peformance.pow" "C:\"
move "Power saver.pow" "C:\"
powercfg -import "C:\Balanced.pow"
powercfg -import "C:\High Peformance.pow"
powercfg -import "C:\Power saver.pow"
del /f "C:\Balanced.pow"
del /f "C:\High Peformance.pow"
del /f "C:\Power saver.pow"
pause