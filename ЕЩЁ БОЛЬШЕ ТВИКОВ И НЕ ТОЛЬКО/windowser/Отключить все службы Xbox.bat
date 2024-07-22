echo Xbox Live Auth Manager

SC STOP XblAuthManager
SC CONFIG XblAuthManager start= disabled
SC DELETE XblAuthManager



echo Xbox Accessory Managment Service

SC STOP XboxGipSvc
SC CONFIG XboxGipSvc start= disabled
SC DELETE XboxGipSvc



echo Xbox Live Game Save

SC STOP XblGameSave
SC CONFIG XblGameSave start= disabled
SC DELETE XblGameSave



echo Xbox Live Networking Service

SC STOP XboxNetApiSvc
SC CONFIG XboxNetApiSvc start= disabled
SC DELETE XboxNetApiSvc