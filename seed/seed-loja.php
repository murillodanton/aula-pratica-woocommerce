<?php
/**
 * Seed da loja WooCommerce - rodado via `wp eval-file /seed/seed-loja.php`
 *
 * Implementa os passos 13-16 do roteiro do PDF:
 *  - Configurações da loja (moeda, endereço, sem impostos)
 *  - 1 categoria de produto com imagem
 *  - 3 produtos com imagens, preços, estoque, dimensões
 *  - PayPal + Pagamento na entrega habilitados
 *  - Frete fixo R$ 5,00 (zona Brasil)
 *  - Logo da loja
 *  - Página "Loja" como home page
 *
 * As imagens são esperadas em /imagens/ (mount do docker-compose).
 */

defined( 'ABSPATH' ) || exit;

if ( ! defined( 'AULA_IMAGENS_DIR' ) ) {
    define( 'AULA_IMAGENS_DIR', '/imagens' );
}

echo "  -> imagens em: " . AULA_IMAGENS_DIR . "\n";

/* -----------------------------------------------------------------
 * 13-14 - Configurações básicas da loja
 * ---------------------------------------------------------------*/
echo "[13-14] Configurando dados básicos da loja...\n";

update_option( 'woocommerce_store_address',      'Rua das Flores, 123' );
update_option( 'woocommerce_store_city',         'Paraisópolis' );
update_option( 'woocommerce_default_country',    'BR:MG' );
update_option( 'woocommerce_store_postcode',     '37960-000' );
update_option( 'woocommerce_currency',           'BRL' );
update_option( 'woocommerce_currency_pos',       'left_space' );
update_option( 'woocommerce_price_thousand_sep', '.' );
update_option( 'woocommerce_price_decimal_sep',  ',' );
update_option( 'woocommerce_price_num_decimals', '2' );
update_option( 'woocommerce_weight_unit',        'kg' );
update_option( 'woocommerce_dimension_unit',     'cm' );

// Pular wizard de onboarding do WooCommerce
update_option( 'woocommerce_onboarding_profile', array(
    'completed' => true,
    'skipped'   => true,
) );
update_option( 'woocommerce_task_list_hidden',   'yes' );
update_option( 'woocommerce_task_list_complete', 'yes' );

echo "  ok\n";

/* -----------------------------------------------------------------
 * Helper - importa imagem para a Media Library
 * ---------------------------------------------------------------*/
function aula_import_image( $filename, $titulo ) {
    $src = trailingslashit( AULA_IMAGENS_DIR ) . $filename;
    if ( ! file_exists( $src ) ) {
        echo "  [warn] imagem não encontrada: $src\n";
        return 0;
    }

    require_once ABSPATH . 'wp-admin/includes/file.php';
    require_once ABSPATH . 'wp-admin/includes/media.php';
    require_once ABSPATH . 'wp-admin/includes/image.php';

    $upload = wp_upload_dir();
    if ( ! empty( $upload['error'] ) ) {
        echo "  [warn] upload dir error: " . $upload['error'] . "\n";
        return 0;
    }

    $dest_filename = wp_unique_filename( $upload['path'], $filename );
    $dest = $upload['path'] . '/' . $dest_filename;

    if ( ! @copy( $src, $dest ) ) {
        echo "  [warn] falhou ao copiar $src -> $dest\n";
        return 0;
    }

    $filetype = wp_check_filetype( $dest_filename, null );
    $attach_id = wp_insert_attachment( array(
        'guid'           => $upload['url'] . '/' . $dest_filename,
        'post_mime_type' => $filetype['type'],
        'post_title'     => $titulo,
        'post_content'   => '',
        'post_status'    => 'inherit',
    ), $dest );

    if ( is_wp_error( $attach_id ) || ! $attach_id ) {
        echo "  [warn] wp_insert_attachment falhou\n";
        return 0;
    }

    $meta = wp_generate_attachment_metadata( $attach_id, $dest );
    wp_update_attachment_metadata( $attach_id, $meta );
    return $attach_id;
}

/* -----------------------------------------------------------------
 * 15.b - Categoria 'Pijamas'
 * ---------------------------------------------------------------*/
echo "[15.b] Criando categoria 'Pijamas'...\n";

$cat_image_id = aula_import_image( 'categoria-pijamas.jpg', 'Categoria Pijamas' );

$existing = term_exists( 'pijamas', 'product_cat' );
if ( $existing ) {
    $cat_id = is_array( $existing ) ? (int) $existing['term_id'] : (int) $existing;
    echo "  categoria já existe (term_id=$cat_id)\n";
} else {
    $created = wp_insert_term( 'Pijamas', 'product_cat', array(
        'slug'        => 'pijamas',
        'description' => 'Pijamas confortáveis para toda a família',
    ) );
    if ( is_wp_error( $created ) ) {
        echo "  [erro] " . $created->get_error_message() . "\n";
        return;
    }
    $cat_id = (int) $created['term_id'];
    echo "  + criada (term_id=$cat_id)\n";
}

