Write-Host "========== Configuring Password Policy =========="

Import-Module ActiveDirectory

Set-ADDefaultDomainPasswordPolicy `
    -Identity "Final.local" `
    -MaxPasswordAge (New-TimeSpan -Days 60) `
    -MinPasswordLength 6 `
    -PasswordHistoryCount 3

Write-Host "Password Policy Configured Successfully."