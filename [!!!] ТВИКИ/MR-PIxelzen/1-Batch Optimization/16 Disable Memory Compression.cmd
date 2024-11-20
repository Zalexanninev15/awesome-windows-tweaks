@echo off
echo Disabling Memory Compression and App PreLaunch...
powershell Disable-MMAgent -MemoryCompression -ApplicationPreLaunch -ErrorAction SilentlyContinue >> me_log.txt
if %errorlevel% neq 0 (
	powershell Disable-MMAgent -ApplicationPreLaunch >> me_log.txt
	if !errorlevel! neq 0 (
		echo WARNING: Failed to disable Memory Compression and App PreLaunch. Please check me_log.txt for details.
		pause
	)
)
pause