# Builds the Invoker Arena mod: out\data.win from backup\data.win.orig, plus out\invoker_arena\ (icons and sounds)
# so the mod can also be started once through Steam launch options (-game "...\out\data.win").
. "$PSScriptRoot\lib.ps1"
New-Item -ItemType Directory -Force -Path (Join-Path $Root 'out') | Out-Null
Invoke-Utmt 'build\invoker_mod.csx' 'out\data.win' 'build\mod_build.log'
Copy-Assets (Join-Path $Root 'out\invoker_arena')
Write-Host "built $(Join-Path $Root 'out\data.win')"
