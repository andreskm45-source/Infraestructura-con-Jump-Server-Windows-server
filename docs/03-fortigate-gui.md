# 03. FortiGate — configuración por GUI

**Toda configuración y demostración del FortiGate debe hacerse por interfaz gráfica**, según la documentación suministrada.

## 1. Interfaces
**Network → Interfaces**:
- `port1`: WAN/ISP (IP por verificar).
- `port2`: LAN-Web, `10.7.84.129/28`.
- `port3`: LAN-Jump, `25.7.84.1/28`.

**Captura aquí:** `evidencias/fortigate/01-interfaces.png`.

## 2. Rutas
**Network → Static Routes**: ruta `0.0.0.0/0` hacia ISP por `port1` (gateway real pendiente). Agregar ruta remota `10.7.84.0/25` mediante interfaz/túnel IPsec de acuerdo con el tipo de túnel configurado.

**Captura aquí:** `evidencias/fortigate/02-rutas.png`.

## 3. Objetos de direcciones
**Policy & Objects → Addresses**: crear `NET-USUARIOS` = `10.7.84.0/25`, `JUMP-SERVER` = `25.7.84.2/32`, `WEB-SERVER` = `10.7.84.130/32`.

**Captura aquí:** `evidencias/fortigate/03-objetos.png`.

## 4. VPN
**VPN → IPsec Tunnels**: véase [VPN IPsec](04-vpn-ipsec.md). Confirmar que peer, IKE/IPsec proposals y selectores coinciden con Cisco.

**Captura aquí:** `evidencias/fortigate/04-ipsec.png`.

## 5. Políticas
**Policy & Objects → Firewall Policy**: configurar únicamente flujos necesarios, registrar eventos y usar políticas de denegación explícitas donde facilite demostrar bloqueos. Véase [matriz de políticas](07-politicas-de-seguridad.md).

**Captura aquí:** `evidencias/fortigate/05-politicas.png`.

## 6. Registros y respaldo
- **Log & Report → Forward Traffic**: captura de permitidos y denegados.
- **Dashboard / VPN Monitor** (según visibilidad de la versión): estado del túnel.
- **System → Config → Backup**: exportar y **sanitizar** credenciales, PSK y material sensible antes de guardar respaldo en `running-configs/FortiGate.conf`.

> No se ha proporcionado un respaldo completo del FortiGate; el archivo del ZIP es un marcador de posición.
