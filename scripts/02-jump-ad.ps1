# PLANTILLA - AD DS y DNS; ejecutar en Windows Server de laboratorio
Install-WindowsFeature AD-Domain-Services, DNS -IncludeManagementTools
# Confirmar prerrequisitos antes de ejecutar:
# Install-ADDSForest -DomainName "lab.local" -DomainNetbiosName "LAB" -InstallDns
# Después del reinicio, configurar reenviadores DNS según red real.
