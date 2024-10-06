echo Bluetooth Support Service

SC STOP bthserv
SC CONFIG bthserv start= disabled
SC DELETE bthserv



echo Bluetooth Service

SC STOP btwdins
SC CONFIG btwdins start= disabled
SC DELETE btwdins



echo Bluetooth Radio Control Service

SC STOP BcmBtRSupport
SC CONFIG BcmBtRSupport start= disabled
SC DELETE BcmBtRSupport



echo Bluetooth Audio Gateway Service

SC STOP BTAGService
SC CONFIG BTAGService start= disabled
SC DELETE BTAGService
