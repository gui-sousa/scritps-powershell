
#Endereços para envio
$SFTPendereco = "ftp.nome.ou.ip"
$SFTPdestino = "/pasta/destino/servidor/ftp"

#Cria artefato a ser enviado em formato ZIP
Compress-Archive -Path .\diretorio\* -DestinationPath .\artefato.zip
$SFTParquivo = ".\artefato.zip"

#Variaveis de autenticação
$SFTPpwd = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
$SFTPcred = New-Object System.Management.Automation.PSCredential ("guisousa", $SFTPpwd)

#Conectando ao servidor FTP
$sessao = New-SFTPSession -Computer $SFTPendereco -Credential $SFTPcred

#Copiando arquivos para o Host FTP
Set-SFTPItem -SFTPSession $sessao -Path $SFTParquivo -Destination $SFTPdestino