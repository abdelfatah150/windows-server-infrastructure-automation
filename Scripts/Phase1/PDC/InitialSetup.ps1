Write-Host "========== PDC Initial Setup =========="

# Set network profile to Private
Set-NetConnectionProfile -NetworkCategory Private

# Set IP and DNS for PDC
$adapter = Get-NetAdapter -Name "Ethernet 2"

New-NetIPAddress `
    -InterfaceIndex $adapter.InterfaceIndex `
    -IPAddress "192.168.10.2" `
    -PrefixLength 24

Set-DnsClientServerAddress `
    -InterfaceIndex $adapter.InterfaceIndex `
    -ServerAddresses "192.168.10.2"

# Enable PowerShell Remoting
Enable-PSRemoting -Force

# Enable File and Printer Sharing firewall rules
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

# Set computer name to PDC
Rename-Computer -NewName "PDC" -Restart -Force

Write-Host "Restarting computer..."