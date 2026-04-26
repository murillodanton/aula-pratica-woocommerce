# Aula Prática - Unidade 3 / Seção 3.3

**Disciplina:** Desenvolvimento de e-commerce com CMS
**Prática:** Configuração de loja WooCommerce

---

## O que esse pacote faz

Automatiza **todos os 17 passos** do roteiro do PDF usando **Docker** no lugar do XAMPP.
A pasta `./woocommerce/` no host equivale ao `C:\xampp\htdocs\woocommerce\` que o PDF pede.

**Não precisa instalar:** XAMPP, PHP, MySQL, WordPress, ou qualquer coisa de PHP no host.
**Precisa instalar:** apenas **Docker Desktop** (Windows/Mac) ou Docker Engine (Linux).

No fim você gera os dois artefatos pedidos em **RESULTADOS** do PDF:

1. `entrega/woocommerce.zip` — pasta woocommerce zipada
2. `entrega/woocommerce_db.sql` — dump do banco de dados

---

## Pré-requisito único

**Docker Desktop** rodando: <https://www.docker.com/products/docker-desktop>

Confira:

```bash
docker compose version
```

---

## Como usar

### Linux / Mac / WSL / Git Bash

```bash
chmod +x instalar.sh exportar-entrega.sh
./instalar.sh           # sobe stack + roda seed (~3-5 min na 1ª vez)
./exportar-entrega.sh   # gera entrega/woocommerce_db.sql + woocommerce.zip
```

### Windows (PowerShell, sem WSL)

```powershell
.\instalar.ps1
.\exportar-entrega.ps1
```

### Verificar resultado

Abra o navegador em <http://localhost:8080/>

- **Loja pública:** <http://localhost:8080/>
- **Admin:** <http://localhost:8080/wp-admin/>
- **Login:** `admin` / **Senha:** `admin123`

---

## O que o `instalar` faz por baixo dos panos

| Passo do PDF | O que acontece |
|---|---|
| 1-3. Pasta + WordPress em htdocs | Imagem `wordpress:6.7-php8.2-apache` popula `./woocommerce/` automaticamente |
| 4. XAMPP Control Panel - Apache + MySQL | `docker compose up -d db wordpress` |
| 5-7. phpMyAdmin → criar banco woocommerce_db | Variáveis de ambiente do container `db` criam o banco no startup |
| 8-10. Wizard de instalação do WordPress | `wp core install` (sem navegador) |
| 11-12. Plugins → instalar WooCommerce | `wp plugin install woocommerce --activate` |
| 13-14. Detalhes da loja | `wp option update woocommerce_*` (BRL, BR:MG) |
| 15.a Inserir 3 produtos | `seed-loja.php` cria Pijama Laranja, Azul, Rosa com imagens |
| 15.b Categoria + slug + imagem | `seed-loja.php` cria categoria "Pijamas" |
| 15.c-d PayPal + outros | sandbox PayPal + Pagamento na entrega habilitados |
| 15.e Sem impostos | `woocommerce_calc_taxes = no` |
| 15.f Frete R$ 5,00 | Zona "Brasil" + flat_rate(cost=5) |
| 15.g Logo | `set_theme_mod('custom_logo', $id)` |
| 16. Personalizar página inicial | Tema Storefront ativo, página "Loja" como home |
| 17. Testar | <http://localhost:8080/> |

Detalhes em **CHECKLIST.md**.

---

## Comandos úteis

```bash
./instalar.sh up       # só sobe os containers (não roda seed)
./instalar.sh seed     # só roda o seed (containers já no ar)
./instalar.sh down     # derruba tudo (banco preservado em volume)
./instalar.sh reset    # apaga volume e pasta woocommerce/ - começa do zero

docker compose logs -f wordpress    # ver logs do Apache
docker compose logs -f db           # ver logs do MariaDB
docker compose exec db mariadb -u root -prootpass woocommerce_db   # entrar no DB
```

Versões PowerShell idem (`.\instalar.ps1 up`, etc.).

---

## Estrutura do pacote

```
aula-pratica-woocommerce/
├── README.md                    <- este arquivo
├── CHECKLIST.md                 <- mapeamento PDF → entrega (item-a-item)
├── PROMPT-CLAUDE-CODE.md        <- prompt pra Claude Code (extensões/debug)
├── docker-compose.yml           <- stack: db + wordpress + wpcli
├── instalar.sh / .ps1           <- wrapper one-shot
├── exportar-entrega.sh / .ps1   <- gera entrega/*.sql + .zip
├── seed/
│   ├── seed.sh                  <- shell wrapper rodado pelo container wpcli
│   └── seed-loja.php            <- código PHP que cria produtos/categoria/configs
├── imagens/                     <- placeholders dos 3 produtos + categoria + logo
│   ├── pijama-laranja.jpg
│   ├── pijama-azul.jpg
│   ├── pijama-rosa.jpg
│   ├── categoria-pijamas.jpg
│   └── logo.png
├── gerar_imagens.py             <- (opcional) regera as imagens
├── woocommerce/                 <- (gerado) pasta WP, equivale a htdocs/woocommerce/
└── entrega/                     <- (gerado) artefatos finais pra submissão
    ├── woocommerce_db.sql
    └── woocommerce.zip
```

---

## Troubleshooting

**`Cannot connect to the Docker daemon`**
→ Abra o Docker Desktop e espere ele iniciar antes de rodar o script.

**`Port 8080 is already allocated`**
→ Algum outro serviço está usando a porta 8080. Edite `docker-compose.yml` e mude
   `"8080:80"` para `"8081:80"` (ou outra porta livre). Também atualize `SITE_URL`
   no mesmo arquivo. Depois `./instalar.sh reset && ./instalar.sh`.

**Seed falha com "WC() not found"**
→ O WooCommerce não foi ativado. Rode `./instalar.sh seed` de novo, ou
   `docker compose run --rm wpcli wp plugin list --path=/var/www/html`.

**Quero começar do zero**
→ `./instalar.sh reset` apaga o volume do banco e a pasta woocommerce.
