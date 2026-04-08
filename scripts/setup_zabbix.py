import json
import time
import requests

ZABBIX_URL = "http://localhost:8081/api_jsonrpc.php"
ZABBIX_USER = "Admin"
ZABBIX_PASSWORD = "zabbix"

HOST_GROUP_NAME = "Linux servers"
HOST_NAME = "HESK"
SCENARIO_NAME = "HESK Web Check"
STEP_NAME = "Home"
STEP_URL = "http://hesk-web"

TRIGGER_DOWN_NAME = "HESK caído"
TRIGGER_SLOW_NAME = "HESK lento"


def zabbix_api(method: str, params: dict, auth=None, request_id=1):
    payload = {
        "jsonrpc": "2.0",
        "method": method,
        "params": params,
        "id": request_id,
    }
    if auth is not None:
        payload["auth"] = auth

    response = requests.post(ZABBIX_URL, json=payload, timeout=30)
    response.raise_for_status()
    data = response.json()

    if "error" in data:
        raise Exception(f"Zabbix API error: {json.dumps(data['error'], indent=2, ensure_ascii=False)}")

    return data["result"]


def wait_for_zabbix(max_attempts=20, delay=5):
    print("Esperando que Zabbix API esté disponible...")
    for attempt in range(1, max_attempts + 1):
        try:
            response = requests.get("http://localhost:8081", timeout=10)
            if response.status_code == 200:
                print("Zabbix Web responde correctamente.")
                return
        except Exception:
            pass

        print(f"Intento {attempt}/{max_attempts}...")
        time.sleep(delay)

    raise Exception("Zabbix no respondió a tiempo.")


def login():
    print("Autenticando en Zabbix...")
    token = zabbix_api(
        "user.login",
        {
            "username": ZABBIX_USER,
            "password": ZABBIX_PASSWORD
        }
    )
    print("Login correcto.")
    return token


def get_host_group_id(auth_token):
    groups = zabbix_api(
        "hostgroup.get",
        {
            "filter": {
                "name": [HOST_GROUP_NAME]
            }
        },
        auth=auth_token
    )

    if not groups:
        raise Exception(f"No se encontró el grupo '{HOST_GROUP_NAME}'")

    return groups[0]["groupid"]


def get_or_create_host(auth_token, group_id):
    hosts = zabbix_api(
        "host.get",
        {
            "filter": {
                "host": [HOST_NAME]
            }
        },
        auth=auth_token
    )

    if hosts:
        print(f"Host '{HOST_NAME}' ya existe.")
        return hosts[0]["hostid"]

    print(f"Creando host '{HOST_NAME}'...")
    result = zabbix_api(
        "host.create",
        {
            "host": HOST_NAME,
            "groups": [
                {"groupid": group_id}
            ]
        },
        auth=auth_token
    )

    host_id = result["hostids"][0]
    print(f"Host creado con ID {host_id}")
    return host_id


def get_existing_scenario(auth_token, host_id):
    scenarios = zabbix_api(
        "httptest.get",
        {
            "hostids": host_id,
            "filter": {
                "name": [SCENARIO_NAME]
            }
        },
        auth=auth_token
    )
    return scenarios[0] if scenarios else None


def create_web_scenario(auth_token, host_id):
    existing = get_existing_scenario(auth_token, host_id)
    if existing:
        print(f"Web Scenario '{SCENARIO_NAME}' ya existe.")
        return existing["httptestid"]

    print(f"Creando Web Scenario '{SCENARIO_NAME}'...")
    result = zabbix_api(
        "httptest.create",
        {
            "name": SCENARIO_NAME,
            "hostid": host_id,
            "delay": "30s",
            "steps": [
                {
                    "name": STEP_NAME,
                    "url": STEP_URL,
                    "status_codes": "200",
                    "no": 1
                }
            ]
        },
        auth=auth_token
    )

    httptest_id = result["httptestids"][0]
    print(f"Web Scenario creado con ID {httptest_id}")
    return httptest_id


def trigger_exists(auth_token, description):
    triggers = zabbix_api(
        "trigger.get",
        {
            "filter": {
                "description": [description]
            }
        },
        auth=auth_token
    )
    return len(triggers) > 0


def create_trigger_with_retry(auth_token, description, expression, priority, max_attempts=12, delay=5):
    if trigger_exists(auth_token, description):
        print(f"Trigger '{description}' ya existe.")
        return

    print(f"Creando trigger '{description}'...")
    for attempt in range(1, max_attempts + 1):
        try:
            zabbix_api(
                "trigger.create",
                {
                    "description": description,
                    "expression": expression,
                    "priority": priority
                },
                auth=auth_token
            )
            print(f"Trigger '{description}' creado.")
            return
        except Exception as e:
            print(f"No se pudo crear aún (intento {attempt}/{max_attempts}): {e}")
            time.sleep(delay)

    raise Exception(f"No se pudo crear el trigger '{description}' luego de varios intentos.")


def create_trigger_down(auth_token):
    expression = f"last(/HESK/web.test.fail[{SCENARIO_NAME}])<>0"
    create_trigger_with_retry(
        auth_token=auth_token,
        description=TRIGGER_DOWN_NAME,
        expression=expression,
        priority=4
    )


def create_trigger_slow(auth_token):
    expression = f"last(/HESK/web.test.time[{SCENARIO_NAME},{STEP_NAME},resp])>2"
    create_trigger_with_retry(
        auth_token=auth_token,
        description=TRIGGER_SLOW_NAME,
        expression=expression,
        priority=2
    )


def main():
    wait_for_zabbix()
    token = login()
    group_id = get_host_group_id(token)
    host_id = get_or_create_host(token, group_id)
    httptest_id = create_web_scenario(token, host_id)

    print("Esperando que Zabbix termine de materializar el Web Scenario...")
    time.sleep(15)

    create_trigger_down(token)
    create_trigger_slow(token)

    print(f"Host ID final: {host_id}")
    print(f"Web Scenario ID final: {httptest_id}")
    print("Automatización completa de Zabbix finalizada.")


if __name__ == "__main__":
    main()