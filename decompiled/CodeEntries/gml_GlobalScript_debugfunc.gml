function debugfunc()
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    try
    {
        log("D===");
        var ctrl = keyboard_check(vk_control);
        debug_benchmark();
        var __array = global.shops_sorted.dlc;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        var __struct = global.banks;
        var __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
        }
        global.enemies.boss_spark_bubble.data.db_counter = 500;
        __struct = global.enemies;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
        }
        __array = global.dice_types_sorted;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        __array = global.dice_rarity_sorted;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        __array = global.dice_inventory;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        __array = global.dice_backpack;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        __array = global.quarks_array;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        __array = global.dice_enemies;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        __struct = global.cards;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
        }
        var res = 
        {
            dice_rarity: 
            {
                legendary: 3
            }
        };
        __array = global.dice_rarity_sorted;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        __array = global.dice_enemies;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        if (keyboard_check(vk_control))
        {
        }
        if (!keyboard_check(vk_control))
        {
        }
        __struct = global.materials;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
        }
        with (o_enemy)
        {
            hp = 1;
        }
        o_game.area.data.boss_spawn_delay = sec(3);
        __struct = global.areas;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
        }
        global.hitstmp = 0;
        global.hitstimer = o_game.data.stats.time_elapsed;
        __array = global.resources_leaves;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var i = 1;
            while (i <= 6)
            {
                i++;
            }
        }
        __struct = global.relics;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
        }
        if (keyboard_check(vk_control))
        {
            global.log_enabled = !global.log_enabled;
            logf("log enabled", global.log_enabled);
        }
        clear_async_actions();
        global.cloud_data.last_season_upload_manual = undefined;
        global.cloud_data.last_season_upload = undefined;
        if (file_exists("save-season.dat"))
        {
            file_delete("save-season.dat");
        }
        global.is_saving = false;
        global.is_cloud_saving = false;
        __struct = global.chests;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
        }
        global.areas.tower.set_max_floor_stats(10);
        o_game.data.stats.borbcipherer = 1;
        __struct = global.quests.daily;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.finish(true);
        }
        var fish_ua = {};
        __array = global.fishing_rods;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        __struct = global.fishing_tournaments;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
        }
        global.cloud_data.last_season_upload_manual = undefined;
        global.resources.ship_fuel.data.unlocked = true;
        global.resources.water_crystal.data.unlocked = true;
        global.harbor.container.add(500);
        global.harbor.ships[0].data.time_end = o_game.data.stats.time_elapsed;
        __array = global.harbor.jobs;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.time_end = 0;
        }
        __array = global.harbor.ships;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
        }
        o_game.data.harbor.job_refresh_count = 10;
        o_game.data.harbor.job_refresh_time_end = 1;
        __struct = global.artifacts;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.collect();
        }
        global.events.halloween.data.expire_timer = o_game.data.stats.time_elapsed + sec(2);
        __struct = global.resources;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.data.count = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
        }
        init_game_vars(true);
    }
    catch (err)
    {
        log("debugfunc err");
        log(err);
    }
}

function debugfunc2()
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
}

function testfunc()
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
}

