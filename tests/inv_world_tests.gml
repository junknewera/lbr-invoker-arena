// Arena simulation, part A: Sun Strike / Cataclysm, EMP, Tornado (+ Aghanim's twisters), Cold Snap.
// Mechanics follow Dota's tooltips (abilities_english.txt); positions are in Dota units.

function inv_tt_damage_from(_w, _source)
{
    var _sum = 0;
    for (var i = 0; i < array_length(_w.events); i++)
    {
        var _e = _w.events[i];
        if (_e.kind == "damage" && _e.source == _source)
        {
            _sum += _e.amount;
        }
    }
    return _sum;
}

function inv_tt_effects(_w, _kind)
{
    var _found = [];
    for (var i = 0; i < array_length(_w.effects); i++)
    {
        if (_w.effects[i].kind == _kind)
        {
            array_push(_found, _w.effects[i]);
        }
    }
    return _found;
}

function inv_tt_axe_mr()
{
    return 1 - 0.75 * (1 - 0.001 * (18 + 1.6 * 29));
}

function inv_world_tests_register()
{
    inv_test_register("world starts with hero at origin and axe 700 units away", function()
    {
        var _w = new InvWorld();
        inv_t_near(point_distance(_w.hero.x, _w.hero.y, _w.axe.x, _w.axe.y), 700, 0.0001, "distance");
    });

    inv_test_register("sun strike lands after 1.7s for 575 pure", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "eee");
        inv_t_eq(inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y), "sun_strike", "cast");
        inv_world_tick(_w, 1.69);
        inv_t_near(inv_tt_damage_from(_w, "sun_strike"), 0, 0.0001, "nothing before 1.7s");
        inv_world_tick(_w, 0.02);
        inv_t_near(inv_tt_damage_from(_w, "sun_strike"), 575, 0.0001, "575 pure on landing");
    });

    inv_test_register("sun strike far from the axe misses", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "eee");
        inv_world_cast_slot(_w, 0, _w.axe.x + 300, _w.axe.y);
        inv_world_tick(_w, 2);
        inv_t_near(inv_tt_damage_from(_w, "sun_strike"), 0, 0.0001, "missed");
    });

    inv_test_register("double-tapped sun strike becomes cataclysm with 90s cooldown", function()
    {
        var _w = new InvWorld();
        random_set_seed(7);
        inv_tt_invoke(_w.caster, "eee");
        inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y);
        inv_world_tick(_w, 0.1);
        inv_t_eq(inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y), "cataclysm", "double tap");
        inv_t_near(inv_cooldown_left(_w.caster, "sun_strike"), 90, 0.0001, "90s cooldown");
        var _strikes = inv_tt_effects(_w, "sun_strike");
        inv_t_eq(array_length(_strikes), 2, "two cataclysm strikes replace the single one");
        for (var i = 0; i < array_length(_strikes); i++)
        {
            var _d = point_distance(_strikes[i].x, _strikes[i].y, _w.axe.x, _w.axe.y);
            inv_t_true(_d >= 90 && _d <= 180, "strike " + string(i) + " within 90-180 of the axe");
        }
        inv_world_tick(_w, 1.7);
        inv_t_near(inv_tt_damage_from(_w, "sun_strike"), 0, 0.0001, "original strike cancelled");
        inv_t_near(inv_tt_damage_from(_w, "cataclysm"), 2 * 575 * 0.75, 0.0001, "two 75% strikes");
    });

    inv_test_register("emp detonates after 2.9s, burns 700 mana and deals 60% of it as magic", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "www");
        inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y);
        inv_world_tick(_w, 2.89);
        inv_t_near(_w.axe.mana, _w.axe.max_mana, 0.0001, "nothing before 2.9s");
        inv_world_tick(_w, 0.02);
        inv_t_near(_w.axe.mana, _w.axe.max_mana - 700, 0.0001, "700 mana burned");
        inv_t_near(inv_tt_damage_from(_w, "emp"), 700 * 0.6 * (1 - inv_tt_axe_mr()), 0.01, "damage");
    });

    inv_test_register("emp beyond cast range is placed at 950 units", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "www");
        inv_world_cast_slot(_w, 0, 3000, 0);
        var _emps = inv_tt_effects(_w, "emp");
        inv_t_eq(array_length(_emps), 1, "one emp");
        inv_t_near(point_distance(_w.hero.x, _w.hero.y, _emps[0].x, _emps[0].y), 950, 0.0001, "clamped");
    });

    inv_test_register("tornado lifts the axe, he is invulnerable, and takes 455 magic on landing", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "wwq");
        inv_t_eq(inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y), "tornado", "cast");
        inv_world_tick(_w, 0.6);
        inv_t_true(_w.axe.lift_left > 0, "lifted");
        inv_world_damage(_w, 575, "pure", "test");
        inv_t_near(inv_tt_damage_from(_w, "test"), 0, 0.0001, "invulnerable while lifted");
        inv_world_tick(_w, 2.8);
        inv_t_near(_w.axe.lift_left, 0, 0.0001, "landed");
        inv_t_near(inv_tt_damage_from(_w, "tornado"), 455 * (1 - inv_tt_axe_mr()), 0.01, "landing damage");
    });

    inv_test_register("emp does not affect a lifted axe", function()
    {
        var _w = new InvWorld();
        inv_tt_invoke(_w.caster, "wwq");
        inv_tt_invoke(_w.caster, "www");
        inv_world_cast_slot(_w, 1, _w.axe.x, _w.axe.y);
        inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y);
        inv_world_tick(_w, 0.6);
        inv_world_tick(_w, 2.4);
        inv_t_true(_w.axe.lift_left > 0, "still lifted when emp goes off");
        inv_t_near(_w.axe.mana, _w.axe.max_mana, 0.0001, "no mana burned");
        inv_t_near(inv_tt_damage_from(_w, "emp"), 0, 0.0001, "no emp damage");
    });

    inv_test_register("tornado travels at most 3900 units", function()
    {
        var _w = new InvWorld();
        _w.axe.x = 5000;
        inv_tt_invoke(_w.caster, "wwq");
        inv_world_cast_slot(_w, 0, 5000, 0);
        inv_world_tick(_w, 4);
        inv_t_eq(array_length(inv_tt_effects(_w, "tornado")), 0, "tornado gone");
        inv_t_near(_w.axe.lift_left, 0, 0.0001, "axe not reached");
    });

    inv_test_register("aghanim's tornado leaves a twister every 300 units", function()
    {
        var _w = new InvWorld();
        _w.axe.x = 5000;
        inv_tt_invoke(_w.caster, "wwq");
        inv_world_cast_slot(_w, 0, 5000, 0);
        inv_world_tick(_w, 3.9);
        inv_t_eq(array_length(inv_tt_effects(_w, "twister")), 13, "twisters along 3900 units");
    });

    inv_test_register("twister deals its wex damage per second in 0.25s ticks", function()
    {
        var _w = new InvWorld();
        inv_world_spawn_twister(_w, _w.axe.x, _w.axe.y);
        inv_world_tick(_w, 1);
        inv_t_near(inv_tt_damage_from(_w, "twister"), 130 * (1 - inv_tt_axe_mr()), 0.01, "one second");
    });

    inv_test_register("cold snap needs the axe within 1000 range", function()
    {
        var _w = new InvWorld();
        _w.axe.x = 1500;
        inv_tt_invoke(_w.caster, "qqq");
        inv_t_eq(inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y), undefined, "out of range");
        inv_t_true(inv_is_ready(_w.caster, "cold_snap"), "no cooldown spent");
    });

    inv_test_register("cold snap freezes on cast and again on damage above 10 every 0.56s for 6.2s", function()
    {
        var _w = new InvWorld();
        var _hit = 92 * (1 - inv_tt_axe_mr());
        inv_tt_invoke(_w.caster, "qqq");
        inv_t_eq(inv_world_cast_slot(_w, 0, _w.axe.x, _w.axe.y), "cold_snap", "cast");
        inv_t_near(inv_tt_damage_from(_w, "cold_snap"), _hit, 0.01, "initial freeze");
        inv_world_damage(_w, 100, "pure", "test");
        inv_t_near(inv_tt_damage_from(_w, "cold_snap"), _hit, 0.01, "no refreeze within 0.56s");
        inv_world_tick(_w, 0.6);
        inv_world_damage(_w, 100, "pure", "test");
        inv_t_near(inv_tt_damage_from(_w, "cold_snap"), 2 * _hit, 0.01, "refreeze after cooldown");
        inv_world_tick(_w, 0.6);
        inv_world_damage(_w, 10, "pure", "test");
        inv_t_near(inv_tt_damage_from(_w, "cold_snap"), 2 * _hit, 0.01, "10 damage does not trigger");
        inv_world_tick(_w, 6);
        inv_world_damage(_w, 100, "pure", "test");
        inv_t_near(inv_tt_damage_from(_w, "cold_snap"), 2 * _hit, 0.01, "expired after 6.2s");
    });
}
