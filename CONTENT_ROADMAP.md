# Fits In My Space Content Roadmap

Working positioning:

> Shopping guides for narrow, compact, under-sink, over-door, low-clearance, and awkward spaces.

Core promise:

> Measure once, buy something that actually fits.

This file is the editorial backlog for the static site. When creating a new guide, pick a planned page from here, create the HTML page, then update its status.

Status values:

- `published`: page already exists on the site.
- `next`: strong candidate for the next build.
- `planned`: good future page.
- `hold`: useful idea, but not first priority.

Page formula:

- Start with the physical constraint, not the product.
- Explain what to measure before buying.
- Recommend product types that naturally fit the constraint.
- Include a `fits if / skip if` table.
- Include product cards with Amazon links or Amazon search links.
- Include common measurement mistakes, FAQ, and internal links.
- Do not manually copy Amazon prices, star ratings, review counts, Prime status, delivery promises, or availability.

## Site Categories

Public category structure:

- `/guides/narrow-kitchen/` - slim trash cans, tiny pantry cabinets, fridge-gap carts, narrow shelves, compact kitchen storage.
- `/guides/under-sink-cabinets/` - around-pipe organizers, cabinet risers, pull-outs, bins, cleaning caddies, door clearance.
- `/guides/small-bathroom/` - slim hampers, over-toilet storage, narrow cabinets, low-ceiling bathroom storage, compact drying.
- `/guides/entryway-shoes/` - narrow shoe racks, shallow benches, over-door hooks, tiny landing zones.
- `/guides/bedroom-tight-spaces/` - narrow nightstands, side tables, under-bed storage, compact wardrobes.
- `/guides/laundry-corners/` - slim hampers, collapsible drying racks, rolling sorters, washer-gap storage.
- `/guides/tiny-desks/` - compact desks, corner desks, wall-leaning desks, shallow workstations.
- `/guides/vertical-storage/` - over-door, behind-door, tall narrow shelves, hooks, vertical organizers.
- `/guides/low-clearance-storage/` - under-bed bins, sofa-clearance boxes, low-profile rolling storage.
- `/guides/measurement-guides/` - how to measure awkward spaces before buying.

The site uses a tiny static generator:

- Source HTML lives in `/src/pages/` and `/src/kits/`.
- Shared CSS and JS live in `/assets/`.
- The build output lives in `/docs/`.
- GitHub Pages should publish `/docs/`.
- Category pages and `sitemap.xml` are generated automatically.

## Current Published Pages

| Status | Page | Current URL | Primary intent |
| --- | --- | --- | --- |
| published | Home | `/` | fit-first shopping portal |
| published | All guides | `/guides/` | guide directory |
| published | Narrow Kitchen category | `/guides/narrow-kitchen/` | narrow kitchen product hub |
| published | Under-Sink & Cabinets category | `/guides/under-sink-cabinets/` | cabinet fit hub |
| published | Small Bathroom category | `/guides/small-bathroom/` | tight bathroom product hub |
| published | Entryway & Shoes category | `/guides/entryway-shoes/` | narrow entry storage hub |
| published | Bedroom Tight Spaces category | `/guides/bedroom-tight-spaces/` | bedroom furniture fit hub |
| published | Laundry Corners category | `/guides/laundry-corners/` | laundry gap and drying hub |
| published | Tiny Desks category | `/guides/tiny-desks/` | compact workspace hub |
| published | Over-Door & Vertical Storage category | `/guides/vertical-storage/` | vertical storage hub |
| published | Low-Clearance Storage category | `/guides/low-clearance-storage/` | low height storage hub |
| published | Measurement Guides category | `/guides/measurement-guides/` | measuring decision hub |
| published | About | `/about/` | trust and positioning |
| published | Affiliate disclosure | `/affiliate-disclosure/` | Amazon disclosure |
| published | Privacy | `/privacy/` | basic privacy |
| published | Contact/request placeholder | `/contact/` | future requests |

## Priority Pages

