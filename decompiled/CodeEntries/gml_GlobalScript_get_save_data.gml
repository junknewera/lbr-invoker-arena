function get_save_data(arg0 = get_empty_wrapper_data(), arg1 = undefined, arg2 = false)
{
    var bench_enabled = false;
    var __benchmark_total2;
    if (bench_enabled)
    {
        var __benchmark_total = 0;
        __benchmark_total2 = 0;
    }
    var t = get_time_object();
    var t_date = get_date_from_object(t);
    var current_profile_data = get_empty_profile_data(global.current_profile);
    if (date_compare_datetime(t_date, get_date_from_object(global.game_time_stats.earliest)) == -1)
    {
        global.game_time_stats.earliest = t;
    }
    if (date_compare_datetime(get_date_from_object(global.game_time_stats.latest), t_date) == -1)
    {
        global.game_time_stats.latest = t;
    }
    arg0.time_stats = global.game_time_stats;
    var save_objects = [o_game];
    var tmp_log = o_game.data.game_log;
    o_game.data.game_log = [];
    var __benchmark_t2;
    if (bench_enabled)
    {
        log("=== saving objects ===");
        __benchmark_t2 = current_time;
    }
    var __struct = global.globalstats;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(arg0.stats, mkey, mitem);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    _map(save_objects, function(arg0, arg1, arg2)
    {
        var obj_name = object_get_name(arg0);
        variable_struct_set(arg2.objects, obj_name, 
        {
            data: arg0.data
        });
    }, current_profile_data);
    if (bench_enabled)
    {
        log("=== saving resources ===");
        __benchmark_t2 = current_time;
    }
    _map(global.resources, function(arg0, arg1, arg2, arg3)
    {
        variable_struct_set(arg3.resources, arg1, arg0.data);
    }, current_profile_data);
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== saving shops ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.shops;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.shops, mkey, {});
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            variable_struct_set(variable_struct_get(current_profile_data.shops, mkey), mkey2, mitem2.data);
        }
    }
    arg0.shops_persist.gems = current_profile_data.shops.gems;
    if (global.current_profile == "challenge")
    {
        arg0.shops_persist.gems = get_default_struct_value(global.profiles.def.shops, "gems");
        __struct = arg0.shops_persist.gems;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var shop_item = variable_struct_get(global.shops.gems, mkey);
            if (!shop_item.is_usable)
            {
                continue;
            }
            try
            {
                var shop_item_main = variable_struct_get(global.profiles.def.shops.gems, mkey);
                mitem.count = shop_item_main.count;
                mitem.inventory = shop_item_main.inventory;
            }
            catch (e)
            {
            }
        }
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== saving achievements ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.achievements;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(arg0.achievements, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== saving areas ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.areas;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.areas, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== converters ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.converters;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.converters, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== saving enemies ===");
        __benchmark_t2 = current_time;
    }
    _map(global.enemies, function(arg0, arg1, arg2, arg3)
    {
        variable_struct_set(arg3.enemies, arg1, arg0.data);
    }, current_profile_data);
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== unique leaves ===");
        __benchmark_t2 = current_time;
    }
    _map(global.unique_leaves, function(arg0, arg1, arg2, arg3)
    {
        variable_struct_set(arg3.unique_leaves, arg1, arg0.data);
    }, current_profile_data);
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== pets ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.pets;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.pets, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== artifacts ===");
        __benchmark_t2 = current_time;
    }
    _map(global.artifacts, function(arg0, arg1, arg2, arg3)
    {
        variable_struct_set(arg3.artifacts, arg1, arg0.data);
    }, current_profile_data);
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== banks ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.banks;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.banks, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== chests ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.chests;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.chests, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== events ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.events;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.events, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== lore ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.lore;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(arg0.lore, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== trades ===");
        __benchmark_t2 = current_time;
    }
    var __array = global.trades;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.trades, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== comm leaves ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.community_leaves;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(arg0.community_leaves, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== equipment ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.equipment;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.equipment, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== house ===");
        __benchmark_t2 = current_time;
    }
    var house_item_count = 0;
    __struct = global.house_items;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        if (house_item_count > global.max_house_items)
        {
            break;
        }
        if (!mitem.data.unlocked)
        {
            continue;
        }
        if (array_length(mitem.data.build_data) > 256)
        {
            array_delete(mitem.data.build_data, 256, array_length(mitem.data.build_data));
        }
        variable_struct_set(arg0.house_items, mkey, mitem.data);
        house_item_count++;
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== borbventures ===");
        __benchmark_t2 = current_time;
    }
    current_profile_data.borbventure = struct_clone(global.borbventures.data);
    current_profile_data.borbventure.borbventures = [];
    current_profile_data.borbventure.borbs = [];
    current_profile_data.borbventure.inventory = [];
    current_profile_data.borbventure.packs = {};
    __array = global.borbventures.items.borbventures;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.borbventure.borbventures, mitem.data);
    }
    __array = global.borbventures.items.borbs;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.borbventure.borbs, mitem.data);
    }
    __array = global.borbventures.items.inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.borbventure.inventory, mitem.data);
    }
    __struct = global.borbventures.borbventure_packs;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.borbventure.packs, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== cards ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.cards;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.cards, mkey, mitem.data);
    }
    __struct = global.cards_packs;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.cards_packs, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== challenges ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.challenges;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(arg0.challenges, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== crafted leaves ===");
        __benchmark_t2 = current_time;
    }
    __array = global.craft_leaves_backpack;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.crafted_backpack, mitem.data);
    }
    __array = global.craft_leaves_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.crafted_leaves, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    current_profile_data.fishing.fish = {};
    __array = global.fish_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(current_profile_data.fishing.fish, mitem.key, mitem.data);
    }
    current_profile_data.fishing.baits = {};
    __struct = global.fishing_baits;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.fishing.baits, mitem.key, mitem.data);
    }
    current_profile_data.fishing.baits_farm = [];
    __array = global.fishing_baits_farm;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.fishing.baits_farm, mitem.data);
    }
    current_profile_data.fishing.rods = [];
    __array = global.fishing_rods;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.fishing.rods, mitem.data);
    }
    current_profile_data.fishing.spots = [];
    __array = global.fishing_spots;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.fishing.spots, mitem.data);
    }
    current_profile_data.fishing.tournaments = {};
    __array = global.fishing_tournaments_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(current_profile_data.fishing.tournaments, mitem.key, mitem.data);
    }
    current_profile_data.fishing.tournament_rod = global.fishing_tournament_rod.data;
    current_profile_data.harbor.container = global.harbor.container.data;
    current_profile_data.harbor.inventory = global.harbor_inventory.get_save_data();
    current_profile_data.harbor.jobs = [];
    __array = global.harbor.jobs;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.harbor.jobs, mitem.data);
    }
    current_profile_data.harbor.ships = [];
    __array = global.harbor.ships;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.harbor.ships, mitem.data);
    }
    if (bench_enabled)
    {
        log("=== materials ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.materials;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.materials, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== milestones ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.milestones;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.milestones, mkey, {});
        var __struct2 = mitem.milestones;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            variable_struct_set(variable_struct_get(current_profile_data.milestones, mkey), mkey2, mitem2.data);
        }
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== quests ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.quests;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.quests, mkey, {});
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            if (!is_struct(struct_get_from_hash(mitem2, variable_get_hash("data"))))
            {
                continue;
            }
            variable_struct_set(variable_struct_get(current_profile_data.quests, mkey), mkey2, mitem2.data);
        }
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== recipes ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.recipes;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.recipes, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== relics ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.relics;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.relics, mkey, mitem.data);
    }
    __struct = global.master_relics;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.master_relics, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== leafscenders ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.leafscenders;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.leafscenders, mkey, {});
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            variable_struct_set(variable_struct_get(current_profile_data.leafscenders, mkey), mkey2, mitem2.data);
        }
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== scrolls ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.scrolls;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.scrolls, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== dice ===");
        __benchmark_t2 = current_time;
    }
    __array = global.dice_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.dice, mitem.data);
    }
    __array = global.dice_backpack;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.dice_backpack, mitem.data);
    }
    __array = global.dice_enemies;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(current_profile_data.dice_enemies, mitem.key, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== mines ===");
        __benchmark_t2 = current_time;
    }
    current_profile_data.mines = [];
    __array = global.mines;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.mines, mitem.data);
    }
    current_profile_data.mine_inventory = [];
    __array = global.mine_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        array_push(current_profile_data.mine_inventory, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== transmuters ===");
        __benchmark_t2 = current_time;
    }
    __struct = global.transmuters;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.transmuters, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== shadow ===");
        __benchmark_t2 = current_time;
    }
    current_profile_data.shadow.crystal = global.shadow_crystal.data;
    current_profile_data.shadow.player = global.shadow_player.data;
    current_profile_data.shadow.tree = global.shadow_tree.get_save_data();
    current_profile_data.shadow.pit = {};
    __struct = global.shadow_pit;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(current_profile_data.shadow.pit, mkey, mitem.data);
    }
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== booster ===");
        __benchmark_t2 = current_time;
    }
    __array = global.booster_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(current_profile_data.booster, mitem.key, mitem.data);
    }
    current_profile_data.booster_game.upgrades = global.booster_game_upgrades.data;
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (bench_enabled)
    {
        log("=== saving file ===");
        __benchmark_t2 = current_time;
    }
    apply_struct_to_struct(variable_struct_get(global.profiles, global.current_profile), current_profile_data);
    variable_struct_get(global.profiles, global.current_profile).objects.o_game.data = o_game.data;
    __struct = global.profiles;
    __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        variable_struct_set(arg0.profiles, mkey, mitem);
    }
    if (!is_undefined(arg1))
    {
        arg0.current_profile = arg1;
    }
    var save_data_string = json_stringify(arg0);
    var save_data_string_raw = save_data_string;
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    if (arg2)
    {
        return save_data_string_raw;
    }
    if (bench_enabled)
    {
        log("=== saving file2 ===");
        __benchmark_t2 = current_time;
    }
    var _hmac_hash = sha1_string_utf8_hmac("ke03m!5ng93nan7p24lyg343nml2o591", save_data_string);
    save_data_string += ("#" + _hmac_hash + "#");
    var len = max(1, string_byte_length(save_data_string));
    var buf = buffer_create(len, buffer_fixed, 1);
    buffer_write(buf, buffer_text, save_data_string);
    var save_data_string_final = buffer_base64_encode(buf, 0, buffer_get_size(buf));
    buffer_delete(buf);
    o_game.data.game_log = tmp_log;
    if (bench_enabled)
    {
        logf("Benchmark 2 ended", current_time - __benchmark_t2);
        __benchmark_total2 += (current_time - __benchmark_t2);
    }
    return save_data_string_final;
}
