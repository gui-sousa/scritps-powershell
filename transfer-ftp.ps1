#Endereços para envio
$SFTPendereco = "ftp.servidor.nome"
$SFTPdestino = "."
$SFTPorigem = ".\diretorio"
$SFTPbkp = "\\diretorio\de\backup"
$timestamp = $(get-date -f dd-MM-yyyy_hh-mm-s)

#Cria artefato a ser enviado em formato ZIP
Compress-Archive -Path $SFTPorigem -DestinationPath "$SFTPbkp\artefato_$timestamp.zip"
$SFTParquivo = "$SFTPbkp\artefato_$timestamp.zip"

#Variaveis de autenticação
$SFTPpwd = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force
$SFTPcred = New-Object System.Management.Automation.PSCredential ("guisousa", $SFTPpwd)

#Conectando ao servidor FTP
$sessao = New-SFTPSession -Computer $SFTPendereco -Credential $SFTPcred

#Copiando arquivos para o Host FTP
Set-SFTPItem -SFTPSession $sessao -Path $SFTParquivo -Destination $SFTPdestino

#Limpa pasta de origem após o envio FTP
Remove-Item "SFTPorigem" -Recurse

