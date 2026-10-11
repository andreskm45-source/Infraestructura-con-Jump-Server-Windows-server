# PLANTILLA - certificados y publicación de aplicaciones RemoteApp
$cert = New-SelfSignedCertificate -DnsName "jump.lab.local","JUMP01.lab.local" -CertStoreLocation Cert:\LocalMachine\My -NotAfter (Get-Date).AddYears(2)
Export-Certificate -Cert $cert -FilePath C:\jump.cer
$pfxPassword = Read-Host "Contraseña de exportación PFX" -AsSecureString
Export-PfxCertificate -Cert $cert -FilePath C:\jump.pfx -Password $pfxPassword
# Asignar los certificados a los roles RDS por Server Manager GUI.
$browser = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
# Ajustar ejecutables, colección y asignación de usuarios a la instalación real.
New-RDRemoteApp -CollectionName "Jump-Apps" -DisplayName "Navegador Web" -FilePath $browser -UserGroups "LAB\GRP-WEB"
New-RDRemoteApp -CollectionName "Jump-Apps" -DisplayName "PuTTY" -FilePath "C:\Program Files\PuTTY\putty.exe" -UserGroups "LAB\GRP-PRIV"
New-RDRemoteApp -CollectionName "Jump-Apps" -DisplayName "Escritorio Remoto" -FilePath "C:\Windows\System32\mstsc.exe" -UserGroups "LAB\GRP-PRIV"
