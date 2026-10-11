# PLANTILLA - Requiere RDS instalado y configurado por GUI
Get-RDSessionCollection
# Si la colección QuickSessionCollection existe, adaptar el nombre y grupos:
# Set-RDSessionCollectionConfiguration -CollectionName "QuickSessionCollection" -UserGroup "LAB\GRP-WEB"
# En Server Manager configurar la colección Jump-Apps y verificar roles RD Broker/Web/Session Host.
