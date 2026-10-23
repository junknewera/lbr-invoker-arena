function prestige_exec(arg0, arg1 = false)
{
    global.is_prestiging = true;
    var prestige = get_default_struct_value(global.prestige_levels_map, arg0);
    if (!is_struct(prestige))
    {
        return log("invalid prestige level", arg0);
    }
    global.last_prestige_level = arg0;
    var prestige_after_reset = get_default_struct_value(prestige, "add_prestige_resources_after_reset", false);
    var prestige_resources = get_prestige_resources(false, arg0);
    if (!prestige_after_reset)
    {
        add_resources(prestige_resources);
    }
    var bags_level = get_upgrade_count(global.shops.blc.increase_max_leaves);
    var coins_before = global.resources.coins.data.count;
    var blc_before = global.resources.blc.data.count;
    var printers_room_before = get_upgrade_count(global.shops.blc.printers_room);
    _map(prestige_resources, function(arg0, arg1)
    {
        if (is_undefined(variable_struct_get(o_game.data.stats.prestige_resources_highest, arg1)))
        {
            variable_struct_set(o_game.data.stats.prestige_resources_highest, arg1, 0);
        }
        variable_struct_set(o_game.data.stats.prestige_resources_highest, arg1, max(arg0, variable_struct_get(o_game.data.stats.prestige_resources_highest, arg1)));
    });
    var __struct = o_game.data.stats.prestige_resources_highest;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(o_game.data.stats.prestige_resources_highest_history, mkey, max(mitem, get_default_struct_value(o_game.data.stats.prestige_resources_highest_history, mkey, 0)));
    }
    var prestige_time_current = o_game.data.stats.prestige_time_current;
    if (o_game.data.stats.prestige_time_current != -1)
    {
        if (variable_struct_get(o_game.data.stats.prestige_time_fastest, arg0) == -1)
        {
            variable_struct_set(o_game.data.stats.prestige_time_fastest, arg0, o_game.data.stats.prestige_time_current);
        }
        else
        {
            variable_struct_set(o_game.data.stats.prestige_time_fastest, arg0, min(o_game.data.stats.prestige_time_current, variable_struct_get(o_game.data.stats.prestige_time_fastest, arg0)));
        }
    }
    o_game.data.stats.prestige_time_current = 0;
    o_game.data.stats.prestige_random_number = random(1);
    add_to_struct_value(o_game.data.stats.prestige_run, prestige.key, 1);
    var _blower = o_game.data.current_weapon_key;
    var _alb_blower = o_game.data.current_alb_weapon_key;
    with (o_game)
    {
        init(arg0);
        nav_page = 0;
    }
    with (o_shop)
    {
        nav_bl_page = 0;
    }
    destroy_unit_instances(true);
    change_area(global.areas.garden);
    global.resources.leaves.data.unlocked = true;
    global.resources.gems.data.unlocked = true;
    __struct = global.areas;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.prestige(arg0);
    }
    __struct = global.converters;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.prestige(arg0);
    }
    if (arg0 == global.prestige_levels.prestige.level)
    {
        global.resources.coins.data.unlocked = true;
        o_game.data.stats.prestige++;
        if (!in_challenge())
        {
            steam_set_stat_int("prestige", o_game.data.stats.prestige);
        }
    }
    else if (arg0 == global.prestige_levels.blc.level)
    {
        global.resources.coins.data.unlocked = true;
        global.resources.blc.data.unlocked = true;
        o_game.data.stats.prestige_crunch++;
        if (!in_challenge())
        {
            steam_set_stat_int("prestige_crunch", o_game.data.stats.prestige_crunch);
        }
    }
    else if (arg0 == global.prestige_levels.mlc.level)
    {
        global.areas.dicey_meadows.data.count = has_bought_shop_item_safe(global.shops.mlc.areas_persist_mlc) ? 1 : 0;
        global.resources.coins.data.unlocked = true;
        global.resources.blc.data.unlocked = true;
        global.resources.mlc.data.unlocked = true;
        o_game.data.stats.prestige_mlc++;
        if (get_upgrade_count(global.shops.mlc.printers_persist_mlc) > 0)
        {
            global.shops.blc.printers_persist.data.count = 1;
            global.shops.blc.printers_room.data.count = printers_room_before;
        }
        if (get_upgrade_count(global.shops.mlc.unique_leaves_persist_mlc) > 0)
        {
            global.shops.blc.unlock_unique_leaves.data.count = 1;
        }
        else
        {
            call_collection(global.unique_leaves, "deactivate");
        }
        if (get_upgrade_count(global.shops.mlc.pets_persist_mlc) > 0)
        {
            global.shops.blc.unlock_pets.data.count = 1;
        }
        else
        {
            __struct = global.pets;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                call_method(mitem, mitem.deactivate);
            }
        }
        if (get_upgrade_count(global.shops.mlc.seeds_persist_mlc) > 0)
        {
            var set_seed_count = global.shops.mlc.seeds_persist_mlc.data.toggle ? 1 : 0;
            __struct = global.shops.farming;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (get_upgrade_count(mitem) == 0)
                {
                    continue;
                }
                mitem.data.count = set_seed_count;
            }
        }
        generate_trades(true);
    }
    else if (arg0 == global.prestige_levels.ulc.level)
    {
        o_game.data.stats.prestige_ulc++;
        o_game.resource_nav_page_index = 0;
        open_all_chests(true);
        if (!has_bought_shop_item(global.shops.ulc.areas_persist_ulc))
        {
            o_game.data.flags.black_leaf_hole = false;
            o_game.data.flags.ff_prison_solution = 0;
            o_game.data.flags.ff_prison_solved = false;
            o_game.data.stats.borbcipherer = 0;
        }
        var __array = global.prestige_levels_array;
        __prop_len = array_length(__array);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.level < arg0)
            {
                variable_struct_set(o_game.data.stats.prestige_run, mitem.key, 0);
            }
        }
        __array = global.recipes_sorted;
        __prop_len = array_length(__array);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.cancel(false);
            mitem.set_inactive();
        }
        __struct = global.artifacts;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (arg0 > mitem.persist_prestige.level)
            {
                mitem.data.count = 0;
            }
        }
        var enable_auto_deposit = is_shop_item_enabled(global.shops.ulc.banks_auto_start_deposit);
        __array = global.banks_array;
        __prop_len = array_length(__array);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.count = 0;
            mitem.data.count_rss = 0;
            if (!enable_auto_deposit)
            {
                mitem.data.auto_deposit_toggle = false;
                mitem.data.auto_deposit_rss_toggle = false;
            }
            mitem.update_amount();
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "borbventure", false))
        {
            reset_count_max(global.borbventures.items.inventory, global.upgrade_attributes.ulc_borbventure_inventory_reset_count);
            call_collection(global.borbventures.items.inventory, "update_upgrade_attributes");
            reset_count(global.borbventures.borbventure_packs);
            var min_borb_level = max(1, global.upgrade_attributes.ulc_borbventure_borb_level_reset_count);
            __array = global.borbventures.items.borbs;
            __prop_len = array_length(__array);
            for (__i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.data.level = min(mitem.data.level, min_borb_level);
                mitem.data.xp = 0;
            }
            cancel_all_borbventures();
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "cards", false))
        {
            reset_count_max(global.cards_array, global.upgrade_attributes.ulc_cards_reset_count);
            reset_count(global.cards_packs);
        }
        reset_count(global.chests);
        if (get_default_struct_value(o_game.data.ulc_settings, "crafted_leaves", false))
        {
            global.craft_leaves_backpack = [];
            global.craft_leaves_inventory = [];
            global.craft_leaves_fusion_slots = [];
            global.craft_leaves_transformation_slots = [];
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "dice", false))
        {
            reset_count_max(global.dice_inventory, 1 + global.upgrade_attributes.ulc_dice_reset_count);
            reset_count_max(global.dice_backpack, 1 + global.upgrade_attributes.ulc_dice_reset_count);
            call_array(global.dice_inventory, "reset_rolls");
            call_array(global.dice_backpack, "reset_rolls");
            call_array(global.dice_inventory, "refresh_cache");
            call_array(global.dice_backpack, "refresh_cache");
            if (global.upgrade_attributes.ulc_perma_dice == 0)
            {
                global.resources.dice.data.count = 0;
                global.resources.power_dice.data.count = 0;
            }
        }
        var inv_size = get_dice_inventory_size();
        for (var n = 0; array_length(global.dice_inventory) > inv_size && n < 500; n++)
        {
            var die = array_last(global.dice_inventory);
            move_array_item(die, global.dice_inventory, global.dice_backpack);
            die.bag = "backpack";
        }
        __struct = global.enemies;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            mitem.prestige_player(arg0);
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "equipment", false))
        {
            __array = global.equipment_array;
            __prop_len = array_length(__array);
            for (__i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.data.count = min(mitem.data.count, global.upgrade_attributes.ulc_equipment_reset_count);
                mitem.data.level = max(1, min(mitem.data.level, global.upgrade_attributes.item_level_reset_count.equipment));
            }
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "leafscended_leaves", false))
        {
            call_collection(global.leafscenders_array, "set_inactive");
            __array = global.resources_leaves;
            __prop_len = array_length(__array);
            for (__i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                for (var i = 1; i <= 6; i++)
                {
                    if (is_undefined(variable_struct_get(mitem.data.leafscend_count, i)))
                    {
                        variable_struct_set(mitem.data.leafscend_count, i, 0);
                    }
                    variable_struct_set(mitem.data.leafscend_count, i, min(variable_struct_get(mitem.data.leafscend_count, i), global.upgrade_attributes.ulc_leafscender_reset_count));
                }
            }
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "materials", false))
        {
            var materials_reset_array = [];
            __array = global.materials_sorted;
            __prop_len = array_length(__array);
            for (__i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.persist_prestige_level >= arg0)
                {
                    continue;
                }
                array_push(materials_reset_array, mitem);
            }
            reset_count_max(materials_reset_array, global.upgrade_attributes.ulc_materials_reset_count);
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "mines", false))
        {
            reset_count_max(global.mine_inventory, global.upgrade_attributes.ulc_mine_items_reset_count);
        }
        __array = global.mines;
        __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            remove_mine(mitem);
            __i--;
        }
        __array = o_game.data.mines.veins;
        __prop_len = array_length(__array);
        __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            remove_vein(mitem);
            __i--;
        }
        o_game.data.mirrors = {};
        deactivate_all_pets();
        reset_level_max(global.pets, global.upgrade_attributes.item_level_reset_count.pets);
        if (get_upgrade_count(global.shops.ulc.printers_persist) > 0)
        {
            global.shops.blc.printers_persist.data.count = 1;
            global.shops.blc.printers_room.data.count = printers_room_before;
            global.shops.mlc.printers_persist_mlc.data.count = 1;
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "quarks", false))
        {
            o_game.data.quarks.quarkstige_count = min(o_game.data.quarks.quarkstige_count, global.upgrade_attributes.ulc_quarkstiges_reset_count);
            __array = global.quarks_array;
            __prop_len = array_length(__array);
            for (__i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                mitem.data.count = 0;
            }
        }
        if (get_default_struct_value(o_game.data.ulc_settings, "relics", false))
        {
            reset_count_max(global.relics, global.upgrade_attributes.ulc_relics_reset_count);
        }
        __struct = global.resources;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (mitem.persist_prestige || mitem.persist_prestige_level >= arg0 || mitem.nav_type == global.resource_types.event)
            {
                continue;
            }
            mitem.data.count = 0;
            if (mitem.key != "leaves")
            {
                mitem.data.unlocked = false;
            }
        }
        set_struct_values(o_game.data.stats.prestige_resources_highest, 0);
        set_struct_values(o_game.data.stats.resources_collected_avg, 0);
        __struct = o_game.data.stats.prestige_run;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (__i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (variable_struct_get(global.prestige_levels, mkey).level < arg0)
            {
                variable_struct_set(__struct, mkey, 0);
            }
        }
        reset_count(global.scrolls);
        call_struct(global.scrolls, "_expire");
        reset_level_max(global.weapons_sorted, global.upgrade_attributes.item_level_reset_count.tools);
        generate_trades(true, true);
        reset_level_max(global.unique_leaves, global.upgrade_attributes.item_level_reset_count.unique);
        call_collection(global.unique_leaves, "deactivate");
        global.shops.blc.unlock_alchemy.data.collected = max(0, global.upgrade_attributes.ulc_perma_alchemy);
        global.shops.mlc.unlock_borbventures.data.count = max(0, global.upgrade_attributes.ulc_perma_borbventures);
        global.shops.mlc.unlock_cards.data.count = max(0, global.upgrade_attributes.ulc_perma_cards);
        o_game.data.flags.death_book = false;
        global.areas.dicey_meadows.data.count = max(0, global.upgrade_attributes.ulc_perma_dice);
        global.shops.blc.unlock_materials.data.count = max(0, global.upgrade_attributes.ulc_perma_materials);
        global.shops.coal.unlock_mines.data.count = max(0, global.upgrade_attributes.ulc_perma_mines);
        global.shops.sacred.unlock_relics.data.count = max(0, global.upgrade_attributes.ulc_perma_relics);
        global.resources.coins.data.unlocked = true;
        global.resources.blc.data.unlocked = true;
        global.resources.mlc.data.unlocked = true;
        global.resources.ulc.data.unlocked = true;
    }
    if (get_upgrade_count(global.shops.gems.keep_blower_after_prestige) > 0 && global.game_settings.gem_upgrades_enabled)
    {
        change_blower(variable_struct_get(global.shops.weapons, _blower));
        change_alb_blower(variable_struct_get(global.shops.weapons, _alb_blower));
    }
    if (!arg1)
    {
        fx_prestige(room_width / 2, room_height / 2, arg0);
        snd_play(snd_prestige_01);
    }
    if ((arg0 == global.prestige_levels.blc.level && get_upgrade_count(global.shops.blc.coins_persist_blc) > 0) || (arg0 == global.prestige_levels.mlc.level && get_upgrade_count(global.shops.mlc.coins_persist_mlc) > 0))
    {
        global.resources.coins.data.unlocked = true;
        global.resources.coins.data.collected = coins_before;
        global.resources.coins.data.count = coins_before;
    }
    if (arg0 == global.prestige_levels.mlc.level && get_upgrade_count(global.shops.mlc.blc_persist_mlc) > 0)
    {
        global.shops.blc.increase_max_leaves.data.count = bags_level;
        global.upgrade_attributes.max_leaf_storage = bags_level;
        global.resources.blc.data.unlocked = true;
        global.resources.blc.data.count = blc_before;
    }
    if (o_game.data.stats.prestige_ulc > 0)
    {
        var __array = global.shops_items_array_autobuyers;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.data.count = 1;
        }
        global.shops.blc.autobuy_priority.data.count = 1;
        global.shops.blc.auto_start_converters.data.count = 1;
        if (is_unlocked_borbventure())
        {
            unlock_borbventures();
        }
    }
    if (prestige_after_reset)
    {
        add_resources(prestige_resources);
    }
    add_game_log(sprintf("Prestiged level %s | %s", arg0, prestige_time_current));
    o_shop.tab = UnknownEnum.Value_48;
    if (get_option(global.options.reset_scroll_position_after_prestige))
    {
        __struct = global.dialog_shop_index_last;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            variable_struct_set(__struct, mkey, 0);
        }
    }
    if (in_challenge())
    {
        global.current_challenge._after_prestige_func();
    }
    gui_dialog_close();
    instance_destroy(o_dialog);
    check_current_challenge();
    init_game_vars(true);
}

enum UnknownEnum
{
    Value_48 = 48
}
