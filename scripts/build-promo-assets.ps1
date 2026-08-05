Add-Type -AssemblyName System.Drawing

$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")
$PromoRoot = Join-Path $Root "promo"
$BaseUrl = "https://doesitfithere.com"

function New-Dir($Path) {
  if (-not (Test-Path $Path)) {
    New-Item -ItemType Directory -Path $Path | Out-Null
  }
}

function Escape-Csv($Value) {
  $Text = [string]$Value
  '"' + $Text.Replace('"', '""') + '"'
}

function Add-TrackingUrl($Url, $Slug, $PinFile) {
  $Content = ($PinFile -replace '\.png$', '') -replace '[^a-zA-Z0-9_-]', '-'
  $Separator = "?"
  if ($Url.Contains("?")) { $Separator = "&" }
  return "$Url$Separator" + "utm_source=pinterest&utm_medium=social&utm_campaign=bulk_promo&utm_content=$Slug-$Content"
}

function Get-PinKey($Slug, $PinFile) {
  $Content = ($PinFile -replace '\.png$', '') -replace '[^a-zA-Z0-9_-]', '-'
  return "$Slug/$Content"
}

function New-PinterestCsvRow($Title, $MediaUrl, $Board, $Description, $DestinationUrl, $PublishDate, $Keywords) {
  return ((Escape-Csv $Title), (Escape-Csv $MediaUrl), (Escape-Csv $Board), "", (Escape-Csv $Description), (Escape-Csv $DestinationUrl), (Escape-Csv $PublishDate), (Escape-Csv $Keywords) -join ",")
}

function New-LedgerCsvRow($PinKey, $ArticleSlug, $PinFile, $Title, $Board, $MediaUrl, $DestinationUrl, $PublishDate, $Status, $PinterestUrl, $Notes) {
  return ((Escape-Csv $PinKey), (Escape-Csv $ArticleSlug), (Escape-Csv $PinFile), (Escape-Csv $Title), (Escape-Csv $Board), (Escape-Csv $MediaUrl), (Escape-Csv $DestinationUrl), (Escape-Csv $PublishDate), (Escape-Csv $Status), (Escape-Csv $PinterestUrl), (Escape-Csv $Notes) -join ",")
}

function New-Brush($Hex) {
  $Color = [System.Drawing.ColorTranslator]::FromHtml($Hex)
  New-Object System.Drawing.SolidBrush($Color)
}

function Add-RoundedRect($Graphics, $Brush, $X, $Y, $W, $H, $R) {
  $Path = New-Object System.Drawing.Drawing2D.GraphicsPath
  $D = $R * 2
  $Path.AddArc($X, $Y, $D, $D, 180, 90)
  $Path.AddArc($X + $W - $D, $Y, $D, $D, 270, 90)
  $Path.AddArc($X + $W - $D, $Y + $H - $D, $D, $D, 0, 90)
  $Path.AddArc($X, $Y + $H - $D, $D, $D, 90, 90)
  $Path.CloseFigure()
  $Graphics.FillPath($Brush, $Path)
  $Path.Dispose()
}

function Draw-WrappedText($Graphics, $Text, $Font, $Brush, $X, $Y, $MaxWidth, $LineHeight) {
  $Words = ([string]$Text).Split(" ")
  $Line = ""
  $CurrentY = $Y
  foreach ($Word in $Words) {
    $Candidate = if ($Line.Length) { "$Line $Word" } else { $Word }
    $Size = $Graphics.MeasureString($Candidate, $Font)
    if ($Size.Width -gt $MaxWidth -and $Line.Length) {
      $Graphics.DrawString($Line, $Font, $Brush, $X, $CurrentY)
      $CurrentY += $LineHeight
      $Line = $Word
    } else {
      $Line = $Candidate
    }
  }
  if ($Line.Length) {
    $Graphics.DrawString($Line, $Font, $Brush, $X, $CurrentY)
    $CurrentY += $LineHeight
  }
  return $CurrentY
}

