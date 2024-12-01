@echo off
date /t & time /t
echo Dism /Online /Cleanup-Image /StartComponentCleanup
Dism /Online /Cleanup-Image /StartComponentCleanup
echo ...
date /t & time /t
echo Dism /Online /Cleanup-Image /RestoreHealth
Dism /Online /Cleanup-Image /RestoreHealth
echo ...
date /t & time /t
echo SFC /scannow
SFC /scannow
date /t & time /t
pause