| Status | Category | Page title | Suggested URL | Long-tail targets | Product types |
| --- | --- | --- | --- | --- | --- |
| published | Narrow Kitchen | Narrow Trash Can Under 10 Inches Wide | `/guides/narrow-kitchen/narrow-trash-can-under-10-inches/` | narrow trash can under 10 inches wide; slim kitchen trash can for narrow space; small trash can beside cabinet | slim rectangular cans, butterfly-lid cans, under-sink cans |
| published | Bedroom Tight Spaces | Nightstand Under 12 Inches Wide | `/guides/bedroom-tight-spaces/nightstand-under-12-inches-wide/` | nightstand under 12 inches wide; narrow bedside table for small room; slim nightstand with drawer | narrow nightstands, C-tables, wall shelves |
| published | Under-Sink & Cabinets | Under Sink Organizer Around Pipes | `/guides/under-sink-cabinets/under-sink-organizer-around-pipes/` | under sink organizer around pipes; under sink storage with plumbing; organizer for sink cabinet with pipes | adjustable under-sink shelves, caddies, bins |
| published | Entryway & Shoes | Shoe Rack for Narrow Entryway | `/guides/entryway-shoes/shoe-rack-for-narrow-entryway/` | shoe rack for narrow entryway; slim shoe storage for hallway; shallow shoe rack by front door | narrow racks, vertical racks, shoe benches |
| published | Small Bathroom | Slim Laundry Hamper for Small Bathroom | `/guides/small-bathroom/slim-laundry-hamper-small-bathroom/` | slim laundry hamper for small bathroom; narrow hamper under 10 inches; skinny laundry basket bathroom | slim hampers, rolling hampers, lidded hampers |
| published | Small Bathroom | Over Toilet Storage for Low Ceiling Bathroom | `/guides/small-bathroom/over-toilet-storage-low-ceiling/` | over toilet storage for low ceiling bathroom; short over toilet shelf; bathroom storage low clearance | low over-toilet shelves, ladder shelves, wall-leaning storage |
| planned | Laundry Corners | Drying Rack for Small Apartment | `/guides/laundry-corners/drying-rack-small-apartment/` | drying rack for small apartment; foldable drying rack small space; compact clothes drying rack | foldable racks, over-door racks, wall-leaning racks |
| planned | Tiny Desks | Compact Desk for Bedroom Corner | `/guides/tiny-desks/compact-desk-bedroom-corner/` | compact desk for bedroom corner; small desk for corner of bedroom; narrow desk under 32 inches | compact desks, corner desks, laptop desks |
| published | Narrow Kitchen | Rolling Cart That Fits Beside Fridge | `/guides/narrow-kitchen/rolling-cart-beside-fridge/` | rolling cart that fits beside fridge; slim cart between fridge and wall; narrow kitchen rolling cart | slim rolling carts, magnetic shelves, narrow pantry carts |
| planned | Low-Clearance Storage | Storage Bins for Under Bed Low Clearance | `/guides/low-clearance-storage/under-bed-storage-bins-low-clearance/` | storage bins for under bed low clearance; under bed bins under 6 inches; low profile underbed storage | low bins, fabric bags, rolling drawers |
| published | Narrow Kitchen | Small Pantry Cabinet for Tiny Kitchen | `/guides/narrow-kitchen/small-pantry-cabinet-tiny-kitchen/` | small pantry cabinet for tiny kitchen; narrow pantry cabinet shallow depth; freestanding pantry under 18 inches wide | slim pantry cabinets, tall narrow shelves |
| published | Bedroom Tight Spaces | Narrow Side Table for Couch | `/guides/bedroom-tight-spaces/narrow-side-table-for-couch/` | narrow side table for couch; slim end table under 10 inches; skinny table beside sofa | C-tables, skinny end tables |
| published | Under-Sink & Cabinets | Cabinet Risers for Shallow Cabinets | `/guides/under-sink-cabinets/cabinet-risers-shallow-cabinets/` | cabinet risers for shallow cabinets; small cabinet shelf risers; narrow cabinet organizer shelves | risers, tier shelves, stackable shelves |
| published | Measurement Guides | How to Measure a Narrow Gap Before Buying Storage | `/guides/measurement-guides/measure-narrow-gap-storage/` | how to measure narrow gap for storage; measure gap beside fridge; buying storage for awkward gap | tape measures, painter tape, gap templates |

## 100+ Article Ideas

