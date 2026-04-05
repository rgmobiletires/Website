Work only inside this project folder:

projects/rg-mobile-tyre-services

Goal:
Fully adapt the Services and About pages so they match the new RG Mobile Tyre Services website direction and no longer feel like WTS.

Important rules:
- Do not edit anything inside base-template
- Do not edit backup folders
- Only edit files inside projects/rg-mobile-tyre-services
- Keep navbar and footer injected by JS
- Keep the visual direction aligned with the current RG homepage:
  - light page backgrounds
  - black / white / yellow palette
  - cleaner, practical, automotive service feel
- Preserve responsive behavior
- Keep code clean and production-ready
- Do not leave WTS text, labels, meta descriptions, titles, or references in these pages
- Fix broken relative paths if found

Files to update:
- pages/services.html
- css/services.css
- pages/about.html
- css/about.css

==================================================
1) SERVICES PAGE
==================================================

Update pages/services.html so it becomes a clean RG services page with this structure:

1. Page hero
- breadcrumb: Home > Services
- eyebrow: "Our Services"
- h1: "Mobile Vehicle Support Across Dublin"
- paragraph:
  "Practical, reliable assistance at your location — from puncture and brake repairs to servicing, clutch and suspension work."

2. Sticky service navigation
Use anchors for:
- Tyre & Brake Repairs
- General Servicing
- Clutch Repairs
- Suspension Repairs

3. Service sections
Create stacked service blocks, one below another, each with:
- image area placeholder
- eyebrow
- h2
- short paragraph
- bullet list
- 2 CTA buttons

Service block 1
id="tyre-brake"
eyebrow: "Fast Response"
title: "Tyre & Brake Repairs"
text:
"Fast, practical support for tyre issues, punctures and brake-related repairs delivered directly to your home, workplace or roadside location."
bullets:
- Puncture repair
- Tyre support and replacement help
- Brake repair assistance
- Mobile on-site support

Service block 2
id="general-servicing"
eyebrow: "Routine Care"
title: "General Vehicle Servicing"
text:
"Dependable mobile vehicle servicing designed to help keep your car running properly without the inconvenience of a traditional garage visit."
bullets:
- General vehicle servicing
- Routine maintenance support
- Practical mobile vehicle care
- Support across Dublin and nearby counties

Service block 3
id="clutch"
eyebrow: "Mechanical Support"
title: "Clutch Repairs"
text:
"Practical mobile support for clutch-related issues, helping you get clear guidance and dependable assistance where possible at your location."
bullets:
- Clutch issue assessment
- Repair support
- Reliable on-site assistance
- Fast contact and response

Service block 4
id="suspension"
eyebrow: "Dependable Repairs"
title: "Suspension Repairs"
text:
"Mobile support for suspension-related issues with practical repair assistance and dependable service across Dublin and surrounding counties."
bullets:
- Suspension checks
- Repair support
- Vehicle handling issue assistance
- Professional mobile service

For every service block CTA:
- primary button: tel:0857061487 with label "Call Now"
- secondary button: contact.html with label appropriate to the block

4. Brands section
Title only:
- "Brands We Work With"
No explanatory paragraph.
Use the same seamless infinite logo marquee concept already used on the homepage.
Use real logos from:
../images/logos_partners/

Use these image files exactly:
- bridgestone.png
- continental.png
- dunlop.png
- goodyear.png
- Hankook.png
- michelin.png
- pirelli.png
- toyotires.png
- yokohama.png

Requirements for logo marquee:
- duplicate the full sequence so the loop is seamless
- logos only, no surrounding boxes
- grayscale
- low opacity
- no colored hover
- hover may only slightly increase opacity
- continuous horizontal movement
- pause on hover is allowed

5. Final CTA
Use:
eyebrow: "Need Fast Assistance?"
title: "Get Professional Mobile Support Today"
text:
"Call RG Mobile Tyre Services for practical, reliable support across Dublin and surrounding counties."
buttons:
- Call 085 706 1487
- Contact Us

