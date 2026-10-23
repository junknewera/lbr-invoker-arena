function init_game_vars(arg0 = false)
{
    if (!global.refresh_game_vars && o_game.data.stats.time_elapsed < global.next_ua_apply_timer && !arg0)
    {
        exit;
    }
    var is_in_challenge = in_challenge();
    if (arg0)
    {
        __struct = global.upgrade_sections_cache_refresh;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            variable_struct_set(__struct, mkey, true);
        }
    }
    var __struct = global.upgrade_sections_cache_refresh;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem)
        {
            variable_struct_set(global.upgrade_sections_values, mkey, {});
            variable_struct_set(global.upgrade_sections_values_added, mkey, false);
        }
    }
    global.benchmark_enabled = false;
    var __benchmark_total, __benchmark_total2;
    if (global.benchmark_enabled)
    {
        __benchmark_total = 0;
        __benchmark_total2 = 0;
    }
    global.refresh_game_vars = false;
    global.next_ua_apply_timer = o_game.data.stats.time_elapsed + sec(get_option(global.options.apply_ua_timer));
    init_upgrade_attributes();
    init_upgrade_attributes_late();
    var __benchmark_t2;
    if (global.benchmark_enabled)
    {
        log("UA total");
        __benchmark_t2 = current_time;
    }
    var __benchmark_t;
    if (global.benchmark_enabled)
    {
        log("shops 1");
        __benchmark_t = current_time;
    }
    if (global.upgrade_sections_cache_refresh.shops)
    {
        __array = global.shops_items_array_upgrade_early;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            apply_upgrade_attributes(mitem, false, global.upgrade_sections.shops, undefined, undefined, "shops_early");
        }
    }
    else
    {
        add_struct_to_struct(global.upgrade_attributes, global.upgrade_sections_values.shops_early);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("pets 1");
        __benchmark_t = current_time;
    }
    if (is_unlocked_pets())
    {
        __array = global.pets_upgrade_early;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.data.active)
            {
                continue;
            }
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.pets);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("scrolls 1");
        __benchmark_t = current_time;
    }
    var __array = global.scrolls_upgrade_early;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.data.active)
        {
            continue;
        }
        apply_upgrade_attributes(mitem, true, global.upgrade_sections.scrolls);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("unique leaves 1");
        __benchmark_t = current_time;
    }
    if (is_unlocked_unique_leaves())
    {
        __array = global.unique_leaves_upgrade_early;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (get_upgrade_count(mitem) == 0 || !mitem.data.active)
            {
                continue;
            }
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.unique);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("unique leaves 2");
        __benchmark_t = current_time;
    }
    if (is_unlocked_unique_leaves())
    {
        __array = global.unique_leaves_upgrade_mid;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (get_upgrade_count(mitem) == 0 || !mitem.data.active)
            {
                continue;
            }
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.unique);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("journeys");
        __benchmark_t = current_time;
    }
    __array = global.journeys_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        apply_upgrade_attributes(mitem, true, global.upgrade_sections.journeys);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("scrolls 2");
        __benchmark_t = current_time;
    }
    __array = global.scrolls_upgrade_late;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.data.active)
        {
            continue;
        }
        apply_upgrade_attributes(mitem, true, global.upgrade_sections.scrolls);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("shops 2");
        __benchmark_t = current_time;
    }
    if (global.upgrade_sections_cache_refresh.shops)
    {
        __array = global.shops_items_array_upgrade_late;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.is_dlc)
            {
                if (!is_dlc_purchase_valid(mitem.dlc_id) || !is_dlc_claimed(mitem.key))
                {
                    continue;
                }
            }
            apply_upgrade_attributes(mitem, false, global.upgrade_sections.shops, undefined, undefined, "shops_late");
        }
    }
    else
    {
        add_struct_to_struct(global.upgrade_attributes, global.upgrade_sections_values.shops_late);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("unique leaves 3");
        __benchmark_t = current_time;
    }
    if (is_unlocked_unique_leaves())
    {
        __array = global.unique_leaves_upgrade_late;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (get_upgrade_count(mitem) == 0 || !mitem.data.active)
            {
                continue;
            }
            apply_upgrade_attributes(mitem, false, global.upgrade_sections.unique);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("pets 2");
        __benchmark_t = current_time;
    }
    if (is_unlocked_pets())
    {
        __array = global.pets_upgrade_late;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (!mitem.data.active)
            {
                continue;
            }
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.pets);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("artifacts");
        __benchmark_t = current_time;
    }
    __struct = global.artifacts;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (mitem.data.count == 0)
        {
            continue;
        }
        apply_upgrade_attributes(mitem, false, global.upgrade_sections.artifacts);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("comm leaves");
        __benchmark_t = current_time;
    }
    if (!is_in_challenge)
    {
        __struct = global.community_leaves;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!mitem.can_apply_bonus())
            {
                continue;
            }
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.community_leaves);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("house items");
        __benchmark_t = current_time;
    }
    if (!is_in_challenge)
    {
        __struct = global.house_items;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (!mitem.can_apply_bonus())
            {
                continue;
            }
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.house);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("borbventure");
        __benchmark_t = current_time;
    }
    if (is_unlocked_borbventure())
    {
        __array = global.borbventures.items.inventory;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            apply_upgrade_attributes(mitem, false, global.upgrade_sections.borbventure);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("cards");
        __benchmark_t = current_time;
    }
    if (is_unlocked_cards())
    {
        if (global.upgrade_sections_cache_refresh.cards)
        {
            __array = global.cards_array;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                apply_upgrade_attributes(mitem, true, global.upgrade_sections.cards);
            }
        }
        else
        {
            add_struct_to_struct(global.upgrade_attributes, global.upgrade_sections_values.cards);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("dice");
        __benchmark_t = current_time;
    }
    if (is_unlocked_dice())
    {
        if (global.upgrade_sections_cache_refresh.dice)
        {
            __array = global.dice_inventory;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                apply_upgrade_attributes(mitem, true, global.upgrade_sections.dice);
                mitem.cost_cache = undefined;
            }
            __array = global.dice_enemies;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                apply_upgrade_attributes(mitem, true, global.upgrade_sections.dice);
            }
            apply_upgrade_attributes(get_dice_cursed_upgrade_attributes(), true, global.upgrade_sections.dice);
        }
        else
        {
            add_struct_to_struct(global.upgrade_attributes, global.upgrade_sections_values.dice);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("quark");
        __benchmark_t = current_time;
    }
    if (is_unlocked_quarks())
    {
        __array = global.quarks_array;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.refresh_cache();
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.quarks);
        }
        apply_upgrade_attributes(get_quantum_upgrade_attributes(), true, global.upgrade_sections.quarks);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("mines");
        __benchmark_t = current_time;
    }
    if (is_unlocked_mines())
    {
        var inventory_size = get_mines_inventory_size();
        __array = global.mine_inventory;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (__i >= inventory_size)
            {
                break;
            }
            apply_upgrade_attributes(mitem, false, global.upgrade_sections.mine);
        }
        apply_upgrade_attributes(get_mines_upgrade_attributes(), true, global.upgrade_sections.mine);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("equip");
        __benchmark_t = current_time;
    }
    __struct = global.equipment;
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
        apply_upgrade_attributes(mitem, false, global.upgrade_sections.equipment);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("crafted leaves");
        __benchmark_t = current_time;
    }
    if (is_unlocked_crafting())
    {
        __array = global.craft_leaves_inventory;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.crafted_leaves);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("challenges");
        __benchmark_t = current_time;
    }
    __struct = global.challenges;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (!mitem.can_apply_bonus())
        {
            continue;
        }
        apply_upgrade_attributes(mitem, true, global.upgrade_sections.challenges);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("milestones");
        __benchmark_t = current_time;
    }
    __array = global.milestones_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.can_apply_bonus())
        {
            continue;
        }
        apply_upgrade_attributes(mitem, true, global.upgrade_sections.milestones);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("relics");
        __benchmark_t = current_time;
    }
    if (is_unlocked_relics())
    {
        if (global.upgrade_sections_cache_refresh.relics)
        {
            __array = global.relics_array;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (get_upgrade_count(mitem) == 0)
                {
                    continue;
                }
                apply_upgrade_attributes(mitem, true, global.upgrade_sections.relics);
            }
            if (is_unlocked_master_relics())
            {
                __array = global.master_relics_array;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    apply_upgrade_attributes(mitem, true, global.upgrade_sections.relics);
                }
            }
        }
        else
        {
            add_struct_to_struct(global.upgrade_attributes, global.upgrade_sections_values.relics);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("death_book");
        __benchmark_t = current_time;
    }
    if (is_unlocked_death_book())
    {
        __array = global.enemies_death_book;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            apply_upgrade_attributes(mitem, true, global.upgrade_sections.death_book);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("plants");
        __benchmark_t = current_time;
    }
    if (is_event_active(global.events.nature_season) && get_option(global.options.enable_supporter_upgrades))
    {
        if (global.upgrade_sections_cache_refresh.season_pass)
        {
            global.season_pass.nature._check_upgrade_attributes();
            apply_upgrade_attributes(global.season_pass.nature, true, global.upgrade_sections.season_pass);
        }
        else
        {
            add_struct_to_struct(global.upgrade_attributes, global.upgrade_sections_values.season_pass);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("shadow crystal");
        __benchmark_t = current_time;
    }
    if (is_unlocked_shadow_crystal())
    {
        apply_upgrade_attributes(global.shadow_tree, true, global.upgrade_sections.shadow);
        apply_upgrade_attributes(get_shadow_pit_ua(), true, global.upgrade_sections.shadow);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("booster");
        __benchmark_t = current_time;
    }
    if (is_unlocked_boosters())
    {
        apply_upgrade_attributes(get_booster_upgrade_attributes(), true, global.upgrade_sections.boost);
    }
    if (global.areas.cheese_pub.data.count > 0)
    {
        apply_upgrade_attributes(get_boostergame_upgrade_attributes(), true, global.upgrade_sections.boost);
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("fish");
        __benchmark_t = current_time;
    }
    if (is_unlocked_fishing())
    {
        if (global.upgrade_sections_cache_refresh.fish)
        {
            apply_upgrade_attributes(get_fishing_upgrade_attributes(), true, global.upgrade_sections.fish);
        }
        else
        {
            add_struct_to_struct(global.upgrade_attributes, global.upgrade_sections_values.fish);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (global.benchmark_enabled)
    {
        log("harbor");
        __benchmark_t = current_time;
    }
    if (is_unlocked_harbor())
    {
        if (global.upgrade_sections_cache_refresh.harbor)
        {
            apply_upgrade_attributes(get_harbor_upgrade_attributes(true), true, global.upgrade_sections.harbor);
        }
        else
        {
            add_struct_to_struct(global.upgrade_attributes, global.upgrade_sections_values.harbor);
        }
    }
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
    }
    if (mp_is_season() && !is_undefined(global.cloud_data.guild))
    {
        __struct = global.cloud_data.guild.upgrade_attributes_items;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            apply_upgrade_attributes(mitem, false, global.upgrade_sections.guild);
        }
    }
    if (mp_is_season())
    {
        global.resources.honor.data.unlocked = true;
        global.resources.season_gems.data.unlocked = true;
    }
    if (global.benchmark_enabled)
    {
        log("misc");
        __benchmark_t = current_time;
    }
    init_game_vars_misc();
    if (global.benchmark_enabled)
    {
        logf("Benchmark ended", current_time - __benchmark_t);
        __benchmark_total += (current_time - __benchmark_t);
        log("total = ", __benchmark_total);
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    set_struct_values(global.upgrade_sections_cache_refresh, false);
    var current_capacity = get_max_active_pets_size();
    if (global.last_pet_capacity != current_capacity || global.force_pet_limits)
    {
        check_pet_limits();
        global.last_pet_capacity = current_capacity;
        global.force_pet_limits = false;
    }
    if (global.game_loaded && is_struct(global.quests.daily) && get_struct_length(global.quests.daily) < get_daily_quests_count())
    {
        generate_daily_quests();
    }
}

function force_init_game_vars()
{
    init_game_vars(true);
}

function refresh_game_vars_soft()
{
    global.refresh_game_vars = true;
}

function refresh_ua_section(arg0)
{
    if (is_array(arg0))
    {
        var sections_struct = {};
        var __array = arg0;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            variable_struct_set(sections_struct, mitem, true);
            if (mitem == "dice" || mitem == "mines")
            {
                sections_struct.season_pass = true;
            }
        }
        var __struct = sections_struct;
        var __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            variable_struct_set(global.upgrade_sections_cache_refresh, mkey, true);
        }
    }
    else if (is_string(arg0))
    {
        if (arg0 == "shops")
        {
            refresh_ua_section(["shops", "shops_early", "shops_late"]);
        }
        else
        {
            variable_struct_set(global.upgrade_sections_cache_refresh, arg0, true);
        }
    }
    refresh_game_vars_soft();
}
