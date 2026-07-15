Write-Host "========== Configuring DNS =========="

# www.final.local -> PDC
Add-DnsServerResourceRecordA `
    -Name "www" `
    -ZoneName "Final.local" `
    -IPv4Address "192.168.10.2"

# www.final.local -> ADC
Add-DnsServerResourceRecordA `
    -Name "www" `
    -ZoneName "Final.local" `
    -IPv4Address "192.168.10.3"

Write-Host "DNS Round Robin Configured Successfully."