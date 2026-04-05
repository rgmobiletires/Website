/* ============================================================
   RG Mobile Tyre Services — Global JavaScript
   ============================================================ */

(function () {
  'use strict';

  const isInPages = window.location.pathname.replace(/\\/g, '/').includes('/pages/');
  const base = isInPages ? '../' : '';

  const fallbackConfig = {
    brand: {
      name: 'RG Mobile Tyre Services',
      logoAlt: 'RG Mobile Tyre Services',
      logos: {
        navLight: 'logo-white.png',
        navDark: 'logo-dark.png',
        footer: 'logo-white.png'
      }
    },
    nav: {
      ctaLabel: 'Call Now',
      links: {
        home: 'Home',
        about: 'About',
        contact: 'Contact'
      }
    },
    footer: {
      description: 'Mobile tyre and vehicle repair services across Dublin and surrounding counties.',
      hours: 'Serving Dublin & surrounding counties',
      socials: {
        instagram: '#',
        facebook: '#',
        linkedin: '#'
      },
      columns: {
        vehicleServices: [],
        commercial: [],
        company: []
      },
      contact: {
        location: 'Dublin and surrounding counties',
        phoneDisplay: '085 706 1487',
        phoneHref: 'tel:0857061487'
      },
      bottom: {
        copyright: '© 2026 RG Mobile Tyre Services. All rights reserved.',
        credit: 'Website created by Neex Creative.'
      }
    }
  };

  const config = window.SITE_CONFIG || fallbackConfig;

  function resolveHref(href = '') {
    if (!href) return '#';
    if (/^(https?:|mailto:|tel:|#)/i.test(href)) return href;
    return base + href.replace(/^\/+/, '');
  }

  function renderFooterLinks(items = []) {
    return items.map(item => `<a href="${resolveHref(item.href)}">${item.label}</a>`).join('');
  }

  function getImageBase() {
    return isInPages ? '../images/' : 'images/';
  }

  function escapeHtml(str) {
    return String(str)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  function normalizePath(path) {
    return path.replace(/\\/g, '/').replace(/^\.\.\//, '').replace(/^\.\//, '').replace(/^\/+/, '');
  }

  function isCurrentPage(targetHref) {
    const currentPath = normalizePath(window.location.pathname.split('/').slice(-2).join('/'));
    const cleanHref = normalizePath((targetHref || '').split('#')[0]);
    if (!cleanHref) return false;
    if (cleanHref === 'index.html') {
      return currentPath === 'index.html' || currentPath.endsWith('/index.html') || window.location.pathname.endsWith('/');
    }
    return currentPath.endsWith(cleanHref);
  }

  function buildNav() {
    const navCfg = config.nav || {};
    const brandCfg = config.brand || {};
    const contactPhone = config.footer?.contact?.phoneHref || 'tel:0857061487';

    return `
<nav class="main-nav" id="mainNav">
  <div class="nav-container">
    <a href="${resolveHref('index.html')}" class="nav__logo" aria-label="${escapeHtml(brandCfg.name || 'Home')}">
      <img id="navLogoImg" alt="${escapeHtml(brandCfg.logoAlt || brandCfg.name || 'Logo')}" class="nav__logo-img"/>
    </a>

    <div class="nav-links">
      <a href="${resolveHref('index.html')}" class="nav-link">${escapeHtml(navCfg.links?.home || 'Home')}</a>
      <a href="${resolveHref('pages/about.html')}" class="nav-link">${escapeHtml(navCfg.links?.about || 'About')}</a>
      <a href="${resolveHref('pages/contact.html')}" class="nav-link">${escapeHtml(navCfg.links?.contact || 'Contact')}</a>
    </div>

    <a href="${contactPhone}" class="nav-cta">${escapeHtml(navCfg.ctaLabel || 'Call Now')}</a>

    <button class="hamburger" id="hamburger" aria-label="Toggle menu" aria-expanded="false">
      <span></span><span></span><span></span>
    </button>
  </div>

  <div class="mobile-menu" id="mobileMenu" role="dialog" aria-modal="true" aria-label="Navigation menu">
    <a href="${resolveHref('index.html')}">${escapeHtml(navCfg.links?.home || 'Home')}</a>
    <a href="${resolveHref('pages/about.html')}">${escapeHtml(navCfg.links?.about || 'About')}</a>
    <a href="${resolveHref('pages/contact.html')}">${escapeHtml(navCfg.links?.contact || 'Contact')}</a>
    <a href="${contactPhone}" class="mobile-cta-btn">${escapeHtml(navCfg.ctaLabel || 'Call Now')}</a>
  </div>
</nav>`;
  }

  function buildFooter() {
    const brandCfg = config.brand || {};
    const footerCfg = config.footer || {};
    const columns = footerCfg.columns || {};
    const contact = footerCfg.contact || {};
    const socials = footerCfg.socials || {};
    const bottom = footerCfg.bottom || {};

    return `
<footer class="main-footer">
  <div class="footer-grid">
    <div class="footer-brand">
      <a href="${resolveHref('index.html')}" class="footer__logo" aria-label="${escapeHtml(brandCfg.name || 'Home')}">
        <img id="footerLogoImg" alt="${escapeHtml(brandCfg.logoAlt || brandCfg.name || 'Logo')}" class="footer__logo-img"/>
      </a>

      <p class="footer-brand-desc">${escapeHtml(footerCfg.description || '')}</p>

      <div class="footer__contact-info" style="margin-top:1rem;display:flex;flex-direction:column;gap:0.5rem;">
        <span style="font-size:0.75rem;color:var(--text-muted);">${escapeHtml(footerCfg.hours || '')}</span>
      </div>
    </div>

    <div class="footer-col">
      <h5>Services</h5>
      ${renderFooterLinks(columns.vehicleServices || [])}
    </div>

    <div class="footer-col">
      <h5>More Services</h5>
      ${renderFooterLinks(columns.commercial || [])}
    </div>

    <div class="footer-col">
      <h5>Company</h5>
      ${renderFooterLinks(columns.company || [])}
    </div>

    <div class="footer-col">
      <h5>Get In Touch</h5>
      <p>${escapeHtml(contact.location || '')}</p>
      <a href="${escapeHtml(contact.phoneHref || '#')}" class="footer-tel">${escapeHtml(contact.phoneDisplay || '')}</a>

      <div class="footer__social" style="margin-top:1.5rem;">
        <a href="${escapeHtml(socials.instagram || '#')}" aria-label="Instagram" target="_blank" rel="noopener">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
          </svg>
        </a>
        <a href="${escapeHtml(socials.facebook || '#')}" aria-label="Facebook" target="_blank" rel="noopener">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
            <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
          </svg>
        </a>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    <p>${escapeHtml(bottom.copyright || '')}</p>
    <p>${escapeHtml(bottom.credit || '')}</p>
  </div>
</footer>`;
  }

  function injectLayout() {
    const navEl = document.getElementById('nav-placeholder');
    const footerEl = document.getElementById('footer-placeholder');
    if (navEl) navEl.outerHTML = buildNav();
    if (footerEl) footerEl.outerHTML = buildFooter();
  }

  function initStickyNav() {
    const nav = document.getElementById('mainNav');
    if (!nav) return;

    const onScroll = () => {
      nav.classList.toggle('scrolled', window.scrollY > 40);
    };

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();
  }

  function setActiveNavLink() {
    const links = document.querySelectorAll('.nav-link');
    links.forEach(link => {
      const href = link.getAttribute('href') || '';
      if (isCurrentPage(href)) link.classList.add('nav-active');
    });
  }

  function initMobileMenu() {
    const hamburger = document.getElementById('hamburger');
    const menu = document.getElementById('mobileMenu');
    if (!hamburger || !menu) return;

    function closeMenu() {
      hamburger.classList.remove('open');
      menu.classList.remove('open');
      hamburger.setAttribute('aria-expanded', 'false');
      document.body.style.overflow = '';
    }

    hamburger.addEventListener('click', () => {
      const open = hamburger.classList.toggle('open');
      menu.classList.toggle('open', open);
      hamburger.setAttribute('aria-expanded', open ? 'true' : 'false');
      document.body.style.overflow = open ? 'hidden' : '';
    });

    menu.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', closeMenu);
    });

    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && menu.classList.contains('open')) closeMenu();
    });
  }

  function initScrollReveal() {
    const els = document.querySelectorAll('.reveal, .reveal-left, .reveal-right, [data-reveal]');
    if (!els.length) return;

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('revealed');
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.1, rootMargin: '0px 0px -40px 0px' });

    els.forEach(el => observer.observe(el));
  }

  function resolveLogos() {
    const imgBase = getImageBase();
    const brandCfg = config.brand || {};
    const logos = brandCfg.logos || {};

    const navLogoImg = document.getElementById('navLogoImg');
    if (navLogoImg) navLogoImg.src = imgBase + (logos.navLight || 'logo-white.png');

    const footerLogoImg = document.getElementById('footerLogoImg');
    if (footerLogoImg) footerLogoImg.src = imgBase + (logos.footer || 'logo-white.png');
  }

  document.addEventListener('DOMContentLoaded', () => {
    injectLayout();
    resolveLogos();
    initStickyNav();
    setActiveNavLink();
    initMobileMenu();
    initScrollReveal();
  });
})();