function Draw-Pin($Pin, $Article, $OutPath) {
  $W = 1000
  $H = 1500
  $Bitmap = New-Object System.Drawing.Bitmap($W, $H)
  $Graphics = [System.Drawing.Graphics]::FromImage($Bitmap)
  $Graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $Graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

  $Bg = New-Brush $Pin.Bg
  $Ink = New-Brush "#20231f"
  $Muted = New-Brush "#62685f"
  $Panel = New-Brush "#fbfaf6"
  $Accent = New-Brush $Pin.Accent
  $White = New-Brush "#ffffff"

  $Graphics.FillRectangle($Bg, 0, 0, $W, $H)
  Add-RoundedRect $Graphics $Panel 70 86 860 1228 34
  Add-RoundedRect $Graphics $Accent 116 150 220 54 18
  Add-RoundedRect $Graphics $Accent 120 880 760 4 2
  Add-RoundedRect $Graphics $Ink 120 1140 500 84 24
  Add-RoundedRect $Graphics $White 758 1130 124 124 24

  $BrandFont = New-Object System.Drawing.Font("Segoe UI", 25, [System.Drawing.FontStyle]::Bold)
  $PillFont = New-Object System.Drawing.Font("Segoe UI", 23, [System.Drawing.FontStyle]::Bold)
  $TitleFont = New-Object System.Drawing.Font("Segoe UI", 67, [System.Drawing.FontStyle]::Bold)
  $SubFont = New-Object System.Drawing.Font("Segoe UI", 34, [System.Drawing.FontStyle]::Regular)
  $BulletFont = New-Object System.Drawing.Font("Segoe UI", 30, [System.Drawing.FontStyle]::Bold)
  $SmallFont = New-Object System.Drawing.Font("Segoe UI", 24, [System.Drawing.FontStyle]::Regular)
  $LogoFont = New-Object System.Drawing.Font("Segoe UI", 58, [System.Drawing.FontStyle]::Bold)

  $Y = 145
  $Graphics.DrawString("Fits In My Space", $BrandFont, $Muted, 120, $Y)
  $Y += 82
  $Graphics.DrawString($Article.Category.ToUpperInvariant(), $PillFont, $White, 140, 160)
  $Y += 64
  $Y = Draw-WrappedText $Graphics $Pin.Title $TitleFont $Ink 120 $Y 760 78
  $Y += 34
  $Y = Draw-WrappedText $Graphics $Pin.Subtitle $SubFont $Muted 122 $Y 720 45
  $Y += 62
  foreach ($Bullet in $Pin.Bullets) {
    Add-RoundedRect $Graphics $Accent 124 ($Y + 9) 18 18 9
    $Y = Draw-WrappedText $Graphics $Bullet $BulletFont $Ink 164 $Y 670 40
    $Y += 28
  }

  $Graphics.DrawString("Read the fit guide", $BulletFont, $White, 154, 1161)
  $Graphics.DrawString("F", $LogoFont, $Accent, 805, 1147)
  $Graphics.DrawString("doesitfithere.com", $SmallFont, $Muted, 120, 1270)
  $Graphics.DrawString("#ad", $SmallFont, $Muted, 800, 1270)

  $Bitmap.Save($OutPath, [System.Drawing.Imaging.ImageFormat]::Png)

  $BrandFont.Dispose(); $PillFont.Dispose(); $TitleFont.Dispose(); $SubFont.Dispose()
  $BulletFont.Dispose(); $SmallFont.Dispose(); $LogoFont.Dispose()
  $Bg.Dispose(); $Ink.Dispose(); $Muted.Dispose(); $Panel.Dispose(); $Accent.Dispose(); $White.Dispose()
  $Graphics.Dispose(); $Bitmap.Dispose()
}

