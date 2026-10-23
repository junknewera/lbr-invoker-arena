# One-time setup on Windows: downloads the UndertaleModTool CLI into tools\, backs up the original data.win
# and prepares testrun\ (a copy of the game used by test.ps1).
. "$PSScriptRoot\lib.ps1"
Assert-Game
Set-Location $Root

if (-not (Test-Path $Utmt)) {
    $target = Join-Path $Root 'tools\utmt'
    New-Item -ItemType Directory -Force -Path $target | Out-Null
    $zip = Join-Path $Root 'tools\utmt.zip'
    Invoke-WebRequest -UseBasicParsing -OutFile $zip -Uri 'https://github.com/UnderminersTeam/UndertaleModTool/releases/download/0.9.2.0/UTMT_CLI_v0.9.2.0-Windows.zip'
    Expand-Archive -Force -Path $zip -DestinationPath $target
    Remove-Item $zip
    if (-not (Test-Path $Utmt)) {
        $found = Get-ChildItem $target -Recurse -Filter 'UndertaleModCli.exe' | Select-Object -First 1
        if (-not $found) { throw 'UndertaleModCli.exe not found in the downloaded archive.' }
        Write-Host "UTMT CLI is at $($found.FullName); set `$env:UTMT_CLI to it."
    }
}

New-Item -ItemType Directory -Force -Path 'backup' | Out-Null
if (-not (Test-Path 'backup\data.win.orig')) {
    if ((Test-Path 'out\data.win') -and ((Get-FileHash (Join-Path $GameDir 'data.win')).Hash -eq (Get-FileHash 'out\data.win').Hash)) {
        throw 'The game folder already has the mod installed. Run restore.ps1 or verify the game files in Steam first.'
    }
    Copy-Item (Join-Path $GameDir 'data.win') 'backup\data.win.orig'
}

New-Item -ItemType Directory -Force -Path 'testrun' | Out-Null
foreach ($file in @('game.exe', 'steam_api64.dll', 'Steamworks_x64.dll', 'options.ini', 'shadow_tree.json', 'default_bg.png')) {
    Copy-Item (Join-Path $GameDir $file) 'testrun\' -Force
}
foreach ($folder in @('fonts', 'lang', 'curse_game_levels')) {
    Copy-Item (Join-Path $GameDir $folder) 'testrun\' -Recurse -Force
}
Write-Host "setup done: game at $GameDir"
