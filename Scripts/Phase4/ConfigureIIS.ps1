Write-Host "========== Configuring IIS =========="

# Install IIS
Install-WindowsFeature Web-Server -IncludeManagementTools

# Get Current Server Name
$ServerName = $env:COMPUTERNAME

$html = @"
<!DOCTYPE html>
<html>
<head>
    <title>Final.local</title>
</head>
<body style="font-family: Arial; text-align:center; margin-top:150px;">
    <h1>Welcome to Final.local</h1>
    <h2>$ServerName</h2>
    <p>Windows Server Infrastructure Automation Project</p>
</body>
</html>
"@

Set-Content -Path "C:\inetpub\wwwroot\index.html" -Value $html

Restart-Service W3SVC

Write-Host "IIS Configuration Completed."