📘 Help Desk DevOps Project

🔗 Repositorio
https://github.com/NiicoEmporiio/help-desk-.git

🎯 Objetivo
Implementar un sistema de mesa de ayuda con HESK, monitoreo con Zabbix y automatización mediante CI/CD, utilizando Docker Compose para levantar el entorno y scripts auxiliares para dejar la instalación lo más automatizada posible en una PC nueva.

🏗️ Arquitectura

Servicios principales:
- HESK → aplicación web de tickets
- MySQL → base de datos de HESK
- Zabbix Server → motor de monitoreo
- Zabbix Web → interfaz web de monitoreo
- Zabbix Agent → agente auxiliar
- GitHub Actions → automatización CI/CD
- Self-hosted runner → ejecución local del pipeline

🚀 Despliegue

Opción recomendada (semiautomática)

1. Clonar repositorio:
git clone https://github.com/NiicoEmporiio/help-desk-.git
cd help-desk-

2. Ejecutar el setup:
.\setup.ps1

Si PowerShell bloquea ejecución:
Set-ExecutionPolicy -Scope Process Bypass

⚙️ Qué hace setup.ps1
- verifica Docker
- verifica Python
- crea .env automáticamente desde .env.example
- levanta contenedores
- instala dependencias Python
- ejecuta setup_zabbix.py
- deja Zabbix configurado automáticamente

🌐 Acceso
HESK → http://localhost:8080
Zabbix → http://localhost:8081

🔐 Credenciales

Zabbix:
Admin / zabbix

MySQL HESK:
hesk_user / hesk_pass

MySQL Zabbix:
zabbix_user / zabbix_pass

📊 Monitoreo

URI monitoreada:
http://hesk-web

Configuración automática:
- Host: HESK
- Web Scenario: HESK Web Check
- Step: Home
- Triggers:
  - HESK caído
  - HESK lento

🔄 Automatización

Archivo principal:
categories.txt

Flujo:
Editar → commit → push → pipeline → actualización automática en HESK

🤖 Self-Hosted Runner

Instalación:
1. GitHub → Settings → Actions → Runners
2. Crear runner Windows x64
3. Carpeta:
C:\actions-runner-helpdesk
4. Ejecutar:
config.cmd
run.cmd

Estado esperado:
Listening for Jobs / Idle

🔐 Secrets necesarios

HESK_DB_HOST = 127.0.0.1
HESK_DB_PORT = 3307
HESK_DB_NAME = hesk
HESK_DB_USER = hesk_user
HESK_DB_PASSWORD = hesk_pass

🧠 Scripts

scripts/setup_zabbix.py:
Configura automáticamente Zabbix (host, web scenario, triggers)

scripts/sync_categories.py:
Sincroniza categorías sin duplicar (idempotente)

📦 Dependencias

requirements.txt:
requests
PyMySQL

🏁 Resultado

Sistema:
- reproducible
- automatizado
- dockerizado
- monitoreado
- portable entre PCs
- con CI/CD funcionando
