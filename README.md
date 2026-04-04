Help Desk DevOps Project

Repositorio:
https://github.com/NiicoEmporiio/help-desk-.git

OBJETIVO
Implementar un sistema de tickets con HESK, monitoreo con Zabbix y automatización mediante CI/CD usando Docker.

ARQUITECTURA
- hesk-web
- hesk-db
- zabbix-server
- zabbix-web
- zabbix-db
- zabbix-agent
- GitHub Actions
- Self-hosted runner

INSTRUCCIONES DE DESPLIEGUE

git clone https://github.com/NiicoEmporiio/help-desk-.git
cd help-desk-

Archivo .env:

TZ=America/Argentina/Buenos_Aires

HESK_DB_NAME=hesk
HESK_DB_USER=hesk_user
HESK_DB_PASSWORD=hesk_pass
HESK_DB_ROOT_PASSWORD=root_pass

HESK_PORT=8080

ZABBIX_DB_NAME=zabbix
ZABBIX_DB_USER=zabbix_user
ZABBIX_DB_PASSWORD=zabbix_pass
ZABBIX_DB_ROOT_PASSWORD=root_pass

ZABBIX_PORT=8081

docker compose up -d --build

Acceso:
http://localhost:8080
http://localhost:8081

USUARIOS

Zabbix:
Admin / zabbix

MySQL:
hesk_user / hesk_pass
zabbix_user / zabbix_pass

MONITOREO

URI:
http://hesk-web

Caída:
last(/HESK/web.test.fail[HESK Web Check])<>0

Lentitud:
last(/HESK/web.test.time[HESK Web Check,Home,resp])>2

AUTOMATIZACIÓN

categories.txt → commit → push

git add .
git commit -m "update"
git push

SELF-HOSTED RUNNER

Paso 1:
Settings → Actions → Runners → New self-hosted runner

Paso 2:
Windows / x64

Paso 3:
C:\actions-runner-helpdesk

Paso 4:
Descargar runner

Paso 5:
tar -xf archivo.zip

Paso 6:
.\config.cmd --url https://github.com/NiicoEmporiio/help-desk-.git --token TOKEN

Paso 7:
.\run.cmd

Estado:
Listening for Jobs
Idle

Funcionamiento:
- GitHub detecta push
- Runner ejecuta job
- Script Python actualiza DB

SCRIPT

scripts/sync_categories.py

Lee archivo, compara y actualiza categorías.

IDEMPOTENCIA

No duplica datos y puede ejecutarse múltiples veces.

SUPUESTOS

- entorno local
- runner local
- base en puerto 3307
- uso tipo prueba técnica

RESULTADO

Sistema automatizado, monitoreado y reproducible.

