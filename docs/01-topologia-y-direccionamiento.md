# 01. Topología y direccionamiento

![Topología](../images/topologia-laboratorio.svg)

## Componentes
- ISP simulado / red 192.168.20.0/24.
- Router Cisco C2691 y switch de acceso para PC Linux con VLAN 10.
- FortiGate con port1 (WAN), port2 (Web Server), port3 (Jump Server).
- Jump Server Windows Server 2019 y Web Server para Sistema de Caja.
- Enlace IPsec Cisco ↔ FortiGate.

## Tabla de redes
| Segmento | Red | Puerta de enlace / nodo |
|---|---|---|
| WAN simulada | 192.168.20.0/24 | Cisco fa0/0 DHCP y FortiGate port1 por confirmar |
| VLAN 10 | 10.7.84.0/25 | Router 10.7.84.1; DHCP .10-.126 |
| Web Server | 10.7.84.128/28 | FortiGate 10.7.84.129, servidor 10.7.84.130 |
| Jump Server | 25.7.84.0/28 | FortiGate 25.7.84.1, servidor 25.7.84.2 |

**Pendiente:** capturar los adaptadores y confirmar las IP de WAN. La red 25.7.84.0/28 es pública y solo es apta en una práctica aislada.

### Evidencias
- `evidencias/01-topologia-pnetlab.png`: captura real de PNETLab.
- `evidencias/02-direccionamiento.png`: tabla o comandos con direcciones confirmadas.
