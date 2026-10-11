# 08. Plan de validación

| Prueba | Resultado esperado | Evidencia | Resultado real |
|---|---|---|---|
| VPN Cisco ↔ FortiGate | Establecido y contadores incrementan | `evidencias/vpn/03-tunel-up.png` | **Pendiente** |
| Cliente VPN → Jump HTTPS | Conecta a RemoteApp | `evidencias/jump/04-usuario-nopriv.png` | **Pendiente** |
| Cliente VPN → Web directo | Denegado | `evidencias/fortigate/07-log-bloqueado.png` | **Pendiente** |
| usr_nopriv | Solo aplicación web | `evidencias/jump/04-usuario-nopriv.png` | **Pendiente** |
| usr_priv | Web + PuTTY + mstsc | `evidencias/jump/05-usuario-priv.png` | **Pendiente** |
| Jump → Web 443/3389/22 | Permitidos | `evidencias/web/03-pruebas-jump-web.png` | **Pendiente** |
| Jump → Web puertos restantes | Denegados | `evidencias/fortigate/07-log-bloqueado.png` | **Pendiente** |

**Criterio:** sustituir «Pendiente» únicamente después de documentar una prueba real. Un ping no prueba necesariamente el estado completo de servicios HTTPS/RDP.
