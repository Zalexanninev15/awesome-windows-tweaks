so what these batch file does is


1| (Delete Log Files) basically deletes Windows Log file that have build up over the months or years

2| (Delete Temporary Files) just deletes windows temp file (u know) :/

3| (Delete Update Cache) DON'T use if u planning to unistall windows update in future this will delete win update download file and cache/log,etc} 

4| (ping dns server) this just PING a dns server specifically {127.0.0.1} this is useless of most people 
    but may be usefull for people have random internet disconnecting and reconnecting or pack loss
	
5| (Disable Services) this disable services like windows telemetry service basically windows spy on u {LOL},
   Windows Insider Service,and printer services,etc
   
6| (Disable Windows Update) disable Windows update causes more harm than good {sorrry windows}

7| (Memory Optimizer) this disable superfetch,prfetch,largesystemcache,and 
   change svchostsplitthreshold value to lower the amount of Svchost multiple instances
   
8| (FPS and Latency) clears,temp file,junk log,change of net policies to have lower the latency,and ip reset 

9| (Ethernet) this change net policies to (global autotuning=restricted)

10|(BCD Edit) this will make change in window boot file to low Latency in game and disable thing like 
    Disable HPET,
	Disable dynamic tick (laptop power savings),
	Disable synthetic timers,
	change like Boot timeout 0,
	Speed up boot times
	Disable hyper virtualization
	Remove windows login logo
	Disable boot logo
	Disable spinning animation
	Disable boot messages
	Disable trusted platform module (TPM)
	Disable nx
	
11| (BCD Tweaks) it's pretty similar to the mentioned above but few that 
    bcdedit /set avoidlowmemory 0x800000
    bcdedit /set nolowmem Yes
	bcdedit /set allowedinmemorysettings 0x0
	explanation what does this
	↓
	(Avoid the use of uncontiguous portions of low-memory from the OS. 
	Boosts memory performance and improves microstuttering at least 80% of the cases. 
	Also fixes the command buffer stutter after disabling 5-level paging on 10th gen Intel. 
	Causes system freeze on unstable memory sticks.)
	
	
	bcdedit /set allowedinmemorysettings 0x0
    bcdedit /set isolatedcontext No
	explanation what does this
	↓
	Disable some of the kernel memory mitigations. 
	Causes boot crash/loops if Intel SGX is enforced and not set to "Application Controlled" or "Off" in your Firmware. 
	Gamers don't use SGX under any possible circumstance.
	
	bcdedit /set vsmlaunchtype Off
    bcdedit /set vm No
	explanation what does this
	↓
	(Virtual Secure Mode).
	
	
	bcdedit /set perfmem 0 
	↓
	I have no information on this but I have seen Brazilian player use this cmd in fortnite to reduce input LATENCY 
	
	
	bcdedit /deletevalue usefirmwarepcisettings
	↓
	Enables or disables the use of BIOS-configured peripheral component interconnect (PCI) resources.
	
12| (BCD_FPS) this will get you better FPS but bad input delay
    bcdedit /set tscsyncpolicy Enhanced
	bcdedit /set x2apicpolicy Enable
	bcdedit /deletevalue useplatformtick 
	
	
	
13| (BCD_INPUT) this will get you better input delay but bad fps
    bcdedit /set useplatformtick Yes 
	bcdedit /set tscsyncpolicy Legacy
	bcdedit /set x2apicpolicy No
	
14| (BCD Edit Tweaks minimal) this will change only two things
    bcdedit -set disabledynamictick yes
	bcdedit -set useplatformtick yes
	
15|  (Latency BCD Tweaks)	
     Disable Dynamic Tick
     Disable High Precision Event Timer (HPET)
     Disable Synthetic Timers

16|  (Disable memory compressor) sometimes keeping it on keeping it on causes lag spikes 

	memory compression is a feature that gives your RAM more breathing room to prevent your computer from lagging. 
	Windows will turn on memory compression by default, and you could disable it if you please.

	
17|  (Disable hibernation) The Fast Startup feature in Windows 10 allows your computer start up faster after a shutdown. 
     When you shut down your computer, Fast Startup will put your computer into a hibernation state instead of a full shutdown. 
     Fast Startup is enabled by default if your computer is capable of hibernation.
	
18|  (Block All Telemetry) THIS will block some windows telemetry ip and nvidia telemetry IP

19|  (Remove monitor latency) this will make change in the registry to ensure you get lower monitor latency like 
     MonitorLatencyTolerance to 0
     MonitorRefreshLatencyTolerance to 0
	 
20  (Input Delay Reduction) it oddly similar to bcdedit tweaks and bcdedit edit that is mentioned above but there are few differences are mentioned down
    Disable 57-bits 5-level paging, also known as "Linear Address 57". 
	Only 100% effective on 10th gen Intel. 256 TB of virtual memory per-disk is way much more than enough anyway.
    
	bcdedit /set linearaddress57 OptOut
    bcdedit /set increaseuserva 268435328

    Enable X2Apic and enable Memory Mapping for PCI-E devices.
	bcdedit /set configaccesspolicy Default

    bcdedit /set MSI Default

    bcdedit /set usephysicaldestination No

    bcdedit /set usefirmwarepcisettings No

21 (Cache Cleaner) this will clean your window temp files 



22 (CLEANING .BAT) this will clean your window temp file and brower temp in EDGE,FIREFOX,VIVALDI,BRAVE,CHROME




23 (CLEANING 01) only window temp files 


24 (CLEANING 02) this will clear minimum temp files


25 (Automatic cleaning) same old temp clear


26 (DNS CLEANUP) this will clear DNS Cache on your Windows what dns cache u might ask DNS servers translate domain names into IP addresses,
   making it possible for DNS clients to reach the origin server.



27 (-Temp +FPSS)   same old old temp damn stuff


28 (twice cleaning) same old old temp damn stuff :/


29 (Lower Latency) this will make changes in the registry particulate HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile
   SystemResponsiveness to 0


30 (Best for fps (worst for inputlag)) nothing much just one thing 
   SET TSCSYNCPOLICY TO ENHANCED
   
   
31 (Best for inputlag (worst for fps)) same story here
   SET TSCSYNCPOLICY TO LEGACY

32 (Delete Useless .NETservices) The ASP.NET State Service (aspnet_state) provides support for out-of-process session states for ASP.NET.
    1- aspnet_state The ASP.NET State Service (aspnet_state) provides support for out-of-process session states for ASP.NET.
	2-.NET Runtime Optimization Service disable clr_optimization_v2.0.50727_32
	3-.NET Runtime Optimization Service disable clr_optimization_v2.0.50727_64
	4-.NET Runtime Optimization Service disable clr_optimization_v4.0.30319_32
	5-.NET Runtime Optimization Service disable clr_optimization_v4.0.30319_64
	and delete them
	

33 (Disable NVTelemetry this will disable Nvidia Telemetry task 
 

    




	
	
	
	
	
	
	

     

   