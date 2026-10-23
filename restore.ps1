# Removes the Invoker Arena mod: puts the original data.win back and deletes the icons/sounds folder.
# (Steam > Leaf Blower Revolution > Properties > Installed Files > Verify integrity does the same for data.win.)
. "$PSScriptRoot\lib.ps1"
Assert-Game

Copy-Item (Join-Path $Root 'backup\data.win.orig') (Join-Path $GameDir 'data.win') -Force
$assets = Join-Path $GameDir 'invoker_arena'
if (Test-Path $assets) { Remove-Item -Recurse -Force $assets }
Write-Host 'original data.win restored, mod assets removed.'