if ( $cat_image_id ) {
    update_term_meta( $cat_id, 'thumbnail_id', $cat_image_id );
}

/* -----------------------------------------------------------------
 * 15.a - 3 produtos
 * ---------------------------------------------------------------*/
echo "[15.a] Criando 3 produtos...\n";

function aula_criar_produto( $args, $cat_id ) {
    // Idempotência: se já existir produto com esse título, pula
    $existing = get_posts( array(
        'post_type'      => 'product',
        'title'          => $args['nome'],
        'posts_per_page' => 1,
        'post_status'    => 'any',
        'fields'         => 'ids',
    ) );
    if ( ! empty( $existing ) ) {
        echo "  [skip] '{$args['nome']}' já existe (ID {$existing[0]})\n";
        return $existing[0];
    }

    $product_id = wp_insert_post( array(
        'post_type'    => 'product',
        'post_status'  => 'publish',
        'post_title'   => $args['nome'],
        'post_content' => $args['descricao'],
        'post_excerpt' => $args['descricao'],
    ) );

    if ( is_wp_error( $product_id ) || ! $product_id ) {
        echo "  [erro] não criou '{$args['nome']}'\n";
        return 0;
    }

    // Tipo simple
    wp_set_object_terms( $product_id, 'simple', 'product_type' );
    // Categoria
    wp_set_object_terms( $product_id, array( $cat_id ), 'product_cat' );

    // Preços
    update_post_meta( $product_id, '_regular_price', $args['preco'] );
    if ( ! empty( $args['preco_promo'] ) ) {
        update_post_meta( $product_id, '_sale_price', $args['preco_promo'] );
        update_post_meta( $product_id, '_price',      $args['preco_promo'] );
    } else {
        update_post_meta( $product_id, '_price', $args['preco'] );
    }

    // Estoque
    update_post_meta( $product_id, '_manage_stock', 'yes' );
    update_post_meta( $product_id, '_stock',        $args['estoque'] );
    update_post_meta( $product_id, '_stock_status', 'instock' );
    update_post_meta( $product_id, '_backorders',   'no' );

    // Dimensões (importante para frete - PDF item v)
    update_post_meta( $product_id, '_weight', '0.5' );
    update_post_meta( $product_id, '_length', '30' );
    update_post_meta( $product_id, '_width',  '25' );
    update_post_meta( $product_id, '_height', '5' );

    // Outras meta padrão
    update_post_meta( $product_id, '_virtual',           'no' );
    update_post_meta( $product_id, '_downloadable',      'no' );
    update_post_meta( $product_id, '_sold_individually', 'no' );
    update_post_meta( $product_id, '_visibility',        'visible' );
    update_post_meta( $product_id, '_featured',          'no' );
    update_post_meta( $product_id, '_tax_status',        'taxable' );

    // Imagem destacada
    if ( ! empty( $args['imagem'] ) ) {
        $img_id = aula_import_image( $args['imagem'], $args['nome'] );
        if ( $img_id ) {
            set_post_thumbnail( $product_id, $img_id );
        }
    }

    echo "  + '{$args['nome']}' (ID $product_id, R$ {$args['preco']})\n";
    return $product_id;
}

aula_criar_produto( array(
    'nome'        => 'Pijama Laranja',
    'descricao'   => 'Pijama laranja confortável, ideal para noites tranquilas. Tecido 100% algodão.',
    'preco'       => '20.00',
    'preco_promo' => '',
    'estoque'     => 15,
    'imagem'      => 'pijama-laranja.jpg',
), $cat_id );

aula_criar_produto( array(
    'nome'        => 'Pijama Azul',
    'descricao'   => 'Pijama azul com estampa de estrela. Macio e durável.',
    'preco'       => '40.00',
    'preco_promo' => '35.00',
    'estoque'     => 10,
    'imagem'      => 'pijama-azul.jpg',
), $cat_id );

aula_criar_produto( array(
    'nome'        => 'Pijama Rosa',
    'descricao'   => 'Pijama rosa com estampa floral. Conforto para o dia a dia.',
    'preco'       => '30.00',
    'preco_promo' => '25.00',
    'estoque'     => 12,
    'imagem'      => 'pijama-rosa.jpg',
), $cat_id );

/* -----------------------------------------------------------------
 * 15.c-d - Métodos de pagamento (PayPal + Pagamento na entrega)
 * ---------------------------------------------------------------*/
echo "[15.c-d] Habilitando métodos de pagamento...\n";

