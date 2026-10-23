# Shared settings for the Windows scripts (dot-sourced, not run). Autodetects the Steam library that holds LBR;
# override with $env:LBR_GAME_DIR, $env:LBR_SAVES_DIR or $env:UTMT_CLI.
$ErrorActionPreference = 'Stop'
$Root = $PSScriptRoot
$AppId = 1468260

# Steam library folders: the Steam install (from the registry) plus every "path" in its libraryfolders.vdf.
function Get-SteamLibraries {
    $steam = (Get-ItemProperty -Path 'HKCU:\Software\Valve\Steam' -ErrorAction SilentlyContinue).SteamPath
    if (-not $steam) { $steam = Join-Path ${env:ProgramFiles(x86)} 'Steam' }
    $libraries = @($steam)
    $vdf = Join-Path $steam 'steamapps\libraryfolders.vdf'
    if (Test-Path $vdf) {
        foreach ($match in (Select-String -Path $vdf -Pattern '"path"\s+"([^"]+)"')) {
            $libraries += $match.Matches[0].Groups[1].Value -replace '\\\\', '\'
        }
    }
    $libraries | Select-Object -Unique
}

function Find-SteamApp([string] $Folder) {
    foreach ($library in Get-SteamLibraries) {
        $candidate = Join-Path $library "steamapps\common\$Folder"
        if (Test-Path $candidate) { return $candidate }
    }
    return $null
}

$GameDir = if ($env:LBR_GAME_DIR) { $env:LBR_GAME_DIR } else { Find-SteamApp 'Leaf Blower Revolution' }
# GameMaker keeps LBR's saves in %LOCALAPPDATA%\<project name>.
$SavesDir = if ($env:LBR_SAVES_DIR) { $env:LBR_SAVES_DIR } else { Join-Path $env:LOCALAPPDATA 'blow_the_leaves_away' }
$Utmt = if ($env:UTMT_CLI) { $env:UTMT_CLI } else { Join-Path $Root 'tools\utmt\UndertaleModCli.exe' }

function Assert-Game {
    if (-not $GameDir -or -not (Test-Path (Join-Path $GameDir 'data.win'))) {
        throw 'Leaf Blower Revolution not found. Set $env:LBR_GAME_DIR to the game folder.'
    }
}

# Loads backup\data.win.orig into the UTMT CLI, applies a .csx script and writes the result (paths relative to the repo).
function Invoke-Utmt([string] $Script, [string] $Output, [string] $Log) {
    Push-Location $Root
    try {
        & $Utmt load 'backup\data.win.orig' -s $Script -o $Output -f *> $Log
        if ($LASTEXITCODE -ne 0) {
            Write-Host "BUILD FAILED ($Log):"
            Select-String -Path $Log -Pattern 'error|exception' | Select-Object -First 20 | ForEach-Object { $_.Line }
            exit 2
        }
    }
    finally {
        Pop-Location
    }
}

function Copy-Assets([string] $Destination) {
    if (Test-Path $Destination) { Remove-Item -Recurse -Force $Destination }
    Copy-Item -Recurse (Join-Path $Root 'assets\invoker_arena') $Destination
}
