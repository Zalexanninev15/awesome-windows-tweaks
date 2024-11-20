## Overview

This will (globally) disable [Credential Guard](https://docs.microsoft.com/en-u/windows/security/identity-protection/credential-guard/credential-guard-manage) on your Windows 10 system.


## GPO

Start GPO via `gpedit.msc` and navigate to **Computer Configuration > Administrative Templates > System > Device Guard**. The change we want to make is the `Turn On Virtualization Based Security` entry.



### Steps
* In the Properties window of `Turn On Virtualization Based Security` policy make sure to select **Enabled**. In has to be set to enabled to enforce the policy, otherwise Windows 10 set it to **ON**.
* Select `Platform Security Level` and in the drop-down select `Secure Boot` or `Secure Boot and DMA Protection`.
* The last step is to enforce that these mechanism are OFF. In the `Credential Guard Configuration` drop-down choose `Enabled without lock`.


