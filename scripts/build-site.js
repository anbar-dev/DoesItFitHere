const fs = require("fs");
const path = require("path");

const rootDir = path.resolve(__dirname, "..");
const outDir = path.join(rootDir, "docs");
const sourceDirs = [path.join(rootDir, "src", "pages"), path.join(rootDir, "src", "kits")];
const assetSource = path.join(rootDir, "assets");
const promoSource = path.join(rootDir, "promo");

const site = {
  name: "Fits In My Space",
  baseUrl: "https://doesitfithere.com",
  customDomain: "doesitfithere.com",
  analyticsId: "",
  description: "Shopping guides for narrow, compact, under-sink, over-door, low-clearance, and awkward spaces."
};

const categories = [
  {
    slug: "narrow-kitchen",
    title: "Narrow Kitchen",
    eyebrow: "Narrow Kitchen",
    description: "Slim trash cans, rolling carts, shallow shelves, compact pantry cabinets, and narrow kitchen storage that depends on width and depth.",
    planned: [
      "Small pantry cabinet for tiny kitchen",
      "Slim recycling bin for tiny kitchen",
      "Narrow kitchen shelf under 8 inches deep",
      "Slim dish drying rack for tiny counter",
      "Skinny kitchen island under 18 inches deep"
    ]
  },
  {
    slug: "under-sink-cabinets",
    title: "Under-Sink & Cabinets",
    eyebrow: "Under-Sink",
    description: "Organizers, risers, pull-outs, caddies, mats, and bins that need to work around pipes, drains, hinges, and cabinet doors.",
    planned: [
      "Cabinet risers for shallow cabinets",
      "Under sink pull-out drawer around plumbing",
      "Door mounted organizer for sink cabinet",
      "Expandable shelf for under sink pipes",
      "Under sink mat that fits around pipes"
    ]
  },
  {
    slug: "small-bathroom",
    title: "Small Bathroom",
    eyebrow: "Small Bathroom",
    description: "Slim hampers, over-toilet shelves, narrow cabinets, shower caddies, towel storage, and bathroom pieces for tight clearances.",
    planned: [
      "Narrow bathroom cabinet under 12 inches deep",
      "Slim toilet paper storage for tiny bathroom",
      "Over door towel rack for small bathroom",
      "Bathroom rolling cart under 7 inches wide",
      "Small bathroom trash can under 8 inches wide"
    ]
  },
  {
    slug: "entryway-shoes",
    title: "Entryway & Shoes",
    eyebrow: "Entryway",
    description: "Narrow shoe racks, shallow benches, over-door organizers, landing tables, umbrella stands, and hallway storage that preserves walkway space.",
    planned: [
      "Shoe cabinet under 10 inches deep",
      "Vertical shoe rack for narrow hallway",
      "Narrow entryway bench with shoe storage",
      "Key table under 8 inches deep",
      "Boot tray for narrow hallway"
    ]
  },
  {
    slug: "bedroom-tight-spaces",
    title: "Bedroom Tight Spaces",
    eyebrow: "Bedroom",
    description: "Small nightstands, narrow side tables, compact dressers, bedside shelves, wardrobes, and under-bed storage for tight rooms.",
    planned: [
      "Narrow side table for couch",
      "Narrow dresser under 24 inches wide",
      "Bedside shelf for no nightstand space",
      "Wardrobe for bedroom without closet",
      "Narrow bedside charging table"
    ]
  },
  {
    slug: "laundry-corners",
    title: "Laundry Corners",
    eyebrow: "Laundry",
    description: "Slim hampers, rolling laundry carts, drying racks, sorter towers, and laundry shelves for awkward gaps and compact bathrooms.",
    planned: [
      "Slim laundry sorter for closet gap",
      "Rolling laundry cart between washer and wall",
      "Over washer shelf for low clearance",
      "Foldable ironing board for small closet",
      "Hamper with wheels for narrow bathroom"
    ]
  },
  {
    slug: "tiny-desks",
    title: "Tiny Desks",
    eyebrow: "Tiny Desks",
    description: "Compact desks, shallow desks, folding desks, corner desks, laptop tables, and desk accessories that preserve chair clearance.",
    planned: [
      "Desk under 30 inches wide",
      "Shallow desk under 18 inches deep",
      "Ladder desk for small room",
      "Folding desk for bedroom corner",
      "Desk chair for narrow desk clearance"
    ]
  },
  {
    slug: "vertical-storage",
    title: "Over-Door & Vertical Storage",
    eyebrow: "Vertical Storage",
    description: "Over-door hooks, behind-door racks, tall narrow shelves, broom holders, and vertical organizers that need clearance to close and open.",
    planned: [
      "Over door hooks for thick door",
      "Behind door storage rack narrow clearance",
      "Tall narrow shelf under 12 inches wide",
      "Over door pantry rack door clearance",
      "Over door towel hooks that let door close"
    ]
  },
  {
    slug: "low-clearance-storage",
    title: "Low-Clearance Storage",
    eyebrow: "Low Clearance",
    description: "Under-bed bins, under-sofa boxes, rolling drawers, flat holiday storage, and low-profile containers for short clearances.",
    planned: [
      "Under sofa storage boxes low clearance",
      "Rolling under bed drawers for carpet",
      "Flat holiday storage under bed",
      "Low profile shoe storage under bed",
      "Under bed drawer clearance for platform beds"
    ]
  },
  {
    slug: "measurement-guides",
    title: "Measurement Guides",
    eyebrow: "Measure First",
    description: "Practical measuring guides for narrow gaps, door swing, pipe clearance, lid swing, baseboards, outlets, and under-bed height.",
    planned: [
      "How to measure a narrow gap before buying storage",
      "How to measure under sink around pipes",
      "How much clearance does a trash can lid need",
      "How to measure outlet clearance behind furniture",
      "How to tape out furniture before buying"
    ]
  }
];

