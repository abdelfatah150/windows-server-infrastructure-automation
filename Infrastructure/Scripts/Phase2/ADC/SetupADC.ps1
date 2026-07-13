Write-Host "========== Installing Windows Features on ADC =========="

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

# Domain Administrator Credentials
$Password = ConvertTo-SecureString `
"123@asd" `
-AsPlainText `
-Force

$Credential = New-Object System.Management.Automation.PSCredential(
"FINAL\Administrator",
$Password
)

# Join Domain
Add-Computer `
-DomainName "FINAL.LOCAL" `
-Credential $Credential `
-Force

Restart-Computer -Force

# Promote to Additional Domain Controller
Install-ADDSDomainController `
-DomainName "FINAL.LOCAL" `
-Credential $Credential `
-SafeModeAdministratorPassword $Password `
-InstallDNS `
-Force
