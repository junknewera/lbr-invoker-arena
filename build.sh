#!/usr/bin/env bash
# Builds the Invoker Arena mod: out/data.win from backup/data.win.orig, plus out/invoker_arena/ (icons and sounds)
# so the mod can also be started once through Steam launch options (-game ".../out/data.win").
set -u
source "$(dirname "$0")/lib.sh"
cd "$ROOT" || exit 2
mkdir -p out
if ! "$UTMT" load backup/data.win.orig -s build/invoker_mod.csx -o out/data.win -f > build/mod_build.log 2>&1; then
    echo "BUILD FAILED (build/mod_build.log):"
    grep -iE "error|exception" build/mod_build.log | head -20
    exit 2
fi
rm -rf out/invoker_arena
cp -r assets/invoker_arena out/
echo "built $ROOT/out/data.win"
