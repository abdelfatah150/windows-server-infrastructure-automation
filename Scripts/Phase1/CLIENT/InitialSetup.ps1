Write-Host "========== CLIENT Initial Setup =========="

# Set network profile to Private
Set-NetConnectionProfile -NetworkCategory Private

# Set IP and DNS for CLIENT
$adapter = Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | Select-Object -First 1

New-NetIPAddress `
    -InterfaceIndex $adapter.InterfaceIndex `
    -IPAddress "192.168.1.10" `
    -PrefixLength 24 `
    -DefaultGateway "192.168.1.1"

Set-DnsClientServerAddress `
    -InterfaceIndex $adapter.InterfaceIndex `
    -ServerAddresses "192.168.1.2"

# Enable PowerShell Remoting
Enable-PSRemoting -Force

# Enable File and Printer Sharing firewall rules
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

# Set computer name to CLIENT
Rename-Computer -NewName "CLIENT" -Force

Write-Host "Restarting computer..."

Restart-Computer -Force