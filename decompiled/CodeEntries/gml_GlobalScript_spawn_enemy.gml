function spawn_enemy(arg0, arg1 = false, arg2 = o_game.area.get_enemy_level())
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var enemy_object = o_enemy_mob;
    if (arg0.is_boss || arg1)
    {
        instance_destroy(o_enemy);
        arg2 *= 5;
        enemy_object = o_enemy_boss;
        arg1 = true;
    }
    random_set_seed(arg0.get_spawn_seed());
    var quark_boost = false;
    var soul_boost = false;
    if (o_game.area.is_horde)
    {
        if (is_current_area(global.areas.leafton_pit))
        {
            quark_boost = percent_chance(global.upgrade_attributes.leafton_pit_quark_boost_chance * 100);
        }
    }
    else
    {
        var soul_boost_chance = arg0.get_soul_boost_chance();
        soul_boost = percent_chance(soul_boost_chance * 100);
        var soul_boost_level = arg0.data.db_souls_chance_level;
        var soul_boost_toggle = get_default_struct_value(arg0.data, "db_souls_chance_level_toggle", true);
        if (!soul_boost_toggle)
        {
            soul_boost = false;
        }
        if (soul_boost_chance > 0)
        {
            var pity_counter = arg0.get_pity_counter();
            var next_pity_counter = arg0.get_next_pity_counter();
            if (pity_counter >= next_pity_counter && soul_boost_toggle)
            {
                soul_boost = true;
            }
        }
        if (soul_boost_toggle)
        {
            if (soul_boost)
            {
                arg2 *= 10000000000;
                arg0.data.soul_spawns++;
            }
        }
    }
    randomize();
    arg0.data.seen = true;
    var o = instance_create_layer(0, 0, global.layers.player, enemy_object);
    apply_struct_to_instance(arg0, o);
    o.enemy = arg0;
    o.level = arg2;
    o.quark_boost = quark_boost;
    o.quark_level = o_game.area.get_enemy_quark_level();
    o.is_boss = arg1;
    o.soul_boost = soul_boost;
    with (o)
    {
        init();
    }
}