const guidePlans = [
  "How to measure a narrow gap before buying storage",
  "How to measure under sink around pipes",
  "How much clearance does a trash can lid need",
  "How to measure door swing before buying furniture",
  "How to measure under bed clearance correctly"
];

function escapeHtml(value) {
  return String(value)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}

function walkFiles(dir) {
  if (!fs.existsSync(dir)) return [];
  return fs.readdirSync(dir, { withFileTypes: true }).flatMap((entry) => {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) return walkFiles(fullPath);
    return entry.isFile() && entry.name.endsWith(".html") ? [fullPath] : [];
  });
}

function parseSource(filePath) {
  const raw = fs.readFileSync(filePath, "utf8").replace(/^\uFEFF/, "");
  const match = raw.match(/^<!--\s*([\s\S]*?)\s*-->\s*/);
  const meta = {};
  let body = raw;

  if (match) {
    body = raw.slice(match[0].length);
    match[1].split(/\r?\n/).forEach((line) => {
      const pair = line.match(/^\s*([A-Za-z0-9_-]+):\s*(.*?)\s*$/);
      if (pair) meta[pair[1]] = pair[2];
    });
  }

  if (!meta.path || !meta.title || !meta.description) {
    throw new Error(`Missing required metadata in ${filePath}`);
  }

  return { filePath, meta, body };
}

function rootPrefix(urlPath) {
  const clean = urlPath.replace(/^\/|\/$/g, "");
  if (!clean) return "";
  return "../".repeat(clean.split("/").length);
}

function destinationFor(urlPath) {
  const clean = urlPath.replace(/^\/|\/$/g, "");
  return clean ? path.join(outDir, clean, "index.html") : path.join(outDir, "index.html");
}

function canonicalUrl(urlPath) {
  const clean = urlPath === "/" ? "/" : `/${urlPath.replace(/^\/|\/$/g, "")}/`;
  return `${site.baseUrl}${clean === "/" ? "/" : clean}`;
}

function renderHeader(root) {
  return `
  <header class="site-header">
    <nav class="nav" aria-label="Main navigation">
      <a class="brand" href="${root}"><img class="brand-logo" src="${root}assets/brand/favicon-192.png" alt="" width="34" height="34"><span>${site.name}</span></a>
      <button class="menu-button" data-menu-button aria-expanded="false" aria-label="Open menu">=</button>
      <div class="nav-links" data-nav-links>
        <a href="${root}guides/">Guides</a>
        <a href="${root}about/">About</a>
        <a href="${root}contact/">Contact</a>
        <a href="${root}affiliate-disclosure/">Disclosure</a>
      </div>
    </nav>
  </header>`;
}

function renderFooter(root) {
  return `
  <footer class="footer">
    <div class="footer-inner">
      <span>${site.name}</span>
      <span>As an Amazon Associate, this site earns from qualifying purchases.</span>
      <span><a href="${root}contact/">Contact</a> | <a href="${root}privacy/">Privacy</a> | <a href="${root}affiliate-disclosure/">Affiliate disclosure</a></span>
    </div>
  </footer>`;
}

function renderAnalytics() {
  return "";
}

function renderPage({ title, description, urlPath, body }) {
  const root = rootPrefix(urlPath);
  return `<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${escapeHtml(title)}</title>
  <meta name="description" content="${escapeHtml(description)}">
  <link rel="canonical" href="${canonicalUrl(urlPath)}">
  <link rel="icon" type="image/png" sizes="32x32" href="${root}assets/brand/favicon-32.png">
  <link rel="icon" type="image/png" sizes="192x192" href="${root}assets/brand/favicon-192.png">
  <link rel="apple-touch-icon" sizes="512x512" href="${root}assets/brand/favicon-512.png">
  <link rel="stylesheet" href="${root}assets/style.css">
${renderAnalytics().trimEnd()}
</head>
<body>
${renderHeader(root)}
  <main>
${body.trim()}
  </main>
${renderFooter(root)}
  <script src="${root}assets/script.js"></script>
</body>
</html>
`;
}

function categoryCard(category) {
  return `<article class="card kit-card">
  <div class="pill-row"><span class="pill">${escapeHtml(category.eyebrow)}</span></div>
  <h3>${escapeHtml(category.title)}</h3>
  <p>${escapeHtml(category.description)}</p>
  <a class="link" href="${category.slug}/">Open category</a>
</article>`;
}

function plannedList(items) {
  return items.map((item) => `<li>${escapeHtml(item)}</li>`).join("");
}

function pageDisplayTitle(page) {
  return page.meta.title.replace(` | ${site.name}`, "");
}

function categoryDisplayName(slug) {
  return categories.find((category) => category.slug === slug)?.title || slug || "Guide";
}

function renderKitCards(pages, currentPath) {
  if (!pages.length) {
    return `<div class="empty-state card">
  <h2>Kit pages coming soon.</h2>
  <p>This category is being shaped around measurable fit problems. Start with the planned topics below, or browse another category with finished guides.</p>
</div>`;
  }

  return `<div class="grid three">
${pages.map((page) => {
    const href = relativeHref(currentPath, page.meta.path);
    return `<article class="card kit-card">
  <div class="pill-row"><span class="pill">${escapeHtml(categoryDisplayName(page.meta.category))}</span></div>
  <h3>${escapeHtml(pageDisplayTitle(page))}</h3>
  <p>${escapeHtml(page.meta.summary || page.meta.description)}</p>
  <a class="link" href="${href}">Open guide</a>
</article>`;
  }).join("\n")}
</div>`;
}

function relativeHref(fromPath, toPath) {
  const fromDir = path.posix.dirname(`/${fromPath.replace(/^\/|\/$/g, "")}/index.html`);
  const toDir = `/${toPath.replace(/^\/|\/$/g, "")}/`;
  let rel = path.posix.relative(fromDir, toDir);
  if (!rel) rel = ".";
  return rel.endsWith("/") ? rel : `${rel}/`;
}

function renderCategoryPage(category, pages) {
  const urlPath = `/guides/${category.slug}/`;
  const published = pages.filter((page) => page.meta.category === category.slug && page.meta.type !== "page");
  const body = `
    <section class="page-hero">
      <div class="page-title">
        <p class="eyebrow">${escapeHtml(category.eyebrow)}</p>
        <h1>${escapeHtml(category.title)}.</h1>
        <p>${escapeHtml(category.description)}</p>
      </div>
    </section>
    <section class="section">
      <div class="section-title">
        <div>
          <p class="eyebrow">Available guides</p>
          <h2>Start with the measurement that can ruin the purchase.</h2>
          <p>Each finished guide explains what to measure, which product types usually fit, and when to skip a tempting option.</p>
        </div>
      </div>
      ${renderKitCards(published, urlPath)}
    </section>
    <section class="band">
      <div class="section">
        <div class="section-title">
          <div>
            <p class="eyebrow">Coming next</p>
            <h2>More problems in this category.</h2>
            <p>These are common high-intent searches where width, depth, height, clearance, or moving parts decide the buy.</p>
          </div>
        </div>
        <div class="card roadmap-list"><ul>${plannedList(category.planned)}</ul></div>
      </div>
    </section>`;

  return {
    urlPath,
    html: renderPage({
      title: `${category.title} | ${site.name}`,
      description: category.description,
      urlPath,
      body
    })
  };
}

