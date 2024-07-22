$ie = New-Object -ComObject InternetExplorer.Application -Strict
$ie.Navigate("google.com")
$ie.Visible = 1