#!/usr/bin/env bash
# ============================================================================
# Sobe o stack Docker e roda o seed da loja WooCommerce.
#
# Uso:
#   ./instalar.sh         # tudo
#   ./instalar.sh up      # só sobe os containers (db + wordpress)
#   ./instalar.sh seed    # só roda o seed (cria produtos, configura tudo)
#   ./instalar.sh down    # derruba tudo (mantém volume do banco)
#   ./instalar.sh reset   # derruba E apaga banco + pasta woocommerce
# ============================================================================

set -euo pipefail
cd "$(dirname "$0")"

cmd="${1:-all}"

# Detecta `docker compose` (V2) vs `docker-compose` (V1)
if docker compose version >/dev/null 2>&1; then
    DC="docker compose"
elif command -v docker-compose >/dev/null 2>&1; then
    DC="docker-compose"
else
    echo "Erro: Docker Compose não encontrado. Instale Docker Desktop ou docker-compose." >&2
    exit 1
fi

case "$cmd" in
    up)
        echo "==> Subindo containers db + wordpress..."
        $DC up -d db wordpress
        echo ""
        echo "Containers rodando. WordPress em http://localhost:8080"
        ;;

    seed)
        echo "==> Rodando seed da loja..."
        $DC run --rm wpcli
        ;;

    down)
        echo "==> Derrubando containers (volume do banco preservado)..."
        $DC down
        ;;

    reset)
        echo "==> RESET COMPLETO: derruba containers, apaga volume do banco e pasta woocommerce/"
        read -p "Tem certeza? [y/N] " confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            echo "Cancelado."
            exit 0
        fi
        $DC down -v
        rm -rf ./woocommerce
        echo "Reset concluído."
        ;;

    all|"")
        echo "==> [1/2] Subindo containers db + wordpress..."
        $DC up -d db wordpress

        echo ""
        echo "==> Aguardando WordPress responder..."
        for i in $(seq 1 60); do
            if curl -fsS -o /dev/null -w "%{http_code}" http://localhost:8080 2>/dev/null | grep -qE "^(200|301|302)$"; then
                break
            fi
            sleep 2
        done

        echo ""
        echo "==> [2/2] Rodando seed da loja..."
        $DC run --rm wpcli

        echo ""
        echo "════════════════════════════════════════════════════════════════"
        echo "  PRONTO"
        echo "════════════════════════════════════════════════════════════════"
        echo ""
        echo "  Loja:    http://localhost:8080/"
        echo "  Admin:   http://localhost:8080/wp-admin/"
        echo "  Login:   admin / admin123"
        echo ""
        echo "  Para gerar pacote de entrega (woocommerce_db.sql + woocommerce.zip):"
        echo "    ./exportar-entrega.sh"
        echo ""
        ;;

    *)
        echo "Comando desconhecido: $cmd"
        echo "Uso: $0 [up|seed|down|reset|all]"
        exit 1
        ;;
esac
