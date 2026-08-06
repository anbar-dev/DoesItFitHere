# Promotion Workflow

This file is archived/on-demand. It is not part of the default article creation workflow for Fits In My Space.

When the user says "create article", "create an article", "make another article", "fai un altro articolo", or similar, do not create Pinterest pins, promo CSVs, short video scripts, Fiverr briefs, Reddit-angle files, or other promo assets. Follow `ARTICLE_CREATION_GUIDE.md` instead.

Use this workflow only when the user explicitly asks for promo assets, Pinterest assets, Reddit angles, video scripts, or a promotional pack.

## Archived Strategy

When explicitly requested, a guide can receive a small promo pack:

- 3 Pinterest-ready vertical PNGs.
- Pinterest bulk upload CSV rows.
- Pinterest title and description copy.
- 20-30 second short video script.
- Fiverr brief for batch editing.
- Reddit angle for manual, non-spam replies.

Pins should link to the guide page, not directly to Amazon. The guide page contains the Amazon affiliate links and disclosure.

## Folder Structure

```text
promo/
  PINTEREST_LEDGER.csv
  pinterest-upload-next.csv
  pinterest-upload-now.csv
  pinterest-upload-scheduled.csv
  pinterest-bulk-upload.csv
  article-slug/
    pins/
      pin-01.png
      pin-02.png
      pin-03.png
    pinterest-upload-next.csv
    pinterest-bulk-upload.csv
    pinterest-copy.md
    short-video-script.md
    fiverr-brief.md
    reddit-angle.md
```

The static site build copies `promo/` into `docs/promo/`, so images become public after GitHub Pages publishes.

Example:

```text
https://doesitfithere.com/promo/narrow-trash-can-under-10-inches/pins/pin-01.png
```

## Pinterest Bulk Upload

Use a Pinterest business account. It is free unless ads are used.

For controlled uploads, use these files:

```text
promo/pinterest-upload-now.csv
promo/pinterest-upload-scheduled.csv
```

`pinterest-upload-now.csv` contains the first 9 pending pins with an empty `Publish date`, so Pinterest should publish them immediately.

`pinterest-upload-scheduled.csv` contains the next 9 pending pins with dates after the already scheduled batch.

`pinterest-upload-next.csv` is the combined view of both files. Use it only when uploading the full pending batch at once is intentional.

`promo/pinterest-bulk-upload.csv` is the full generated archive. Do not upload it repeatedly, because it includes pins that may already be on Pinterest.

The CSV points to public image URLs on the site. Push the site before uploading the CSV, otherwise Pinterest cannot fetch the media.

Each Pin row needs a unique destination URL. When publishing multiple variants for the same guide, use UTM parameters so Pinterest does not reject rows with duplicate destination links:

```text
?utm_source=pinterest&utm_medium=social&utm_campaign=bulk_promo&utm_content=article-slug-pin-01
```

## Pinterest Ledger

`promo/PINTEREST_LEDGER.csv` is the memory file for Pinterest.

Status values:

- `ready`: generated but not exported yet.
- `exported`: included in `pinterest-upload-next.csv`; waiting for manual upload confirmation.
- `uploaded`: Pinterest accepted the pin.
- `published`: pin is live and no longer only scheduled.
- `error`: Pinterest rejected the row and it needs fixing.
- `hold`: intentionally paused.

When Pinterest accepts an upload, update the matching rows from `exported` to `uploaded`. If Pinterest returns errors, keep those rows as `error` or paste the error into chat so Codex can update the ledger.

The generator excludes `uploaded`, `published`, and `hold` rows from `pinterest-upload-next.csv`. It keeps `ready`, `exported`, and `error` rows in the next upload file until they are confirmed or paused.

Because Pinterest can reject duplicate destination links, every Pin variant uses a unique UTM-tagged guide URL.

Current handoff rule with the user:

1. Codex generates promo files.
2. User uploads `pinterest-upload-now.csv` or `pinterest-upload-scheduled.csv`.
3. User tells Codex `uploaded ok` or pastes Pinterest errors.
4. Codex updates `PINTEREST_LEDGER.csv`.
5. Future CSV files exclude rows already marked `uploaded`, `published`, or `hold`.

Recommended boards:

- `Small Spaces That Actually Fit`
- `Narrow Kitchen Finds`
- `Under Sink Storage Ideas`
- `Tiny Bathroom Storage`
- `Small Bedroom Furniture`
- `Low Clearance Storage`

## Disclosure

Pinterest descriptions should include a clear disclosure such as `#ad` when the linked page contains affiliate links. The Pin links to the guide, and the guide includes the Amazon Associate disclosure.

## Good Pin Angles

- "Measure this before buying a slim trash can."
- "Fits if / skip if for under-sink organizers."
- "The hidden clearance that ruins narrow shoe racks."
- "Low bed? Check this height before ordering bins."
- "Do not buy a rolling cart until you measure the fridge gap."

## Reddit Guidance

Use Reddit manually only when the thread asks about a specific fit problem. Lead with the measurement checklist, not a link.

Good no-link answer shape:

1. Name the likely measurement that matters.
2. Explain the product types that tend to work.
3. Add one `skip if` warning.
4. Link only if the subreddit allows it or the person asks.

Disclosure if linking:

```text
I made a full measurement guide for this; it contains Amazon affiliate links.
```

## Build Commands

Generate promo assets explicitly:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\build-promo-assets.ps1 -GeneratePromo
```

Rebuild site:

```powershell
npm run build
```

If normal Node is unavailable, Codex can use its bundled Node runtime.
