Write-Host "========== Creating Users =========="

Import-Module ActiveDirectory

$Users = Import-Csv ".\Users.csv"

foreach ($User in $Users)
{

    $SecurePassword = ConvertTo-SecureString `
        $User.Password `
        -AsPlainText `
        -Force

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$($User.Username)'" -ErrorAction SilentlyContinue))
    {

        New-ADUser `
            -Name "$($User.FirstName) $($User.LastName)" `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -SamAccountName $User.Username `
            -UserPrincipalName "$($User.Username)@Final.local" `
            -Department $User.Department `
            -Path "OU=$($User.Department),DC=Final,DC=local" `
            -AccountPassword $SecurePassword `
            -Enabled $true `
            -ChangePasswordAtLogon $false

        Add-ADGroupMember `
            -Identity $User.Group `
            -Members $User.Username

        Write-Host "$($User.Username) Created Successfully."

    }

    else
    {
        Write-Host "$($User.Username) Already Exists."
    }

}