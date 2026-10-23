// Arena simulation, part B: Chaos Meteor, Deafening Blast, Ice Wall, Forge Spirits, Alacrity, Ghost Walk,
// hero attacks and the items Hex / Shiva / BKB / Blink.

function inv_tt_count_from(_w, _source)
{
    var _n = 0;
    for (var i = 0; i < array_length(_w.events); i++)
    {
        if (_w.events[i].kind == "damage" && _w.events[i].source == _source)
        {
            _n++;
        }
    }
    return _n;
}

function inv_tt_armor_mult(_armor)
{
    return 1 - 0.06 * _armor / (1 + 0.06 * abs(_armor));
}

function inv_world_b_tests_register()
{
    inv_test_register("three chaos meteors land after 1.3s and roll dealing 215 every 0.5s", function()
    {
        var _w = new InvWorld();
        var _mr = inv_tt_axe_mr();
        inv_tt_invoke(_w.caster, "eew");
        inv_t_eq(inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y), "chaos_meteor", "cast");
        inv_t_eq(array_length(inv_tt_effects(_w, "meteor")), 3, "three meteors");
        inv_world_tick(_w, 1.29);
        inv_t_near(inv_tt_damage_from(_w, "chaos_meteor"), 0, 0.0001, "nothing before landing");
        inv_world_tick(_w, 0.01);
        inv_t_near(inv_tt_damage_from(_w, "chaos_meteor"), 3 * 215 * (1 - _mr), 0.01, "landing hit");
        inv_world_tick(_w, 0.5);
        inv_t_near(inv_tt_damage_from(_w, "chaos_meteor"), 6 * 215 * (1 - _mr), 0.01, "second roll tick");
        inv_t_true(inv_tt_damage_from(_w, "chaos_meteor_burn") > 0, "burning");
    });

    inv_test_register("radial deafening blast hits the axe once, knocks back and disarms", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "qwe");
        inv_t_eq(inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y), "deafening_blast", "cast");
        inv_t_eq(array_length(inv_tt_effects(_w, "blast")), 12, "twelve waves (talent)");
        inv_world_tick(_w, 0.5);
        inv_world_tick(_w, 1.0);
        inv_t_eq(inv_tt_count_from(_w, "deafening_blast"), 1, "hit once");
        inv_t_near(inv_tt_damage_from(_w, "deafening_blast"), 390 * (1 - inv_tt_axe_mr()), 0.01, "damage");
        inv_t_true(_w.axe.knockback_left > 0 && _w.axe.disarmed_left > 4, "knocked back and disarmed");
        inv_t_true(_w.axe.x > 700, "pushed away from Invoker");
    });

    inv_test_register("aghanim's ice wall forms after 1.3s, burns 128/s and roots after 2.5s", function()
    {
        var _w = new InvWorld();
        var _mr = inv_tt_axe_mr();
        _w.axe.x = 600;
        inv_tt_invoke(_w.caster, "qqe");
        inv_t_eq(inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y), "ice_wall", "cast");
        inv_world_tick(_w, 1.3);
        inv_t_near(inv_tt_damage_from(_w, "ice_wall"), 0, 0.0001, "not formed yet");
        inv_world_tick(_w, 1.0);
        inv_t_near(inv_tt_damage_from(_w, "ice_wall"), 128 * (1 - _mr), 0.01, "one second inside");
        inv_world_tick(_w, 1.5);
        inv_t_true(_w.axe.rooted_left > 0, "rooted");
        inv_t_near(inv_tt_damage_from(_w, "ice_wall_root"), 325 * (1 - _mr), 0.01, "root damage");
    });

    inv_test_register("forge spirit summons min(quas, exort) = 3 spirits and recast replaces them", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "eeq");
        inv_world_cast_slot(_w, 0, 0, 0);
        inv_t_eq(array_length(inv_tt_effects(_w, "spirit")), 3, "three spirits");
        inv_world_tick(_w, 27);
        inv_world_cast_slot(_w, 0, 0, 0);
        inv_t_eq(array_length(inv_tt_effects(_w, "spirit")), 3, "replaced, not added");
    });

    inv_test_register("forge spirits hit every 1.35s for 100 physical and melt 2.4 armor per hit", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "eeq");
        inv_world_cast_slot(_w, 0, 0, 0);
        inv_world_tick(_w, 1.35);
        inv_t_eq(inv_tt_count_from(_w, "forge_spirit"), 3, "three hits");
        inv_t_near(_w.axe.armor_reduction, 3 * 2.4, 0.0001, "armor melted");
        inv_t_near(_w.events[0].amount, 100 * inv_tt_armor_mult(0.16 * (18 + 1.7 * 29)), 0.01, "first hit vs full armor");
    });

    inv_test_register("alacrity gives invoker +131 attack damage for 9s", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "wwe");
        inv_t_eq(inv_world_cast_slot(_w, 0, 0, 0), "alacrity", "cast");
        inv_t_near(_w.hero.alacrity_left, 9, 0.0001, "duration");
        inv_t_near(inv_hero_attack_damage(_w.caster, true) - inv_hero_attack_damage(_w.caster, false), 131, 0.0001, "bonus damage");
    });

    inv_test_register("invoker attack: 233 damage and 1.7 / 1.91 interval with no orbs", function()
    {
        var _c = new InvCaster();
        inv_t_near(inv_hero_attack_damage(_c, false), 22 + (22 + 4 * 29 + 9 + 10 + 30) + 24, 0.0001, "damage");
        inv_t_near(inv_hero_attack_interval(_c, false), 1.7 / ((100 + 14 + 2 * 29 + 9 + 10) / 100), 0.0001, "interval");
    });

    inv_test_register("attack order walks into 600 range and hits at the attack interval", function()
    {
        var _w = new InvWorld();
        inv_world_order_attack(_w);
        inv_world_tick(_w, 0.3);
        inv_t_eq(inv_tt_count_from(_w, "attack"), 1, "first hit once in range");
        inv_world_tick(_w, inv_hero_attack_interval(_w.caster, false));
        inv_t_eq(inv_tt_count_from(_w, "attack"), 2, "second hit after one interval");
    });

    inv_test_register("ghost walk makes invoker invisible until he casts", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "qqw");
        inv_world_cast_slot(_w, 0, 0, 0);
        inv_t_near(_w.hero.invisible_left, 50, 0.0001, "invisible");
        inv_tt_invoke(_w.caster, "wwq");
        inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y);
        inv_t_near(_w.hero.invisible_left, 0, 0.0001, "broken by casting");
    });

    inv_test_register("hex needs 800 range and turns the axe into a critter for 2.8s", function()
    {
        var _w = new InvWorld();
        _w.axe.x = 1000;
        inv_t_eq(inv_world_use_item(_w, 0, _w.axe.x, _w.axe.y), undefined, "out of range");
        inv_t_true(inv_is_ready(_w.caster, "sheepstick"), "no cooldown spent");
        _w.axe.x = 700;
        inv_t_eq(inv_world_use_item(_w, 0, _w.axe.x, _w.axe.y), "sheepstick", "hex");
        inv_t_near(_w.axe.hexed_left, 2.8, 0.0001, "hexed");
    });

    inv_test_register("shiva's wave reaches the axe at 400 speed, hits once for 225 and slows", function()
    {
        var _w = new InvWorld();
        inv_t_eq(inv_world_use_item(_w, 1, 0, 0), "shivas_guard", "shiva");
        inv_world_tick(_w, 1.6);
        inv_t_near(inv_tt_damage_from(_w, "shivas_guard"), 0, 0.0001, "not reached yet");
        inv_world_tick(_w, 0.2);
        inv_world_tick(_w, 1.0);
        inv_t_eq(inv_tt_count_from(_w, "shivas_guard"), 1, "hit once");
        inv_t_near(inv_tt_damage_from(_w, "shivas_guard"), 225 * (1 - inv_tt_axe_mr()), 0.01, "damage");
        inv_t_true(_w.axe.slowed_left > 0, "slowed");
    });

    inv_test_register("bkb gives invoker 9s of avatar", function()
    {
        var _w = new InvWorld();
        inv_t_eq(inv_world_use_item(_w, 4, 0, 0), "black_king_bar", "bkb");
        inv_t_near(_w.hero.bkb_left, 9, 0.0001, "duration");
    });

    inv_test_register("blink teleports up to 1200, or 960 toward a farther point", function()
    {
        var _w = new InvWorld();
        inv_t_eq(inv_world_use_item(_w, 5, 1000, 0), "blink", "blink");
        inv_t_near(_w.hero.x, 1000, 0.0001, "in range");
        inv_world_tick(_w, 15);
        inv_world_use_item(_w, 5, 4000, 0);
        inv_t_near(_w.hero.x, 1960, 0.0001, "clamped to 960");
    });

    inv_test_register("right click on ground moves invoker at 280 speed", function()
    {
        var _w = new InvWorld();
        inv_world_order_move(_w, 0, 1000);
        inv_world_tick(_w, 1);
        inv_t_near(_w.hero.y, 280, 0.0001, "moved");
    });
}
