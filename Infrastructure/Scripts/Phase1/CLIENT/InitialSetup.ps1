Write-Host "========== CLIENT Initial Setup =========="

# Set network profile to Private
Set-NetConnectionProfile -NetworkCategory Private

# Enable PowerShell Remoting
Enable-PSRemoting -Force

# Enable File and Printer Sharing firewall rules
Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

# Set computer name to CLIENT
Rename-Computer -NewName "CLIENT" -Force

Write-Host "Restarting computer..."

Restart-Computer -Force