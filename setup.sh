#!/usr/bin/env bash
# One-time setup on Linux: downloads the UndertaleModTool CLI into tools/, backs up the original data.win
# and prepares testrun/ (a copy of the game used by test.sh and e2e.sh).
set -eu
source "$(dirname "$0")/lib.sh"
require_game
cd "$ROOT"

if [ ! -x "$UTMT" ]; then
    mkdir -p tools/utmt
    curl -sSL -o tools/utmt.zip https://github.com/UnderminersTeam/UndertaleModTool/releases/download/0.9.2.0/UTMT_CLI_v0.9.2.0-Ubuntu.zip
    unzip -q -o tools/utmt.zip -d tools/utmt
    rm tools/utmt.zip
    chmod +x tools/utmt/UndertaleModCli
fi

mkdir -p backup
if [ ! -f backup/data.win.orig ]; then
    if [ -f out/data.win ] && cmp -s "$GAME/data.win" out/data.win; then
        echo "The game folder already has the mod installed. Run restore.sh or verify the game files in Steam first."
        exit 2
    fi
    cp "$GAME/data.win" backup/data.win.orig
fi

mkdir -p testrun
cp "$GAME"/game.exe "$GAME"/*.dll "$GAME"/options.ini "$GAME"/shadow_tree.json "$GAME"/default_bg.png testrun/
cp -r "$GAME"/fonts "$GAME"/lang "$GAME"/curse_game_levels testrun/

for tool in wine xvfb-run import; do
    command -v "$tool" > /dev/null || echo "note: '$tool' not found (only test.sh / e2e.sh need it)"
done
echo "setup done: game at $GAME"
