#!/bin/sh
# ============================================================================
# seed.sh - rodado dentro do container wpcli
#
# 1. Aguarda o WordPress estar acessível (banco já configurado pelo entrypoint
#    da imagem oficial wordpress)
# 2. Roda `wp core install` (substitui o wizard /wp-admin/install.php)
# 3. Instala e ativa o plugin WooCommerce
# 4. Ativa o tema Storefront (compatível com WooCommerce)
# 5. Roda /seed/seed-loja.php que cria categoria, produtos, frete, pagamentos
# 6. Atualiza permalinks
# ============================================================================

set -e

WP="wp --path=/var/www/html"

echo ""
echo "==> [1/6] Aguardando WordPress + banco ficarem prontos"
# A imagem wordpress já gera wp-config.php no entrypoint quando os ENV WORDPRESS_DB_* estão setados.
# Esperamos até o arquivo aparecer.
for i in $(seq 1 60); do
    if [ -f /var/www/html/wp-config.php ]; then
        break
    fi
    sleep 1
done
if [ ! -f /var/www/html/wp-config.php ]; then
    echo "    [erro] wp-config.php não foi gerado pelo container wordpress"
    exit 1
fi
echo "    ok - wp-config.php presente"

# Aguarda banco aceitar conexões via wp-cli
for i in $(seq 1 30); do
    if $WP db check >/dev/null 2>&1; then
        break
    fi
    sleep 1
done
echo "    ok - banco respondendo"

echo ""
echo "==> [2/6] Instalando WordPress (substitui o wizard do navegador)"
if $WP core is-installed 2>/dev/null; then
    echo "    WordPress já estava instalado - pulando"
else
    $WP core install \
        --url="$SITE_URL" \
        --title="$SITE_TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASS" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email
    echo "    ok - WordPress instalado"
fi

# Idioma pt_BR + timezone
$WP language core install pt_BR --activate 2>/dev/null || true
$WP option update WPLANG "pt_BR" 2>/dev/null || true
$WP option update timezone_string "America/Sao_Paulo"
$WP option update blogdescription "Loja online de pijamas - aula prática"

echo ""
echo "==> [3/6] Instalando e ativando WooCommerce"
if $WP plugin is-active woocommerce 2>/dev/null; then
    echo "    WooCommerce já estava ativo - pulando"
else
    $WP plugin install woocommerce --activate
    echo "    ok - WooCommerce ativado"
fi
$WP language plugin install woocommerce pt_BR 2>/dev/null || true

echo ""
echo "==> [4/6] Ativando tema Storefront"
if $WP theme is-active storefront 2>/dev/null; then
    echo "    Storefront já estava ativo - pulando"
else
    $WP theme install storefront --activate 2>/dev/null || \
        echo "    [warn] Storefront não disponível; mantendo tema atual"
fi
$WP language theme install storefront pt_BR 2>/dev/null || true

echo ""
echo "==> [5/6] Rodando seed da loja (categoria, produtos, frete, pagamentos, logo)"
$WP eval-file /seed/seed-loja.php

echo ""
echo "==> [6/6] Atualizando permalinks"
$WP rewrite structure '/%postname%/' --hard

echo ""
echo "════════════════════════════════════════════════════════════════"
echo "  LOJA INSTALADA COM SUCESSO"
echo "════════════════════════════════════════════════════════════════"
echo ""
echo "  Loja:    $SITE_URL/"
echo "  Admin:   $SITE_URL/wp-admin/"
echo "  Login:   $ADMIN_USER / $ADMIN_PASS"
echo ""
echo "  Para gerar pacote de entrega: ./exportar-entrega.sh"
echo "  (ou .\\exportar-entrega.ps1 no Windows)"
echo ""
