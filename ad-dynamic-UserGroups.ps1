Import-Module activedirectory

$ADdominio = "dc=spirogiro"
$ADUPN = "dc=local"

$ADou = @(
    "OU=Adm Predial, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Comercial, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Consultores Externos, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Cooperativa, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Corretora, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=CRM, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Filiais, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Financeiro, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Juridico, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=MultiGed, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Operacao, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Parceiros, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Presidencia, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Relacionamento, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=RH, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=TI, OU=Usuarios, $ADdominio, $ADUPN",
    "OU=Usuarios de Servico, OU=Usuarios, $ADdominio, $ADUPN"
)

$ADgrupo = @(
    "AdmPredial_Geral_QuaQua",
    "Comercial_Geral_QuaQua",
    "Consultores_Geral_QuaQua",
    "Cooperativa_Geral_QuaQua",
    "Corretora_Geral_QuaQua",
    "CRM_Geral_QuaQua",
    "Filiais_Geral_QuaQua",
    "Financeiro_Geral_QuaQua",
    "Juridico_Geral_QuaQua",
    "MultiGed_Geral_QuaQua",
    "Operacao_Geral_QuaQua",
    "Parceiros_Geral_QuaQua",
    "Presidencia_Geral_QuaQua",
    "Relacionamento_Geral_QuaQua",
    "RH_Geral_QuaQua",
    "TI_Geral_QuaQua",
    "UsuariosdeServico_Geral_QuaQua"
)

$ADDN = @(
    "*OU=Adm Predial,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Comercial,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Consultores Externos,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Cooperativa,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Corretora,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=CRM,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Filiais,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Financeiro,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Juridico,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=MultiGed,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Operacao,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Parceiros,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Presidencia,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Relacionamento,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=RH,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=TI,OU=Usuarios,$ADdominio,$ADUPN*",
    "*OU=Usuarios de Servico,OU=Usuarios,$ADdominio,$ADUPN*"
)


for ($i = 0;$i -lt ($ADou.Length) -and ($ADgrupo.Length) -and ($ADDN.Length); $i++) {

    $ADusuarios = @()
    
    foreach($OU in $ADou[$i]){
    $ADusuarios += Get-ADUser -SearchBase $ADou[$i] -Filter *
    }

    foreach($usuario in $ADusuarios)
    {
    Add-ADGroupMember -Identity $ADgrupo[$i] -Members $usuario.samaccountname -ErrorAction SilentlyContinue
    }

    $grupomembros = Get-ADGroupMember -Identity $ADgrupo[$i]
    foreach($membro in $grupomembros)
    {
    if($membro.distinguishedname -notlike $ADDN[$i])    
    {
    Remove-ADGroupMember -Identity $ADgrupo[$i] -Members $membro.samaccountname -Confirm:$false
    }
    }
}