function debug_unlock_all(arg0 = false)
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    if (!global.debug)
    {
        exit;
    }
    global.shops.blc.unlock_alchemy.data.count = 1;
    global.shops.blc.unlock_alchemy.data.collected = 1;
    global.shops.coins.unlock_areas.data.count = 1;
    global.shops.blc.unlock_artifacts.data.count = 1;
    global.shops.soul_entities.unlock_banks.data.count = 1;
    global.shops.mlc.unlock_borbventures.data.count = 1;
    global.shops.mlc.unlock_cards.data.count = 1;
    global.shops.blc.unlock_crafting.data.count = 1;
    global.shops.coins.unlock_converters.data.count = 1;
    global.shops.sacred.unlock_relics.data.count = 1;
    global.shops.coal.unlock_mines.data.count = 1;
    global.shops.blc.unlock_materials.data.count = 1;
    global.shops.sacred.unlock_relics.data.count = 1;
    global.shops.coins.unlock_printers.data.count = 1;
    global.shops.blc.unlock_pets.data.count = 1;
    global.shops.blc.unlock_unique_leaves.data.count = 1;
    var __struct = global.areas;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.count = 1;
    }
    global.areas.tower.data.highest_floor = 200;
    global.areas.tower.data.highest_floor_stats = 200;
    global.areas.inner_pyramid.data.highest_floor = 100;
    global.areas.inner_pyramid.data.highest_floor_stats = 100;
    global.shops.blc.unlock_scrolls.data.count = 1;
    o_game.data.stats.prestige = 10;
    o_game.data.stats.prestige_crunch = 10;
    o_game.data.stats.prestige_mlc = 10;
    o_game.data.stats.prestige_ulc = 10;
    global.enemies.boss_weaver_of_worlds.data.defeated_run = 100;
    if (arg0)
    {
        init_game_vars(true);
        exit;
    }
    var __array = global.shops_items_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.data.count = get_shop_item_max_count(mitem);
        if (get_shop_item_max_count(mitem) == 0)
        {
            mitem.data.count = 100;
        }
    }
    __struct = global.resources;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.unlocked = true;
        mitem.data.count = 10000000000;
        mitem.data.collected = 10000000000;
        mitem.data.collected_total = 10000000000;
        if (mitem.is_leaf)
        {
            for (var level = 1; level <= global.game_settings.leafscend_max_level; level++)
            {
                variable_struct_set(mitem.data.leafscend_count, level, 50000);
            }
        }
    }
    global.resources.quantum_blob.data.count = 100000;
    __struct = global.artifacts;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.collect();
    }
    __struct = global.cards;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.collect(10000000000);
    }
    __struct = global.chests;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.unlocked = true;
        mitem.data.count = 10;
    }
    __struct = global.community_leaves;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.collect();
    }
    __struct = global.equipment;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.count = 0;
        mitem.collect(1000000000000);
        mitem.data.level = mitem.get_max_upgrade_level();
    }
    __struct = global.materials;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.count = 0;
        mitem.collect(1000000);
    }
    __struct = global.pets;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.unlocked = true;
        mitem.data.level = mitem.get_max_upgrade_level();
    }
    __struct = global.recipes;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.unlocked = true;
        mitem.data.count = 1;
    }
    __struct = global.relics;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.unlocked = true;
        mitem.data.count = mitem.max_count();
    }
    __struct = global.scrolls;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.unlocked = true;
        mitem.data.count = 10;
    }
    __struct = global.shops.weapons;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.unlocked = true;
        mitem.data.count = 1;
        mitem.data.level = mitem.get_max_upgrade_level();
    }
    __struct = global.unique_leaves;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.collect();
        mitem.data.level = mitem.get_max_upgrade_level();
    }
    o_game.data.quarks.quarkstige_count = 50;
    __struct = global.booster_game_upgrades.upgrades;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(global.booster_game_upgrades.data, mkey, global.booster_game_upgrades.get_max_upgrade_level(mkey));
    }
    global.booster_game_upgrades.refresh_upgrade_attributes();
    global.borbventures.items.inventory = [];
    __struct = global.borbventures.borbventure_levels;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var __struct2 = global.borbventures.borbventure_items;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            if (array_length(global.borbventures.items.inventory) >= global.borbventures.get_inventory_size())
            {
                break;
            }
            global.borbventures.add_item(mitem2.key, 100, mitem);
        }
    }
    global.craft_leaves_backpack = [];
    global.craft_leaves_inventory = [];
    var n = 1;
    repeat (9)
    {
        var dleaf = craft_leaf_type(global.craft_leaf_types.dusk);
        if (n < 9)
        {
            dleaf.data.ascend_level = 11;
            dleaf.data.level = 30;
            dleaf.data.quality = 100;
            dleaf.data.quality_base = 100;
        }
        dleaf.data.props.blower_enemy_damage = 1;
        dleaf.data.shards.blower_enemy_damage = 10;
        dleaf.data.props.blower_enemy_damage_multiplier_craft = 1;
        dleaf.data.shards.blower_enemy_damage_multiplier_craft = 10;
        dleaf.data.props.nuclear_fuel_multiplier = 1;
        dleaf.data.shards.nuclear_fuel_multiplier = 10;
        dleaf.data.props.max_resource_storage = 
        {
            __collection_key: "energy_quark",
            energy_quark: 0
        };
        dleaf.data.shards.max_resource_storage = 
        {
            energy_quark: 10
        };
        dleaf.data.props.max_resource_storage_pct = 
        {
            __collection_key: "energy_quark",
            energy_quark: 0
        };
        dleaf.data.shards.max_resource_storage_pct = 
        {
            energy_quark: 10
        };
        dleaf.set_prop_values();
        dleaf.refresh_info_text();
        n++;
    }
    global.dice_inventory = [];
    __array = global.dice_rarity_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        create_die(global.dice_types.blower, mitem, true);
        create_die(global.dice_types.energy, mitem, true);
        create_die(global.dice_types.quark_reactor, mitem, true);
        create_die(global.dice_types.relic, mitem, true);
        create_die(global.dice_types.trout, mitem, true);
        create_die(global.dice_types.nature, mitem, true);
    }
    __array = global.dice_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.data.avg = 12000;
        mitem.data.rolls = [12000, 12000, 12000, 12000, 12000];
        mitem.data.roll_count = 10;
        mitem.roll();
    }
    global.mine_inventory = [];
    __array = global.mine_rarity_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        add_mine_inventory_item("blossom", mitem, 60);
        add_mine_inventory_item("blower", mitem, 60);
        add_mine_inventory_item("capacitor", mitem, 60);
        add_mine_inventory_item("quark_reactor", mitem, 60);
        add_mine_inventory_item("relic", mitem, 60);
        add_mine_inventory_item("trout", mitem, 60);
    }
    init_game_vars(true);
}