| # | Status | Category | Page title | Suggested URL | Long-tail targets | Product types |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | published | Narrow Kitchen | Narrow Trash Can Under 10 Inches Wide | `/guides/narrow-kitchen/narrow-trash-can-under-10-inches/` | narrow trash can under 10 inches wide; slim kitchen trash can narrow gap | slim trash cans |
| 2 | published | Bedroom Tight Spaces | Nightstand Under 12 Inches Wide | `/guides/bedroom-tight-spaces/nightstand-under-12-inches-wide/` | nightstand under 12 inches wide; narrow bedside table | slim nightstands |
| 3 | published | Under-Sink & Cabinets | Under Sink Organizer Around Pipes | `/guides/under-sink-cabinets/under-sink-organizer-around-pipes/` | under sink organizer around pipes; under sink storage with plumbing | under-sink organizers |
| 4 | planned | Entryway & Shoes | Shoe Rack for Narrow Entryway | `/guides/entryway-shoes/shoe-rack-for-narrow-entryway/` | shoe rack for narrow entryway; slim hallway shoe storage | shoe racks |
| 5 | planned | Small Bathroom | Slim Laundry Hamper for Small Bathroom | `/guides/small-bathroom/slim-laundry-hamper-small-bathroom/` | slim laundry hamper small bathroom; narrow hamper under 10 inches | slim hampers |
| 6 | planned | Small Bathroom | Over Toilet Storage for Low Ceiling Bathroom | `/guides/small-bathroom/over-toilet-storage-low-ceiling/` | over toilet storage low ceiling bathroom; short toilet shelf | over-toilet shelves |
| 7 | planned | Laundry Corners | Drying Rack for Small Apartment | `/guides/laundry-corners/drying-rack-small-apartment/` | drying rack for small apartment; compact clothes drying rack | foldable drying racks |
| 8 | planned | Tiny Desks | Compact Desk for Bedroom Corner | `/guides/tiny-desks/compact-desk-bedroom-corner/` | compact desk bedroom corner; small corner desk bedroom | compact desks |
| 9 | published | Narrow Kitchen | Rolling Cart That Fits Beside Fridge | `/guides/narrow-kitchen/rolling-cart-beside-fridge/` | rolling cart fits beside fridge; slim cart between fridge and wall | rolling carts |
| 10 | planned | Low-Clearance Storage | Storage Bins for Under Bed Low Clearance | `/guides/low-clearance-storage/under-bed-storage-bins-low-clearance/` | storage bins under bed low clearance; under bed bins under 6 inches | low bins |
| 11 | published | Narrow Kitchen | Small Pantry Cabinet for Tiny Kitchen | `/guides/narrow-kitchen/small-pantry-cabinet-tiny-kitchen/` | small pantry cabinet tiny kitchen; narrow freestanding pantry | pantry cabinets |
| 12 | published | Bedroom Tight Spaces | Narrow Side Table for Couch | `/guides/bedroom-tight-spaces/narrow-side-table-for-couch/` | narrow side table for couch; skinny end table | side tables |
| 13 | published | Under-Sink & Cabinets | Cabinet Risers for Shallow Cabinets | `/guides/under-sink-cabinets/cabinet-risers-shallow-cabinets/` | cabinet risers shallow cabinets; small cabinet shelf risers | cabinet risers |
| 14 | next | Measurement Guides | How to Measure a Narrow Gap Before Buying Storage | `/guides/measurement-guides/measure-narrow-gap-storage/` | measure narrow gap for storage; measure gap beside fridge | tape measures |
| 15 | planned | Narrow Kitchen | Slim Recycling Bin for Tiny Kitchen | `/guides/narrow-kitchen/slim-recycling-bin-tiny-kitchen/` | slim recycling bin tiny kitchen; narrow recycling bin | recycling bins |
| 16 | planned | Narrow Kitchen | Narrow Kitchen Shelf Under 8 Inches Deep | `/guides/narrow-kitchen/narrow-kitchen-shelf-under-8-inches-deep/` | narrow kitchen shelf under 8 inches deep; shallow kitchen shelf | narrow shelves |
| 17 | planned | Narrow Kitchen | Magnetic Spice Rack for Fridge Side | `/guides/narrow-kitchen/magnetic-spice-rack-fridge-side/` | magnetic spice rack fridge side; spice storage for tiny kitchen | magnetic racks |
| 18 | planned | Narrow Kitchen | Slim Dish Drying Rack for Tiny Counter | `/guides/narrow-kitchen/slim-dish-drying-rack-tiny-counter/` | slim dish drying rack tiny counter; narrow dish rack | dish racks |
| 19 | planned | Narrow Kitchen | Narrow Microwave Stand for Small Kitchen | `/guides/narrow-kitchen/narrow-microwave-stand-small-kitchen/` | narrow microwave stand small kitchen; microwave cart shallow depth | microwave stands |
| 20 | planned | Narrow Kitchen | Pull-Out Cabinet Organizer for Narrow Base Cabinet | `/guides/narrow-kitchen/pull-out-organizer-narrow-base-cabinet/` | pull out organizer narrow base cabinet; narrow cabinet pull out shelf | pull-out shelves |
| 21 | planned | Narrow Kitchen | Skinny Kitchen Island Under 18 Inches Deep | `/guides/narrow-kitchen/skinny-kitchen-island-under-18-inches-deep/` | skinny kitchen island under 18 inches deep; narrow kitchen island | slim islands |
| 22 | planned | Narrow Kitchen | Trash Can for Under Sink Cabinet Door Clearance | `/guides/narrow-kitchen/trash-can-under-sink-door-clearance/` | trash can under sink cabinet door clearance; under sink trash can narrow | under-sink cans |
| 23 | planned | Narrow Kitchen | Narrow Bakeware Organizer for Cabinet | `/guides/narrow-kitchen/narrow-bakeware-organizer-cabinet/` | narrow bakeware organizer cabinet; vertical pan organizer small cabinet | pan organizers |
| 24 | planned | Narrow Kitchen | Small Coffee Station Shelf for Counter Corner | `/guides/narrow-kitchen/small-coffee-station-shelf-counter-corner/` | small coffee station shelf counter corner; compact coffee organizer | counter shelves |
| 25 | planned | Under-Sink & Cabinets | Under Sink Pull-Out Drawer Around Plumbing | `/guides/under-sink-cabinets/under-sink-pull-out-drawer-around-plumbing/` | under sink pull out drawer around plumbing; sink cabinet drawer organizer | pull-out drawers |
| 26 | planned | Under-Sink & Cabinets | Narrow Cleaning Caddy Under Sink | `/guides/under-sink-cabinets/narrow-cleaning-caddy-under-sink/` | narrow cleaning caddy under sink; slim cleaning supply caddy | caddies |
| 27 | planned | Under-Sink & Cabinets | Stackable Bins for Sink Cabinet | `/guides/under-sink-cabinets/stackable-bins-sink-cabinet/` | stackable bins sink cabinet; under sink bins around pipes | stackable bins |
| 28 | planned | Under-Sink & Cabinets | Under Sink Organizer for Double Sink Plumbing | `/guides/under-sink-cabinets/under-sink-organizer-double-sink-plumbing/` | under sink organizer double sink plumbing; two pipe under sink storage | split organizers |
| 29 | planned | Under-Sink & Cabinets | Door Mounted Organizer for Sink Cabinet | `/guides/under-sink-cabinets/door-mounted-organizer-sink-cabinet/` | door mounted organizer sink cabinet; sink cabinet door rack clearance | door racks |
| 30 | planned | Under-Sink & Cabinets | Lazy Susan for Corner Cabinet With Pipe Clearance | `/guides/under-sink-cabinets/lazy-susan-corner-cabinet-pipe-clearance/` | lazy susan corner cabinet pipe clearance; turntable under sink | turntables |
| 31 | planned | Under-Sink & Cabinets | Expandable Shelf for Under Sink Pipes | `/guides/under-sink-cabinets/expandable-shelf-under-sink-pipes/` | expandable shelf under sink pipes; adjustable under sink shelf | expandable shelves |
| 32 | planned | Under-Sink & Cabinets | Shallow Drawer Organizers for Bathroom Vanity | `/guides/under-sink-cabinets/shallow-drawer-organizers-bathroom-vanity/` | shallow drawer organizers bathroom vanity; low drawer bathroom organizer | drawer trays |
| 33 | planned | Under-Sink & Cabinets | Narrow Cabinet Trash Bag Organizer | `/guides/under-sink-cabinets/narrow-cabinet-trash-bag-organizer/` | narrow cabinet trash bag organizer; trash bag holder under sink | bag organizers |
| 34 | planned | Under-Sink & Cabinets | Under Sink Mat That Fits Around Pipes | `/guides/under-sink-cabinets/under-sink-mat-fits-around-pipes/` | under sink mat fits around pipes; sink cabinet liner pipe cutout | sink mats |
| 35 | planned | Small Bathroom | Narrow Bathroom Cabinet Under 12 Inches Deep | `/guides/small-bathroom/narrow-bathroom-cabinet-under-12-inches-deep/` | narrow bathroom cabinet under 12 inches deep; shallow bathroom storage | slim cabinets |
| 36 | planned | Small Bathroom | Slim Toilet Paper Storage for Tiny Bathroom | `/guides/small-bathroom/slim-toilet-paper-storage-tiny-bathroom/` | slim toilet paper storage tiny bathroom; narrow toilet paper holder | TP storage |
| 37 | planned | Small Bathroom | Corner Shelf for Small Shower | `/guides/small-bathroom/corner-shelf-small-shower/` | corner shelf small shower; narrow shower caddy | shower shelves |
| 38 | planned | Small Bathroom | Over Door Towel Rack for Small Bathroom | `/guides/small-bathroom/over-door-towel-rack-small-bathroom/` | over door towel rack small bathroom; towel storage no wall space | towel racks |
| 39 | planned | Small Bathroom | Narrow Medicine Cabinet Organizer | `/guides/small-bathroom/narrow-medicine-cabinet-organizer/` | narrow medicine cabinet organizer; small bathroom cabinet bins | small bins |
| 40 | planned | Small Bathroom | Small Bathroom Rolling Cart Under 7 Inches Wide | `/guides/small-bathroom/rolling-cart-under-7-inches-wide/` | bathroom rolling cart under 7 inches wide; slim bathroom cart | slim carts |
| 41 | planned | Small Bathroom | Shower Stool for Narrow Tub | `/guides/small-bathroom/shower-stool-narrow-tub/` | shower stool narrow tub; compact shower seat | shower stools |
| 42 | planned | Small Bathroom | Pedestal Sink Storage That Fits Around Base | `/guides/small-bathroom/pedestal-sink-storage-around-base/` | pedestal sink storage around base; under pedestal sink organizer | pedestal organizers |
| 43 | planned | Small Bathroom | Toothbrush Organizer for Tiny Sink Ledge | `/guides/small-bathroom/toothbrush-organizer-tiny-sink-ledge/` | toothbrush organizer tiny sink ledge; narrow bathroom counter organizer | toothbrush holders |
| 44 | planned | Small Bathroom | Small Bathroom Trash Can Under 8 Inches Wide | `/guides/small-bathroom/trash-can-under-8-inches-wide/` | small bathroom trash can under 8 inches wide; skinny bathroom trash can | slim bins |
| 45 | planned | Entryway & Shoes | Shoe Cabinet Under 10 Inches Deep | `/guides/entryway-shoes/shoe-cabinet-under-10-inches-deep/` | shoe cabinet under 10 inches deep; shallow shoe cabinet | shoe cabinets |
| 46 | planned | Entryway & Shoes | Vertical Shoe Rack for Narrow Hallway | `/guides/entryway-shoes/vertical-shoe-rack-narrow-hallway/` | vertical shoe rack narrow hallway; tall skinny shoe rack | vertical racks |
| 47 | planned | Entryway & Shoes | Narrow Entryway Bench With Shoe Storage | `/guides/entryway-shoes/narrow-entryway-bench-shoe-storage/` | narrow entryway bench with shoe storage; slim shoe bench | shoe benches |
| 48 | planned | Entryway & Shoes | Over Door Shoe Organizer for Small Closet | `/guides/entryway-shoes/over-door-shoe-organizer-small-closet/` | over door shoe organizer small closet; shoe storage behind door | over-door organizers |
| 49 | planned | Entryway & Shoes | Key Table Under 8 Inches Deep | `/guides/entryway-shoes/key-table-under-8-inches-deep/` | key table under 8 inches deep; narrow entry table | slim tables |
| 50 | planned | Entryway & Shoes | Coat Rack for Narrow Entryway | `/guides/entryway-shoes/coat-rack-narrow-entryway/` | coat rack for narrow entryway; skinny coat stand | coat racks |
| 51 | planned | Entryway & Shoes | Umbrella Stand for Tiny Entry | `/guides/entryway-shoes/umbrella-stand-tiny-entry/` | umbrella stand tiny entry; narrow umbrella holder | umbrella stands |
| 52 | planned | Entryway & Shoes | Mudroom Storage for No Mudroom Entry | `/guides/entryway-shoes/mudroom-storage-no-mudroom-entry/` | mudroom storage no mudroom entry; small entry landing zone | entry storage |
| 53 | planned | Entryway & Shoes | Boot Tray for Narrow Hallway | `/guides/entryway-shoes/boot-tray-narrow-hallway/` | boot tray narrow hallway; slim boot mat | boot trays |
| 54 | planned | Entryway & Shoes | Wall Hook Alternative for Narrow Entry | `/guides/entryway-shoes/wall-hook-alternative-narrow-entry/` | wall hook alternative narrow entry; freestanding entry hooks | hook racks |
| 55 | planned | Bedroom Tight Spaces | Narrow Dresser Under 24 Inches Wide | `/guides/bedroom-tight-spaces/narrow-dresser-under-24-inches-wide/` | narrow dresser under 24 inches wide; skinny bedroom dresser | narrow dressers |
| 56 | planned | Bedroom Tight Spaces | Bedside Shelf for No Nightstand Space | `/guides/bedroom-tight-spaces/bedside-shelf-no-nightstand-space/` | bedside shelf no nightstand space; clip on bedside shelf | bedside shelves |
| 57 | planned | Bedroom Tight Spaces | Wardrobe for Bedroom Without Closet | `/guides/bedroom-tight-spaces/wardrobe-bedroom-without-closet/` | wardrobe for bedroom without closet; narrow freestanding wardrobe | wardrobes |
| 58 | planned | Bedroom Tight Spaces | Bed Frame With Storage for Low Ceiling Room | `/guides/bedroom-tight-spaces/bed-frame-storage-low-ceiling-room/` | bed frame with storage low ceiling room; storage bed clearance | storage beds |
| 59 | planned | Bedroom Tight Spaces | Narrow Bookshelf Beside Bed | `/guides/bedroom-tight-spaces/narrow-bookshelf-beside-bed/` | narrow bookshelf beside bed; slim bedroom bookcase | bookshelves |
| 60 | planned | Bedroom Tight Spaces | Small Vanity Desk for Tight Bedroom | `/guides/bedroom-tight-spaces/small-vanity-desk-tight-bedroom/` | small vanity desk tight bedroom; narrow vanity table | vanity desks |
| 61 | planned | Bedroom Tight Spaces | Laundry Basket That Fits in Closet Corner | `/guides/bedroom-tight-spaces/laundry-basket-closet-corner/` | laundry basket closet corner; slim bedroom hamper | hampers |
| 62 | planned | Bedroom Tight Spaces | Narrow Bedside Charging Table | `/guides/bedroom-tight-spaces/narrow-bedside-charging-table/` | narrow bedside charging table; slim nightstand with outlet shelf | charging tables |
| 63 | planned | Bedroom Tight Spaces | Storage Ottoman for End of Bed Clearance | `/guides/bedroom-tight-spaces/storage-ottoman-end-bed-clearance/` | storage ottoman end of bed clearance; narrow bedroom bench | ottomans |
| 64 | planned | Bedroom Tight Spaces | Compact Makeup Organizer for Small Dresser | `/guides/bedroom-tight-spaces/compact-makeup-organizer-small-dresser/` | compact makeup organizer small dresser; narrow vanity organizer | makeup organizers |
| 65 | planned | Laundry Corners | Slim Laundry Sorter for Closet Gap | `/guides/laundry-corners/slim-laundry-sorter-closet-gap/` | slim laundry sorter closet gap; narrow laundry sorter | laundry sorters |
| 66 | planned | Laundry Corners | Rolling Laundry Cart Between Washer and Wall | `/guides/laundry-corners/rolling-laundry-cart-between-washer-wall/` | rolling laundry cart between washer and wall; slim laundry cart | laundry carts |
| 67 | planned | Laundry Corners | Over Washer Shelf for Low Clearance | `/guides/laundry-corners/over-washer-shelf-low-clearance/` | over washer shelf low clearance; short laundry shelf | washer shelves |
| 68 | planned | Laundry Corners | Foldable Ironing Board for Small Closet | `/guides/laundry-corners/foldable-ironing-board-small-closet/` | foldable ironing board small closet; compact ironing board | ironing boards |
| 69 | planned | Laundry Corners | Drying Rack Over Bathtub | `/guides/laundry-corners/drying-rack-over-bathtub/` | drying rack over bathtub; bathtub clothes drying rack | bathtub racks |
| 70 | planned | Laundry Corners | Wall Leaning Drying Rack for Narrow Hall | `/guides/laundry-corners/wall-leaning-drying-rack-narrow-hall/` | wall leaning drying rack narrow hall; slim foldable drying rack | leaning racks |
| 71 | planned | Laundry Corners | Laundry Shelf for Utility Closet | `/guides/laundry-corners/laundry-shelf-utility-closet/` | laundry shelf utility closet; narrow laundry storage shelf | utility shelves |
| 72 | planned | Laundry Corners | Compact Detergent Organizer for Shelf | `/guides/laundry-corners/compact-detergent-organizer-shelf/` | compact detergent organizer shelf; laundry bottle organizer | bottle trays |
| 73 | planned | Laundry Corners | Hamper With Wheels for Narrow Bathroom | `/guides/laundry-corners/hamper-with-wheels-narrow-bathroom/` | hamper with wheels narrow bathroom; slim rolling hamper | rolling hampers |
| 74 | planned | Laundry Corners | Stackable Laundry Baskets for Small Closet | `/guides/laundry-corners/stackable-laundry-baskets-small-closet/` | stackable laundry baskets small closet; vertical laundry basket storage | stackable baskets |
| 75 | planned | Tiny Desks | Desk Under 30 Inches Wide | `/guides/tiny-desks/desk-under-30-inches-wide/` | desk under 30 inches wide; compact desk small bedroom | small desks |
| 76 | planned | Tiny Desks | Shallow Desk Under 18 Inches Deep | `/guides/tiny-desks/shallow-desk-under-18-inches-deep/` | shallow desk under 18 inches deep; narrow depth desk | shallow desks |
| 77 | planned | Tiny Desks | Ladder Desk for Small Room | `/guides/tiny-desks/ladder-desk-small-room/` | ladder desk small room; wall leaning desk | ladder desks |
| 78 | planned | Tiny Desks | Folding Desk for Bedroom Corner | `/guides/tiny-desks/folding-desk-bedroom-corner/` | folding desk bedroom corner; collapsible desk small space | folding desks |
| 79 | planned | Tiny Desks | Corner Desk Under 36 Inches | `/guides/tiny-desks/corner-desk-under-36-inches/` | corner desk under 36 inches; small corner computer desk | corner desks |
| 80 | planned | Tiny Desks | Desk Chair for Narrow Desk Clearance | `/guides/tiny-desks/desk-chair-narrow-desk-clearance/` | desk chair narrow desk clearance; chair for shallow desk | compact chairs |
| 81 | planned | Tiny Desks | Monitor Stand for Small Desk | `/guides/tiny-desks/monitor-stand-small-desk/` | monitor stand small desk; compact monitor riser | monitor stands |
| 82 | planned | Tiny Desks | Printer Stand Under Desk Small Space | `/guides/tiny-desks/printer-stand-under-desk-small-space/` | printer stand under desk small space; compact printer cart | printer stands |
| 83 | planned | Tiny Desks | Cable Tray for Small Desk Without Drilling | `/guides/tiny-desks/cable-tray-small-desk/` | cable tray small desk; under desk cable organizer compact | cable trays |
| 84 | planned | Tiny Desks | Desk Lamp for Narrow Desk | `/guides/tiny-desks/desk-lamp-narrow-desk/` | desk lamp narrow desk; clamp lamp small desk | clamp lamps |
| 85 | planned | Vertical Storage | Over Door Hooks for Thick Door | `/guides/vertical-storage/over-door-hooks-thick-door/` | over door hooks for thick door; over door rack door clearance | over-door hooks |
| 86 | planned | Vertical Storage | Behind Door Storage Rack Narrow Clearance | `/guides/vertical-storage/behind-door-storage-rack-narrow-clearance/` | behind door storage rack narrow clearance; door rack fits behind door | behind-door racks |
| 87 | planned | Vertical Storage | Tall Narrow Shelf Under 12 Inches Wide | `/guides/vertical-storage/tall-narrow-shelf-under-12-inches-wide/` | tall narrow shelf under 12 inches wide; skinny storage shelf | tall shelves |
| 88 | planned | Vertical Storage | Over Door Pantry Rack Door Clearance | `/guides/vertical-storage/over-door-pantry-rack-door-clearance/` | over door pantry rack door clearance; pantry rack thick door | pantry racks |
| 89 | planned | Vertical Storage | Over Door Mirror With Hook Clearance | `/guides/vertical-storage/over-door-mirror-hook-clearance/` | over door mirror hook clearance; mirror for narrow door | door mirrors |
| 90 | planned | Vertical Storage | Vertical Broom Holder for Narrow Closet | `/guides/vertical-storage/vertical-broom-holder-narrow-closet/` | vertical broom holder narrow closet; broom storage small closet | broom holders |
| 91 | planned | Vertical Storage | Tall Bathroom Shelf Behind Door | `/guides/vertical-storage/tall-bathroom-shelf-behind-door/` | tall bathroom shelf behind door; narrow shelf behind bathroom door | slim shelves |
| 92 | planned | Vertical Storage | Over Door Towel Hooks That Let Door Close | `/guides/vertical-storage/over-door-towel-hooks-door-close/` | over door towel hooks that let door close; low profile over door hooks | low hooks |
| 93 | planned | Vertical Storage | Pegboard Alternative for Narrow Utility Space | `/guides/vertical-storage/pegboard-alternative-narrow-utility-space/` | pegboard alternative narrow utility space; vertical utility organizer | utility organizers |
| 94 | planned | Vertical Storage | Tall Narrow Toy Storage for Small Room | `/guides/vertical-storage/tall-narrow-toy-storage-small-room/` | tall narrow toy storage small room; vertical toy organizer | toy storage |
| 95 | planned | Low-Clearance Storage | Under Sofa Storage Boxes Low Clearance | `/guides/low-clearance-storage/under-sofa-storage-boxes-low-clearance/` | under sofa storage boxes low clearance; low profile storage under couch | low boxes |
| 96 | planned | Low-Clearance Storage | Under Crib Storage Bins Low Clearance | `/guides/low-clearance-storage/under-crib-storage-bins-low-clearance/` | under crib storage bins low clearance; low under crib storage | low bins |
| 97 | planned | Low-Clearance Storage | Rolling Under Bed Drawers for Carpet | `/guides/low-clearance-storage/rolling-under-bed-drawers-carpet/` | rolling under bed drawers carpet; under bed wheels on carpet | rolling drawers |
| 98 | planned | Low-Clearance Storage | Flat Holiday Storage Under Bed | `/guides/low-clearance-storage/flat-holiday-storage-under-bed/` | flat holiday storage under bed; low ornament storage box | holiday bins |
| 99 | planned | Low-Clearance Storage | Low Profile Shoe Storage Under Bed | `/guides/low-clearance-storage/low-profile-shoe-storage-under-bed/` | low profile shoe storage under bed; under bed shoe organizer low clearance | shoe bins |
| 100 | planned | Low-Clearance Storage | Under Bed Drawer Clearance for Platform Beds | `/guides/low-clearance-storage/under-bed-drawer-clearance-platform-beds/` | under bed drawer clearance platform bed; storage for low platform bed | drawers |
| 101 | planned | Measurement Guides | How to Measure Door Swing Before Buying Furniture | `/guides/measurement-guides/measure-door-swing-furniture/` | measure door swing before buying furniture; door clearance furniture | tape measures |
| 102 | planned | Measurement Guides | How to Measure Under Sink Around Pipes | `/guides/measurement-guides/measure-under-sink-around-pipes/` | measure under sink around pipes; under sink plumbing clearance | tape measures |
| 103 | planned | Measurement Guides | How Much Clearance Does a Trash Can Lid Need | `/guides/measurement-guides/trash-can-lid-clearance/` | trash can lid clearance; swing lid trash can height clearance | trash cans |
| 104 | planned | Measurement Guides | How to Measure Baseboard Depth for Shelves | `/guides/measurement-guides/measure-baseboard-depth-shelves/` | baseboard depth for shelves; shelf sits away from wall baseboard | shelves |
| 105 | planned | Measurement Guides | How to Measure Outlet Clearance Behind Furniture | `/guides/measurement-guides/measure-outlet-clearance-behind-furniture/` | outlet clearance behind furniture; furniture depth with plugs | outlet extenders |
| 106 | planned | Measurement Guides | How to Tape Out Furniture Before Buying | `/guides/measurement-guides/tape-out-furniture-before-buying/` | tape out furniture before buying; painter tape room layout | painter tape |
| 107 | planned | Measurement Guides | How to Measure Closet Depth for Storage Bins | `/guides/measurement-guides/measure-closet-depth-storage-bins/` | measure closet depth storage bins; closet shelf bin depth | bins |
| 108 | planned | Measurement Guides | How to Check If Over Door Hooks Will Fit | `/guides/measurement-guides/check-over-door-hooks-fit/` | check if over door hooks fit; over door hook door clearance | hooks |
| 109 | planned | Measurement Guides | How to Measure Hallway Clearance for Shoe Storage | `/guides/measurement-guides/measure-hallway-clearance-shoe-storage/` | hallway clearance shoe storage; narrow entryway walkway width | shoe racks |
| 110 | planned | Measurement Guides | How to Measure Under Bed Clearance Correctly | `/guides/measurement-guides/measure-under-bed-clearance/` | measure under bed clearance; under bed storage height | low bins |

## Content Selection Rules

When choosing the next page, prefer topics that meet at least four criteria:

- The searcher has a clear physical constraint.
- The page can recommend 4-8 Amazon product types naturally.
- The article can say exactly what to measure.
- There is a meaningful `skip if` warning.
- The page can become 3 Pinterest pins around measurement mistakes.
- The page can internally link to at least 2 related guides or category hubs.

Avoid pages that are mostly style inspiration, generic decluttering, broad decor, or general home organization without a measurable fit constraint.

## Future Promotion Notes

For every new page, create:

- 1 Reddit-style helpful answer that can be posted manually with disclosure if linking.
- 3 Pinterest pin titles.
- 1 short meta description.
- 3 internal links to related pages.

Promotion angles:

- "Measure this before buying" beats "best organizers."
- "Fits if / skip if" builds trust.
- "Avoid returns" is the practical hook.
- Pins should visualize width, depth, height, door swing, pipe clearance, or low clearance.
