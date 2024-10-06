Write-Host "Optimization scripts created by waylaa (https://github.com/waylaa/WindowsOptimizations)" -ForegroundColor Green
Write-Host "If you paid for any of these scripts, you have been scammed." -ForegroundColor Green

# Limits throughput, especially in high-speed, high-latency environments, such as most internet connections.
Set-NetTCPSetting -SettingName InternetCustom -AutoTuningLevelLocal Normal

# Restricts the auto-tuning level.
Set-NetTCPSetting -SettingName InternetCustom -ScalingHeuristics Disabled

# Changes the TCP congestion provider to CTCP, increasing network speed especially on higher speed network connections.
# This also may decrease latency (ping).
if (-not (Test-Path -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26"))
{
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26"
}

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26" -Name 00000000 -Value ([byte[]](0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x05, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0))
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Nsi\{eb004a03-9b1a-11d4-9123-0050047759bc}\26" -Name 04000000 -Value ([byte[]](0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x05, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0))

# The receive-side scaling setting enables parallelized processing of received packets on multiple processors,
# while avoiding packet reordering.
Enable-NetAdapterRss -Name *

# Allows the NIC to coalesce multiple TCP/IP packets that arrive within a single interrupt into a single larger
# packet (up to 64KB).
Enable-NetAdapterRsc -Name *

# Limits the time and number of hops/routers a packet will travel before being discarded. A number that's too small
# risks packets being discarded before reaching their destination. A number that's too large (over 128) will cause
# delay in when lost IP packets are discarded.
if (-not (Test-Path -Path HKLM:\SYSTEM\CurrentControlSet\Service\Tcpip\Parameters))
{
    New-Item -Path HKLM:\SYSTEM\CurrentControlSet\Service\Tcpip\Parameters -Force
}

Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Service\Tcpip\Parameters -Name DefaultTTL -Value 64

# A mechanism that provides routers with an alternate method of communicating network congestion.
# It is aimed to decrease retransmissions.
Set-NetTCPSetting -SettingName InternetCustom -EcnCapability Disabled

# Disables checksum offloading.
Disable-NetAdapterChecksumOffload -Name * -ErrorAction SilentlyContinue

# Enables Windows to offload all TCP processing for a connection to a network adapter (with proper driver support).
Set-NetOffloadGlobalSetting -Chimney Disabled

# The network adapter hardware is used to complete data segmentation, theoretically faster than operating system software.
Disable-NetAdapterLso -Name *

# "Timestamps" (TSOpt) is a less commonly used 1323 option that is intended to increase transmission reliability by
# retransmitting segments that are not acknowledged within some retransmission timeout (RTO) interval.
Set-NetTCPSetting -SettingName InternetCustom -Timestamps Disabled

# This is intended to increase the priority of DNS/hostname resolution, by increasing the priority of
# four related processes from their defaults.
if (-not (Test-Path -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider))
{
    New-Item -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider -Force
}

Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider -Name LocalPriority -Value 4
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider -Name HostPriority -Value 5
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider -Name DnsPriority -Value 6
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider -Name NetbtPriority -Value 7

# Sets the number of times to attempt to reestablish a connection with SYN packets.
Set-NetTCPSetting -SettingName InternetCustom -MaxSynRetransmissions 2

# Helps slow clients/connections as it makes TCP/IP less aggressive in retransmitting packets when enabled.
Set-NetTCPSetting -SettingName InternetCustom -NonSackRttResiliency disabled

# A network throttling mechanism to restrict the processing of non-multimedia network traffic to 10 packets per millisecond.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name NetworkThrottlingIndex -Value 0xffffffff

# Optimizes the machine as a file server so it would allocate resources accordingly.
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name LargeSystemCache -Value 0
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name Size -Value 1

# The Windows defaults are usually sufficient under normal network load. However, under heavy network load it may be
# necessary to adjust these two registry settings to increase port availability and decrease the time to wait
# before reclaiming unused ports.
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Service\Tcpip\Parameters -Name MaxUserPort -Value 65534
Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Service\Tcpip\Parameters -Name TcpTimedWaitDelay -Value 30

# Prevents QoS applications from getting priority to 20% of available bandwidth.
if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched))
{
    New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched
}

Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched -Name NonBestEffortLimit -Value 0

# Nagle's algorithm is designed to allow several small packets to be combined together into a single,
# larger packet for more efficient transmissions.
$networkInterfaces = [System.Collections.Generic.List[System.Net.NetworkInformation.NetworkInterface]]::new()

foreach ($networkInterface in [System.Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces())
{
    if ($networkInterface.OperationalStatus -eq [System.Net.NetworkInformation.OperationalStatus]::Up)
    {
        $networkInterfaces.Add($networkInterface)
    }
}

$result = $null
foreach ($networkInterface in $networkInterfaces)
{
    if ($null -eq $result)
    {
        $result = $networkInterface
    }
    else
    {
        if ($null -eq $networkInterface.GetIPProperties().GetIPv4Properties())
        {
            if ($networkInterface.GetIPProperties().GetIPv4Properties().Index -le $result.GetIPProperties().GetIPv4Properties().Index)
            {
                $result = $networkInterface
                Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$result.Id -Name TcpAckFrequency -Value 1
                Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$result.Id -Name TcpNoDelay -Value 1
                Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$result.Id -Name TcpDelAckTicks -Value 0
            }
        }
    }
}

Write-Output "[NetworkOptimizations] Operation completed successfully."