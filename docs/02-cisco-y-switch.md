# 02. Router Cisco y switch

## Switch — VLAN 10
Consultar [SW.txt](../running-configs/SW.txt). La plantilla configura una VLAN 10, trunk hacia el router y puerto de acceso para el cliente.

## Cisco C2691
Consultar [C2691.txt](../running-configs/C2691.txt). El archivo aportado es una **plantilla parcial** que incluye interfaz WAN DHCP, interfaz VLAN 10, DHCP, NAT e IPsec. Falta verificar la IP del peer, la ruta de salida y el estado real.

## Comprobaciones desde Cisco
```text
show ip interface brief
show vlan-switch brief
show ip dhcp binding
show ip route
show crypto isakmp sa
show crypto ipsec sa
show ip nat translations
show running-config | section line
```

Guardar salida **real y sin secretos** como evidencia en `evidencias/cisco/`. No confundir la salida esperada con un resultado verificado.
