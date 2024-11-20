@echo off
Dism.exe /online /cleanup-image /AnalyzeComponentStore
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase