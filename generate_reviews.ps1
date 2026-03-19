$consoles = @('PS5', 'Xbox Series X/S', 'Nintendo Switch', 'Nintendo Switch 2', 'PC')

function Generate-GameTitle {
    param($console)
    $prefixes = @('Epic', 'Ultimate', 'Mystic', 'Galactic', 'Cyber', 'Legendary', 'Quantum', 'Neon', 'Cosmic', 'Phantom')
    $suffixes = @('Adventure', 'Quest', 'Battle', 'Saga', 'Chronicles', 'Odyssey', 'Warfare', 'Empire', 'Realm', 'Legacy')
    return "$($prefixes | Get-Random) $($suffixes | Get-Random) $console"
}

function Generate-Review {
    $summaries = @(
        "An exhilarating experience with stunning graphics and deep gameplay.",
        "A must-play for fans of the genre, offering hours of fun.",
        "Innovative mechanics make this game stand out from the crowd.",
        "Beautiful world-building and compelling story.",
        "Intense action and strategic depth keep you engaged.",
        "Perfect for casual gamers looking for a relaxing time.",
        "Challenging puzzles and rewarding progression.",
        "Immersive soundtrack enhances the overall experience.",
        "Multiplayer mode is a blast with friends.",
        "A true masterpiece in gaming."
    )
    return $summaries | Get-Random
}

foreach ($console in $consoles) {
    $filename = $console.ToLower().Replace(' ', '').Replace('/', '') + '.html'
    $content = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$console Reviews - Game Review Site</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>$console Game Reviews</h1>
        <nav>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="reviews.html">All Reviews</a></li>
                <li><a href="about.html">About</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h2>Reviews for $console</h2>
"@
    for ($i = 1; $i -le 30; $i++) {
        $title = Generate-GameTitle -console $console
        $rating = Get-Random -Minimum 1 -Maximum 11
        $review = Generate-Review
        $content += @"
        <div class="review-card">
            <h3>$title</h3>
            <p>Rating: $rating/10</p>
            <p>$review</p>
        </div>
"@
    }
    $content += @"
    </main>
    <footer>
        <p>&copy; 2026 Game Review Site</p>
    </footer>
    <script src="script.js"></script>
</body>
</html>
"@
    $content | Out-File -FilePath $filename -Encoding UTF8
}

Write-Host "Review pages generated."