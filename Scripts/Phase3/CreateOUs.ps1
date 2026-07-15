Write-Host "========== Creating Organizational Units =========="

Import-Module ActiveDirectory

$OUs = @(
    "HR",
    "Sales",
    "Dev",
    "IT"
)

foreach ($OU in $OUs)
{
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$OU'" -ErrorAction SilentlyContinue))
    {
        New-ADOrganizationalUnit `
            -Name $OU `
            -Path "DC=Final,DC=local"

        Write-Host "$OU OU Created Successfully."
    }
    else
    {
        Write-Host "$OU Already Exists."
    }
}