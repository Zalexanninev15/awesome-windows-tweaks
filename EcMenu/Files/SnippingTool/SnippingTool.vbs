'www.sordum.org - Velociraptor & BlueLife - 2023.08.14

Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set colOperatingSystems = objWMIService.ExecQuery ("Select * from Win32_OperatingSystem")
Set WshShell = WScript.CreateObject("Shell.Application")

For Each objOperatingSystem in colOperatingSystems
	'~ WScript.Echo objOperatingSystem.Caption
	if instr(objOperatingSystem.Caption, "Windows 11") Then
		WshShell.ShellExecute "shell:Appsfolder\Microsoft.ScreenSketch_8wekyb3d8bbwe!App"
	Else
		StikyNotPath = WScript.CreateObject("Wscript.Shell").ExpandEnvironmentStrings("%SystemRoot%\system32\SnippingTool.exe")
		WshShell.ShellExecute StikyNotPath
	End If
Next