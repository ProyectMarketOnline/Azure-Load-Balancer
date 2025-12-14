# Proyecto: Alta Disponibilidad y Balanceo de Carga en Azure

![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Apache](https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=Apache&logoColor=white)
![Status](https://img.shields.io/badge/STATUS-EN%20DESARROLLO-yellow?style=for-the-badge)

> **Implementación de una arquitectura de alta disponibilidad para MarketOnline S.A.C. utilizando Azure Load Balancer y Redundancia de Zona.**

---

## Descripción del Proyecto

Este proyecto aborda la problemática de **MarketOnline S.A.C.**, una empresa de comercio electrónico que sufría caídas recurrentes en su sitio web durante campañas de alto tráfico (CyberWow) debido a una infraestructura monolítica.

El objetivo principal es migrar su infraestructura a **Microsoft Azure**, implementando un **Load Balancer (Balanceador de Carga)** que distribuya el tráfico entre múltiples servidores web ubicados en diferentes zonas de disponibilidad, garantizando así la continuidad del servicio y tolerancia a fallos.

## Arquitectura de la Solución

La solución implementada utiliza una arquitectura distribuida en la región **West US 3** para asegurar redundancia y disponibilidad.

### Componentes Clave:
* **Azure Load Balancer (SKU Standard):** Distribuye el tráfico entrante (Puerto 80) hacia el pool de servidores.
* **Backend Pool:** Compuesto por 2 Máquinas Virtuales (Linux Ubuntu) con servidor web Apache.
* **Availability Zones:**
    * `VM-Web01`: Zona de Disponibilidad 1.
    * `VM-Web02`: Zona de Disponibilidad 2.
* **Health Probes:** Monitorización constante vía HTTP/80 para detectar y aislar instancias fallidas.
* **Red Virtual (VNet):** Segmentación segura mediante subredes y NSG (Network Security Groups).

## Tecnologías Utilizadas

* **Proveedor Cloud:** Microsoft Azure (Región West US 3).
* **Sistema Operativo:** Ubuntu Server 20.04 / 24.04 LTS.
* **Servidor Web:** Apache2 HTTP Server.
* **Redes:** Virtual Networks, Public IPs, Network Security Groups.
* **Herramientas:** Azure Portal, PuTTY (SSH), GitHub Projects (Gestión SCRUM).

## Hoja de Ruta (Roadmap SCRUM)

El proyecto se gestiona bajo metodología Ágil/SCRUM dividido en 4 Sprints:

* [x] **Sprint 0: Planificación**
    * Definición del Acta de Constitución y Product Backlog.
* [x] **Sprint 1: Infraestructura Base**
    * Despliegue de VNet y Subredes (`WebSubnet`).
    * Aprovisionamiento de VMs en Zonas 1 y 2.
    * Instalación de servidores web Apache.
* [x] **Sprint 2: Balanceo de Carga**
    * Configuración del Azure Load Balancer Standard.
    * Implementación de Health Probes y Reglas de Balanceo.
    * Pruebas de failover y distribución de tráfico.
* [ ] **Sprint 3: Seguridad y Monitoreo (En Progreso)**
    * Hardening de NSGs.
    * Configuración de alertas en Azure Monitor.

## Despliegue e Instalación

Pasos generales seguidos para la implementación:

1.  **Creación de Grupo de Recursos:** `RG-MarketOnline-Prod`.
2.  **Configuración de Red:** Creación de `VNet-MarketOnline` (10.0.0.0/16).
3.  **Despliegue de Servidores:**
    ```bash
    # Instalación de Apache en cada nodo
    sudo apt-get update
    sudo apt-get install apache2 -y
    echo "<h1>Hola desde el Servidor X</h1>" | sudo tee /var/www/html/index.html
    ```
4.  **Configuración del Balanceador:** Asociación de Frontend IP, Backend Pool y Sondas de Salud.

## Equipo del Proyecto

| Integrante | Rol |
| :--- | :--- |
| **Silva Pino, Jesus Francisco** | **Cloud Architect / Tech Lead** |

---
*Este proyecto fue desarrollado como parte del curso "Proyecto Integrador - Implementación Cloud" de la carrera de Administración de Redes y Comunicaciones*
