This assembly is intended for these versions of USB Controller
drivers:

OS            Controller Driver  HIDUSBFN  Possible
              File               needed    overclocking
-------------------------------------------------------
7 x86 & x64   iusb3xhc.sys       Yes       LS->FS
              (1.0.10.255,
               5.0.4.43)

8.1 x86       usbport.sys        Yes       LS->FS
              (6.3.9600.18088-
               6.3.9600.19024)

10 x86 1803+  usbport.sys        Yes       LS->FS
              (10.0.17134.1-
               10.0.19041.1)

10 x64 1703+  usbport.sys        Yes       LS->FS
              (10.0.15063.1-
               10.0.19041.1)

10 x86 1803+  usbxhci.sys        Yes       LS,FS->HS
              (10.0.17134.1-
               10.0.19041.1)

10 x64 1803+  usbxhci.sys        Yes       LS,FS->HS
              (10.0.17134.1-
               10.0.19041.1263)

11 21H2       usbxhci.sys        Yes       LS,FS->HS
              (10.0.22000.1)


PATCH folders are intended for using with ATSIV or
UMAP methods.

DRIVER folders are intended for REPLACEMENT of
original HIDUSBF drivers and under x64 versions of OS
will run in Test Mode ONLY!

NTx86 folders are intended for 32 bit (x86) versions of Windows.

AMD64 folders are intended for 64 bit (x64) versions of Windows.

If you want to automatically apply changes you have to create 
Scheduler task(job) running under admin or system account on 
system startup to run .CMD file like RESTART.CMD
Or manually run it with elevated rigths.

RESTART.CMD is only example! You need to edit it with your 
real paths and device ids.

"DeviceInstanceID1" and so on is the first line of clipboard
buffer which setup.exe is copied by "Copy IDs" button.
Of course, you can use any other program (like devcon.exe) 
instead of DevState64.exe to restart device.

DevState tool located at
https://github.com/LordOfMice/Tools/devstate.zip

When using umap to load patcher:

"DriverEntry returned 0xC000007A"
means the patcher loaded successfully, but didn't find anything to patch

"DriverEntry returned 0xC0000271"
means the patcher loaded successfully and found something to patch

all other messages mean errors outside of patcher
