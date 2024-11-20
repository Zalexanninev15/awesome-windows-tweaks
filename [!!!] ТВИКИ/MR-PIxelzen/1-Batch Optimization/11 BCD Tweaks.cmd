bcdedit /deletevalue useplatformclock

bcdedit /set disabledynamictick yes

bcdedit /set useplatformtick yes

bcdedit /set {globalsettings} custom:16000067 true

bcdedit /set {globalsettings} custom:16000069 true

bcdedit /set {globalsettings} custom:16000068 true

bcdedit /set bootux disabled

bcdedit /timeout 0

bcdedit /deletevalue usefirmwarepcisettings

bcdedit /set perfmem 0 

bcdedit /set hypervisorlaunchtype Off

bcdedit /set avoidlowmemory 0x8000000

bcdedit /set nolowmem Yes

bcdedit /set vsmlaunchtype Off

bcdedit /set vm No

bcdedit /set allowedinmemorysettings 0x0

bcdedit /set isolatedcontext No

pause