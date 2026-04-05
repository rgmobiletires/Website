Add-Type -AssemblyName System.Drawing

$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$outputDir = Join-Path $projectRoot 'images\services_placeholders'
New-Item -ItemType Directory -Path $outputDir -Force | Out-Null

function New-Color([int]$a, [int]$r, [int]$g, [int]$b) {
    [System.Drawing.Color]::FromArgb($a, $r, $g, $b)
}

function New-RoundedPath([float]$x, [float]$y, [float]$width, [float]$height, [float]$radius) {
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $diameter = $radius * 2
    $path.AddArc($x, $y, $diameter, $diameter, 180, 90)
    $path.AddArc($x + $width - $diameter, $y, $diameter, $diameter, 270, 90)
    $path.AddArc($x + $width - $diameter, $y + $height - $diameter, $diameter, $diameter, 0, 90)
    $path.AddArc($x, $y + $height - $diameter, $diameter, $diameter, 90, 90)
    $path.CloseFigure()
    $path
}

function Add-GlowCircle($graphics, [float]$x, [float]$y, [float]$size, $color) {
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.AddEllipse($x, $y, $size, $size)
    $brush = New-Object System.Drawing.Drawing2D.PathGradientBrush($path)
    $brush.CenterColor = $color
    $brush.SurroundColors = @([System.Drawing.Color]::FromArgb(0, $color))
    $graphics.FillEllipse($brush, $x, $y, $size, $size)
    $brush.Dispose()
    $path.Dispose()
}

function Draw-Base($graphics, [string]$eyebrow, [string]$title, [string]$subtitle) {
    $backgroundRect = New-Object System.Drawing.Rectangle 0, 0, 1600, 1000
    $bgBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        $backgroundRect,
        (New-Color 255 11 12 14),
        (New-Color 255 220 223 226),
        12
    )
    $blend = New-Object System.Drawing.Drawing2D.ColorBlend
    $blend.Colors = @(
        (New-Color 255 10 10 12),
        (New-Color 255 28 30 33),
        (New-Color 255 91 95 100),
        (New-Color 255 218 221 224)
    )
    $blend.Positions = @(0.0, 0.34, 0.72, 1.0)
    $bgBrush.InterpolationColors = $blend
    $graphics.FillRectangle($bgBrush, $backgroundRect)
    $bgBrush.Dispose()

    Add-GlowCircle $graphics -120 600 820 (New-Color 86 240 180 0)
    Add-GlowCircle $graphics 1060 -120 640 (New-Color 46 255 255 255)
    Add-GlowCircle $graphics 900 520 500 (New-Color 30 240 180 0)

    $sheenBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Point -ArgumentList 700, 0),
        (New-Object System.Drawing.Point -ArgumentList 1180, 1000),
        (New-Color 48 255 255 255),
        (New-Color 0 255 255 255)
    )
    $graphics.FillPolygon(
        $sheenBrush,
        @(
            (New-Object System.Drawing.PointF 760, 0),
            (New-Object System.Drawing.PointF 1100, 0),
            (New-Object System.Drawing.PointF 780, 1000),
            (New-Object System.Drawing.PointF 520, 1000)
        )
    )
    $sheenBrush.Dispose()

    $gridPen = New-Object System.Drawing.Pen((New-Color 26 255 255 255), 1)
    foreach ($x in 860, 960, 1060, 1160, 1260, 1360, 1460) {
        $graphics.DrawLine($gridPen, $x, 0, $x, 1000)
    }
    foreach ($y in 140, 280, 420, 560, 700, 840) {
        $graphics.DrawLine($gridPen, 760, $y, 1600, $y)
    }
    $gridPen.Dispose()

    $gold = New-Color 255 240 180 0
    $white = New-Color 255 246 246 244
    $softWhite = New-Color 210 238 239 241
    $muted = New-Color 225 196 198 202

    $eyebrowFont = New-Object System.Drawing.Font('Segoe UI', 21, [System.Drawing.FontStyle]::Bold)
    $titleFont = New-Object System.Drawing.Font('Segoe UI Semibold', 58, [System.Drawing.FontStyle]::Bold)
    $subFont = New-Object System.Drawing.Font('Segoe UI', 21, [System.Drawing.FontStyle]::Regular)
    $pillFont = New-Object System.Drawing.Font('Segoe UI', 15, [System.Drawing.FontStyle]::Bold)
    $stringFormat = New-Object System.Drawing.StringFormat
    $stringFormat.Alignment = [System.Drawing.StringAlignment]::Near
    $stringFormat.LineAlignment = [System.Drawing.StringAlignment]::Near

    $accentPen = New-Object System.Drawing.Pen($gold, 5)
    $graphics.DrawLine($accentPen, 110, 285, 225, 285)
    $accentPen.Dispose()

    $graphics.DrawString($eyebrow.ToUpperInvariant(), $eyebrowFont, (New-Object System.Drawing.SolidBrush $gold), (New-Object System.Drawing.RectangleF 248, 246, 460, 40), $stringFormat)
    $graphics.DrawString($title, $titleFont, (New-Object System.Drawing.SolidBrush $white), (New-Object System.Drawing.RectangleF 110, 320, 620, 170), $stringFormat)
    $graphics.DrawString($subtitle, $subFont, (New-Object System.Drawing.SolidBrush $softWhite), (New-Object System.Drawing.RectangleF 112, 502, 530, 92), $stringFormat)

    $pillPath = New-RoundedPath 112 636 258 56 22
    $pillFill = New-Object System.Drawing.SolidBrush (New-Color 36 255 255 255)
    $pillStroke = New-Object System.Drawing.Pen((New-Color 45 255 255 255), 1.5)
    $graphics.FillPath($pillFill, $pillPath)
    $graphics.DrawPath($pillStroke, $pillPath)
    $graphics.DrawString('TEMPORARY VISUAL', $pillFont, (New-Object System.Drawing.SolidBrush $muted), (New-Object System.Drawing.RectangleF 140, 651, 220, 24), $stringFormat)

    $pillPath.Dispose()
    $pillFill.Dispose()
    $pillStroke.Dispose()
    $eyebrowFont.Dispose()
    $titleFont.Dispose()
    $subFont.Dispose()
    $pillFont.Dispose()
    $stringFormat.Dispose()
}

