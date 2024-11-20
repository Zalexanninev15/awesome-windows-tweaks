## Disabling Credential Guard under Windows 10

Credential Guard is used as upper layer for:

* Hardware security
* Virtualization-based security
* Better protection against advanced persistent threats

If you do not need it, disable it (in case you want to globally disable credential guard).


 [Device Guard and Credential Guard hardware readiness tool](https://www.microsoft.com/en-us/download/details.aspx?id=53337) is the official solution to configure Credential Guard on Windows 10.


## DISM

Dism can disable (similar like via `appwiz.cpl`) specific app packages ("features"). However, DISM is the more elegant way since it can show more information regarding what packages are preinstalled and is easy to work with.

Start an elevated command prompt:

dism /image:<WIM file name> /Enable-Feature /FeatureName:Microsoft-Hyper-V-Hypervisor /all
dism /image:<WIM file name> /Enable-Feature /FeatureName:IsolatedUserMode


### Alternative use (this is an example for an online system (your current running OS image))
dism /Online /Enable-Feature:Microsoft-Hyper-V /All
dism /Online /Enable-Feature /FeatureName:IsolatedUserMode


## BCDedit Method (optional, don't do it)

Similar like DISM, start an elevated prompt first, then execute the following commands one by one. This method is not recommend because it can cause additional problems and might not work across all Windows 10 builds.


```bash
mountvol X: /s
copy %WINDIR%\System32\SecConfig.efi X:\EFI\Microsoft\Boot\SecConfig.efi /Y
bcdedit /create {0cb3b571-2f2e-4343-a879-d86a476d7215} /d "DebugTool" /application osloader
bcdedit /set {0cb3b571-2f2e-4343-a879-d86a476d7215} path "\EFI\Microsoft\Boot\SecConfig.efi"
bcdedit /set {bootmgr} bootsequence {0cb3b571-2f2e-4343-a879-d86a476d7215}
bcdedit /set {0cb3b571-2f2e-4343-a879-d86a476d7215} loadoptions DISABLE-LSA-ISO
bcdedit /set {0cb3b571-2f2e-4343-a879-d86a476d7215} device partition=X:
mountvol X: /d
```
