net stop dmwappushservice 
sc config dmwappushservice start=disabled

net stop diagnosticshub.standardcollector.service
sc config diagnosticshub.standardcollector.service start=disabled

net stop DcpSvc
sc config DcpSvc start=disabled

net stop WerSvc
sc config WerSvc start=disabled

net stop PcaSvc
sc config PcaSvc start=disabled

net stop DoSvc
sc config DoSvc start=disabled

net stop WMPNetworkSvc
sc config WMPNetworkSvc start=disabled

