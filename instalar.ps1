# ============================================================================
# Wrapper PowerShell - apenas chama Docker. Sem PHP, sem XAMPP, sem nada local.
#
# Uso (PowerShell normal, NÃO precisa ser admin):
#   .\instalar.ps1            # tudo
#   .\instalar.ps1 up         # só sobe os containers
#   .\instalar.ps1 seed       # só roda o seed
#   .\instalar.ps1 down       # derruba (mantém banco)
#   .\instalar.ps1 reset      # derruba e apaga tudo
# ============================================================================

param([string]$Command = "all")

$ErrorActionPreference = "Stop"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Verifica Docker
try {
    docker compose version | Out-Null
} catch {
    Write-Host "Erro: Docker não encontrado. Instale Docker Desktop." -ForegroundColor Red
    exit 1
}

switch ($Command) {
    "up" {
        Write-Host "==> Subindo containers db + wordpress..." -ForegroundColor Cyan
        docker compose up -d db wordpress
        Write-Host ""
        Write-Host "Containers rodando. WordPress em http://localhost:8080"
    }

    "seed" {
        Write-Host "==> Rodando seed da loja..." -ForegroundColor Cyan
        docker compose run --rm wpcli
    }

    "down" {
        Write-Host "==> Derrubando containers (volume do banco preservado)..." -ForegroundColor Cyan
        docker compose down
    }

    "reset" {
        Write-Host "==> RESET COMPLETO: derruba containers, apaga banco e pasta woocommerce/" -ForegroundColor Yellow
        $confirm = Read-Host "Tem certeza? [y/N]"
        if ($confirm -ne "y" -and $confirm -ne "Y") {
            Write-Host "Cancelado."
            exit 0
        }
        docker compose down -v
        if (Test-Path .\woocommerce) { Remove-Item .\woocommerce -Recurse -Force }
        Write-Host "Reset concluído."
    }

    { $_ -in "all", "" } {
        Write-Host "==> [1/2] Subindo containers db + wordpress..." -ForegroundColor Cyan
        docker compose up -d db wordpress

        Write-Host ""
        Write-Host "==> Aguardando WordPress responder..." -ForegroundColor Cyan
        for ($i = 0; $i -lt 60; $i++) {
            try {
                $r = Invoke-WebRequest -Uri "http://localhost:8080" -UseBasicParsing -TimeoutSec 2 -ErrorAction Stop
                if ($r.StatusCode -in 200, 301, 302) { break }
            } catch { Start-Sleep -Seconds 2 }
        }

        Write-Host ""
        Write-Host "==> [2/2] Rodando seed da loja..." -ForegroundColor Cyan
        docker compose run --rm wpcli

        Write-Host ""
        Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Green
        Write-Host "  PRONTO" -ForegroundColor Green
        Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Green
        Write-Host ""
        Write-Host "  Loja:    http://localhost:8080/"
        Write-Host "  Admin:   http://localhost:8080/wp-admin/"
        Write-Host "  Login:   admin / admin123"
        Write-Host ""
        Write-Host "  Para gerar pacote de entrega: .\exportar-entrega.ps1" -ForegroundColor Yellow
        Write-Host ""
    }

    default {
        Write-Host "Comando desconhecido: $Command"
        Write-Host "Uso: .\instalar.ps1 [up|seed|down|reset|all]"
        exit 1
    }
}
