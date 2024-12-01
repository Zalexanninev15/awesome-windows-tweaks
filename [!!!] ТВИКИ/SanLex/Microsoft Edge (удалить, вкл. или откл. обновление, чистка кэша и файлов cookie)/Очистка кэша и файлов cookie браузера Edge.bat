@echo off

rem Clean caches and cookies (not covered by CookieAutodelete, since the browser is running
del "%LocalAppData%\Microsoft\Edge\User Data\Default\*history*." /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\arbitration_service_config.json" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Custom Dictionary.txt" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\DashTrackerDatabase" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\DashTrackerDatabase-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\default_cloud_config.json" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\DIPS" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\DIPS-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\HubApps" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\HubApps Icons" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\HubApps Icons-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\LOG" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\LOG.old" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\MediaDeviceSalts" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Action Predictor" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Action Predictor-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Persistent State" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\PreferredApps" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Reporting and NEL" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Reporting and NEL-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\QuotaManager" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\QuotaManager-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\SharedStorage" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Shortcuts" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Shortcuts-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Top Sites" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Top Sites-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\uu_host_config" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Visited Links" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Vpn Tokens" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\WebAssistDatabase" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\WebAssistDatabase-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Web Data" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Web Data-journal" /s /f /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Asset Store" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\EdgePushStorageWithConnectTokenAndKey" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\AssistanceHome" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\blob_storage" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\BudgetDatabase" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Code Cache" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Collections" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\commerce_subscription_db" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Continuous Migration" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\databases" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\DawnCache" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\discounts_db" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Download Service" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\DualEngine" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\EdgeCoupons" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\EdgeEDrop" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\EdgeHubAppUsage" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\EdgeTravel" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\EntityExtraction" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Feature Engagement Tracker" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\GPUCache" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\File System" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\IndexedDB" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\JumpListIconsRecentClosed" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\JumpListIconsRecentWorkspacesV2" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\JumpListIconsTopSites" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Local Storage" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\MediaFoundationCdmStore" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Nurturing" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\optimization_guide_hint_cache_store" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\optimization_guide_model_metadata_store" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\parcel_tracking_db" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\PersistentOriginTrials" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\PriceComparison" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Password_Diagnostics" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Pdf" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\PDF Restore Data" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Platform Notifications" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Safe Browsing Network" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Segmentation Platform" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\SemanticEncoder.db" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Service Worker" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Session Storage" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Sessions" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Shared Dictionary" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\shared_proto_db" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Site Characteristics Database" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Storage" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\VideoDecodeStats" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\WebrtcVideoStats" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Web Applications" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\WebStorage" /s /q
rd "%LocalAppData%\Microsoft\Edge\User Data\Default\Workspaces" /s /q

echo.
echo Finished...
echo.

pause
exit /b