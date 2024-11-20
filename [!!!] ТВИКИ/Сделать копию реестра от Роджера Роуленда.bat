ECHO OFF
reg export HKLM hklm.reg > nul
reg export HKCU hkcu.reg > nul
reg export HKCR hkcr.reg > nul
reg export HKU  hku.reg > nul
reg export HKCC hkcc.reg > nul