// Pagamento na entrega (cod) - sempre disponível, mais simples
$cod = (array) get_option( 'woocommerce_cod_settings', array() );
$cod['enabled']            = 'yes';
$cod['title']              = 'Pagamento na entrega';
$cod['description']        = 'Pague em dinheiro ao receber o produto.';
$cod['instructions']       = 'Pague em dinheiro ao receber o produto.';
$cod['enable_for_methods'] = array();
$cod['enable_for_virtual'] = 'no';
update_option( 'woocommerce_cod_settings', $cod );

// PayPal Standard (gateway interno do WooCommerce)
$paypal = (array) get_option( 'woocommerce_paypal_settings', array() );
$paypal['enabled']        = 'yes';
$paypal['title']          = 'PayPal';
$paypal['description']    = 'Pague com PayPal; aceita cartões de crédito.';
$paypal['email']          = '[email protected]';
$paypal['testmode']       = 'yes';   // sandbox conforme PDF item 15.c.ii
$paypal['debug']          = 'no';
$paypal['receiver_email'] = '[email protected]';
$paypal['identity_token'] = '';
$paypal['invoice_prefix'] = 'WC-';
$paypal['send_shipping']  = 'yes';
$paypal['paymentaction']  = 'sale';
update_option( 'woocommerce_paypal_settings', $paypal );

echo "  ok (cod + paypal-sandbox habilitados)\n";

/* -----------------------------------------------------------------
 * 15.e - Sem impostos sobre vendas
 * ---------------------------------------------------------------*/
echo "[15.e] Desabilitando impostos sobre vendas...\n";
update_option( 'woocommerce_calc_taxes', 'no' );
echo "  ok\n";

/* -----------------------------------------------------------------
 * 15.f - Frete fixo R$ 5,00 (zona Brasil)
 * ---------------------------------------------------------------*/
echo "[15.f] Configurando frete fixo R\$ 5,00...\n";

if ( ! class_exists( 'WC_Shipping_Zone' ) ) {
    require_once WC()->plugin_path() . '/includes/class-wc-shipping-zone.php';
}
if ( ! class_exists( 'WC_Shipping_Zones' ) ) {
    require_once WC()->plugin_path() . '/includes/class-wc-shipping-zones.php';
}

// Verifica se a zona "Brasil" já existe
$zone = null;
foreach ( WC_Shipping_Zones::get_zones() as $z ) {
    if ( $z['zone_name'] === 'Brasil' ) {
        $zone = new WC_Shipping_Zone( $z['zone_id'] );
        echo "  zona 'Brasil' já existe (zone_id={$z['zone_id']})\n";
        break;
    }
}

if ( ! $zone ) {
    $zone = new WC_Shipping_Zone();
    $zone->set_zone_name( 'Brasil' );
    $zone->set_zone_order( 0 );
    $zone->add_location( 'BR', 'country' );
    $zone->save();
    echo "  + zona 'Brasil' criada (zone_id=" . $zone->get_id() . ")\n";
}

// Adiciona método flat_rate se não houver
$flat_method_id = null;
foreach ( $zone->get_shipping_methods() as $m ) {
    if ( $m->id === 'flat_rate' ) {
        $flat_method_id = $m->instance_id;
        break;
    }
}

if ( ! $flat_method_id ) {
    $flat_method_id = $zone->add_shipping_method( 'flat_rate' );
    echo "  + método flat_rate adicionado (instance_id=$flat_method_id)\n";
}

// Configura o custo do flat_rate
$flat_settings = get_option( 'woocommerce_flat_rate_' . $flat_method_id . '_settings', array() );
$flat_settings = array_merge( (array) $flat_settings, array(
    'title'      => 'Frete fixo',
    'tax_status' => 'none',
    'cost'       => '5',
) );
update_option( 'woocommerce_flat_rate_' . $flat_method_id . '_settings', $flat_settings );

echo "  ok - frete fixo R\$ 5,00 ativo\n";

/* -----------------------------------------------------------------
 * 15.g - Logo
 * ---------------------------------------------------------------*/
echo "[15.g] Adicionando logo da loja...\n";
$logo_id = aula_import_image( 'logo.png', 'Logo Loja Pijamas' );
if ( $logo_id ) {
    set_theme_mod( 'custom_logo', $logo_id );
    echo "  ok (attachment_id=$logo_id)\n";
} else {
    echo "  [skip] logo.png não encontrada\n";
}

/* -----------------------------------------------------------------
 * 16 - Personalizar página inicial
 * ---------------------------------------------------------------*/
echo "[16] Definindo página 'Loja' como home page...\n";

$shop_page_id = (int) get_option( 'woocommerce_shop_page_id' );
if ( $shop_page_id ) {
    update_option( 'show_on_front', 'page' );
    update_option( 'page_on_front', $shop_page_id );
    echo "  ok (page_on_front=$shop_page_id)\n";
} else {
    echo "  [warn] página Loja do WooCommerce não encontrada\n";
}

echo "\n[seed] concluído com sucesso\n";
