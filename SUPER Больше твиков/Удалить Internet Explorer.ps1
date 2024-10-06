Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "Internet-Explorer-Optional-amd64"
get-appxpackage *Internet-Explorer* | remove-appxpackage