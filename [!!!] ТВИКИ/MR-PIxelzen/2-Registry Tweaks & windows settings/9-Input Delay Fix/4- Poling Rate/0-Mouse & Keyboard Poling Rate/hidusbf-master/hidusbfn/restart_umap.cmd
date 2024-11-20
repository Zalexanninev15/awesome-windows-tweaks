@echo off
PathToUmap\umap.exe PathToHidusbfP\hidusbfP.sys
PathToDevState\DevState64.exe R "DeviceInstanceID1"
PathToDevState\DevState64.exe R "DeviceInstanceID2"
PathToDevState\DevState64.exe R "DeviceInstanceIDn"
