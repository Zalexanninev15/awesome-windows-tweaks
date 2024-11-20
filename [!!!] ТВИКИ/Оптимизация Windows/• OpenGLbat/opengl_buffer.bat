@echo off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\ATI Technologies Inc.\ATI OpenGL Driver" /v BufferSize /t REG_DWORD /d 1048576 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\Intel Corporation\Intel(R) HD Graphics" /v BufferSize /t REG_DWORD /d 1048576 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\NVIDIA Corporation\nvoglv64" /v BufferSize /t REG_DWORD /d 1048576 /f
echo The OpenGL buffer size has been increased to 1MB.