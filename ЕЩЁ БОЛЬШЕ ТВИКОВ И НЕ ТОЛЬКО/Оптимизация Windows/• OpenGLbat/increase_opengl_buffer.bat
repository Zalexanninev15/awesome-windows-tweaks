@echo off
set OPENGL_32_DLL=C:WindowsSystem32opengl32.dll
set OPENGL_32_DLL_SIZE=2576980377
copy %OPENGL_32_DLL% %OPENGL_32_DLL%.bak
fsutil file setvaliddata %OPENGL_32_DLL% %OPENGL_32_DLL_SIZE%