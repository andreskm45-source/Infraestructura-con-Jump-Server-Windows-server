# 07. Políticas y segmentación de seguridad

## Matriz de reglas objetivo
| # | Origen | Destino | Servicio | Acción | NAT |
|---|---|---|---|---|---|
| 1 | VPN / 10.7.84.0/25 | Jump 25.7.84.2 | HTTPS 443 | Permitir | No |
| 2 | VPN / 10.7.84.0/25 | Jump 25.7.84.2 | RDP 3389 (si requerido) | Permitir | No |
| 3 | VPN / 10.7.84.0/25 | Web 10.7.84.130 | Todos | Denegar | No |
| 4 | Jump 25.7.84.2 | Web 10.7.84.130 | HTTPS 443, RDP 3389, SSH 22 | Permitir | No |
| 5 | Jump 25.7.84.2 | Internet | DNS, HTTP, HTTPS | Permitir | Sí (cuando aplique) |
| 6 | Otros flujos | Destinos internos | Todos | Denegar implícitamente | No |

## Dónde configurar
**FortiGate GUI → Policy & Objects → Firewall Policy.** Ajustar interfaces de entrada y salida conforme a WAN, túnel, port2 y port3. Ordenar reglas específicas antes de cualquier política general. Activar logging para evidencias.

**Importante:** una política por dirección IP **no distingue** automáticamente `usr_nopriv` de `usr_priv`. Las restricciones por usuario deben reforzarse dentro del Jump Server con permisos RDS y AppLocker; para filtrado por identidad a nivel firewall haría falta integrar una solución de identidad compatible.

## Evidencias
- `evidencias/fortigate/05-politicas.png`
- `evidencias/fortigate/06-log-permitido.png`
- `evidencias/fortigate/07-log-bloqueado.png`
- `evidencias/jump/06-applocker.png`

**Pendiente:** documentar interfaces exactas, policy IDs y resultados observados en la GUI.
