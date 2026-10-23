# Installs the Invoker Arena mod into the Steam copy of Leaf Blower Revolution:
# backs up the saves, replaces data.win with out\data.win and copies the icons/sounds folder next to it.
. "$PSScriptRoot\lib.ps1"
Assert-Game

$current = (Get-FileHash (Join-Path $GameDir 'data.win')).Hash
$original = (Get-FileHash (Join-Path $Root 'backup\data.win.orig')).Hash
$modded = (Get-FileHash (Join-Path $Root 'out\data.win')).Hash
if ($current -ne $original -and $current -ne $modded) {
    Write-Host 'data.win in the game folder is neither the original this mod was built from nor the mod itself.'
    Write-Host 'LBR was probably updated by Steam. Rebuild against the new version:'
    Write-Host "  Copy-Item `"$(Join-Path $GameDir 'data.win')`" backup\data.win.orig; .\build.ps1; .\install.ps1"
    exit 1
}

if (Test-Path $SavesDir) {
    $dest = Join-Path $Root ('backup\saves-' + (Get-Date -Format 'yyyyMMdd-HHmmss'))
    Copy-Item -Recurse $SavesDir $dest
    Write-Host "saves backed up to $dest"
}

Copy-Item (Join-Path $Root 'out\data.win') (Join-Path $GameDir 'data.win') -Force
Copy-Assets (Join-Path $GameDir 'invoker_arena')
Write-Host 'installed. Start LBR from Steam and press I in game to enter the Invoker Arena.'
