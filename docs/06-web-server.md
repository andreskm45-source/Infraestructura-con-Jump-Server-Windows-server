# 06. Web Server — Sistema de Caja

## Servidor previsto
- IP `10.7.84.130/28`, gateway `10.7.84.129`.
- IIS con HTTPS 443; RDP 3389 y OpenSSH Server 22 (si se requiere).
- Firewall local con origen permitido `25.7.84.2` para los tres servicios.
- Script aportado: [07-webserver.ps1](../scripts/07-webserver.ps1).

## Pruebas desde el Jump Server
```powershell
Test-NetConnection 10.7.84.130 -Port 443
Test-NetConnection 10.7.84.130 -Port 3389
Test-NetConnection 10.7.84.130 -Port 22
```

### Evidencias pendientes
- `evidencias/web/01-iis-https.png`
- `evidencias/web/02-firewall-local.png`
- `evidencias/web/03-pruebas-jump-web.png`

No publicar datos de clientes/caja ni contraseñas reales en capturas o scripts.
