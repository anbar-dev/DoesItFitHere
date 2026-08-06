# Promo Archive

This folder is archived/on-demand.

Normal article creation is HTML-only and should not create or update promo files. Keep existing Pinterest CSVs, pin assets, video scripts, Fiverr briefs, and Reddit-angle files as archive material unless the user explicitly asks for promotion.

To generate promo assets intentionally:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-promo-assets.ps1 -GeneratePromo
```

Running `scripts/build-promo-assets.ps1` without `-GeneratePromo` should not create, modify, or delete promo files.