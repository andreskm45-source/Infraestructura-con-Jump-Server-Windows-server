# 04. VPN IPsec Site-to-Site

## Objetivo
Conectar la LAN cliente VLAN 10 a la dirección del Jump Server, sin permitir acceso directo al Web Server.

## Extremos y selectores propuestos
| Parámetro | Cisco | FortiGate |
|---|---|---|
| LAN local / remota | 10.7.84.0/25 | 25.7.84.2/32 |
| Destino / origen | 25.7.84.2/32 | 10.7.84.0/25 |
| Peer WAN | IP FortiGate por confirmar | IP Cisco WAN por confirmar |
| IKE | IKEv1 | IKEv1 |
| Propuesta de la plantilla | DES / SHA1 / DH2 | Coincidente, por verificar |
| IPsec ESP de la plantilla | ESP-DES + SHA1 | Coincidente, por verificar |

**Seguridad:** DES, SHA1 y DH grupo 2 son obsoletos y no deben utilizarse en producción. Usar propuestas fuertes (p. ej. AES-GCM y grupos modernos) si ambos equipos/licencias lo permiten. El archivo Cisco original incluye una PSK de ejemplo; nunca utilizarla o publicarla como clave real.

## Cisco
La plantilla [C2691.txt](../running-configs/C2691.txt) contiene crypto ISAKMP, transform-set, ACL para tráfico interesante y crypto map. Completar IP de peer, rutas y parámetros reales.

## FortiGate GUI
1. **VPN → IPsec Tunnels → Create New**.
2. Configurar peer remoto con IP WAN Cisco real y una PSK nueva almacenada fuera del repositorio.
3. Ajustar fase 1/2 para que coincida con Cisco.
4. Selectores: local `25.7.84.2/32`, remoto `10.7.84.0/25`.
5. Comprobar las rutas y políticas de túnel hacia port3, sin acceso del túnel a port2.

## Evidencias
- `evidencias/vpn/01-phase1.png` (tapar datos sensibles).
- `evidencias/vpn/02-phase2.png`.
- `evidencias/vpn/03-tunel-up.png`.
- `evidencias/cisco/crypto-isakmp-sa.txt` y `crypto-ipsec-sa.txt`.

**Criterio de aceptación:** túnel establecido, contadores de encapsulación/decapsulación incrementando y acceso controlado únicamente a los puertos del Jump Server.
