# RG Mobile Tyre Services

Website institucional para o **RG Mobile Tyre Services** — serviço móvel de pneus e reparações de veículos em Dublin e arredores.

Desenvolvido por [Neex Creative](https://neexcreative.com).

---

## Stack

- HTML5 semântico
- CSS3 (sem frameworks)
- JavaScript vanilla
- Deploy via Vercel + GitHub

---

## Estrutura do Projecto

```
rg-mobile-tyre-services/
├── css/
│   ├── global.css        # Estilos globais, nav, footer, variáveis
│   ├── home.css          # Estilos da página inicial
│   ├── contact.css       # Estilos da página de contacto
│   └── about.css         # Estilos da página sobre
├── js/
│   ├── global.js         # Nav, footer, scroll reveal, mobile menu
│   └── site-config.js    # Configuração do site (links, textos, socials)
├── images/
│   ├── logos_partners/   # Logos das marcas parceiras
│   └── services_placeholders/  # Imagens dos serviços
├── pages/
│   ├── about.html
│   ├── contact.html
│   └── commercial.html
├── Planning/             # Documentos de planeamento interno
├── index.html            # Página principal
├── DEPLOY.md             # Guia de deploy
└── README.md
```

---

## Páginas

| Página | Descrição |
|--------|-----------|
| `index.html` | Home — hero, serviços, marcas, CTA |
| `pages/about.html` | Sobre o negócio |
| `pages/contact.html` | Contacto, mapa, reviews |
| `pages/commercial.html` | Serviços comerciais |

---

## Configuração Rápida

Todo o conteúdo do site (textos, links, telefone, redes sociais) é gerido num único ficheiro:

```
js/site-config.js
```

Para alterar o telefone, links de social media, descrição, ou links de navegação — edita apenas esse ficheiro.

---

## Deploy

### Updates do dia a dia
```bash
git add .
git commit -m "descricao do que mudaste"
git push
```

O Vercel detecta automaticamente e faz o deploy em segundos.

### Links
- **GitHub:** https://github.com/Neexcreative/rg-mobile-tyre-services
- **Vercel:** https://rg-mobile-tyre-services.vercel.app

---

## Domínio (quando comprado)

1. Vercel → **Settings → Domains → Add Domain**
2. Copiar os DNS records fornecidos pelo Vercel
3. Colar no painel do registar do domínio
4. Aguardar 24–48h para propagação

---

## Design System

| Elemento | Valor |
|----------|-------|
| Cor primária | `#f0b400` (gold) |
| Cor de fundo escura | `#0a0a0a` |
| Cor de fundo clara | `#f4f2eb` |
| Font display | Inter |
| Font body | Montserrat |
| Border radius base | `2px` |

---

## Contacto do Cliente

**RG Mobile Tyre Services**
- Tel: 085 706 1487
- Área de serviço: Dublin e arredores
- Instagram: [@rgmotortyres](https://www.instagram.com/rgmotortyres/)

---

## Desenvolvido por

**Neex Creative** — Graphic, Motion & Web Design Studio, Dublin  
info@neexcreative.com