Write-Host "========== Configuring DHCP Failover =========="

Add-DhcpServerv4Failover `
    -Name "Final-DHCP-Failover" `
    -ComputerName "PDC" `
    -PartnerServer "ADC" `
    -ScopeId 192.168.10.0 `
    -SharedSecret "Final@123"

Write-Host "DHCP Failover Configured Successfully."