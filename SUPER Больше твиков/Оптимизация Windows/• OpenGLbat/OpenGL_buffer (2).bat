@echo off
reg add "HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindows NTCurrentVersionOpenGLDriversMSOpenGL" /v "DisableAsync" /t REG_DWORD /d 0x1 /f
reg add "HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindows NTCurrentVersionOpenGLDriversMSOpenGL" /v "EnableMultisampleBuffers" /t REG_DWORD /d 0x1 /f
reg add "HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindows NTCurrentVersionOpenGLDriversMSOpenGL" /v "EnableSurfaceMemoryManagement" /t REG_DWORD /d 0x1 /f
reg add "HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindows NTCurrentVersionOpenGLDriversMSOpenGL" /v "MaxWGLSwapInterval" /t REG_DWORD /d 0x1 /f