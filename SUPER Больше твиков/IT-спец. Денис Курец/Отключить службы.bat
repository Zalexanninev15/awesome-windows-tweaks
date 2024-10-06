net stop RemoteRegistry
sc config RemoteRegistry start=disabled

net stop TermService
sc config TermService start=disabled

net stop TrkWks
sc config TrkWks start=disabled

net stop DPS
sc config DPS start=disabled

