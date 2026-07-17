Write-Host "========== PDC Domain Setup Started =========="

# Set local Administrator password
$AdminPassword = ConvertTo-SecureString "V@grant2026!" -AsPlainText -Force
Set-LocalUser -Name "Administrator" -Password $AdminPassword

# Install Required Windows Features
$features = @(
    "AD-Domain-Services",
    "DHCP",
    "DNS",
    "Web-Server",
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
    -NoRebootOnCompletion `
    -Force

Write-Host "Restarting server..."

Restart-Computer -Force