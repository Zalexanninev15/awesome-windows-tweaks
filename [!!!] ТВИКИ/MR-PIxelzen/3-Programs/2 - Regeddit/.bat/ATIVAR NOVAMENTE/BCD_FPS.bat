bcdedit /set useplatformclock No 
bcdedit /set allowedinmemorysettings 0
bcdedit /deletevalue useplatformtick 
bcdedit /set tscsyncpolicy Enhanced
bcdedit /set disabledynamictick Yes
bcdedit /set x2apicpolicy Enable
bcdedit /set perfmem 0
bcdedit /set uselegacyapicmode No 
bcdedit /set MSI Default
bcdedit /set debug No