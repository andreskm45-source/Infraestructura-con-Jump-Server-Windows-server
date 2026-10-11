# PLANTILLA - RemoteApp Web Client; verificar compatibilidad y certificados
Install-Module -Name RDWebClientManagement -Scope AllUsers
Install-RDWebClientPackage
Import-RDWebClientBrokerCert C:\jump.cer
Publish-RDWebClientPackage -Type Production -Latest
# URL prevista: https://jump.lab.local/RDWeb/webclient
