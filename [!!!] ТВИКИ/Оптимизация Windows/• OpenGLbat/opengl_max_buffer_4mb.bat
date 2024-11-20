@echo off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\AMD Inc.\AMD OpenGL Driver" /v MaxBufferSize /t REG_DWORD /d 4194304 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\Intel Corporation\Intel(R) HD Graphics" /v MaxBufferSize /t REG_DWORD /d 4194304 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\OpenGLDrivers\NVIDIA Corporation\nvoglv64" /v MaxBufferSize /t REG_DWORD /d 4194304 /f
echo The OpenGL max buffer size has been increased to 4MB.