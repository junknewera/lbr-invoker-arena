# Shared settings for the Linux scripts (sourced, not run). Autodetects the Steam library that holds LBR;
# override with LBR_GAME_DIR, LBR_SAVES_DIR, DOTA_DIR, UTMT_CLI or VRF_CLI.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APPID=1468260

# Steam library folders: the usual Steam roots plus every "path" listed in their libraryfolders.vdf.
steam_libraries() {
    local steam
    for steam in "$HOME/.local/share/Steam" "$HOME/.steam/steam" "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam"; do
        [ -f "$steam/steamapps/libraryfolders.vdf" ] || continue
        printf '%s\n' "$steam"
        sed -n 's/^[[:space:]]*"path"[[:space:]]*"\(.*\)"[[:space:]]*$/\1/p' "$steam/steamapps/libraryfolders.vdf"
    done | awk '!seen[$0]++'
}

# First library containing the given steamapps/common/<folder>.
find_library() {
    local lib
    while IFS= read -r lib; do
        if [ -d "$lib/steamapps/common/$1" ]; then
            printf '%s\n' "$lib"
            return
        fi
    done < <(steam_libraries)
}

LIBRARY="$(find_library "Leaf Blower Revolution")"
GAME="${LBR_GAME_DIR:-$LIBRARY/steamapps/common/Leaf Blower Revolution}"
# LBR runs through Proton; GameMaker keeps saves in the prefix's AppData/Local.
SAVES="${LBR_SAVES_DIR:-$LIBRARY/steamapps/compatdata/$APPID/pfx/drive_c/users/steamuser/AppData/Local/blow_the_leaves_away}"
DOTA="${DOTA_DIR:-$(find_library "dota 2 beta")/steamapps/common/dota 2 beta}"
UTMT="${UTMT_CLI:-$ROOT/tools/utmt/UndertaleModCli}"
VRF="${VRF_CLI:-$ROOT/tools/vrf/Source2Viewer-CLI}"

# Isolated wine prefix for headless test runs; GameMaker writes test output into its save area there.
export WINEPREFIX="$ROOT/.wine" WINEDEBUG=-all WINEDLLOVERRIDES="mscoree,mshtml="
TEST_SAVE_AREA="$WINEPREFIX/drive_c/users/$USER/AppData/Local/blow_the_leaves_away"

require_game() {
    if [ ! -f "$GAME/data.win" ]; then
        echo "Leaf Blower Revolution not found at: $GAME"
        echo "Set LBR_GAME_DIR to the game folder."
        exit 2
    fi
}
