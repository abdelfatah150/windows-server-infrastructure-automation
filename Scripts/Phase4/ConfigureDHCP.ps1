Write-Host "========== Creating Security Groups =========="

Import-Module ActiveDirectory

$Groups = @{

    "HR"    = "HR_Users"
    "Sales" = "Sales_Users"
    "Dev"   = "Dev_Users"
    "IT"    = "IT_Users"

}

foreach ($Department in $Groups.Keys)
{

    $Group = $Groups[$Department]

    if (-not (Get-ADGroup -Filter "Name -eq '$Group'" -ErrorAction SilentlyContinue))
    {

        New-ADGroup `
            -Name $Group `
            -GroupScope Global `
            -GroupCategory Security `
            -Path "OU=$Department,DC=Final,DC=local"

        Write-Host "$Group Created Successfully."

    }
    else
    {
        Write-Host "$Group Already Exists."
    }

}