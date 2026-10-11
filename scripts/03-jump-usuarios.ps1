# PLANTILLA - crear usuarios y grupos sin credenciales incrustadas
Import-Module ActiveDirectory
New-ADGroup -Name "GRP-WEB" -GroupScope Global
New-ADGroup -Name "GRP-PRIV" -GroupScope Global
$securePassword = Read-Host "Contraseña inicial de laboratorio para cuentas de prueba" -AsSecureString
New-ADUser -Name "usr_nopriv" -SamAccountName "usr_nopriv" -AccountPassword $securePassword -Enabled $true -ChangePasswordAtLogon $true
New-ADUser -Name "usr_priv" -SamAccountName "usr_priv" -AccountPassword $securePassword -Enabled $true -ChangePasswordAtLogon $true
Add-ADGroupMember GRP-WEB -Members usr_nopriv,usr_priv
Add-ADGroupMember GRP-PRIV -Members usr_priv
# Verificar las directivas de inicio de sesión remoto antes de asignar acceso RDS.
