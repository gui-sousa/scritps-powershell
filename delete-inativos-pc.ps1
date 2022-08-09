Import-Module activedirectory

$dias = (Get-Date).AddDays(-60)


Get-ADComputer -Property Name,lastLogonDate -Filter {lastLogonDate -lt $dias} | Remove-ADObject -Recursive -Confirm:$false