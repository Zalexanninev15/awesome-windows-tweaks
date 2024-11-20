net stop XblAuthManager
sc config XblAuthManager start=disabled
net stop XblGameSave
sc config XblGameSave start=disabled
net stop XboxNetApiSvc
sc config XboxNetApiSvc start=disabled