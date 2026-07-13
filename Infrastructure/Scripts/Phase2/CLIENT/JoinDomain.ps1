Write-Host "========== Client Domain Join Started =========="

# Domain Administrator Credentials
$Password = ConvertTo-SecureString `
"P@ssw0rd123" `
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