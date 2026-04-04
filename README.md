README - HELP DESK DEVOPS PROJECT

Repositorio:
https://github.com/NiicoEmporiio/help-desk-.git

--------------------------------------------------

1. OBJETIVO

Implementar un sistema de tickets con HESK, monitoreo con Zabbix y automatización mediante CI/CD usando Docker.

--------------------------------------------------

2. INSTRUCCIONES DE DESPLIEGUE

Clonar repositorio:
git clone https://github.com/NiicoEmporiio/help-desk-.git
cd help-desk-

Crear archivo .env con:

# Zona horaria
TZ=America/Argentina/Buenos_Aires

# =========================
# HESK (MySQL)
# =========================
HESK_DB_NAME=hesk
HESK_DB_USER=hesk_user
HESK_DB_PASSWORD=hesk_pass
HESK_DB_ROOT_PASSWORD=root_pass

HESK_PORT=8080

# =========================
# ZABBIX (MySQL)
# =========================
ZABBIX_DB_NAME=zabbix
ZABBIX_DB_USER=zabbix_user
ZABBIX_DB_PASSWORD=zabbix_pass
ZABBIX_DB_ROOT_PASSWORD=root_pass

ZABBIX_PORT=8081

Levantar servicios:
docker compose up -d --build

Acceso:
HESK → http://localhost:8080
Zabbix → http://localhost:8081

--------------------------------------------------

3. USUARIOS Y CLAVES

Zabbix:
Usuario: Admin
Password: zabbix

MySQL:
hesk_user / hesk_pass
zabbix_user / zabbix_pass
root / root_pass

--------------------------------------------------

4. MONITOREO

URI monitoreada:
http://hesk-web

Umbrales:

Caída:
last(/HESK/web.test.fail[HESK Web Check])<>0

Lentitud:
last(/HESK/web.test.time[HESK Web Check,Home,resp])>2

--------------------------------------------------

5. PIPELINE

Editar categories.txt → commit → push

git add .
git commit -m "update categories"
git push

--------------------------------------------------

6. AUTOMATIZACIÓN

Script:
scripts/sync_categories.py

Función:
- Lee categories.txt
- Compara con DB
- Inserta nuevas
- No duplica (idempotente)

--------------------------------------------------

7. ARQUITECTURA

Servicios:
- hesk-web
- hesk-db
- zabbix-server
- zabbix-web
- zabbix-db
- zabbix-agent

--------------------------------------------------

8. SUPUESTOS

- Entorno local con Docker
- Runner local (self-hosted)
- Base accesible por puerto 3307
- Proyecto tipo POC