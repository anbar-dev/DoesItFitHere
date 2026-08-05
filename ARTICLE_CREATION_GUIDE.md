# Article Creation Guide

This is the operating manual for creating new Fits In My Space buying guides.

Use this guide together with:

- `CONTENT_ROADMAP.md` - what pages to create.
- `src/KIT_PAGE_TEMPLATE.txt` - starter HTML structure.
- `scripts/build-site.js` - site generator.
- `README.md` - project/build overview.

## Project Positioning

Brand:

> Fits In My Space

Core promise:

> Shopping guides for narrow, compact, under-sink, over-door, low-clearance, and awkward spaces.

Every page should help the reader avoid buying something that physically does not fit. The editorial edge is measurement: width, depth, height, clearance, door swing, pipes, outlets, trim, baseboards, handles, lids, and the space needed to actually use the product after it arrives.

This is not a generic home organization site. Do not publish a page unless the buying decision depends on a measurable constraint.

## Affiliate Settings

Amazon Associates tag:

```text
fitsin-20
```

Use this tag in Amazon product links:

```html
https://www.amazon.com/s?k=SEARCH+TERM&tag=fitsin-20
```

Direct product links may also be used when the product has been checked recently:

```html
https://www.amazon.com/dp/ASIN/ref=nosim?tag=fitsin-20
```

Do not manually state Amazon prices, ratings, review counts, Prime status, stock status, delivery dates, coupons, discounts, or availability. These change too often.

## Source And Output

Do not edit `docs/` by hand.

Edit source files:

```text
src/pages/
src/kits/
assets/
scripts/
promo/
CONTENT_ROADMAP.md
ARTICLE_CREATION_GUIDE.md
PROMOTION_WORKFLOW.md
```

Then rebuild:

```powershell
npm run build
```

Generated output goes to:

```text
docs/
```

GitHub Pages publishes:

```text
main branch /docs folder
```

## Page Metadata

Every article page source must start with metadata:

```html
<!--
title: Page Title | Fits In My Space
description: Short SEO description.
path: /guides/category-slug/page-slug/
type: fit-guide
category: category-slug
summary: One-sentence summary used on category cards.
-->
```

Allowed category slugs:

```text
narrow-kitchen
under-sink-cabinets
small-bathroom
entryway-shoes
bedroom-tight-spaces
laundry-corners
tiny-desks
vertical-storage
low-clearance-storage
measurement-guides
```

## Page Formula

Use this structure for most guides:

1. Page hero focused on the physical constraint.
2. Fit scoreboard.
3. Amazon disclosure.
4. Quick verdict.
5. What to measure before buying.
6. Best product types for the constraint.
7. `Fits if / skip if` table.
8. Recommended Amazon-searchable product cards.
9. Common measurement mistakes.
10. Internal links.
11. FAQ.
12. JSON-LD FAQPage.
13. Sidebar with "On this page" and a measurement checklist.

## Fit Scores To Include

Use 4 scoreboard items. Choose the most relevant:

- `Critical measure`: width, depth, height, clearance, door swing, pipe gap, lid swing, caster height.
- `Best first filter`: maximum width, minimum clearance, adjustable shelf, open back, collapsible frame.
- `Common fail`: too deep, lid hits sink, drawer hits pipes, handle blocks door, feet catch on baseboard.
- `Buyer intent`: High / Very high / Urgent.
- `Install effort`: None / Low / Moderate.
- `Return risk`: Low / Medium / High.

The scores should help shoppers decide, not decorate the page.

## Product Selection Rules

Prefer products that:

- solve a fit problem with a clear measurement filter;
- are broadly searchable on Amazon US;
- can be explained without prices, reviews, or availability;
- include adjustable, collapsible, stackable, slim, narrow, shallow, low-profile, or open-back options where useful;
- can be skipped when the reader's dimensions do not match.

Each product card should include:

- clear product type or exact product title;
- "for..." phrase tied to the fit use case;
- why it belongs;
- when to skip it;
- Amazon button.

Example:

```html
<div class="product">
  <div class="product-media text-only"><span>Measure: under 10 in. wide</span></div>
  <div>
    <h3>Slim rectangular trash can <span>for a 9-inch cabinet gap</span></h3>
    <p>Choose a straight-sided can and check lid swing. Skip round cans if the available width is the limiting measurement.</p>
    <a class="button amazon" href="https://www.amazon.com/s?k=slim+trash+can+under+10+inches&tag=fitsin-20">Search on Amazon</a>
  </div>
</div>
```

Use 4-7 product cards for most pages. The recommendation can be a product type when the page is primarily a fit filter.

## SEO Rules

