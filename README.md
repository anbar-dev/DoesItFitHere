# Fits In My Space

Static affiliate/editorial site for shopping guides built around physical fit: narrow widths, shallow depths, low clearances, door swing, pipes, outlets, baseboards, and awkward gaps.

## Structure

- `src/pages/` - standalone page body HTML with metadata.
- `src/kits/` - source article pages, grouped by fit category.
- `assets/` - shared CSS, JavaScript, and images.
- `promo/` - generated Pinterest/social promo packs and bulk upload CSV.
- `scripts/build-site.js` - tiny static generator.
- `docs/` - generated site output for GitHub Pages.
- `CONTENT_ROADMAP.md` - editorial roadmap and long-tail backlog.
- `ARTICLE_CREATION_GUIDE.md` - rules and workflow for creating fit-first buying guides.

## Build

Run:

```powershell
npm run build
```

Generate promo assets:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-promo-assets.ps1
```

Generate brand assets:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-brand-assets.ps1
```

Upload `promo/pinterest-upload-now.csv` for immediate pins and `promo/pinterest-upload-scheduled.csv` for scheduled pins. `promo/PINTEREST_LEDGER.csv` tracks what has already been exported or uploaded.

If Node is not installed locally, Codex can run the project using its bundled Node runtime.

## Publishing

Configure GitHub Pages to publish from the `main` branch and the `/docs` folder.

Do not edit files in `docs/` by hand. Edit `src/`, `assets/`, `scripts/`, `promo/`, or the operational markdown files, then rebuild.