function renderKitsIndex() {
  const body = `
    <section class="page-hero">
      <div class="page-title">
        <p class="eyebrow">Content map</p>
        <h1>Fit-first shopping guide categories.</h1>
        <p>The site is organized around the spaces that cause failed purchases: narrow kitchen gaps, under-sink pipes, low bathroom ceilings, tight entryways, slim bedrooms, laundry corners, tiny desks, vertical storage, and low-clearance storage.</p>
      </div>
    </section>
    <section class="section">
      <div class="grid three">
        ${categories.map(categoryCard).join("\n")}
      </div>
    </section>`;

  return {
    urlPath: "/guides/",
    html: renderPage({
      title: `Fit Guide Categories | ${site.name}`,
      description: "Browse fit-first shopping guide categories for narrow kitchens, under-sink cabinets, small bathrooms, entryways, bedrooms, laundry, tiny desks, vertical storage, low-clearance storage, and measurement guides.",
      urlPath: "/guides/",
      body
    })
  };
}

function renderGuidesIndex(pages) {
  const published = pages.filter((page) => page.meta.type === "guide");
  const body = `
    <section class="page-hero">
      <div class="page-title">
        <p class="eyebrow">Guides</p>
        <h1>Trust pages and buying strategy.</h1>
        <p>Comparison pages and measuring guides for fit risk, what to skip, and how to avoid buying the wrong size.</p>
      </div>
    </section>
    <section class="section">
      ${renderKitCards(published, "/guides/")}
    </section>
    <section class="band">
      <div class="section">
        <div class="section-title">
          <div>
            <p class="eyebrow">Coming next</p>
            <h2>More measuring guides.</h2>
          </div>
        </div>
        <div class="card roadmap-list"><ul>${plannedList(guidePlans)}</ul></div>
      </div>
    </section>`;

  return {
    urlPath: "/guides/",
    html: renderPage({
      title: `Measurement Buying Guides | ${site.name}`,
      description: "Measurement buying guides about clearance, narrow gaps, door swing, pipe clearance, under-bed height, and what to skip.",
      urlPath: "/guides/",
      body
    })
  };
}

function renderSitemap(paths) {
  const urls = paths
    .sort()
    .map((urlPath) => `  <url><loc>${canonicalUrl(urlPath)}</loc></url>`)
    .join("\n");

  return `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls}
</urlset>
`;
}

function renderRobots() {
  return `User-agent: *
Allow: /

Sitemap: ${site.baseUrl}/sitemap.xml
`;
}

function copyDir(src, dest) {
  if (!fs.existsSync(src)) return;
  fs.mkdirSync(dest, { recursive: true });
  for (const entry of fs.readdirSync(src, { withFileTypes: true })) {
    const srcPath = path.join(src, entry.name);
    const destPath = path.join(dest, entry.name);
    if (entry.isDirectory()) {
      copyDir(srcPath, destPath);
    } else if (entry.isFile()) {
      fs.copyFileSync(srcPath, destPath);
    }
  }
}

function writeOutput(urlPath, html) {
  const dest = destinationFor(urlPath);
  fs.mkdirSync(path.dirname(dest), { recursive: true });
  fs.writeFileSync(dest, html, "utf8");
}

function build() {
  const resolvedOut = path.resolve(outDir);
  if (!resolvedOut.startsWith(rootDir + path.sep)) {
    throw new Error(`Refusing to write outside project: ${resolvedOut}`);
  }

  fs.rmSync(outDir, { recursive: true, force: true });
  fs.mkdirSync(outDir, { recursive: true });

  const pages = sourceDirs.flatMap(walkFiles).map(parseSource);
  const outputs = [];

  for (const page of pages) {
    outputs.push({
      urlPath: page.meta.path,
      html: renderPage({
        title: page.meta.title,
        description: page.meta.description,
        urlPath: page.meta.path,
        body: page.body
      })
    });
  }

  outputs.push(renderKitsIndex());
  if (pages.some((page) => page.meta.type === "guide")) {
    outputs.push(renderGuidesIndex(pages));
  }
  for (const category of categories) outputs.push(renderCategoryPage(category, pages));

  const paths = new Set();
  for (const output of outputs) {
    writeOutput(output.urlPath, output.html);
    paths.add(output.urlPath);
  }

  copyDir(assetSource, path.join(outDir, "assets"));
  copyDir(promoSource, path.join(outDir, "promo"));
  fs.writeFileSync(path.join(outDir, "sitemap.xml"), renderSitemap([...paths]), "utf8");
  fs.writeFileSync(path.join(outDir, "robots.txt"), renderRobots(), "utf8");
  fs.writeFileSync(path.join(outDir, "CNAME"), `${site.customDomain}\n`, "utf8");
  fs.writeFileSync(path.join(outDir, ".nojekyll"), "", "utf8");

  console.log(`Built ${paths.size} pages into ${path.relative(rootDir, outDir)}`);
}

build();
