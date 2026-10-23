# Builds a test data.win (src + tests) and runs it in the real GameMaker runner (testrun\game.exe).
# A game window shows up for a few seconds. The test build stops before LBR's own startup, so saves are not touched.
. "$PSScriptRoot\lib.ps1"
$results = Join-Path $SavesDir 'lbr_mod_test_results.txt'
$testrun = Join-Path $Root 'testrun'

Invoke-Utmt 'build\inv_test.csx' 'testrun\data.win' 'build\test_build.log'
Remove-Item $results -ErrorAction SilentlyContinue
Set-Content -Path (Join-Path $testrun 'steam_appid.txt') -Value $AppId

function Test-Done { (Test-Path $results) -and (Select-String -Path $results -Pattern '^DONE' -Quiet) }

$game = Start-Process -FilePath (Join-Path $testrun 'game.exe') -WorkingDirectory $testrun -PassThru
try {
    $deadline = (Get-Date).AddSeconds(60)
    while ((Get-Date) -lt $deadline -and -not (Test-Done)) { Start-Sleep -Milliseconds 500 }
}
finally {
    Stop-Process -Id $game.Id -Force -ErrorAction SilentlyContinue
}

if (-not (Test-Done)) {
    Write-Host 'NO RESULTS (timeout)'
    exit 3
}
Get-Content $results
if (Select-String -Path $results -Pattern '^DONE passed=\d+ failed=0$' -Quiet) { exit 0 }
exit 1
