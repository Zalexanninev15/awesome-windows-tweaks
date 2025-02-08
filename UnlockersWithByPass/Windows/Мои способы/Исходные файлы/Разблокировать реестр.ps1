$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System"

$registryName = "DisableRegistryTools"
$registryValue = 0

if (Test-Path $registryPath) 
{
    Remove-ItemProperty -Path $registryPath -Name $registryName -ErrorAction SilentlyContinue
}
else {
	New-Item -Path $registryPath
}
New-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue -PropertyType DWORD -Force

Start-Process regedit