function debugfunc_second()
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
}

function debug_get_damage_output()
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var output = "";
    output_dmg = {};
    var __array = global.upgrade_sections_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        output += ("---" + string(mitem) + "---" + "\n");
        var section_array = [];
        var __struct2 = variable_struct_get(global.upgrade_sections_values, mitem);
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            if (string_pos("blower_enemy_damage", mkey2) == 0)
            {
                continue;
            }
            if (mitem2 == 0)
            {
                continue;
            }
            array_push(section_array, 
            {
                key: mkey2,
                value: mitem2
            });
            add_to_struct_value(output_dmg, mitem, mitem2);
        }
        sort_array_by_key(section_array, true);
        var __array2 = section_array;
        __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            output += (sprintf("%s | %s", mitem2.key, number_format(mitem2.value, 2)) + "\n");
        }
        output += "\n\n";
    }
    global.damage_output_cache = output;
    var output_dmg_text = [];
    var __struct = output_dmg;
    var __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        array_push(output_dmg_text, sprintf("%s: %s", mkey, number_format(mitem)));
    }
    log(implode("\n", output_dmg_text));
}

function debug_benchmark()
{
    if (live_auto_call_1())
    {
        var lac_argc = argument_count;
        var lac_args = array_create(lac_argc);
        var lac_argk = 0;
        repeat (lac_argc)
        {
            lac_args[lac_argk] = argument[lac_argk];
            lac_argk++;
        }
        if (live_auto_call_2(lac_args))
        {
            return global.live_result;
        }
    }
    var bench_enabled = false;
    if (!bench_enabled)
    {
        exit;
    }
    var repeat_count = 100;
    a = {};
    b = {};
    c = {};
    for (var i = 0; i < 100; i++)
    {
        variable_struct_set(a, i, random(100));
        var key = "i" + string(i);
        variable_struct_set(a, key, {});
        for (var j = 0; j < 100; j++)
        {
            variable_struct_set(variable_struct_get(a, key), j, random(100));
        }
    }
    log("=== bench 1 ===");
    var __benchmark_total = 0;
    var __benchmark_t = current_time;
    repeat (repeat_count)
    {
        b = json_parse(json_stringify(a));
    }
    logf("Benchmark ended", current_time - __benchmark_t);
    __benchmark_total += (current_time - __benchmark_t);
    log("=== bench 2 ===");
    __benchmark_total = 0;
    __benchmark_t = current_time;
    repeat (repeat_count)
    {
        apply_struct_to_struct(c, a);
    }
    logf("Benchmark ended", current_time - __benchmark_t);
    __benchmark_total += (current_time - __benchmark_t);
}
