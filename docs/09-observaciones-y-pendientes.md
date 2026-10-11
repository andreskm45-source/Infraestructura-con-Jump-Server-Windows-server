# 09. Observaciones técnicas y tareas pendientes

1. **Sin capturas de implementación:** el ZIP proporcionado tiene únicamente un archivo `images/LEEME.txt` y no incluye capturas reales. La topología publicada procede de la imagen adjunta.
2. **Configuraciones iniciales incompletas:** Cisco y switch están marcadas como plantillas; FortiGate.conf era un marcador de posición.
3. **No publicar credenciales:** los scripts originales contienen contraseñas de ejemplo y el Cisco contenía una PSK escrita en claro; deben sustituirse por valores suministrados de manera segura.
4. **Cifrado legado:** IKEv1, DES, SHA1 y DH2 de la plantilla se mantienen solamente como información académica; están obsoletos y no son adecuados para producción.
5. **IPs WAN:** verificar el par WAN real antes de aplicar túneles; una IP fija en la plantilla no garantiza conectividad.
6. **Privilegios:** la diferencia entre usuarios se prueba en RemoteApp/AppLocker, no solamente con firewall IPv4.
7. **Red Jump:** 25.7.84.0/28 pertenece al espacio público. Mantener aislada y migrar a RFC1918 si se conecta a Internet.
8. **Pruebas de laboratorio:** faltan capturas y resultados reales de VPN, permisos, conexiones y políticas.
9. **Video:** insertar enlace auténtico al inicio de README.md.
10. **Windows RDS:** verificar compatibilidad de roles, certificados, permisos y requisitos de RemoteApp Web Client antes de dar el despliegue por correcto.
