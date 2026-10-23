# TDD evidence: Invoker Arena core rules (`src/inv_core.gml`)

**Source plan:** the inline `/ecc:plan` "Invoker Arena" plan from the 2026-10-23 session (stage 3 "core" plus the numbers table). No `*.plan.md` file exists.
**Scope of this cycle:** pure game rules only: orbs, Invoke, cooldowns, items, key layout and the Axe dummy. No drawing, input polling or LBR integration yet.

## How the tests run
- No GML test runner exists. `test.sh` builds a test `data.win` from `backup/data.win.orig` (sha256 `cadf4bb2…7a`) with UTMT CLI 0.9.2.0 and `build/inv_test.csx`. That script imports `src/*.gml` and `tests/*.gml` as global scripts.
- The build runs in the **real GameMaker runner v2024.14.3.260 shipped with LBR**, under wine 11.20 and Xvfb, in an isolated prefix `~/lbr-mod/.wine`. The game folder and the user's saves are not touched.
- `tests/zz_inv_test_runner.gml` runs at startup and writes `lbr_mod_test_results.txt`. `test.sh` waits for the `DONE` line, kills wine and exits 0 only on `failed=0`.
- Harness gotchas:
  - the UTMT compiler treats the IDE constant `GM_runtime_version` as a variable;
  - `game_end()` during global-script init does not quit, so the harness kills wine itself;
  - results use CRLF line endings.

## User journeys
1. I press Q/W/E, then D (Invoke), and get the right spell in slot F; the previous spell moves to R.
2. Every spell and item has level-30 Invoker cooldowns (with Aghanim's), and Refresher resets them.
3. Z X C V CapsLock Space use Hex, Shiva, Refresher, Aghanim, BKB, Blink; Aghanim does nothing.
4. The Axe has about 8000 HP; magic damage is cut by 25%, pure damage is not; he respawns 3 s after death; reset restores him.

## RED → GREEN
| Stage | Command | Result |
|---|---|---|
| RED | `./test.sh` (tests only, no `src/inv_core.gml`) | `DONE passed=0 failed=26`. Every failure was a missing implementation, e.g. `Variable <unknown_object>.InvCaster(...) not set before reading it.`, `...inv_combo_key...`, `...InvAxe...` |
| GREEN | `./test.sh` (with `src/inv_core.gml`) | `DONE passed=26 failed=0`, exit 0 (after fixing the harness CRLF check) |
| RED (correction) | `./test.sh` after aligning tests with the Dota tooltips (`abilities_english.txt`, `dota_english.txt`) | `DONE passed=25 failed=2`: `swapping invoked spells does not start invoke cooldown: invoke still ready after a pure swap`; `axe regenerates up to max hp: hp after 1s: expected ~7535.59, got 7120.46` |
| GREEN (correction) | `./test.sh` | `DONE passed=27 failed=0`, exit 0 |

## Guarantees
| # | What is guaranteed | Test (`tests/inv_core_tests.gml`) | Result |
|---|---|---|---|
| 1 | Only the last three orbs are kept, in press order | orbs keep last three in press order | PASS |
| 2 | All 10 orb combos map to the right spell, in any order | orb combos map to all ten spells in any order | PASS |
| 3 | Invoke with fewer than 3 orbs does nothing | invoke needs three orbs | PASS |
| 4 | A new spell goes to F (key F) and the old one moves to R | invoke puts new spell in slot F… | PASS |
| 5 | Re-invoking the R spell swaps it into F without starting Invoke's cooldown (Invoke Note1); re-invoking the F spell changes nothing | invoking the spell in slot R… / swapping invoked spells… / already in F… | PASS |
| 6 | Invoke cooldown = max(0, 7 − 0.3 × orb levels): 0 at 9/9/9, 6.1 at 1/1/1; Invoke is blocked while on cooldown | invoke cooldown … (3 tests) | PASS |
| 7 | Spell cooldowns: Cold Snap 13, Ghost Walk 40, Tornado 22, EMP 27, Alacrity 15, Meteor 50, Sun Strike 23, Forge 27, Ice Wall 23, Blast 36 | spell cooldowns match level 30 Invoker… | PASS |
| 8 | Casting starts the cooldown, blocks recasts until it expires and persists after the spell leaves the slots; casting an empty slot does nothing | casting… (3 tests) | PASS |
| 9 | Spell values at orbs 9 plus talents (Tornado 455 dmg / 2.8 s lift, SS 575, Blast 390, Cold Snap 92, Meteor 215 / 50 dps / 3 meteors, Ice Wall 128 dps, EMP 700 mana, Alacrity +131) | spell values use orb level 9 and talents | PASS |
| 10 | Item layout Z X C V CapsLock Space; cooldowns Hex 20, Shiva 27, Refresher 180, BKB 95, Blink 15; Aghanim has no active | item … / aghanim's scepter has no active | PASS |
| 11 | Refresher resets spells and items but not itself | refresher resets spells and items but not itself | PASS |
| 12 | BKB duration goes 9 → 8 → 7 → 7 | bkb duration shrinks 9 8 7 and stays at 7 | PASS |
| 13 | Keys: Q W E = orbs, F = slot 1, R = slot 2, D = Invoke, Z X C V CapsLock(20) Space = items 0–5; other keys unbound | keys map to the requested layout | PASS |
| 14 | Axe max HP = 120 + 22 × (25 + 2.7×29 + 15 + 6×40) ≈ 8002.6 | axe max hp is level 30 with six hearts | PASS |
| 15 | Magic damage −25%, pure damage unchanged, a dead Axe takes no damage | magical… / pure… / axe dies… | PASS |
| 16 | The Axe dies at 0 HP, respawns after 3 s at full HP and regenerates up to max at 2 + 0.1×str + 6×1% max HP + 1.5% of missing HP (≈520 HP/s at full HP); reset restores him | axe dies… / axe regenerates… / reset restores a dead axe | PASS |

## Coverage and known gaps
- **No coverage tool for GML.** By inspection, every function in `src/inv_core.gml` is called by at least one test. The 80% line-coverage metric cannot be measured here.
- **Rules confirmed from Dota's localization files** (earlier they were filled in from memory):
  - `dota_english.txt` `DOTA_HeroStats_Strength_Desc`: "Each point of Strength grants 22 Health and 0.1 Health Regen";
  - `DOTA_Glossary_Talents_Desc`: levels 27–30 learn the remaining talents, so all 8 are taken at level 30;
  - `abilities_english.txt` Heart: `hp_regen` = "+% Max Health Regen"; Behemoth's Blood = 1.5% of missing HP, "Multiple instances … do not stack";
  - Invoke: −0.3 s per orb level; Note1: no cooldown when it only swaps spells.
- **Still an interpretation:**
  - the +1% max HP regen of each Heart stacks (6%), because only Behemoth's Blood is marked as non-stacking. Check Axe's HP regen in Hero Demo;
  - Invoke's cooldown floor is 0, because cooldowns can't be negative.
- **Not covered yet:**
  - spell effects (Tornado lift, EMP delay, Meteor rolling, Sun Strike delay, Ice Wall, Forge Spirits, Ghost Walk, Blast knockback);
  - physical damage and armour, Hex/Shiva/BKB/Blink effects;
  - mana;
  - input wiring, HUD, LBR integration and assets.
- **No Git repo**, so the skill's checkpoint commits were skipped.
