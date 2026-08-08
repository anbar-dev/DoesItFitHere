# Clone Rebrand Checklist

Use this checklist when duplicating this project to create a different affiliate site from the same static-site engine, article workflow, and promotion workflow.

The current clone is branded:

```text
Fits In My Space
```

Current promise:

```text
Shopping guides for narrow, compact, under-sink, over-door, low-clearance, and awkward spaces.
```

## Preserve

- static source files in `src/`;
- generated output in `docs/`;
- roadmap-driven article creation;
- Amazon affiliate disclosure and product cards;
- Pinterest/Reddit promotion packs;
- simple GitHub Pages publishing.

## Replace For A New Clone

- site name, domain, analytics ID, and affiliate tag;
- homepage positioning;
- public category structure;
- article formula;
- roadmap and long-tail targets;
- promo boards, pin copy, video hooks, and Reddit angles;
- visual assets and brand assets.

Good affiliate positioning should answer:

```text
What specific buying mistake are we helping the visitor avoid?
```

For Fits In My Space, the answer is:

```text
Buying a product that does not physically fit the measured space.
```

## Before Editing

Read these files first:

```text
README.md
CONTENT_ROADMAP.md
ARTICLE_CREATION_GUIDE.md
PROMOTION_WORKFLOW.md
src/KIT_PAGE_TEMPLATE.txt
scripts/build-site.js
scripts/build-promo-assets.ps1
package.json
```

Also inspect at least two finished article pages under `src/kits/` and one finished promo folder under `promo/`.

Do not edit `docs/` by hand. Edit source files and rebuild.

## Current Site Brief

- Site name: Fits In My Space.
- Domain: doesitfithere.com.
- One-sentence promise: shopping guides for narrow, compact, under-sink, over-door, low-clearance, and awkward spaces.
- Target reader: shoppers with a real physical constraint who need a product that fits on the first try.
- Main problem categories: narrow kitchen, under-sink and cabinets, small bathroom, entryway and shoes, bedroom tight spaces, laundry corners, tiny desks, vertical storage, low-clearance storage, measurement guides.
- Monetizable products: slim trash cans, narrow shelves, under-sink organizers, rolling carts, shoe racks, hampers, over-door hooks, under-bed bins, compact desks, small nightstands, drying racks, cabinet risers.
- Trust angle: every article explains what to measure, what fits, what fails, and when to skip a product.
- Topics to avoid: generic organization inspiration, decor-only roundups, broad decluttering, style trends without measurements.
- Disclosure style: visible Amazon disclosure on every article with affiliate links.

## Replace Brand Settings

Update:

- `package.json` name.
- `scripts/build-site.js` site object:
  - `name`
  - `baseUrl`
  - `customDomain`
  - `analyticsId`
  - `description`
- visible brand text in `src/pages/`.
- footer and disclosure wording.
- `assets/brand/` images and favicon files.
- main hero image under `assets/images/`.

Search for old-brand terms:

```powershell
rg -n "OLD_BRAND|OLD_DOMAIN|OLD_TAG|OLD_NICHE_TERM" .
```

Only keep terms if they truly belong to the new niche. `small apartment` may remain when it is a useful keyword.

## Rebuild The Content Model

Update `CONTENT_ROADMAP.md` completely.

The roadmap should include:

- positioning;
- core promise;
- public categories;
- current published pages;
- priority pages;
- at least 100 article ideas;
- guides/trust pages;
- content selection rules;
- promotion notes.

Each planned article should include:

- status;
- category;
- page title;
- suggested URL;
- long-tail targets;
- product types to recommend.

Prefer articles that meet at least four criteria:

- solves a concrete fit problem;
- has clear buyer intent;
- naturally supports 4-8 Amazon product links;
- has a `fits if / skip if` section;
- can become 3 Pinterest pins;
- can internally link to at least 2 related pages.

## Update The Article Guide

Rewrite `ARTICLE_CREATION_GUIDE.md` for the current niche.

Keep:

