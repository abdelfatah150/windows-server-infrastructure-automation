Write-Host "========== Configuring DHCP =========="

# Create DHCP Scope
Add-DhcpServerv4Scope `
    -Name "Final Scope" `
    -StartRange 192.168.10.40 `
    -EndRange 192.168.10.230 `
    -SubnetMask 255.255.255.0 `
    -State Active

# Add Exclusion Range
Add-DhcpServerv4ExclusionRange `
    -ScopeId 192.168.10.0 `
    -StartRange 192.168.10.80 `
    -EndRange 192.168.10.85

# Set Lease Duration (8 Days)
Set-DhcpServerv4Scope `
    -ScopeId 192.168.10.0 `
    -LeaseDuration 8.00:00:00

# Configure DHCP Options
Set-DhcpServerv4OptionValue `
    -ScopeId 192.168.10.0 `
    -DnsDomain "Final.local" `
    -DnsServer 192.168.10.2 `
    -Router 192.168.10.1

Write-Host "DHCP Configuration Completed."