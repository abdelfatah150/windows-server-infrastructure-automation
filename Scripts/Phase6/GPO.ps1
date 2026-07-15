Write-Host "========== Configuring Group Policies =========="



# ======================================
# Import Group Policy Module
# ======================================

Import-Module GroupPolicy



# ======================================
# Create GPOs
# ======================================


Write-Host "Creating GPOs..."



$SecurityGPO = "Final Security Policy"

$RemoteGPO = "Remote Access Policy"

$DriveGPO = "Network Drives Policy"



New-GPO -Name $SecurityGPO

New-GPO -Name $RemoteGPO

New-GPO -Name $DriveGPO



# ======================================
# Get Domain Name
# ======================================

$DomainDN = (Get-ADDomain).DistinguishedName



# ======================================
# Link GPOs to Domain
# ======================================


New-GPLink `
-Name $SecurityGPO `
-Target $DomainDN



New-GPLink `
-Name $RemoteGPO `
-Target $DomainDN



New-GPLink `
-Name $DriveGPO `
-Target $DomainDN





# ======================================
# 1. Enable Remote Desktop
# ======================================


Write-Host "Enabling Remote Desktop..."



Set-GPRegistryValue `
-Name $RemoteGPO `
-Key "HKLM\System\CurrentControlSet\Control\Terminal Server" `
-ValueName "fDenyTSConnections" `
-Type DWord `
-Value 0



# Enable Remote Assistance

Set-GPRegistryValue `
-Name $RemoteGPO `
-Key "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Terminal Server" `
-ValueName "AllowTSConnections" `
-Type DWord `
-Value 1




# ======================================
# 2. Allow IT Group Remote Assistance
# ======================================


Write-Host "Assigning IT Group as Helpers..."



Set-GPRegistryValue `
-Name $RemoteGPO `
-Key "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Terminal Server" `
-ValueName "Shadow" `
-Type DWord `
-Value 2





# ======================================
# 3. Disable USB Storage
# ======================================


Write-Host "Blocking USB Storage..."



Set-GPRegistryValue `
-Name $SecurityGPO `
-Key "HKLM\System\CurrentControlSet\Services\USBSTOR" `
-ValueName "Start" `
-Type DWord `
-Value 4





# ======================================
# 4. Disable Task Manager
# ======================================


Write-Host "Disabling Task Manager..."



Set-GPRegistryValue `
-Name $SecurityGPO `
-Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" `
-ValueName "DisableTaskMgr" `
-Type DWord `
-Value 1





# ======================================
# 5. Disable Control Panel
# ======================================


Write-Host "Disabling Control Panel..."



Set-GPRegistryValue `
-Name $SecurityGPO `
-Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
-ValueName "NoControlPanel" `
-Type DWord `
-Value 1





# ======================================
# 6. Map Network Drives
# ======================================


Write-Host "Creating Network Drive Mapping..."



# Public Drive

New-GPRegistryValue `
-Name $DriveGPO `
-Key "HKCU\Network\P" `
-ValueName "RemotePath" `
-Type String `
-Value "\\PDC\Public"



# Dev Drive

New-GPRegistryValue `
-Name $DriveGPO `
-Key "HKCU\Network\D" `
-ValueName "RemotePath" `
-Type String `
-Value "\\PDC\Dev"



# HR Drive

New-GPRegistryValue `
-Name $DriveGPO `
-Key "HKCU\Network\H" `
-ValueName "RemotePath" `
-Type String `
-Value "\\PDC\HR"




Write-Host "========== GPO Configuration Completed =========="