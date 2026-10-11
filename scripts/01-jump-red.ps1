# PLANTILLA - validar interfaz antes de ejecutar
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 25.7.84.2 -PrefixLength 28 -DefaultGateway 25.7.84.1
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 127.0.0.1
Rename-Computer -NewName JUMP01 -Restart
