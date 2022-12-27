#Define user to change password
$User = 'testex2'

#Define Token with words, numbers and special characters
$TokenSet = @{
        U = [Char[]]'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        L = [Char[]]'abcdefghijklmnopqrstuvwxyz'
        N = [Char[]]'0123456789'
        S = [Char[]]'!"#$%&''()*+,-./:;<=>?@[\]^_`{|}~'
    }

$Upper = Get-Random -Count 5 -InputObject $TokenSet.U
$Lower = Get-Random -Count 5 -InputObject $TokenSet.L
$Number = Get-Random -Count 5 -InputObject $TokenSet.N
$Special = Get-Random -Count 5 -InputObject $TokenSet.S

#Join rondom characters
$StringSet = $Upper + $Lower + $Number + $Special
$RandomString = (Get-Random -Count 15 -InputObject $StringSet) -join ''

#Store rondom string
$Password = ConvertTo-SecureString $RandomString -AsPlainText -Force

#Define new password
Set-ADAccountPassword $User -NewPassword $Password -Reset -PassThru