$Articles = @(
  [pscustomobject]@{ Slug="narrow-trash-can-under-10-inches"; Category="Narrow Kitchen"; Board="Narrow Kitchen Finds"; Url="$BaseUrl/guides/narrow-kitchen/narrow-trash-can-under-10-inches/"; Keywords="narrow trash can, slim trash can, under 10 inches wide, small kitchen"; VideoHook="Do not buy a slim trash can until you check lid swing."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Narrow Trash Can Under 10 Inches?"; Subtitle="Measure the gap, then check lid swing, pedal space, and bag removal."; Bullets=@("Straight sides beat round cans","Lid clearance matters","Leave room to pull it out"); Description="A fit-first guide to choosing a narrow trash can under 10 inches wide. This guide contains Amazon affiliate links. #ad"; Bg="#244c49"; Accent="#c85f46"},
    [pscustomobject]@{File="pin-02.png"; Title="The Inch That Ruins Slim Trash Cans"; Subtitle="A can can fit the gap and still fail when the lid opens."; Bullets=@("Check handles and trim","Measure overhead clearance","Skip tight pedal setups"); Description="Measure-first tips for slim kitchen trash cans in narrow gaps. #ad"; Bg="#e4aa3f"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Slim Trash Cans"; Subtitle="Use this checklist before ordering a narrow kitchen can."; Bullets=@("Fits if width has clearance","Skip if bag cannot lift out","Check the lid path"); Description="Narrow trash can buying guide with fit checks and Amazon search links. #ad"; Bg="#3d6788"; Accent="#c85f46"}
  )},
  [pscustomobject]@{ Slug="nightstand-under-12-inches-wide"; Category="Bedroom"; Board="Small Bedroom Furniture"; Url="$BaseUrl/guides/bedroom-tight-spaces/nightstand-under-12-inches-wide/"; Keywords="nightstand under 12 inches wide, narrow nightstand, small bedroom"; VideoHook="A tiny nightstand still needs room for the drawer."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Nightstand Under 12 Inches Wide"; Subtitle="Measure the bed gap, mattress height, outlet access, and drawer pull."; Bullets=@("Open shelves are safer","C-tables can work","Watch outlet depth"); Description="A fit-first guide to narrow nightstands and bedside tables under 12 inches wide. #ad"; Bg="#244c49"; Accent="#e4aa3f"},
    [pscustomobject]@{File="pin-02.png"; Title="No Room For A Nightstand?"; Subtitle="Try a wall shelf, C-table, or open skinny bedside table."; Bullets=@("Floor space optional","Match mattress height","Protect plug access"); Description="Small bedroom nightstand alternatives with measurement checks. #ad"; Bg="#c85f46"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Do Not Block The Outlet"; Subtitle="The best narrow nightstand still leaves room for cords and access."; Bullets=@("Measure plug depth","Check bedding overhang","Skip blocked drawers"); Description="Nightstand under 12 inches wide buying guide for tight bedrooms. #ad"; Bg="#3d6788"; Accent="#e4aa3f"}
  )},
  [pscustomobject]@{ Slug="under-sink-organizer-around-pipes"; Category="Under Sink"; Board="Under Sink Storage Ideas"; Url="$BaseUrl/guides/under-sink-cabinets/under-sink-organizer-around-pipes/"; Keywords="under sink organizer around pipes, sink cabinet storage, under sink organizer"; VideoHook="Your sink cabinet is not a rectangle. Map the pipes first."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Under Sink Organizer Around Pipes"; Subtitle="Measure pipe position before buying drawers, shelves, or bins."; Bullets=@("Map the P-trap","Keep valves reachable","Avoid solid backs"); Description="A measurement-first under-sink organizer guide with Amazon search links. #ad"; Bg="#244c49"; Accent="#c85f46"},
    [pscustomobject]@{File="pin-02.png"; Title="Why Under-Sink Drawers Fail"; Subtitle="A pull-out drawer only works if the full slide path is clear."; Bullets=@("Check hinges","Check disposal depth","Check door opening"); Description="Under-sink storage fit checks for cabinets with pipes and valves. #ad"; Bg="#e4aa3f"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Sink Storage"; Subtitle="Adjustable shelves, split organizers, caddies, or bins?"; Bullets=@("Adjust around pipes","Use smaller zones","Skip blocked tracks"); Description="Under sink organizer around pipes guide for awkward cabinets. #ad"; Bg="#3d6788"; Accent="#c85f46"}
  )},
  [pscustomobject]@{ Slug="shoe-rack-for-narrow-entryway"; Category="Entryway"; Board="Small Spaces That Actually Fit"; Url="$BaseUrl/guides/entryway-shoes/shoe-rack-for-narrow-entryway/"; Keywords="shoe rack for narrow entryway, slim shoe rack, hallway shoe storage"; VideoHook="Measure shoe overhang, not just the rack."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Shoe Rack For Narrow Entryway"; Subtitle="Protect the walkway, door swing, and shoe overhang."; Bullets=@("Depth matters most","Keep daily pairs only","Watch baseboards"); Description="A fit-first guide to narrow entryway shoe racks and slim shoe storage. #ad"; Bg="#244c49"; Accent="#e4aa3f"},
    [pscustomobject]@{File="pin-02.png"; Title="The Doorway Pile Has A Measurement"; Subtitle="Choose shallow, vertical, or tilt-front shoe storage by clearance."; Bullets=@("Check door swing","Measure shoe length","Skip bulky benches"); Description="Shoe rack ideas for narrow entryways with fits-if and skip-if notes. #ad"; Bg="#c85f46"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Shoe Storage"; Subtitle="A shoe rack can fit the wall and still block the hallway."; Bullets=@("Include shoe overhang","Leave walking room","Check tilt doors"); Description="Narrow entryway shoe rack buying guide with measurement checks. #ad"; Bg="#3d6788"; Accent="#e4aa3f"}
  )},
  [pscustomobject]@{ Slug="slim-laundry-hamper-small-bathroom"; Category="Bathroom"; Board="Tiny Bathroom Storage"; Url="$BaseUrl/guides/small-bathroom/slim-laundry-hamper-small-bathroom/"; Keywords="slim laundry hamper, small bathroom hamper, narrow hamper"; VideoHook="A full hamper is wider than an empty hamper."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Slim Hamper For Small Bathroom"; Subtitle="Measure the full hamper, lid path, handles, and walkway."; Bullets=@("Rigid shapes are predictable","Soft hampers can bulge","Door hooks need clearance"); Description="A fit-first guide to slim laundry hampers for small bathrooms. #ad"; Bg="#244c49"; Accent="#c85f46"},
    [pscustomobject]@{File="pin-02.png"; Title="Do Not Forget Hamper Bulge"; Subtitle="A narrow hamper can grow into your walkway when full."; Bullets=@("Check lid swing","Leave hand clearance","Avoid shower splash"); Description="Slim bathroom hamper buying tips with measurement checks. #ad"; Bg="#e4aa3f"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Bathroom Hampers"; Subtitle="Choose slim, rolling, hanging, or collapsible by the real space."; Bullets=@("Measure the corner","Check the door","Skip blocked lids"); Description="Small bathroom laundry hamper guide with Amazon search links. #ad"; Bg="#3d6788"; Accent="#c85f46"}
  )},
  [pscustomobject]@{ Slug="over-toilet-storage-low-ceiling"; Category="Bathroom"; Board="Tiny Bathroom Storage"; Url="$BaseUrl/guides/small-bathroom/over-toilet-storage-low-ceiling/"; Keywords="over toilet storage low ceiling, short over toilet shelf, small bathroom storage"; VideoHook="Over-toilet storage has to leave the tank usable."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Over-Toilet Storage, Low Ceiling?"; Subtitle="Measure height, tank lid clearance, flush handle, and shelf depth."; Bullets=@("Short shelves first","Keep tank access","Avoid head bumps"); Description="A fit-first guide to over-toilet storage for low ceiling bathrooms. #ad"; Bg="#244c49"; Accent="#e4aa3f"},
    [pscustomobject]@{File="pin-02.png"; Title="The Tank Lid Still Has To Open"; Subtitle="Do not buy bathroom storage that traps toilet access."; Bullets=@("Check bottom shelf height","Limit depth","Watch baseboards"); Description="Low ceiling bathroom storage ideas with measurement checks. #ad"; Bg="#c85f46"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Toilet Storage"; Subtitle="Short shelf, tank tray, side cabinet, or ladder shelf?"; Bullets=@("Measure ceiling height","Check flush handle","Skip deep shelves"); Description="Over-toilet storage buying guide for low clearance bathrooms. #ad"; Bg="#3d6788"; Accent="#e4aa3f"}
  )},
  [pscustomobject]@{ Slug="drying-rack-small-apartment"; Category="Laundry"; Board="Small Spaces That Actually Fit"; Url="$BaseUrl/guides/laundry-corners/drying-rack-small-apartment/"; Keywords="drying rack small apartment, compact drying rack, foldable drying rack"; VideoHook="A drying rack has two sizes: folded and open."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Drying Rack For Small Apartment"; Subtitle="Measure the open footprint before you fall for the folded size."; Bullets=@("Folded size is not enough","Door clearance matters","Leave airflow"); Description="A fit-first guide to drying racks for small apartment laundry. #ad"; Bg="#244c49"; Accent="#c85f46"},
    [pscustomobject]@{File="pin-02.png"; Title="Where Will It Open?"; Subtitle="Wing rack, tower rack, over-door rack, or tub rack?"; Bullets=@("Check the drying zone","Avoid blocked doors","Match your airflow"); Description="Compact clothes drying rack guide for small spaces. #ad"; Bg="#e4aa3f"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Drying Racks"; Subtitle="Choose by open footprint, not closet storage size."; Bullets=@("Measure loaded width","Check height","Skip hallway blockers"); Description="Small apartment drying rack buying guide with measurement checks. #ad"; Bg="#3d6788"; Accent="#c85f46"}
  )},
  [pscustomobject]@{ Slug="compact-desk-bedroom-corner"; Category="Tiny Desks"; Board="Small Bedroom Furniture"; Url="$BaseUrl/guides/tiny-desks/compact-desk-bedroom-corner/"; Keywords="compact desk bedroom corner, small corner desk, narrow desk"; VideoHook="The desk is not the footprint. The chair is."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Compact Desk For Bedroom Corner"; Subtitle="Measure desk depth, chair pull-out, outlet access, and door clearance."; Bullets=@("Add chair space","Check plug depth","Keep closet doors clear"); Description="A fit-first guide to compact desks for bedroom corners. #ad"; Bg="#244c49"; Accent="#e4aa3f"},
    [pscustomobject]@{File="pin-02.png"; Title="Small Desk, Big Clearance Problem"; Subtitle="A desk can fit the corner but still block the bed walkway."; Bullets=@("Shallow desks help","Corner desks need chair room","Folding desks need storage"); Description="Compact bedroom desk buying guide with measurement checks. #ad"; Bg="#c85f46"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Tiny Desks"; Subtitle="Writing desk, corner desk, ladder desk, or folding desk?"; Bullets=@("Measure the whole work zone","Protect outlet access","Skip blocked drawers"); Description="Small bedroom desk guide with Amazon search links. #ad"; Bg="#3d6788"; Accent="#e4aa3f"}
  )},
  [pscustomobject]@{ Slug="rolling-cart-beside-fridge"; Category="Narrow Kitchen"; Board="Narrow Kitchen Finds"; Url="$BaseUrl/guides/narrow-kitchen/rolling-cart-beside-fridge/"; Keywords="rolling cart beside fridge, slim rolling cart, fridge gap cart"; VideoHook="The fridge handle might be the real width limit."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Rolling Cart Beside Fridge"; Subtitle="Measure the narrowest gap, handle projection, and roll-out path."; Bullets=@("Baseboards steal width","Handles can block carts","Wheels need a clear path"); Description="A fit-first guide to slim rolling carts that fit beside a fridge. #ad"; Bg="#244c49"; Accent="#c85f46"},
    [pscustomobject]@{File="pin-02.png"; Title="Do Not Trust The Fridge Gap"; Subtitle="Measure front, back, baseboard, outlet, and water line clearance."; Bullets=@("Cart width is not enough","Check depth access","Avoid stuck shelves"); Description="Slim fridge-gap cart buying tips with measurement checks. #ad"; Bg="#e4aa3f"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Fridge Carts"; Subtitle="Rolling cart, stationary shelf, or magnetic shelf?"; Bullets=@("Roll straight out","Watch handle width","Skip ventilation blockers"); Description="Rolling cart beside fridge guide with Amazon search links. #ad"; Bg="#3d6788"; Accent="#c85f46"}
  )},
  [pscustomobject]@{ Slug="under-bed-storage-bins-low-clearance"; Category="Low Clearance"; Board="Low Clearance Storage"; Url="$BaseUrl/guides/low-clearance-storage/under-bed-storage-bins-low-clearance/"; Keywords="under bed storage low clearance, low profile underbed bins, under bed bins under 6 inches"; VideoHook="Measure to the bed frame, not the mattress."; Pins=@(
    [pscustomobject]@{File="pin-01.png"; Title="Under-Bed Bins, Low Clearance"; Subtitle="Include lid ribs, handles, wheels, carpet, and the lowest bed frame point."; Bullets=@("Measure the real gap","Wheels add height","Soft bags can bulge"); Description="A fit-first guide to low-clearance under-bed storage bins. #ad"; Bg="#244c49"; Accent="#e4aa3f"},
    [pscustomobject]@{File="pin-02.png"; Title="The Wheel Height Counts"; Subtitle="Rolling drawers are convenient only if the total height fits."; Bullets=@("Check carpet drag","Leave pull-out space","Avoid overfilled bags"); Description="Low profile under-bed storage buying tips with measurement checks. #ad"; Bg="#c85f46"; Accent="#244c49"},
    [pscustomobject]@{File="pin-03.png"; Title="Fits If / Skip If: Under-Bed Storage"; Subtitle="Plastic bins, fabric bags, rolling drawers, or flat zip bags?"; Bullets=@("Measure lowest frame point","Include the lid","Skip tight wheel setups"); Description="Storage bins for under bed low clearance guide with Amazon search links. #ad"; Bg="#3d6788"; Accent="#e4aa3f"}
  )}
)

