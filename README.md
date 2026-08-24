# Fits In My Space

Static affiliate/editorial site for shopping guides built around physical fit: narrow widths, shallow depths, low clearances, door swing, pipes, outlets, baseboards, and awkward gaps.

When the user says "create article", "create an article", "make another article", "fai un altro articolo", or similar, the default workflow is HTML-only and follows `ARTICLE_CREATION_GUIDE.md`. That means: update the source article HTML, update `CONTENT_ROADMAP.md`, build the site, verify the generated page, then commit and push. Promo assets are not part of the default article workflow.

Non-negotiable product-image rule: every published product card must show a clearly visible, real product image that matches the linked Amazon ASIN. Use the direct Amazon image URL inside a clickable `.product-media` block. Never publish a product card with `text-only`, a text placeholder, a missing image, a broken/blank image, or an image that cannot be clearly recognized in the generated page.

## Structure

- `src/pages/` - standalone page body HTML with metadata.
- `src/kits/` - source article pages, grouped by fit category.
- `assets/` - shared CSS, JavaScript, and images.
- `promo/` - archived/on-demand Pinterest/social promo packs and bulk upload CSV.
- `scripts/build-site.js` - tiny static generator.
- `docs/` - generated site output for GitHub Pages.
- `CONTENT_ROADMAP.md` - editorial roadmap and long-tail backlog.
- `ARTICLE_CREATION_GUIDE.md` - rules and workflow for creating fit-first buying guides.

## Navigation model

- `/guides/` is the category directory, not a flat list of every article.
- Category pages are for browsing; the homepage's featured problems and quick picker link directly to published guides to keep the path short.
- A category without published articles is intentionally marked as coming soon and links back to the category directory.
- `/contact/` is currently a static topic-request form. It does not send email until a submission service is connected.

## Build

Run:

```powershell
npm run build
```

Generate promo assets only when explicitly requested:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-promo-assets.ps1 -GeneratePromo
```

Generate brand assets:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-brand-assets.ps1
```

Existing files in `promo/` are kept as an archive. Upload `promo/pinterest-upload-now.csv` or `promo/pinterest-upload-scheduled.csv` only when running an explicit promo workflow. `promo/PINTEREST_LEDGER.csv` tracks what has already been exported or uploaded.

If Node is not installed locally, Codex can run the project using its bundled Node runtime.

## Publishing

Configure GitHub Pages to publish from the `main` branch and the `/docs` folder.

Do not edit files in `docs/` by hand. Edit `src/`, `assets/`, `scripts/`, `promo/`, or the operational markdown files, then rebuild.
