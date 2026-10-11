# PLANTILLA - Web Server de laboratorio, validar antes de ejecutar
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 10.7.84.130 -PrefixLength 28 -DefaultGateway 10.7.84.129
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 8.8.8.8
Rename-Computer -NewName WEB01
Install-WindowsFeature Web-Server -IncludeManagementTools
Import-Module WebAdministration
$cert = New-SelfSignedCertificate -DnsName "caja.lab.local" -CertStoreLocation Cert:\LocalMachine\My
New-WebBinding -Name "Default Web Site" -Protocol https -Port 443
(Get-WebBinding -Name "Default Web Site" -Protocol https).AddSslCertificate($cert.Thumbprint,"My")
Set-Content C:\inetpub\wwwroot\index.html "<h1>Sistema de Caja</h1>"
# ADVERTENCIA: habilitar RDP abre reglas generales, limitarlas antes de utilizar
Set-ItemProperty 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Set-Service sshd -StartupType Automatic
Start-Service sshd
# Restringir reglas generales habilitadas por IIS/RDP/OpenSSH, no basta con crear estas reglas
New-NetFirewallRule -DisplayName "HTTPS desde Jump" -Direction Inbound -Protocol TCP -LocalPort 443 -RemoteAddress 25.7.84.2 -Action Allow
New-NetFirewallRule -DisplayName "SSH desde Jump" -Direction Inbound -Protocol TCP -LocalPort 22 -RemoteAddress 25.7.84.2 -Action Allow
New-NetFirewallRule -DisplayName "RDP desde Jump" -Direction Inbound -Protocol TCP -LocalPort 3389 -RemoteAddress 25.7.84.2 -Action Allow
