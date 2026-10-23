#!/usr/bin/env bash
# Removes the Invoker Arena mod: puts the original data.win back and deletes the icons/sounds folder.
# (Steam > Leaf Blower Revolution > Properties > Installed Files > Verify integrity does the same for data.win.)
set -eu
source "$(dirname "$0")/lib.sh"
require_game

cp "$ROOT/backup/data.win.orig" "$GAME/data.win"
rm -rf "$GAME/invoker_arena"
echo "original data.win restored, mod assets removed."