New-Dir $PromoRoot

$ArticleSlugs = @($Articles | ForEach-Object { $_.Slug })
$ResolvedPromoRoot = [System.IO.Path]::GetFullPath($PromoRoot)
Get-ChildItem -Path $PromoRoot -Directory | ForEach-Object {
  $ResolvedChild = [System.IO.Path]::GetFullPath($_.FullName)
  if ($ResolvedChild.StartsWith($ResolvedPromoRoot + [System.IO.Path]::DirectorySeparatorChar) -and -not ($ArticleSlugs -contains $_.Name)) {
    Remove-Item -LiteralPath $_.FullName -Recurse -Force
  }
}

$CsvHeader = "Title,Media URL,Pinterest board,Thumbnail,Description,Link,Publish date,Keywords"
$LedgerHeader = "pin_key,article_slug,pin_file,title,board,media_url,destination_url,publish_date,status,pinterest_url,notes"

$AllCsvRows = New-Object System.Collections.Generic.List[string]
$NextCsvRows = New-Object System.Collections.Generic.List[string]
$NowCsvRows = New-Object System.Collections.Generic.List[string]
$ScheduledCsvRows = New-Object System.Collections.Generic.List[string]
$LedgerRows = New-Object System.Collections.Generic.List[string]
$AllCsvRows.Add($CsvHeader)
$NextCsvRows.Add($CsvHeader)
$NowCsvRows.Add($CsvHeader)
$ScheduledCsvRows.Add($CsvHeader)
$LedgerRows.Add($LedgerHeader)

