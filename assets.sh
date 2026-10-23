#!/usr/bin/env bash
# Builds assets/invoker_arena/ (icons/*.png, sounds/*.ogg, vo/*.ogg). If assets_raw/ is missing, first extracts the
# Invoker icons/sounds from Dota's pak01_dir.vpk with Source 2 Viewer (tools/vrf). Needs ffmpeg.
# The mod loads the result at runtime from <game dir>/invoker_arena/.
set -eu
source "$(dirname "$0")/lib.sh"
RAW="$ROOT/assets_raw"
OUT="$ROOT/assets/invoker_arena"

if [ ! -d "$RAW" ]; then
    if [ ! -x "$VRF" ]; then
        mkdir -p "$ROOT/tools/vrf"
        curl -sSL -o "$ROOT/tools/vrf.zip" https://github.com/ValveResourceFormat/ValveResourceFormat/releases/download/20.1/cli-linux-x64.zip
        unzip -q -o "$ROOT/tools/vrf.zip" -d "$ROOT/tools/vrf"
        rm "$ROOT/tools/vrf.zip"
        chmod +x "$VRF"
    fi
    "$VRF" -i "$DOTA/game/dota/pak01_dir.vpk" -d -o "$RAW" -f "panorama/images/spellicons/invoker_,panorama/images/items/sheepstick_png,panorama/images/items/shivas_guard_png,panorama/images/items/refresher_png,panorama/images/items/ultimate_scepter_png,panorama/images/items/black_king_bar_png,panorama/images/items/blink_png,panorama/images/heroes/icons/npc_dota_hero_invoker_png,panorama/images/heroes/icons/npc_dota_hero_axe_png,sounds/weapons/hero/invoker/,sounds/items/black_king_bar,sounds/items/refresher,sounds/items/shivas_guard,sounds/items/blink_swift,sounds/vo/invoker/invo_ability_" > /dev/null
fi

rm -rf "$OUT"
mkdir -p "$OUT/icons" "$OUT/sounds" "$OUT/vo"

for key in quas wex exort invoke cold_snap ghost_walk tornado emp alacrity chaos_meteor sun_strike forge_spirit ice_wall deafening_blast; do
    cp "$RAW/panorama/images/spellicons/invoker_${key}_png.png" "$OUT/icons/$key.png"
done
for key in sheepstick shivas_guard refresher ultimate_scepter black_king_bar blink; do
    cp "$RAW/panorama/images/items/${key}_png.png" "$OUT/icons/$key.png"
done
for hero in invoker axe; do
    cp "$RAW/panorama/images/heroes/icons/npc_dota_hero_${hero}_png.png" "$OUT/icons/$hero.png"
done

to_ogg() { ffmpeg -loglevel error -y -i "$1" -ac 2 -ar 44100 -c:a libvorbis -q:a 5 "$2"; }
for s in invoke cold_snap ghost_walk tornado_cast emp_cast emp_discharge alacrity meteor_cast meteor_impact \
         sunstrike_charge sunstrike_ignite deafening_blast glacier_cast; do
    to_ogg "$RAW/sounds/weapons/hero/invoker/$s.wav" "$OUT/sounds/$s.ogg"
done
for s in black_king_bar refresher shivas_guard; do
    to_ogg "$RAW/sounds/items/$s.wav" "$OUT/sounds/$s.ogg"
done
to_ogg "$RAW/sounds/items/blink_swift.wav" "$OUT/sounds/blink.ogg"
for f in "$RAW"/sounds/vo/invoker/invo_ability_*.mp3; do
    name=$(basename "$f" .mp3)
    to_ogg "$f" "$OUT/vo/${name#invo_ability_}.ogg"
done
echo "assets: $(find "$OUT" -type f | wc -l) files, $(du -sh "$OUT" | cut -f1)"