6. Meta content
Update title and meta description for RG services page.

7. Path corrections
Because services.html is inside /pages:
- Home link should use ../index.html
- contact page should use contact.html
- assets should use ../images, ../css, ../js
Fix any wrong ../contact.html or ../pages/contact.html links.

Now update css/services.css to fully support this structure.

Requirements for css/services.css:
- Replace old WTS/commercial/vehicle page styles with RG-specific styles
- Use light backgrounds for most of the page
- Keep black / white / yellow palette
- Keep sticky service nav
- Style stacked service blocks with:
  - image column slightly smaller than text column
  - clean white cards
  - subtle border and shadow
  - yellow accents
  - buttons that are natural width on desktop
- Style the brands marquee consistently with homepage brands section
- Style final CTA on dark background
- Make the page feel consistent with the new RG homepage
- Remove obsolete WTS-only sections and rules if no longer used

==================================================
2) ABOUT PAGE
==================================================

Update pages/about.html so it becomes a proper RG About page with this structure:

1. Page hero
- breadcrumb: Home > About
- eyebrow: "About RG"
- h1: "Mobile Vehicle Support You Can Rely On"
- paragraph:
  "RG Mobile Tyre Services provides fast, practical and dependable on-site vehicle support across Dublin and surrounding counties."

2. Intro / company overview section
Title:
- "Reliable Help At Your Location"
Text should explain:
- RG provides mobile vehicle support
- service is practical and convenient
- customers can get help at home, work or roadside
- service area is Dublin and surrounding counties

3. Simple highlights / trust section
Create 4 highlight items:
- Mobile Service
  text: "We come to your location for practical and efficient support."
- Fast Response
  text: "Quick contact and dependable response across Dublin and nearby areas."
- Trusted Brands
  text: "We work with recognised tyre brands such as Michelin, Continental, Pirelli and Yokohama."
- Practical Support
  text: "Straightforward service focused on helping drivers get back on the road."

4. Coverage area section
Title:
- "Serving Dublin & Surrounding Counties"
Short supporting paragraph about operating across Dublin and nearby areas.

5. Brands section
Same concept as services page:
- title only: "Brands We Work With"
- same infinite grayscale logo marquee
- same logo files from images/logos_partners

6. Final CTA
eyebrow: "Need Fast Assistance?"
title: "Call RG Mobile Tyre Services Today"
text:
"Get dependable mobile support for punctures, brakes, servicing, clutch and suspension work."
buttons:
- Call 085 706 1487
- Contact Us

7. Meta content
Update title and meta description for RG about page.

8. Paths
Because about.html is inside /pages:
- Home link should use ../index.html
- contact page should use contact.html
- services page should use services.html
- assets should use ../images, ../css, ../js

Now update css/about.css to fully support the new structure.

Requirements for css/about.css:
- Use light backgrounds consistent with RG homepage and services page
- Black / white / yellow palette
- Clean, modern, professional layout
- Strong but simple page hero
- Nicely spaced intro section
- 4 trust/highlight cards or grid blocks
- Coverage area section
- Reuse or mirror the logo marquee styling approach
- Strong final CTA section
- Responsive on tablet and mobile
- Remove old WTS styling assumptions and old irrelevant sections

==================================================
3) CONSISTENCY CHECKS
==================================================

After editing:
- Ensure there is no visible "WTS" text left in services.html or about.html
- Ensure no outdated red accent remains if tied to these page-specific CSS files
- Ensure all internal links are valid
- Ensure JS placeholders remain:
  - nav-placeholder
  - footer-placeholder
- Ensure scripts load correctly:
  - ../js/site-config.js
  - ../js/global.js
- Ensure CSS paths are correct
- Ensure the markup stays clean and easy to maintain

At the end, summarize:
- which files were changed
- any paths fixed
- any references that still need manual image/logo replacement later