Write-Host "========== Enabling Active Directory Recycle Bin =========="

Enable-ADOptionalFeature `
-Identity "Recycle Bin Feature" `
-Scope ForestOrConfigurationSet `
-Target "FINAL.LOCAL" `
-Confirm:$false