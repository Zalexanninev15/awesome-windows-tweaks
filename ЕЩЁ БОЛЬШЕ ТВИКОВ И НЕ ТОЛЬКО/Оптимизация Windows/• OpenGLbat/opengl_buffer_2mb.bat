@echo off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\AMD Inc.\AMD OpenGL Driver" /v BufferSize /t REG_DWORD /d 2097152 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\Intel Corporation\Intel(R) HD Graphics" /v BufferSize /t REG_DWORD /d 2097152 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\NVIDIA Corporation\nvoglv64" /v BufferSize /t REG_DWORD /d 2097152 /f
echo The OpenGL buffer size has been increased to 2MB.
