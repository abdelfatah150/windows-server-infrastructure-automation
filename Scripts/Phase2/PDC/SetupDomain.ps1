Write-Host "========== PDC Domain Setup Started =========="

# Install Required Windows Features
$features = @(
    "AD-Domain-Services",
    "DHCP",
    "DNS",
    "Web-Server",
    "Hyper-V",
    "FS-Resource-Manager"
)

foreach ($feature in $features)
{
    Write-Host "Installing $feature..."

    Install-WindowsFeature `
        -Name $feature `
        -IncludeManagementTools
}

# Create DSRM Password
$DSRMPassword = ConvertTo-SecureString `
"V@grant2026!" `
-AsPlainText `
-Force

# Create Active Directory Forest
Install-ADDSForest `
-DomainName "FINAL.LOCAL" `
-DomainNetbiosName "FINAL" `
-SafeModeAdministratorPassword $DSRMPassword `
-InstallDNS `
-Force