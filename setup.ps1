Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " Setup Help Desk DevOps" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

# 1. Verificar Docker
Write-Host "`n[1/6] Verificando Docker..." -ForegroundColor Yellow
try {
    docker --version | Out-Null
    docker compose version | Out-Null
    Write-Host "Docker OK" -ForegroundColor Green
}
catch {
    Write-Host "ERROR: Docker Desktop no esta instalado o no esta corriendo." -ForegroundColor Red
    exit 1
}

# 2. Verificar Python real
Write-Host "`n[2/6] Verificando Python..." -ForegroundColor Yellow
$pythonOk = $false

try {
    $pythonVersion = python --version 2>&1
    if ($LASTEXITCODE -eq 0 -and $pythonVersion -match "Python") {
        Write-Host "Python OK -> $pythonVersion" -ForegroundColor Green
        $pythonOk = $true
    }
    else {
        Write-Host "ADVERTENCIA: Python no esta disponible correctamente." -ForegroundColor Yellow
    }
}
catch {
    Write-Host "ADVERTENCIA: Python no esta disponible." -ForegroundColor Yellow
}

# 3. Crear .env si no existe
Write-Host "`n[3/6] Verificando archivo .env..." -ForegroundColor Yellow
if (-Not (Test-Path ".env")) {
    if (Test-Path ".env.example") {
        Copy-Item ".env.example" ".env"
        Write-Host "Se creo .env a partir de .env.example" -ForegroundColor Green
    }
    else {
        Write-Host "ERROR: No existe .env ni .env.example" -ForegroundColor Red
        exit 1
    }
}
else {
    Write-Host ".env ya existe" -ForegroundColor Green
}

# 4. Levantar contenedores
Write-Host "`n[4/6] Levantando contenedores..." -ForegroundColor Yellow
docker compose up -d --build
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Fallo docker compose up -d --build" -ForegroundColor Red
    exit 1
}

# 5. Esperar servicios
Write-Host "`n[5/6] Esperando inicializacion de servicios..." -ForegroundColor Yellow
Start-Sleep -Seconds 20

# 6. Ejecutar automatizacion de Zabbix si Python esta disponible
Write-Host "`n[6/6] Configurando Zabbix automaticamente..." -ForegroundColor Yellow
if ($pythonOk) {
    if (Test-Path "scripts\setup_zabbix.py") {
        python scripts/setup_zabbix.py
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Automatizacion de Zabbix completada." -ForegroundColor Green
        }
        else {
            Write-Host "ADVERTENCIA: El script de Zabbix devolvio error. Revisar salida." -ForegroundColor Yellow
        }
    }
    else {
        Write-Host "ADVERTENCIA: No existe scripts\setup_zabbix.py" -ForegroundColor Yellow
    }
}
else {
    Write-Host "ADVERTENCIA: Se omite setup_zabbix.py porque Python no esta disponible." -ForegroundColor Yellow
}

# Estado final
Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Estado actual de contenedores" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
docker ps

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Sistema iniciado" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "HESK:   http://localhost:8080" -ForegroundColor White
Write-Host "Zabbix: http://localhost:8081" -ForegroundColor White
Write-Host ""
Write-Host "Notas:" -ForegroundColor Yellow
Write-Host "- HESK ya deberia iniciar con la base cargada automaticamente" -ForegroundColor Yellow
Write-Host "- Zabbix ya deberia crear host, web scenario y triggers automaticamente" -ForegroundColor Yellow
Write-Host "- Si queres CI/CD automatico, todavia falta configurar runner y validar GitHub Actions" -ForegroundColor Yellow