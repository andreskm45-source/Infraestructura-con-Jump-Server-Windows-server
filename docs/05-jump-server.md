# 05. Jump Server — Windows Server 2019

**Función:** salto controlado hacia Web Server, autenticación de usuarios y publicación de RemoteApp (RDS).

## Configuración propuesta
1. Asignar `25.7.84.2/28`, gateway `25.7.84.1`: [01-jump-red.ps1](../scripts/01-jump-red.ps1).
2. Instalar AD DS / DNS para `lab.local`: [02-jump-ad.ps1](../scripts/02-jump-ad.ps1).
3. Crear `GRP-WEB`, `GRP-PRIV`, `usr_nopriv` y `usr_priv`: [03-jump-usuarios.ps1](../scripts/03-jump-usuarios.ps1).
4. Configurar RDS y colección `Jump-Apps`: [04-jump-rds.ps1](../scripts/04-jump-rds.ps1).
5. Publicar navegador, PuTTY y mstsc según grupo: [05-jump-remoteapp.ps1](../scripts/05-jump-remoteapp.ps1).
6. Configurar RemoteApp Web Client: [06-jump-webclient.ps1](../scripts/06-jump-webclient.ps1).
7. Aplicar restricción AppLocker para bloquear `putty.exe` a `LAB\\usr_nopriv`.

## Matriz de acceso RemoteApp
| Cuenta | Grupos | Aplicaciones esperadas |
|---|---|---|
| usr_nopriv | GRP-WEB | Navegador |
| usr_priv | GRP-WEB, GRP-PRIV | Navegador, PuTTY, mstsc |

**URL prevista:** `https://jump.lab.local/RDWeb/webclient` (requiere DNS/certificado y servicios correctamente instalados).

### Capturas pendientes
- `evidencias/jump/01-ad-usuarios.png`
- `evidencias/jump/02-rds-coleccion.png`
- `evidencias/jump/03-apps-publicadas.png`
- `evidencias/jump/04-usuario-nopriv.png`
- `evidencias/jump/05-usuario-priv.png`
- `evidencias/jump/06-applocker.png`

**Advertencia:** los scripts aportados son plantillas y contienen contraseñas de ejemplo y operaciones con reinicios; revisarlos y cambiar todas las credenciales antes de usarlos. Un despliegue combinado de AD DS, RDS y RD Web en un único servidor requiere comprobar la compatibilidad y prerrequisitos de roles/licencias del laboratorio.
