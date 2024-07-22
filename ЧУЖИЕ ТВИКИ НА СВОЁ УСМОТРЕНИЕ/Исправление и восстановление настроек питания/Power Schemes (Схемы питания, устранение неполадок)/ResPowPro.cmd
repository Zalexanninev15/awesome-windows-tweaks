echo off
 TITLE Restore Windows Profile
 CLS
  ECHO This will reset the system to original windows profile and remove all user power plans.
  ECHO.
 :choice
  SET /p c=Are you sure you want to continue [Y/N]? 
   IF /i "%c%" EQU "Y" GOTO reset
   IF /i "%c%" EQU "N" GOTO exit
  GOTO :choice
 :reset
  CLS
   Powercfg -restoredefaultschemes
   ECHO Restore Windows Profile Successfully.
   ECHO.
   ECHO Now check your power plan options.
  PAUSE
 :exit
exit