Each page should target 3-5 long-tail phrases from `CONTENT_ROADMAP.md`.

Include them naturally in:

- `title`;
- `description`;
- H1 or intro;
- quick verdict;
- FAQ questions;
- internal anchor text where relevant.

Good patterns:

- `narrow [product] under [measurement]`
- `[product] for narrow [room/space]`
- `under sink organizer around pipes`
- `low clearance [storage/product]`
- `rolling cart that fits beside fridge`
- `[furniture] under [width] wide`
- `over toilet storage for low ceiling bathroom`

## Trust Differentiators

Every guide must include at least one trust-building section:

- `Measure this first`
- `Fits if / skip if`
- `Common fit mistakes`
- `When not to buy`
- `Door, drawer, lid, and pipe clearance notes`
- `Return-risk notes`

This is central to the site. Do not create pages that only list attractive products.

## FAQ And Structured Data

Most full guides should include:

- visible FAQ section;
- matching `FAQPage` JSON-LD.

Keep FAQ answers short, practical, and consistent with page copy. Avoid guarantees. Use careful language around plumbing, electrical outlets, wall mounting, heavy loads, and appliance clearances.

## Internal Links

Each page should include 2-4 internal links to related categories or published guides.

If a related page is not published yet, link to the category hub.

Example:

```html
<div class="internal-links">
  <a href="../">Narrow Kitchen category</a>
  <a href="../../under-sink-cabinets/">Under-Sink & Cabinets category</a>
  <a href="../../measurement-guides/">Measurement Guides category</a>
</div>
```

## Images

Hero/category imagery:

- Use generated or original images when needed.
- Store project images in `assets/images/`.

Product images:

- Use direct Amazon product images only when verified from the current Amazon product page.
- Do not download Amazon product images into the repository.
- Text-only measurement cards are acceptable when using Amazon search links.

## Research Workflow

Before writing a page:

1. Pick a `next` page from `CONTENT_ROADMAP.md`, or follow the user's requested topic.
2. Define the exact physical constraint.
3. List what the reader must measure before buying.
4. Search current Amazon products or product types.
5. Avoid stale prices, ratings, review counts, stock status, and delivery promises.
6. Choose products that match the fit constraint and include skip notes.

## Build Workflow

After creating a page:

1. Save source file under the right folder, for example:

   ```text
   src/kits/narrow-kitchen/narrow-trash-can-under-10-inches.html
   ```

2. Update `CONTENT_ROADMAP.md` status from `next` or `planned` to `published`.
3. Rebuild:

   ```powershell
   npm run build
   ```

4. Verify:

   - generated page exists under `docs/`;
   - category page links to it;
   - `docs/sitemap.xml` includes it;
   - Amazon links include `tag=fitsin-20`;
   - no old brand, old domain, or old affiliate tag remains;
   - no manual prices, ratings, review counts, Prime status, or availability.

Useful checks:

```powershell
rg -n "OLD_BRAND|OLD_DOMAIN|OLD_TAG|OLD_NICHE_TERM" .
rg -n "price|rating|reviews|Prime|in stock|available" .\src .\docs
rg -n "tag=fitsin-20" docs
```

## Current Published Guides

- `/guides/narrow-kitchen/narrow-trash-can-under-10-inches/`
- `/guides/bedroom-tight-spaces/nightstand-under-12-inches-wide/`
- `/guides/under-sink-cabinets/under-sink-organizer-around-pipes/`
- `/guides/entryway-shoes/shoe-rack-for-narrow-entryway/`
- `/guides/small-bathroom/slim-laundry-hamper-small-bathroom/`
- `/guides/small-bathroom/over-toilet-storage-low-ceiling/`
- `/guides/laundry-corners/drying-rack-small-apartment/`
- `/guides/tiny-desks/compact-desk-bedroom-corner/`
- `/guides/narrow-kitchen/rolling-cart-beside-fridge/`
- `/guides/low-clearance-storage/under-bed-storage-bins-low-clearance/`

## Publishing

After rebuild:

```powershell
git add .
git commit -m "Rebrand site to Fits In My Space"
git push
```

## Promotion Workflow

After publishing a strong guide, generate a promo pack:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-promo-assets.ps1
```

Promo packs live in `promo/` and are copied into `docs/promo/` by the static site build.

Pins should link to the article page, not directly to Amazon. Use unique UTM-tagged article URLs for multiple Pin variants of the same page, otherwise Pinterest may reject duplicate links.

GitHub Pages URL pattern:

```text
https://doesitfithere.com/
```

Live article example:

```text
https://doesitfithere.com/guides/narrow-kitchen/narrow-trash-can-under-10-inches/
```