$ImmediateUploadLimit = 9
$NextUploadCount = 0
$ScheduleStart = (Get-Date).ToUniversalTime().Date.AddDays(1).AddHours(15)
$ScheduledUploadOffset = 0

foreach ($Article in $Articles) {
  $ArticleDir = Join-Path $PromoRoot $Article.Slug
  $PinsDir = Join-Path $ArticleDir "pins"
  New-Dir $ArticleDir
  New-Dir $PinsDir

  $ArticleAllCsvRows = New-Object System.Collections.Generic.List[string]
  $ArticleNextCsvRows = New-Object System.Collections.Generic.List[string]
  $ArticleAllCsvRows.Add($CsvHeader)
  $ArticleNextCsvRows.Add($CsvHeader)

  $CopyLines = @("# Pinterest Copy - $($Article.Slug)", "", "Guide URL: $($Article.Url)", "Board: $($Article.Board)", "", "## Pins")

  foreach ($Pin in $Article.Pins) {
    $OutPath = Join-Path $PinsDir $Pin.File
    Draw-Pin $Pin $Article $OutPath
    $PinKey = Get-PinKey $Article.Slug $Pin.File
    $MediaUrl = "$BaseUrl/promo/$($Article.Slug)/pins/$($Pin.File)"
    $TrackedUrl = Add-TrackingUrl $Article.Url $Article.Slug $Pin.File
    $PublishDate = ""
    if ($NextUploadCount -ge $ImmediateUploadLimit) {
      $PublishDate = $ScheduleStart.AddDays($ScheduledUploadOffset).ToString("yyyy-MM-ddTHH:mm:ss", [Globalization.CultureInfo]::InvariantCulture)
      $ScheduledUploadOffset += 1
    }
    $Status = "exported"
    $Notes = if ($PublishDate) { "Included in pinterest-upload-scheduled.csv and pinterest-upload-next.csv; set status to uploaded after successful import." } else { "Included in pinterest-upload-now.csv and pinterest-upload-next.csv; set status to uploaded after successful import." }
    $CsvRow = New-PinterestCsvRow $Pin.Title $MediaUrl $Article.Board $Pin.Description $TrackedUrl $PublishDate $Article.Keywords
    $AllCsvRows.Add($CsvRow)
    $NextCsvRows.Add($CsvRow)
    $ArticleAllCsvRows.Add($CsvRow)
    $ArticleNextCsvRows.Add($CsvRow)
    if ($PublishDate) { $ScheduledCsvRows.Add($CsvRow) } else { $NowCsvRows.Add($CsvRow) }
    $LedgerRows.Add((New-LedgerCsvRow $PinKey $Article.Slug $Pin.File $Pin.Title $Article.Board $MediaUrl $TrackedUrl $PublishDate $Status "" $Notes))

    $CopyLines += @("", "### $($Pin.File)", "", "Title: $($Pin.Title)", "", "Description: $($Pin.Description)", "", "Media URL after publishing: $MediaUrl", "", "Tracked destination URL: $TrackedUrl", "", "Scheduled publish date: $PublishDate UTC", "", "Keywords: $($Article.Keywords)")
    $NextUploadCount += 1
  }

  Set-Content -Path (Join-Path $ArticleDir "pinterest-copy.md") -Value ($CopyLines -join "`r`n") -Encoding UTF8
  Set-Content -Path (Join-Path $ArticleDir "pinterest-bulk-upload.csv") -Value ($ArticleAllCsvRows -join "`r`n") -Encoding UTF8
  Set-Content -Path (Join-Path $ArticleDir "pinterest-upload-next.csv") -Value ($ArticleNextCsvRows -join "`r`n") -Encoding UTF8

  $Video = @"
# Short Video Script - $($Article.Slug)

Length: 20-30 seconds
Format: 9:16 vertical
Destination: Pinterest video pin, YouTube Shorts, TikTok

Hook:
$($Article.VideoHook)

Beat 1:
Show the awkward space and the measurement that decides the purchase.

Beat 2:
Show the 3-part fit logic from the Pin bullets.

Beat 3:
Show one quick "skip if" warning.

Close:
Full fit guide on Fits In My Space.

On-screen disclosure:
#ad - page contains Amazon affiliate links.
"@
  Set-Content -Path (Join-Path $ArticleDir "short-video-script.md") -Value $Video -Encoding UTF8

  $Fiverr = @"
# Fiverr Brief - $($Article.Slug)

Create one 20-30 second vertical video, 1080x1920, using the script in short-video-script.md.

Style:
- Clean, practical small-space shopping aesthetic.
- Large readable text.
- Show tape measures, painter-tape footprints, narrow gaps, and product clearance.
- Calm helpful pacing, not flashy.
- Use the colors from the included Pin PNGs.
- No fake prices, ratings, discounts, stock claims, or Amazon logos.

Deliverables:
- 1 MP4 vertical video.
- 1 editable project file if possible.
- 1 thumbnail frame.

Required text:
- Fits In My Space
- #ad
- Full guide: $($Article.Url)
"@
  Set-Content -Path (Join-Path $ArticleDir "fiverr-brief.md") -Value $Fiverr -Encoding UTF8

  $Reddit = @"
# Reddit Angle - $($Article.Slug)

Use manually only where it is genuinely relevant. Do not drop links as the first move.

Helpful no-link reply angle:
$($Article.VideoHook)

Suggested approach:
1. Answer the person's specific fit problem.
2. Mention the measurement checklist in plain text.
3. Add one skip-if warning.
4. Link only if the subreddit allows it or the person asks.

Disclosure if linking:
I made a full measurement guide for this; it contains affiliate links.
"@
  Set-Content -Path (Join-Path $ArticleDir "reddit-angle.md") -Value $Reddit -Encoding UTF8
}

Set-Content -Path (Join-Path $PromoRoot "pinterest-bulk-upload.csv") -Value ($AllCsvRows -join "`r`n") -Encoding UTF8
Set-Content -Path (Join-Path $PromoRoot "pinterest-upload-next.csv") -Value ($NextCsvRows -join "`r`n") -Encoding UTF8
Set-Content -Path (Join-Path $PromoRoot "pinterest-upload-now.csv") -Value ($NowCsvRows -join "`r`n") -Encoding UTF8
Set-Content -Path (Join-Path $PromoRoot "pinterest-upload-scheduled.csv") -Value ($ScheduledCsvRows -join "`r`n") -Encoding UTF8
Set-Content -Path (Join-Path $PromoRoot "PINTEREST_LEDGER.csv") -Value ($LedgerRows -join "`r`n") -Encoding UTF8

Write-Host "Built promo assets for $($Articles.Count) guides into promo/ ($NextUploadCount rows in pinterest-upload-next.csv)"