function Draw-TyreBrake($graphics) {
    $gold = New-Color 255 240 180 0
    $white = New-Color 210 246 246 246
    Add-GlowCircle $graphics 920 200 430 (New-Color 34 255 255 255)

    $shadowBrush = New-Object System.Drawing.SolidBrush (New-Color 150 15 16 18)
    $outerPen = New-Object System.Drawing.Pen((New-Color 215 19 21 24), 44)
    $midPen = New-Object System.Drawing.Pen((New-Color 205 219 221 225), 8)
    $innerPen = New-Object System.Drawing.Pen((New-Color 190 234 236 239), 18)
    $goldPen = New-Object System.Drawing.Pen($gold, 5)
    $spokePen = New-Object System.Drawing.Pen($white, 7)
    $caliperBrush = New-Object System.Drawing.SolidBrush $gold

    $graphics.FillEllipse($shadowBrush, 900, 200, 430, 430)
    $graphics.DrawEllipse($outerPen, 930, 230, 370, 370)
    $graphics.DrawEllipse($midPen, 980, 280, 270, 270)
    $graphics.DrawEllipse($innerPen, 1036, 336, 158, 158)

    foreach ($angle in 0, 60, 120, 180, 240, 300) {
        $radians = [Math]::PI * $angle / 180
        $x1 = 1115 + [Math]::Cos($radians) * 36
        $y1 = 415 + [Math]::Sin($radians) * 36
        $x2 = 1115 + [Math]::Cos($radians) * 104
        $y2 = 415 + [Math]::Sin($radians) * 104
        $graphics.DrawLine($spokePen, $x1, $y1, $x2, $y2)
    }

    $graphics.FillPie($caliperBrush, 1180, 316, 120, 186, -30, 165)
    $graphics.DrawArc($goldPen, 852, 150, 540, 540, 210, 82)
    $graphics.DrawArc($goldPen, 872, 170, 500, 500, 30, 58)

    $shadowBrush.Dispose()
    $outerPen.Dispose()
    $midPen.Dispose()
    $innerPen.Dispose()
    $goldPen.Dispose()
    $spokePen.Dispose()
    $caliperBrush.Dispose()
}

function Draw-Servicing($graphics) {
    $gold = New-Color 255 240 180 0
    $white = New-Color 200 248 248 248
    Add-GlowCircle $graphics 930 160 420 (New-Color 34 240 180 0)

    $gearPen = New-Object System.Drawing.Pen((New-Color 190 234 237 240), 16)
    $innerPen = New-Object System.Drawing.Pen((New-Color 160 255 255 255), 5)
    $goldPen = New-Object System.Drawing.Pen($gold, 10)
    $listPen = New-Object System.Drawing.Pen($white, 6)
    $listGoldPen = New-Object System.Drawing.Pen($gold, 6)
    $toothBrush = New-Object System.Drawing.SolidBrush (New-Color 170 231 234 236)
    $dotBrush = New-Object System.Drawing.SolidBrush $gold

    for ($i = 0; $i -lt 8; $i++) {
        $angle = $i * 45
        $radians = [Math]::PI * $angle / 180
        $centerX = 1140 + [Math]::Cos($radians) * 135
        $centerY = 420 + [Math]::Sin($radians) * 135
        $graphics.TranslateTransform($centerX, $centerY)
        $graphics.RotateTransform($angle)
        $graphics.FillRectangle($toothBrush, -16, -40, 32, 80)
        $graphics.ResetTransform()
    }

    $graphics.DrawEllipse($gearPen, 980, 260, 320, 320)
    $graphics.DrawEllipse($innerPen, 1055, 335, 170, 170)
    $graphics.DrawLine($goldPen, 1160, 180, 1390, 410)
    $graphics.DrawEllipse($goldPen, 1350, 370, 76, 76)
    $graphics.DrawLine($listPen, 930, 680, 1340, 680)
    $graphics.DrawLine($listGoldPen, 930, 740, 1260, 740)
    $graphics.DrawLine($listPen, 930, 800, 1310, 800)

    foreach ($y in 680, 740, 800) {
        $graphics.FillEllipse($dotBrush, 880, $y - 12, 24, 24)
    }

    $gearPen.Dispose()
    $innerPen.Dispose()
    $goldPen.Dispose()
    $listPen.Dispose()
    $listGoldPen.Dispose()
    $toothBrush.Dispose()
    $dotBrush.Dispose()
}

function Draw-Clutch($graphics) {
    $gold = New-Color 255 240 180 0
    $white = New-Color 210 245 246 248
    Add-GlowCircle $graphics 900 150 520 (New-Color 28 255 255 255)

    $outerPen = New-Object System.Drawing.Pen((New-Color 215 226 229 233), 18)
    $midPen = New-Object System.Drawing.Pen((New-Color 150 210 214 219), 46)
    $innerPen = New-Object System.Drawing.Pen((New-Color 190 248 248 248), 8)
    $goldPen = New-Object System.Drawing.Pen($gold, 6)
    $whiteArcPen = New-Object System.Drawing.Pen($white, 14)
    $diagPen = New-Object System.Drawing.Pen((New-Color 120 255 255 255), 3)

    $graphics.DrawEllipse($outerPen, 930, 200, 430, 430)
    $graphics.DrawEllipse($midPen, 1005, 275, 280, 280)
    $graphics.DrawEllipse($innerPen, 1086, 356, 118, 118)

    foreach ($angle in 0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330) {
        $radians = [Math]::PI * $angle / 180
        $x1 = 1145 + [Math]::Cos($radians) * 180
        $y1 = 415 + [Math]::Sin($radians) * 180
        $x2 = 1145 + [Math]::Cos($radians) * 235
        $y2 = 415 + [Math]::Sin($radians) * 235
        $graphics.DrawLine($goldPen, $x1, $y1, $x2, $y2)
    }

    $graphics.DrawArc($whiteArcPen, 960, 230, 370, 370, 215, 110)
    $graphics.DrawArc($whiteArcPen, 960, 230, 370, 370, 20, 85)
    $graphics.DrawLine($diagPen, 870, 760, 1450, 180)
    $graphics.DrawLine((New-Object System.Drawing.Pen($gold, 5)), 920, 790, 1490, 220)

    $outerPen.Dispose()
    $midPen.Dispose()
    $innerPen.Dispose()
    $goldPen.Dispose()
    $whiteArcPen.Dispose()
    $diagPen.Dispose()
}

