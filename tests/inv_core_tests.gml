// Core Invoker Arena rules: orbs, Invoke, cooldowns, items, key layout and the Axe dummy.
// Expected numbers come from the installed Dota 2 data (npc_dota_hero_invoker.txt, items.txt, npc_dota_hero_axe.txt).

function inv_tt_invoke(_c, _orbs)
{
    for (var i = 1; i <= string_length(_orbs); i++)
    {
        inv_press_orb(_c, string_char_at(_orbs, i));
    }
    return inv_invoke(_c);
}

function inv_core_tests_register()
{
    inv_test_register("orbs keep last three in press order", function()
    {
        var _c = new InvCaster();
        inv_press_orb(_c, "q");
        inv_press_orb(_c, "w");
        inv_press_orb(_c, "e");
        inv_press_orb(_c, "q");
        inv_t_arr(_c.orbs, ["w", "e", "q"], "orbs");
    });

    inv_test_register("orb combos map to all ten spells in any order", function()
    {
        var _cases = [
            ["qqq", "cold_snap"], ["qqw", "ghost_walk"], ["qqe", "ice_wall"],
            ["www", "emp"], ["wwq", "tornado"], ["wwe", "alacrity"],
            ["eee", "sun_strike"], ["eeq", "forge_spirit"], ["eew", "chaos_meteor"],
            ["qwe", "deafening_blast"], ["wqq", "ghost_walk"], ["ewq", "deafening_blast"]
        ];
        for (var i = 0; i < array_length(_cases); i++)
        {
            var _s = _cases[i][0];
            var _orbs = [string_char_at(_s, 1), string_char_at(_s, 2), string_char_at(_s, 3)];
            inv_t_eq(inv_combo_key(_orbs), _cases[i][1], "combo " + _s);
        }
    });

    inv_test_register("invoke needs three orbs", function()
    {
        var _c = new InvCaster();
        inv_t_eq(inv_tt_invoke(_c, "qw"), undefined, "invoke result");
        inv_t_arr(_c.slots, [undefined, undefined], "slots");
    });

    inv_test_register("invoke puts new spell in slot F and shifts old one to R", function()
    {
        var _c = new InvCaster();
        inv_t_eq(inv_tt_invoke(_c, "wwq"), "tornado", "first invoke");
        inv_t_eq(inv_tt_invoke(_c, "www"), "emp", "second invoke");
        inv_t_arr(_c.slots, ["emp", "tornado"], "slots");
    });

    inv_test_register("invoking the spell in slot R swaps it into F", function()
    {
        var _c = new InvCaster();
        inv_tt_invoke(_c, "wwq");
        inv_tt_invoke(_c, "www");
        inv_t_eq(inv_tt_invoke(_c, "wwq"), "tornado", "re-invoke");
        inv_t_arr(_c.slots, ["tornado", "emp"], "slots");
    });

    inv_test_register("swapping invoked spells does not start invoke cooldown", function()
    {
        var _c = new InvCaster(1, 1, 1);
        inv_tt_invoke(_c, "wwq");
        inv_tick(_c, 6.1);
        inv_tt_invoke(_c, "www");
        inv_tick(_c, 6.1);
        inv_t_eq(inv_tt_invoke(_c, "wwq"), "tornado", "swap back");
        inv_t_arr(_c.slots, ["tornado", "emp"], "slots");
        inv_t_true(inv_is_ready(_c, "invoke"), "invoke still ready after a pure swap");
    });

    inv_test_register("invoking the spell already in F keeps both slots", function()
    {
        var _c = new InvCaster();
        inv_tt_invoke(_c, "www");
        inv_tt_invoke(_c, "wwq");
        inv_tt_invoke(_c, "wwq");
        inv_t_arr(_c.slots, ["tornado", "emp"], "slots");
    });

    inv_test_register("invoke cooldown is 0 with orbs 9/9/9", function()
    {
        inv_t_near(inv_invoke_cooldown(new InvCaster()), 0, 0.0001, "invoke cd");
    });

    inv_test_register("invoke cooldown is 7 - 0.3 per orb level", function()
    {
        inv_t_near(inv_invoke_cooldown(new InvCaster(1, 1, 1)), 6.1, 0.0001, "invoke cd at 1/1/1");
    });

    inv_test_register("invoke on cooldown does nothing until it recovers", function()
    {
        var _c = new InvCaster(1, 1, 1);
        inv_tt_invoke(_c, "wwq");
        inv_t_eq(inv_tt_invoke(_c, "www"), undefined, "invoke during cooldown");
        inv_t_arr(_c.slots, ["tornado", undefined], "slots during cooldown");
        inv_tick(_c, 6.1);
        inv_t_eq(inv_invoke(_c), "emp", "invoke after cooldown");
    });

    inv_test_register("spell cooldowns match level 30 Invoker with all talents", function()
    {
        var _c = new InvCaster();
        var _cases = [
            ["cold_snap", 13], ["ghost_walk", 40], ["tornado", 22], ["emp", 27], ["alacrity", 15],
            ["chaos_meteor", 50], ["sun_strike", 23], ["forge_spirit", 27], ["ice_wall", 23], ["deafening_blast", 36]
        ];
        for (var i = 0; i < array_length(_cases); i++)
        {
            inv_t_near(inv_spell_cooldown(_c, _cases[i][0]), _cases[i][1], 0.0001, _cases[i][0]);
        }
    });

    inv_test_register("casting a slot starts its cooldown and blocks recast", function()
    {
        var _c = new InvCaster();
        inv_tt_invoke(_c, "wwq");
        inv_t_eq(inv_cast_slot(_c, 0), "tornado", "first cast");
        inv_t_eq(inv_cast_slot(_c, 0), undefined, "recast blocked");
        inv_tick(_c, 21.9);
        inv_t_eq(inv_cast_slot(_c, 0), undefined, "still on cooldown at 21.9s");
        inv_tick(_c, 0.2);
        inv_t_eq(inv_cast_slot(_c, 0), "tornado", "ready after 22s");
    });

    inv_test_register("casting an empty slot does nothing", function()
    {
        inv_t_eq(inv_cast_slot(new InvCaster(), 0), undefined, "empty slot");
    });

    inv_test_register("spell cooldown persists after it leaves the slots", function()
    {
        var _c = new InvCaster();
        inv_tt_invoke(_c, "wwq");
        inv_cast_slot(_c, 0);
        inv_tt_invoke(_c, "www");
        inv_tt_invoke(_c, "qqq");
        inv_tt_invoke(_c, "wwq");
        inv_t_eq(inv_cast_slot(_c, 0), undefined, "tornado still on cooldown");
    });

    inv_test_register("spell values use orb level 9 and talents", function()
    {
        var _c = new InvCaster();
        var _cases = [
            ["tornado", "damage", 455], ["tornado", "lift_duration", 2.8],
            ["sun_strike", "damage", 575], ["deafening_blast", "damage", 390],
            ["cold_snap", "freeze_damage", 92], ["chaos_meteor", "main_damage", 215],
            ["chaos_meteor", "burn_dps", 50], ["chaos_meteor", "meteor_count", 3],
            ["ice_wall", "damage_per_second", 128], ["emp", "mana_burned", 700],
            ["alacrity", "bonus_damage", 131]
        ];
        for (var i = 0; i < array_length(_cases); i++)
        {
            var _k = _cases[i];
            inv_t_near(inv_spell_value(_c, _k[0], _k[1]), _k[2], 0.0001, _k[0] + "." + _k[1]);
        }
    });

    inv_test_register("item slots follow the Z X C V CapsLock Space layout", function()
    {
        inv_t_arr(new InvCaster().items, ["sheepstick", "shivas_guard", "refresher", "ultimate_scepter", "black_king_bar", "blink"], "items");
    });

    inv_test_register("item cooldowns match Dota", function()
    {
        var _cases = [["sheepstick", 20], ["shivas_guard", 27], ["refresher", 180], ["black_king_bar", 95], ["blink", 15]];
        for (var i = 0; i < array_length(_cases); i++)
        {
            inv_t_near(inv_item_cooldown(_cases[i][0]), _cases[i][1], 0.0001, _cases[i][0]);
        }
    });

    inv_test_register("aghanim's scepter has no active", function()
    {
        var _c = new InvCaster();
        inv_t_eq(inv_use_item(_c, 3), undefined, "use aghanim");
        inv_t_true(inv_is_ready(_c, "ultimate_scepter"), "no cooldown started");
    });

    inv_test_register("refresher resets abilities only, not items or itself", function()
    {
        var _c = new InvCaster();
        inv_tt_invoke(_c, "wwq");
        inv_t_eq(inv_cast_slot(_c, 0), "tornado", "cast tornado");
        inv_t_eq(inv_use_item(_c, 0), "sheepstick", "use hex");
        inv_t_eq(inv_use_item(_c, 2), "refresher", "use refresher");
        inv_t_true(inv_is_ready(_c, "tornado"), "tornado refreshed");
        inv_t_true(!inv_is_ready(_c, "sheepstick"), "hex stays on cooldown");
        inv_t_true(!inv_is_ready(_c, "refresher"), "refresher on cooldown");
        inv_t_eq(inv_use_item(_c, 2), undefined, "refresher blocked");
    });

    inv_test_register("bkb duration shrinks 9 8 7 and stays at 7", function()
    {
        var _c = new InvCaster();
        var _durations = [];
        for (var i = 0; i < 4; i++)
        {
            inv_t_eq(inv_use_item(_c, 4), "black_king_bar", "bkb use " + string(i));
            array_push(_durations, _c.bkb_duration);
            inv_tick(_c, 95);
        }
        inv_t_arr(_durations, [9, 8, 7, 7], "bkb durations");
    });

    inv_test_register("keys map to the requested layout", function()
    {
        var _cases = [
            [ord("Q"), "quas"], [ord("W"), "wex"], [ord("E"), "exort"],
            [ord("F"), "slot1"], [ord("R"), "slot2"], [ord("D"), "invoke"],
            [ord("Z"), "item0"], [ord("X"), "item1"], [ord("C"), "item2"],
            [ord("V"), "item3"], [20, "item4"], [vk_space, "item5"]
        ];
        for (var i = 0; i < array_length(_cases); i++)
        {
            inv_t_eq(inv_key_action(_cases[i][0]), _cases[i][1], "key " + string(_cases[i][0]));
        }
        inv_t_eq(inv_key_action(ord("A")), undefined, "unbound key");
    });

    inv_test_register("axe max hp is level 30 with six hearts", function()
    {
        inv_t_near(new InvAxe().max_hp, 120 + 22 * (25 + 2.7 * 29 + 15 + 6 * 40), 0.01, "max hp");
    });

    inv_test_register("magical damage is reduced by 25% base and 0.1% per intelligence", function()
    {
        var _a = new InvAxe();
        var _mr = 1 - 0.75 * (1 - 0.001 * (18 + 1.6 * 29));
        inv_t_near(inv_axe_hit(_a, 1000, "magical"), 1000 * (1 - _mr), 0.0001, "dealt");
        inv_t_near(_a.hp, _a.max_hp - 1000 * (1 - _mr), 0.0001, "hp");
    });

    inv_test_register("axe mana pool is 75 + 12 per intelligence", function()
    {
        var _a = new InvAxe();
        inv_t_near(_a.max_mana, 75 + 12 * (18 + 1.6 * 29), 0.0001, "max mana");
        inv_t_near(_a.mana, _a.max_mana, 0.0001, "starts full");
    });

    inv_test_register("pure damage ignores resistance", function()
    {
        var _a = new InvAxe();
        inv_t_near(inv_axe_hit(_a, 575, "pure"), 575, 0.0001, "dealt");
    });

    inv_test_register("axe dies at zero hp and respawns after 3 seconds", function()
    {
        var _a = new InvAxe();
        inv_axe_hit(_a, 100000, "pure");
        inv_t_true(!_a.alive, "dead");
        inv_t_near(_a.hp, 0, 0.0001, "hp clamped to 0");
        inv_t_near(inv_axe_hit(_a, 500, "pure"), 0, 0.0001, "dead axe takes no damage");
        inv_axe_tick(_a, 2.9);
        inv_t_true(!_a.alive, "still dead at 2.9s");
        inv_axe_tick(_a, 0.2);
        inv_t_true(_a.alive, "respawned");
        inv_t_near(_a.hp, _a.max_hp, 0.0001, "full hp after respawn");
    });

    inv_test_register("axe regenerates up to max hp", function()
    {
        var _a = new InvAxe();
        inv_axe_hit(_a, 1000, "pure");
        inv_axe_tick(_a, 1);
        // 0.1 regen per strength, +1% max HP per Heart (stacks), Behemoth's Blood 1.5% of missing HP (does not stack).
        var _regen = 2 + 0.1 * (25 + 2.7 * 29 + 15 + 6 * 40) + 6 * 0.01 * _a.max_hp + 0.015 * 1000;
        inv_t_near(_a.hp, _a.max_hp - 1000 + _regen, 0.01, "hp after 1s");
        inv_axe_tick(_a, 100);
        inv_t_near(_a.hp, _a.max_hp, 0.0001, "capped at max");
    });

    inv_test_register("reset restores a dead axe", function()
    {
        var _a = new InvAxe();
        inv_axe_hit(_a, 100000, "pure");
        inv_axe_reset(_a);
        inv_t_true(_a.alive, "alive");
        inv_t_near(_a.hp, _a.max_hp, 0.0001, "full hp");
    });
}
