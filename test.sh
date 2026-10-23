#!/usr/bin/env bash
# Builds a test data.win (src + tests) and runs it headless in the real GameMaker runner under wine + Xvfb.
set -u
source "$(dirname "$0")/lib.sh"
RESULTS="$TEST_SAVE_AREA/lbr_mod_test_results.txt"

cd "$ROOT" || exit 2
if ! "$UTMT" load backup/data.win.orig -s build/inv_test.csx -o testrun/data.win -f > build/test_build.log 2>&1; then
    echo "BUILD FAILED (build/test_build.log):"
    grep -iE "error|exception" build/test_build.log | head -20
    exit 2
fi

rm -f "$RESULTS" testrun_shot.png
echo "$APPID" > testrun/steam_appid.txt
(
    cd testrun || exit 2
    xvfb-run -a -s "-screen 0 1280x720x24" sh -c '
        wine game.exe > ../testrun.log 2>&1 &
        i=0
        while [ $i -lt 120 ] && ! grep -q "^DONE" "$0" 2>/dev/null; do sleep 0.5; i=$((i + 1)); done
        grep -q "^DONE" "$0" 2>/dev/null || import -window root ../testrun_shot.png 2>/dev/null
        wineserver -k
    ' "$RESULTS"
)

if ! grep -q "^DONE" "$RESULTS" 2>/dev/null; then
    echo "NO RESULTS (timeout) - see $ROOT/testrun_shot.png"
    exit 3
fi
# GameMaker writes CRLF line endings.
tr -d '\r' < "$RESULTS"
tr -d '\r' < "$RESULTS" | grep -q "^DONE passed=[0-9]* failed=0$"
