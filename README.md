# ☁️ Proyecto 15: Alta Disponibilidad y Balanceo de Carga en Azure

![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Apache](https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=Apache&logoColor=white)
![Status](https://img.shields.io/badge/STATUS-FINALIZADO-brightgreen?style=for-the-badge)

> **Implementación de una arquitectura de alta disponibilidad para MarketOnline S.A.C. utilizando Azure Load Balancer, Redundancia de Zona y Seguridad Perimetral.**

---

## 📖 Descripción del Proyecto

Este proyecto soluciona la problemática de **MarketOnline S.A.C.**, asegurando que su plataforma de comercio electrónico permanezca operativa durante eventos de alto tráfico (CyberWow). 

Se ha migrado de una infraestructura monolítica a una arquitectura distribuida en **Microsoft Azure**, implementando un **Load Balancer** que distribuye el tráfico entre servidores redundantes y se recupera automáticamente ante fallos (Failover).

## 🏗️ Arquitectura de la Solución

La infraestructura se encuentra desplegada en la región **West US 3** aprovechando las Zonas de Disponibilidad (Availability Zones).

### Componentes Implementados:
* **Azure Load Balancer (Standard):** Punto de entrada único que balancea el tráfico HTTP (Puerto 80).
* **Backend Pool Distribuido:**
    * `VM-Web01`: Zona 1 (Ubuntu 24.04 + Apache).
    * `VM-Web02`: Zona 2 (Ubuntu 24.04 + Apache).
* **Health Probes:** Sondas de salud TCP/80 que aíslan nodos defectuosos en <5 segundos.
* **Seguridad (NSG):** Filtrado de tráfico a nivel de red (Capa 4).
* **Observabilidad:** Tablero de métricas en Azure Monitor.

## 🎯 Épicas Logradas

Se ha dado cumplimiento al 100% de las Historias de Usuario definidas en el alcance del proyecto:

### ✅ ÉPICA 1: Preparación de la Infraestructura Base
**Objetivo:** Crear los recursos fundamentales de red y cómputo.
- [x] Despliegue de Virtual Network (`VNet`) y subredes.
- [x] Configuración de Máquinas Virtuales en zonas de disponibilidad cruzadas.
- [x] Instalación y configuración de servidores web Apache.

### ✅ ÉPICA 2: Configuración del Azure Load Balancer
**Objetivo:** Implementar la distribución de tráfico y redundancia.
- [x] Implementación de Load Balancer SKU Standard con IP Pública.
- [x] Asociación del Backend Pool con las interfaces de red.
- [x] Configuración de Health Probes (Puerto 80) y Reglas de Balanceo.

### ✅ ÉPICA 3: Monitoreo, Seguridad y Optimización
**Objetivo:** Garantizar la observabilidad, seguridad y eficiencia.
- [x] **Hardening:** Restricción de acceso SSH (Puerto 22) solo a IP administrativa.
- [x] **Alertas:** Notificación automática por correo ante caída de nodos.
- [x] **Dashboard:** Visualización en tiempo real de disponibilidad y tráfico.

### ✅ ÉPICA 4: Documentación y Presentación
**Objetivo:** Elaborar la documentación técnica y evidencias.
- [x] Manual técnico de despliegue.
- [x] Pruebas de estrés y validación de Failover documentadas.
- [x] Video demostrativo de funcionamiento.

## 🛡️ Detalles de Seguridad (Hardening)

Como parte de la estrategia de defensa en profundidad:
* **Acceso Restringido (SSH):** El puerto 22 ha sido bloqueado para internet, permitiendo conexión únicamente desde la IP de gestión autorizada.
* **Superficie de Ataque Reducida:** Solo el puerto 80 (HTTP) es público. Puertos críticos (21, 445, 3389) están denegados por defecto.

## Documentación y Evidencias

En este repositorio encontrarás los entregables detallados:

* **[Manual Técnico de Implementación](/Reportes_Finales/Manual_Tecnico_MarketOnline.pdf):** Guía paso a paso de la configuración.
* **Evidencias:** Capturas de pantalla de pruebas de Failover y Seguridad en la carpeta `/evidencias`.
* **Demostración:** [Ver Video del Proyecto en Funcionamiento]

## Despliegue Rápido (Snippet)

Comandos utilizados para la provisión de los servidores web:

```bash
# Actualización e instalación de Apache
sudo apt-get update && sudo apt-get install apache2 -y

# Personalización del Index
sudo bash -c 'cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head><title>MarketOnline</title></head>
<body>
    <div style="background-color:#1e293b;color:#4ade80;padding:10px;text-align:center">
        CONECTADO A: <span style="color:white;font-weight:bold">VM-WEB01</span>
    </div>
</body>
</html>
EOF'

