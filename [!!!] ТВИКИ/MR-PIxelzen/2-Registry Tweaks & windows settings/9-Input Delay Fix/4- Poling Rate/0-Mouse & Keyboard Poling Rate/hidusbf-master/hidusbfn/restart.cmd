@echo off
PathToAtsiv\atsiv.exe -f PathToHidusbfP\hidusbfP.sys
PathToAtsiv\atsiv.exe -u hidusbfp.sys
PathToDevState\DevState64.exe R "DeviceInstanceID1"
PathToDevState\DevState64.exe R "DeviceInstanceID2"
PathToDevState\DevState64.exe R "DeviceInstanceIDn"
