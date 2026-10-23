#!/usr/bin/env bash
# Installs the Invoker Arena mod into the Steam copy of Leaf Blower Revolution:
# backs up the saves, replaces data.win with out/data.win and copies the icons/sounds folder next to it.
set -eu
source "$(dirname "$0")/lib.sh"
require_game

sha() { sha256sum "$1" | cut -d' ' -f1; }
current=$(sha "$GAME/data.win")
if [ "$current" != "$(sha "$ROOT/backup/data.win.orig")" ] && [ "$current" != "$(sha "$ROOT/out/data.win")" ]; then
    echo "data.win in the game folder is neither the original this mod was built from nor the mod itself."
    echo "LBR was probably updated by Steam. Rebuild against the new version:"
    echo "  cp \"$GAME/data.win\" \"$ROOT/backup/data.win.orig\" && ./build.sh && ./install.sh"
    exit 1
fi

if [ -d "$SAVES" ]; then
    dest="$ROOT/backup/saves-$(date +%Y%m%d-%H%M%S)"
    cp -r "$SAVES" "$dest"
    echo "saves backed up to $dest"
fi

cp "$ROOT/out/data.win" "$GAME/data.win"
rm -rf "$GAME/invoker_arena"
cp -r "$ROOT/assets/invoker_arena" "$GAME/"
echo "installed. Start LBR from Steam and press I in game to enter the Invoker Arena."
