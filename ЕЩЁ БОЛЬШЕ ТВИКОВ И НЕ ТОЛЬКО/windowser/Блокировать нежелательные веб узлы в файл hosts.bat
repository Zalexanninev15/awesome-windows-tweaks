COPY "%WINDIR%\system32\drivers\etc\hosts" "%WINDIR%\system32\drivers\etc\hosts.backup.txt"
ATTRIB -r "%WINDIR%\system32\drivers\etc\hosts"
SET HOSTS=%WINDIR%\System32\drivers\etc\hosts
FIND /C /I "www.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% www.msn.com>>%HOSTS%
FIND /C /I "www.msftncsi.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% www.msftncsi.com>>%HOSTS%
FIND /C /I "www.msdn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% www.msdn.com>>%HOSTS%
FIND /C /I "www.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% www.microsoft.com>>%HOSTS%
FIND /C /I "www.bing.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% www.bing.com>>%HOSTS%
FIND /C /I "wustats.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% wustats.microsoft.com>>%HOSTS%
FIND /C /I "wns.notify.windows.com.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% wns.notify.windows.com.akadns.net>>%HOSTS%
FIND /C /I "windowsupdate.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% windowsupdate.microsoft.com>>%HOSTS%
FIND /C /I "windowsupdate.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% windowsupdate.com>>%HOSTS%
FIND /C /I "win10.ipv6.microsoft.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% win10.ipv6.microsoft.com.nsatc.net>>%HOSTS%
FIND /C /I "win10.ipv6.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% win10.ipv6.microsoft.com>>%HOSTS%
FIND /C /I "wildcard.appex-rf.msn.com.edgesuite.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% wildcard.appex-rf.msn.com.edgesuite.net>>%HOSTS%
FIND /C /I "wes.df.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% wes.df.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "watson.telemetry.microsoft.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% watson.telemetry.microsoft.com.nsatc.net>>%HOSTS%
FIND /C /I "watson.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% watson.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "watson.ppe.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% watson.ppe.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "watson.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% watson.microsoft.com>>%HOSTS%
FIND /C /I "watson.live.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% watson.live.com>>%HOSTS%
FIND /C /I "vortex.data.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% vortex.data.microsoft.com>>%HOSTS%
FIND /C /I "vortex-win.data.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% vortex-win.data.microsoft.com>>%HOSTS%
FIND /C /I "vortex-sandbox.data.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% vortex-sandbox.data.microsoft.com>>%HOSTS%
FIND /C /I "vortex-cy2.metron.live.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% vortex-cy2.metron.live.com.nsatc.net>>%HOSTS%
FIND /C /I "vortex-bn2.metron.live.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% vortex-bn2.metron.live.com.nsatc.net>>%HOSTS%
FIND /C /I "view.atdmt.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% view.atdmt.com>>%HOSTS%
FIND /C /I "v10.vortex-win.data.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% v10.vortex-win.data.microsoft.com>>%HOSTS%
FIND /C /I "v10.vortex-win.data.metron.life.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% v10.vortex-win.data.metron.life.com.nsatc.net>>%HOSTS%
FIND /C /I "update.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% update.microsoft.com>>%HOSTS%
FIND /C /I "ui.skype.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ui.skype.com>>%HOSTS%
FIND /C /I "travel.tile.appex.bing.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% travel.tile.appex.bing.com>>%HOSTS%
FIND /C /I "telemetry.urs.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% telemetry.urs.microsoft.com>>%HOSTS%
FIND /C /I "telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% telemetry.microsoft.com>>%HOSTS%
FIND /C /I "telemetry.appex.bing.net:443" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% telemetry.appex.bing.net:443>>%HOSTS%
FIND /C /I "telemetry.appex.bing.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% telemetry.appex.bing.net>>%HOSTS%
FIND /C /I "telecommand.telemetry.microsoft.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% telecommand.telemetry.microsoft.com.nsatc.net>>%HOSTS%
FIND /C /I "telecommand.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% telecommand.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "survey.watson.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% survey.watson.microsoft.com>>%HOSTS%
FIND /C /I "support.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% support.microsoft.com>>%HOSTS%
FIND /C /I "statsfe2.ws.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% statsfe2.ws.microsoft.com>>%HOSTS%
FIND /C /I "statsfe2.update.microsoft.com.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% statsfe2.update.microsoft.com.akadns.net>>%HOSTS%
FIND /C /I "statsfe1.ws.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% statsfe1.ws.microsoft.com>>%HOSTS%
FIND /C /I "static.2mdn.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% static.2mdn.net>>%HOSTS%
FIND /C /I "ssw.live.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ssw.live.com.nsatc.net>>%HOSTS%
FIND /C /I "ssw.live.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ssw.live.com>>%HOSTS%
FIND /C /I "sqm.telemetry.microsoft.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% sqm.telemetry.microsoft.com.nsatc.net>>%HOSTS%
FIND /C /I "sqm.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% sqm.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "sqm.df.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% sqm.df.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "sls.update.microsoft.com.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% sls.update.microsoft.com.akadns.net>>%HOSTS%
FIND /C /I "skydrive.wns.windows.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% skydrive.wns.windows.com>>%HOSTS%
FIND /C /I "skyapi.skyprod.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% skyapi.skyprod.akadns.net>>%HOSTS%
FIND /C /I "skyapi.live.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% skyapi.live.net>>%HOSTS%
FIND /C /I "settings.data.glbdns2.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% settings.data.glbdns2.microsoft.com>>%HOSTS%
FIND /C /I "settings-win.data.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% settings-win.data.microsoft.com>>%HOSTS%
FIND /C /I "settings-sandbox.data.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% settings-sandbox.data.microsoft.com>>%HOSTS%
FIND /C /I "services.wes.df.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% services.wes.df.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "secure.flashtalking.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% secure.flashtalking.com>>%HOSTS%
FIND /C /I "secure.adnxs.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% secure.adnxs.com>>%HOSTS%
FIND /C /I "schemas.microsoft.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% schemas.microsoft.akadns.net>>%HOSTS%
FIND /C /I "sO.2mdn.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% sO.2mdn.net>>%HOSTS%
FIND /C /I "s.gateway.messenger.live.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% s.gateway.messenger.live.com>>%HOSTS%
FIND /C /I "reports.wes.df.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% reports.wes.df.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "register.mesh.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% register.mesh.com>>%HOSTS%
FIND /C /I "redir.metaservices.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% redir.metaservices.microsoft.com>>%HOSTS%
FIND /C /I "rad.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% rad.msn.com>>%HOSTS%
FIND /C /I "rad.live.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% rad.live.com>>%HOSTS%
FIND /C /I "pricelist.skype.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% pricelist.skype.com>>%HOSTS%
FIND /C /I "preview.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% preview.msn.com>>%HOSTS%
FIND /C /I "pre.footprintpredict.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% pre.footprintpredict.com>>%HOSTS%
FIND /C /I "office.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% office.microsoft.com>>%HOSTS%
FIND /C /I "oca.telemetry.microsoft.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% oca.telemetry.microsoft.com.nsatc.net>>%HOSTS%
FIND /C /I "oca.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% oca.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "msntest.serving-sys.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% msntest.serving-sys.com>>%HOSTS%
FIND /C /I "msnbot-65-55-108-23.search.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% msnbot-65-55-108-23.search.msn.com>>%HOSTS%
FIND /C /I "msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% msn.com>>%HOSTS%
FIND /C /I "msftncsi.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% msftncsi.com>>%HOSTS%
FIND /C /I "msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% msedge.net>>%HOSTS%
FIND /C /I "msdn.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% msdn.microsoft.com>>%HOSTS%
FIND /C /I "msdn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% msdn.com>>%HOSTS%
FIND /C /I "microsoftupdate.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% microsoftupdate.microsoft.com>>%HOSTS%
FIND /C /I "microsoftupdate.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% microsoftupdate.com>>%HOSTS%
FIND /C /I "microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% microsoft.com>>%HOSTS%
FIND /C /I "m.hotmail.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% m.hotmail.com>>%HOSTS%
FIND /C /I "m.adnxs.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% m.adnxs.com>>%HOSTS%
FIND /C /I "login.live.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% login.live.com.nsatc.net>>%HOSTS%
FIND /C /I "login.live.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% login.live.com>>%HOSTS%
FIND /C /I "live.rads.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% live.rads.msn.com>>%HOSTS%
FIND /C /I "lb1.www.ms.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% lb1.www.ms.akadns.net>>%HOSTS%
FIND /C /I "ipv6.msftncsi.com.edgesuite.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ipv6.msftncsi.com.edgesuite.net>>%HOSTS%
FIND /C /I "ipv6.msftncsi.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ipv6.msftncsi.com>>%HOSTS%
FIND /C /I "i1.services.social.microsoft.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% i1.services.social.microsoft.com.nsatc.net>>%HOSTS%
FIND /C /I "i1.services.social.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% i1.services.social.microsoft.com>>%HOSTS%
FIND /C /I "h1.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% h1.msn.com>>%HOSTS%
FIND /C /I "go.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% go.microsoft.com>>%HOSTS%
FIND /C /I "g.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% g.msn.com>>%HOSTS%
FIND /C /I "flex.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% flex.msn.com>>%HOSTS%
FIND /C /I "feedback.windows.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% feedback.windows.com>>%HOSTS%
FIND /C /I "feedback.search.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% feedback.search.microsoft.com>>%HOSTS%
FIND /C /I "feedback.microsoft-hohm.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% feedback.microsoft-hohm.com>>%HOSTS%
FIND /C /I "fe3.delivery.mp.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% fe3.delivery.mp.microsoft.com>>%HOSTS%
FIND /C /I "fe3.delivery.dsp.mp.microsoft.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% fe3.delivery.dsp.mp.microsoft.com.nsatc.net>>%HOSTS%
FIND /C /I "fe2.update.microsoft.com.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% fe2.update.microsoft.com.akadns.net>>%HOSTS%
FIND /C /I "en-us.appex-rf.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% en-us.appex-rf.msn.com>>%HOSTS%
FIND /C /I "ec.atdmt.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ec.atdmt.com>>%HOSTS%
FIND /C /I "download.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% download.microsoft.com>>%HOSTS%
FIND /C /I "dns.msftncsi.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% dns.msftncsi.com>>%HOSTS%
FIND /C /I "directory.services.live.com.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% directory.services.live.com.akadns.net>>%HOSTS%
FIND /C /I "directory.services.live.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% directory.services.live.com>>%HOSTS%
FIND /C /I "diagnostics.support.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% diagnostics.support.microsoft.com>>%HOSTS%
FIND /C /I "df.telemetry.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% df.telemetry.microsoft.com>>%HOSTS%
FIND /C /I "db3aqu.atdmt.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% db3aqu.atdmt.com>>%HOSTS%
FIND /C /I "cs1.wpc.v0cdn.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% cs1.wpc.v0cdn.net>>%HOSTS%
FIND /C /I "corpext.msitadfs.glbdns2.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% corpext.msitadfs.glbdns2.microsoft.com>>%HOSTS%
FIND /C /I "corp.sts.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% corp.sts.microsoft.com>>%HOSTS%
FIND /C /I "compatexchange.cloudapp.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% compatexchange.cloudapp.net>>%HOSTS%
FIND /C /I "client.wns.windows.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% client.wns.windows.com>>%HOSTS%
FIND /C /I "choice.microsoft.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% choice.microsoft.com.nsatc.net>>%HOSTS%
FIND /C /I "choice.microsoft.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% choice.microsoft.com>>%HOSTS%
FIND /C /I "cds26.ams9.msecn.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% cds26.ams9.msecn.net>>%HOSTS%
FIND /C /I "cdn.atdmt.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% cdn.atdmt.com>>%HOSTS%
FIND /C /I "c.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% c.msn.com>>%HOSTS%
FIND /C /I "c.atdmt.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% c.atdmt.com>>%HOSTS%
FIND /C /I "bs.serving-sys.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% bs.serving-sys.com>>%HOSTS%
FIND /C /I "bl3302geo.storage.dkyprod.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% bl3302geo.storage.dkyprod.akadns.net>>%HOSTS%
FIND /C /I "bl3302.storage.live.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% bl3302.storage.live.com>>%HOSTS%
FIND /C /I "b.rad.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% b.rad.msn.com>>%HOSTS%
FIND /C /I "b.ads2.msads.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% b.ads2.msads.net>>%HOSTS%
FIND /C /I "b.ads1.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% b.ads1.msn.com>>%HOSTS%
FIND /C /I "az512334.vo.msecnd.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% az512334.vo.msecnd.net>>%HOSTS%
FIND /C /I "az361816.vo.msecnd.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% az361816.vo.msecnd.net>>%HOSTS%
FIND /C /I "apps.skype.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% apps.skype.com>>%HOSTS%
FIND /C /I "any.edge.bing.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% any.edge.bing.com>>%HOSTS%
FIND /C /I "americas2.notify.windows.com.akadns.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% americas2.notify.windows.com.akadns.net>>%HOSTS%
FIND /C /I "aka-cdn-ns.adtech.de" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% aka-cdn-ns.adtech.de>>%HOSTS%
FIND /C /I "aidps.atdmt.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% aidps.atdmt.com>>%HOSTS%
FIND /C /I "ads1.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ads1.msn.com>>%HOSTS%
FIND /C /I "ads1.msads.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ads1.msads.net>>%HOSTS%
FIND /C /I "ads.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ads.msn.com>>%HOSTS%
FIND /C /I "adnxs.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% adnxs.com>>%HOSTS%
FIND /C /I "adnexus.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% adnexus.net>>%HOSTS%
FIND /C /I "ad.doubleclick.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ad.doubleclick.net>>%HOSTS%
FIND /C /I "ac3.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% ac3.msn.com>>%HOSTS%
FIND /C /I "a978.i6g1.akamai.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a978.i6g1.akamai.net>>%HOSTS%
FIND /C /I "a.rad.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a.rad.msn.com>>%HOSTS%
FIND /C /I "a.ads2.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a.ads2.msn.com>>%HOSTS%
FIND /C /I "a.ads2.msads.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a.ads2.msads.net>>%HOSTS%
FIND /C /I "a.ads1.msn.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a.ads1.msn.com>>%HOSTS%
FIND /C /I "a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-msedge.net>>%HOSTS%
FIND /C /I "a-0009.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0009.a-msedge.net>>%HOSTS%
FIND /C /I "a-0008.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0008.a-msedge.net>>%HOSTS%
FIND /C /I "a-0007.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0007.a-msedge.net>>%HOSTS%
FIND /C /I "a-0006.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0006.a-msedge.net>>%HOSTS%
FIND /C /I "a-0005.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0005.a-msedge.net>>%HOSTS%
FIND /C /I "a-0004.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0004.a-msedge.net>>%HOSTS%
FIND /C /I "a-0003.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0003.a-msedge.net>>%HOSTS%
FIND /C /I "a-0002.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0002.a-msedge.net>>%HOSTS%
FIND /C /I "a-0001.a-msedge.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% a-0001.a-msedge.net>>%HOSTS%
FIND /C /I "OneSettings-bn2.metron.live.com.nsatc.net" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% OneSettings-bn2.metron.live.com.nsatc.net>>%HOSTS%
FIND /C /I "BN1WNS2011508.wns.windows.com" %HOSTS%
IF %ERRORLEVEL% NEQ 0 ECHO ^%NOURL% BN1WNS2011508.wns.windows.com>>%HOSTS%
ATTRIB +r "%WINDIR%\system32\drivers\etc\hosts"