function Draw-Suspension($graphics) {
    $gold = New-Color 255 240 180 0
    $white = New-Color 220 246 246 246
    Add-GlowCircle $graphics 940 180 480 (New-Color 34 240 180 0)

    $bodyPen = New-Object System.Drawing.Pen((New-Color 210 228 230 233), 18)
    $goldPen = New-Object System.Drawing.Pen($gold, 8)
    $coilPen = New-Object System.Drawing.Pen($white, 10)
    $damperBrush = New-Object System.Drawing.SolidBrush (New-Color 210 26 27 30)
    $damperPen = New-Object System.Drawing.Pen($white, 6)

    $graphics.DrawLine($bodyPen, 1180, 180, 1320, 320)
    $graphics.DrawLine($bodyPen, 930, 710, 1070, 850)
    $graphics.DrawLine($bodyPen, 1070, 850, 1320, 600)
    $graphics.DrawLine($bodyPen, 1180, 180, 930, 430)
    $graphics.DrawLine($goldPen, 1000, 500, 1255, 245)

    $graphics.FillRectangle($damperBrush, 958, 438, 72, 170)
    $graphics.DrawRectangle($damperPen, 958, 438, 72, 170)

    $centers = @(
        @(1065, 435),
        @(1130, 500),
        @(1195, 565),
        @(1260, 630),
        @(1325, 695)
    )
    foreach ($pair in $centers) {
        $graphics.DrawEllipse($coilPen, $pair[0] - 42, $pair[1] - 42, 84, 84)
    }

    $graphics.DrawLine((New-Object System.Drawing.Pen($gold, 5)), 905, 410, 1340, 845)
    $graphics.DrawEllipse((New-Object System.Drawing.Pen($white, 8)), 880, 390, 58, 58)
    $graphics.DrawEllipse((New-Object System.Drawing.Pen($white, 8)), 1322, 824, 58, 58)

    $bodyPen.Dispose()
    $goldPen.Dispose()
    $coilPen.Dispose()
    $damperBrush.Dispose()
    $damperPen.Dispose()
}

function Draw-Vignette($graphics) {
    $borderBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Rectangle 0, 0, 1600, 1000),
        (New-Color 0 0 0 0),
        (New-Color 95 0 0 0),
        90
    )
    $borderBlend = New-Object System.Drawing.Drawing2D.Blend
    $borderBlend.Factors = @(0.0, 0.08, 0.36, 1.0)
    $borderBlend.Positions = @(0.0, 0.55, 0.82, 1.0)
    $borderBrush.Blend = $borderBlend

    $topRect = New-Object System.Drawing.Rectangle 0, 0, 1600, 120
    $bottomRect = New-Object System.Drawing.Rectangle 0, 880, 1600, 120
    $leftRect = New-Object System.Drawing.Rectangle 0, 0, 110, 1000
    $rightRect = New-Object System.Drawing.Rectangle 1490, 0, 110, 1000
    $graphics.FillRectangle($borderBrush, $topRect)
    $graphics.FillRectangle($borderBrush, $bottomRect)
    $graphics.FillRectangle($borderBrush, $leftRect)
    $graphics.FillRectangle($borderBrush, $rightRect)

    $borderBrush.Dispose()
}

$cards = @(
    @{
        File = 'tyre-brake-placeholder.png'
        Eyebrow = 'Fast Support'
        Title = 'Tyre & Brake'
        Subtitle = 'Mobile puncture and brake assistance, presented as a temporary premium placeholder.'
        Drawer = ${function:Draw-TyreBrake}
    },
    @{
        File = 'servicing-placeholder.png'
        Eyebrow = 'Routine Care'
        Title = 'Vehicle Servicing'
        Subtitle = 'On-site maintenance visual placeholder with a clean automotive workshop feel.'
        Drawer = ${function:Draw-Servicing}
    },
    @{
        File = 'clutch-placeholder.png'
        Eyebrow = 'Mechanical Support'
        Title = 'Clutch Repairs'
        Subtitle = 'Temporary service card image with a refined transmission-inspired graphic treatment.'
        Drawer = ${function:Draw-Clutch}
    },
    @{
        File = 'suspension-placeholder.png'
        Eyebrow = 'Vehicle Stability'
        Title = 'Suspension Repairs'
        Subtitle = 'Temporary premium placeholder highlighting suspension and ride-quality support.'
        Drawer = ${function:Draw-Suspension}
    }
)

foreach ($card in $cards) {
    $bitmap = New-Object System.Drawing.Bitmap 1600, 1000
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    Draw-Base $graphics $card.Eyebrow $card.Title $card.Subtitle
    & $card.Drawer $graphics
    Draw-Vignette $graphics

    $outputPath = Join-Path $outputDir $card.File
    $bitmap.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bitmap.Dispose()

    Write-Output "Created $outputPath"
}