- source/output rules;
- metadata requirements;
- product cards with one clearly visible, matching Amazon product image per card;
- the rule that no published card may use `product-media text-only`, a text placeholder, or a missing/broken image;
- no manual Amazon prices, ratings, review counts, Prime status, delivery dates, or availability;
- FAQ and JSON-LD;
- internal links;
- build and verification steps.

For Fits In My Space, every guide needs:

- physical constraint;
- what to measure before buying;
- best product types;
- `fits if / skip if` table;
- product recommendations;
- common fit mistakes;
- FAQ;
- internal links.

## Update The Static Generator

Edit `scripts/build-site.js`.

Replace:

- `site` object;
- `categories`;
- planned guide list;
- nav labels;
- category page copy;
- directory/index page copy;
- CNAME/domain output.

Fits In My Space uses public URLs under:

```text
/guides/category/page/
```

The source folder may remain `src/kits/` because it is only an internal project convention.

## Update Source Pages

Rewrite:

- `src/pages/index.html`
- `src/pages/about.html`
- `src/pages/contact.html`
- `src/pages/affiliate-disclosure.html`
- `src/pages/privacy.html`

Then rewrite or replace old source articles under `src/kits/` so they match the new niche.

## Update Templates

Rewrite `src/KIT_PAGE_TEMPLATE.txt`.

Use labels such as:

- `Measure this before buying`
- `Best product types`
- `Fits if / skip if`
- `Recommended picks`
- `Common fit mistakes`
- `FAQ`
- `On this page`

Avoid labels from older clones unless they belong to the current niche.

## Update Promotion Workflow

Rewrite `PROMOTION_WORKFLOW.md`.

Keep:

- 3 Pinterest pins per strong article;
- unique UTM links per pin;
- `PINTEREST_LEDGER.csv`;
- status values;
- Reddit manual/non-spam guidance;
- no direct Amazon links from pins.

Replace:

- recommended Pinterest boards;
- example URLs;
- disclosure copy;
- Reddit advice style;
- video hooks;
- Fiverr creative direction.

## Update Promo Asset Generator

Edit `scripts/build-promo-assets.ps1`.

Replace:

- `$BaseUrl`;
- visible brand text in `Draw-Pin`;
- call-to-action text;
- logo initials;
- all entries in `$Articles`;
- Pinterest boards;
- keywords;
- video hooks;
- pin titles, subtitles, bullets, and descriptions;
- Fiverr brief style notes.

After the new site has fresh articles, update `$Articles` to match only published or soon-to-publish article slugs.

## Update Promo Files

For a clean new project, reset or regenerate:

```text
promo/PINTEREST_LEDGER.csv
promo/pinterest-upload-next.csv
promo/pinterest-upload-now.csv
promo/pinterest-upload-scheduled.csv
promo/pinterest-bulk-upload.csv
promo/<article-slug>/
```

Do not carry old Pinterest ledger rows into the new site unless intentionally preserving them for the same domain and articles.

## Update Assets And Visual Style

Replace:

- hero image;
- brand favicons;
- Pinterest profile image;
- old-niche imagery.

Review `assets/style.css` for brand colors and old visual assumptions.

## Build And Verify

Run:

```powershell
npm run build
```

Verify:

```powershell
rg -n "OLD_BRAND|OLD_DOMAIN|OLD_TAG|OLD_NICHE_TERM" .
rg -n "tag=" docs
Get-Content .\docs\sitemap.xml
Get-Content .\docs\robots.txt
```

Check:

- generated homepage exists at `docs/index.html`;
- generated category pages exist;
- sitemap contains the current domain;
- robots.txt points to the current sitemap;
- CNAME contains the current domain;
- Amazon links use the current tag;
- old category names are gone;
- old promo URLs are gone;
- no manual prices, ratings, review counts, Prime status, delivery dates, or availability.

## Launch Order

Recommended launch sequence:

1. Rebrand site shell and generator.
2. Rewrite roadmap and article guide.
3. Publish 5-10 strong articles.
4. Generate promo packs for the strongest pages.
5. Rebuild and verify.
6. Push to GitHub Pages.
7. Upload first small Pinterest batch.
8. Track uploaded pins in `promo/PINTEREST_LEDGER.csv`.
9. Continue publishing articles from the roadmap.
