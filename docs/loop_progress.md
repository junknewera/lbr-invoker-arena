# Progress

The /loop was stopped at the user's request ("разом"); the rest was done in one pass.

| Stage | Result |
|---|---|
| Core rules (`src/inv_core.gml`) | orbs/Invoke/cooldowns/items/keys/Axe, unit-tested |
| World sim (`src/inv_world.gml`) | all 10 spells + Cataclysm/twisters/Ice Floe, attacks, Hex/Shiva/BKB/Blink/Refresher |
| Unit tests (`./test.sh`) | 55/55 in the real LBR runner |
| LBR integration (`mod/`, `build/invoker_mod.csx`) | arena object, I toggle, HUD hidden, nav hotkeys and blower input gated |
| Assets (`assets.sh`) | Dota icons + sounds + Invoker voice lines, loaded at runtime from `<game>/invoker_arena/` |
| E2E (`./e2e.sh`) | title → new game → arena → 3 scripted combos, screenshots in `e2e/` |
| Install (`install.sh` / `restore.sh`) | written, NOT run (the user installs it) |

## Open interpretations (verify in Dota Hero Demo)
- Each Heart's +1% max HP regen stacks (6%).
- Twister damage is damage per second, dealt in 0.25 s ticks.
- Magic resistance from intelligence multiplies with the 25% base.
- Meteor fan angle (±20°), knockback speed (100/s), Forge Spirit walking speed.
- Hero hull radius 24; armor formula 0.06·a/(1+0.06·|a|).
