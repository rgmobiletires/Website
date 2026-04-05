# RG Mobile Tyre Services

Institutional website for **RG Mobile Tyre Services** — a mobile tyre and vehicle repair service covering Dublin and surrounding counties.

Built by [Neex Creative](https://neexcreative.com).

---

## Stack

- Semantic HTML5
- CSS3 (no frameworks)
- Vanilla JavaScript
- Deployed via GitHub + Vercel

---

## Project Structure

```
rg-mobile-tyre-services/
├── css/
│   ├── global.css        # Global styles, nav, footer, variables
│   ├── home.css          # Home page styles
│   ├── contact.css       # Contact page styles
│   └── about.css         # About page styles
├── js/
│   ├── global.js         # Nav, footer, scroll reveal, mobile menu
│   └── site-config.js    # Site configuration (links, text, socials)
├── images/
│   ├── logos_partners/   # Partner brand logos
│   └── services_placeholders/  # Service images
├── pages/
│   ├── about.html
│   ├── contact.html
│   └── commercial.html
├── Planning/             # Internal planning documents
├── index.html            # Main page
├── DEPLOY.md             # Deploy guide
└── README.md
```

---

## Pages

| Page | Description |
|------|-------------|
| `index.html` | Home — hero, services, brands, CTA |
| `pages/about.html` | About the business |
| `pages/contact.html` | Contact, map, reviews |
| `pages/commercial.html` | Commercial services |

---

## Quick Configuration

All site content (text, links, phone number, social media) is managed in a single file:

```
js/site-config.js
```

To update the phone number, social media links, description, or navigation links — edit only that file.

---

## Deploy

### Day-to-day updates
```bash
git add .
git commit -m "description of what changed"
git push
```

Vercel automatically detects the push and deploys within seconds.

### Links
- **GitHub:** https://github.com/Neexcreative/rg-mobile-tyre-services
- **Vercel:** https://rg-mobile-tyre-services.vercel.app

---

## Custom Domain (when purchased)

1. Vercel → **Settings → Domains → Add Domain**
2. Copy the DNS records provided by Vercel
3. Paste them into your domain registrar's panel
4. Wait 24–48h for DNS propagation

---

## Design System

| Element | Value |
|---------|-------|
| Primary colour | `#f0b400` (gold) |
| Dark background | `#0a0a0a` |
| Light background | `#f4f2eb` |
| Display font | Inter |
| Body font | Montserrat |
| Base border radius | `2px` |

---

## Client Information

**RG Mobile Tyre Services**
- Phone: 085 706 1487
- Service area: Dublin and surrounding counties
- Instagram: [@rgmotortyres](https://www.instagram.com/rgmotortyres/)

---

## Built by

**Neex Creative** — Graphic, Motion & Web Design Studio, Dublin  
info@neexcreative.com