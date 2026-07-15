Write-Host "========== PDC Initial Setup =========="

# Set network profile to Private
Set-NetConnectionProfile -NetworkCategory Private

# Set IP and DNS for PDC
$adapter = Get-NetAdapter | Where-Object Status -eq "Up" | Select-Object -First 1

Get-NetIPAddress -InterfaceIndex $adapter.InterfaceIndex -AddressFamily IPv4 |
    Remove-NetIPAddress -Confirm:$false -ErrorAction SilentlyContinue

New-NetIPAddress `
    -InterfaceIndex $adapter.InterfaceIndex `
    -IPAddress "192.168.10.2" `
    -PrefixLength 24 `
    -DefaultGateway "192.168.10.1"

Set-DnsClientServerAddress `
    -InterfaceIndex $adapter.InterfaceIndex `
    -ServerAddresses "192.168.10.2"

# Enable PowerShell Remoting
Enable-PSRemoting -Force

# Enable File and Printer Sharing firewall rules
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

# Set computer name to PDC
Rename-Computer -NewName "PDC" -Force

Write-Host "Restarting computer..."

Restart-Computer -Force