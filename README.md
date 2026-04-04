📘 Help Desk DevOps Project
🔗 Repositorio
https://github.com/NiicoEmporiio/help-desk-.git
🎯 Objetivo
Implementar un sistema de tickets con HESK, monitoreo con Zabbix y automatización mediante CI/CD usando Docker.
🏗️ Arquitectura
Servicios utilizados:
- HESK (aplicación web)
- MySQL (base de datos)
- Zabbix (monitoreo)
- GitHub Actions (CI/CD)
- Self-hosted runner (ejecución local)
🚀 Despliegue
1. Clonar repositorio
git clone https://github.com/NiicoEmporiio/help-desk-.git
cd help-desk-

2. Crear archivo .env con variables

3. Levantar servicios
docker compose up -d --build

4. Acceso:
HESK → http://localhost:8080
Zabbix → http://localhost:8081
🔐 Credenciales
Zabbix:
Admin / zabbix

MySQL:
hesk_user / hesk_pass
zabbix_user / zabbix_pass
📊 Monitoreo
URI monitoreada:
http://hesk-web

Alertas:
- Caída: web.test.fail
- Lentitud: web.test.time > 2
🔄 Automatización
Archivo: categories.txt

Flujo:
Editar → commit → push → pipeline → actualización automática
🤖 Self-Hosted Runner
Paso a paso:

1. GitHub → Settings → Actions → Runners
2. Crear runner (Windows x64)
3. Carpeta: C:\actions-runner-helpdesk
4. Descargar y extraer
5. Configurar: .\config.cmd
6. Ejecutar: .\run.cmd

Estado esperado:
Listening for Jobs / Idle
⚙️ Funcionamiento
GitHub detecta cambios → envía job → runner ejecuta → script Python actualiza base de datos.
🧠 Script
scripts/sync_categories.py

Lee archivo, compara y crea solo nuevas categorías (idempotente).
🏁 Resultado
Sistema completamente automatizado, monitoreado y reproducible.
