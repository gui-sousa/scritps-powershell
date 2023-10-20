#Script que gera notificação para sinalizar terminos de Deploy
#Importa modulo
Import-Module BurntToast

#Comando que gera a notificação
New-BurntToastNotification -AppLogo 'https://raw.githubusercontent.com/gui-sousa/Zabbix_Mail_HTML/main/sign-check-icon_34365.png' -Sound 'Default' -Text "Deploy Finalizado",'Veja no terminal o que aconteceu'
