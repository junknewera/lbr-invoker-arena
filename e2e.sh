#!/usr/bin/env bash
# End-to-end check: runs out/data.win headless (wine + Xvfb) with -inv_autotest, which starts a new game, enters
# the arena and plays a scripted combo; takes a screenshot each time the mod reports a new step (e2e/<step>.png).
set -u
source "$(dirname "$0")/lib.sh"
STATE="$TEST_SAVE_AREA/lbr_mod_e2e_state.txt"

cd "$ROOT" || exit 2
mkdir -p e2e
cp out/data.win testrun/data.win
rm -rf testrun/invoker_arena && cp -r assets/invoker_arena testrun/
rm -f "$STATE" e2e/*.png
echo "$APPID" > testrun/steam_appid.txt
(
    cd testrun || exit 2
    xvfb-run -a -s "-screen 0 1600x900x24" sh -c '
        wine game.exe -inv_autotest > ../e2e/game.log 2>&1 &
        last=""; i=0
        while [ $i -lt 600 ]; do
            cur=$( { tr -d "\r" < "$0"; } 2>/dev/null )
            if [ -n "$cur" ] && [ "$cur" != "$last" ]; then
                import -window root "../e2e/$cur.png" 2>/dev/null; last="$cur"
                [ "$cur" = "done" ] && break
            fi
            sleep 0.1; i=$((i + 1))
        done
        [ "$last" = "done" ] || import -window root ../e2e/timeout.png 2>/dev/null
        wineserver -k
    ' "$STATE"
)
ls e2e/*.png 2>/dev/null
[ -f e2e/done.png ]
