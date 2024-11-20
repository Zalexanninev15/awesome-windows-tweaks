ECHO off
 :menu
  TITLE Power Profile
  CLS
   ECHO Import Power Schemes:
   ECHO.
   ECHO (P)ower Saver Profile
   ECHO (H)igh Performance Profile
   ECHO (U)ltimate Performance Profile
  ECHO.
 :choice
  SET /p c=Please choose which options? 
   IF /i "%c%" EQU "P" GOTO saver
   IF /i "%c%" EQU "H" GOTO high
   IF /i "%c%" EQU "U" GOTO ultimate
  GOTO choice
 :saver
  TITLE Power Saver Profile
  CLS
   Powercfg -Import "%~dp0PowerSaver.pow"
   ECHO.
   ECHO.
   ECHO Now check your change power plan options.
   PAUSE
  GOTO menu
 :high
  TITLE High Performance Profile
  CLS
   Powercfg -Import "%~dp0HighPerformance.pow"
   ECHO.
   ECHO.
   ECHO Now check your change power plan options.
   PAUSE
  GOTO menu
 :ultimate
  TITLE Ultimate Performance Profile
  CLS
   Powercfg -Import "%~dp0UltimatePerformance.pow"
   ECHO.
   ECHO.
   ECHO Now check your change power plan options.
   PAUSE
  GOTO menu
EXIT
