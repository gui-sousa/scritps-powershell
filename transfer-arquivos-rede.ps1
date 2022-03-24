#Variaveis com o caminho de rede
$PASTAorigem = "\\edeia\pasta\rede\arquivos"
$PASTAdestino = "\\angola\kuduro\rede\arquivos"

<#Copia todos os arquivos e pastas dentro do endereço.
Faz 3 tentativas em caso de falha, 
aguardando 5 segundos entre cada tentativa#>
Robocopy.exe $PASTAorigem $PASTAdestino /e /r:3 /w:5 /COPYALL