#IP do Servidor
$IPdestino = "10.1.80.61"
$destino = "/root/teste-ftp/sub1"
$origem = "./diretorio"


#Variaveis de autenticação
$SFTPpwd = ConvertTo-SecureString "Z@33M0@2020" -AsPlainText -Force
$SFTPcred = New-Object System.Management.Automation.PSCredential ("root", $SFTPpwd)

#Conectando ao servidor FTP
$sessao = New-SFTPSession -Computer $IPdestino -Credential $SFTPcred

#Copiando arquivos para o Host FTP /root/teste-ftp/sub1
#Set-SFTPLocation -SFTPSession $sessao -Path "/root/teste-ftp/sub1"
Set-SFTPItem -SFTPSession $sessao -Path $origem -Destination $destino

