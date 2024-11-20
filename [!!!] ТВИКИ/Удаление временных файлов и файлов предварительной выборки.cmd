echo off
color F0
title Remove Temp and Prefetch Files By EverythingTech
mode con: cols=72 lines=21
cls
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
