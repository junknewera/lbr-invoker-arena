function load_game(arg0)
{
    load_options();
    global.options.enable_gems_upgrades.data.value = true;
    reset_game();
    var wrapper_data = undefined;
    var data = undefined;
    var data_load = undefined;
    var fresh_start = is_empty(global.load_game_content);
    if (instance_exists(o_season_helper))
    {
        if (is_struct(o_season_helper.daily_reward))
        {
            global.cloud_data.daily_reward = o_season_helper.daily_reward;
        }
        global.cloud_data.daily_reward_available = get_default_value(o_season_helper.daily_reward_available, false);
        if (is_struct(o_season_helper.season_selected))
        {
            global.cloud_data.season_selected = o_season_helper.season_selected;
        }
        global.cloud_data.user_id = o_season_helper.user_id;
        if (is_struct(o_season_helper.guild))
        {
            global.cloud_data.guild = new Guild(o_season_helper.guild);
        }
    }
    if (!is_empty(global.load_game_content))
    {
        wrapper_data = get_compat_save_data(global.load_game_content);
        log("=== LOADING GAME ===");
        __struct = global.profiles;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            if (is_undefined(variable_struct_get(wrapper_data.profiles, mkey)) || !is_struct(variable_struct_get(wrapper_data.profiles, mkey)))
            {
                continue;
            }
            var load_profile_data = variable_struct_get(wrapper_data.profiles, mkey);
            variable_struct_set(global.profiles, mkey, struct_clone(load_profile_data));
        }
        var load_profile_key = wrapper_data.current_profile;
        if (!is_undefined(arg0))
        {
            load_profile_key = arg0;
        }
        if (load_profile_key == "challenge" && is_struct(struct_get_from_hash(wrapper_data, variable_get_hash("stats"))))
        {
            var tmp_challenge_key = struct_get_from_hash(wrapper_data.stats, variable_get_hash("current_challenge_key"));
            if (!is_struct(variable_struct_get(global.challenges, tmp_challenge_key)))
            {
                load_profile_key = undefined;
            }
        }
        if (is_empty(load_profile_key) || global.force_exit_challenge)
        {
            load_profile_key = global.profile_types.def;
            global.force_exit_challenge = false;
        }
        data_load = variable_struct_get(wrapper_data.profiles, load_profile_key);
        data = struct_clone(data_load);
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("stats"))))
        {
            struct_apply_defaults(wrapper_data.stats, global.globalstats);
            global.globalstats = struct_clone(wrapper_data.stats);
        }
        global.current_profile = load_profile_key;
        apply_challenge_before_load();
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("objects"))))
        {
            _map(data.objects, function(arg0, arg1)
            {
                var obj = asset_get_index(arg1);
                if (obj == -1)
                {
                    exit;
                }
                struct_apply_defaults(arg0.data, obj.data);
                obj.data = arg0.data;
            }, false);
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("resources"))))
        {
            __struct = data.resources;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var resource = variable_struct_get(global.resources, mkey);
                if (!is_struct(resource))
                {
                    continue;
                }
                apply_struct_to_struct(resource.data, mitem);
                resource.data.count = max(0, prepare_resource_value(resource, resource.data.count));
                resource.data.collected = max(0, prepare_resource_value(resource, resource.data.collected));
                resource.data.collected_total = max(0, prepare_resource_value(resource, resource.data.collected_total));
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("shops"))))
        {
            if (is_struct(struct_get_from_hash(data.shops, variable_get_hash("flask_orange"))) && !is_undefined(struct_get_from_hash(data.shops.flask_orange, variable_get_hash("unlock_flask_orange"))))
            {
                data.shops.flask_orange.unlock_flask_black = data.shops.flask_orange.unlock_flask_orange;
            }
            if (is_struct(struct_get_from_hash(data.shops, variable_get_hash("quarks"))))
            {
                data.shops.quark = data.shops.quarks;
            }
            __struct = data.shops;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var shop = variable_struct_get(global.shops, mkey);
                if (is_undefined(shop))
                {
                    continue;
                }
                if (mkey == "gems" && !global.game_settings.gem_upgrades_enabled)
                {
                    continue;
                }
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    var shop_item = variable_struct_get(shop, mkey2);
                    if (is_undefined(shop_item))
                    {
                        continue;
                    }
                    apply_struct_to_struct(shop_item.data, mitem2);
                }
            }
        }
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("shops_persist"))))
        {
            __struct = wrapper_data.shops_persist;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var shop = variable_struct_get(global.shops, mkey);
                if (is_undefined(shop))
                {
                    continue;
                }
                if (mkey == "gems" && !global.game_settings.gem_upgrades_enabled)
                {
                    continue;
                }
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    var shop_item = variable_struct_get(shop, mkey2);
                    if (is_undefined(shop_item))
                    {
                        continue;
                    }
                    apply_struct_to_struct(shop_item.data, mitem2);
                }
            }
        }
        refresh_dlc_shop();
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("achievements"))))
        {
            __struct = wrapper_data.achievements;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var achievement = variable_struct_get(global.achievements, mkey);
                if (is_undefined(achievement))
                {
                    continue;
                }
                apply_struct_to_struct(achievement.data, mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("areas"))))
        {
            __struct = data.areas;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var area = variable_struct_get(global.areas, mkey);
                if (is_undefined(area))
                {
                    continue;
                }
                area.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("banks"))))
        {
            __struct = data.banks;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.banks, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("borbventure"))))
        {
            global.borbventures.load_data(data.borbventure);
            global.borbventures.items.borbventures = [];
            global.borbventures.items.borbs = [];
            global.borbventures.items.inventory = [];
            __struct = global.borbventures.borbventure_packs;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.data.count = 0;
            }
            if (is_array(struct_get_from_hash(data.borbventure, variable_get_hash("borbs"))))
            {
                __array = struct_get_from_hash(data.borbventure, variable_get_hash("borbs"));
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var borb = new Borbventurer();
                    borb.load_data(mitem);
                    array_push(global.borbventures.items.borbs, borb);
                }
            }
            if (is_array(struct_get_from_hash(data.borbventure, variable_get_hash("borbventures"))))
            {
                __array = struct_get_from_hash(data.borbventure, variable_get_hash("borbventures"));
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var borbventure = new Borbventure();
                    borbventure.load_data(mitem);
                    array_push(global.borbventures.items.borbventures, borbventure);
                }
            }
            if (is_struct(struct_get_from_hash(data.borbventure, variable_get_hash("packs"))))
            {
                __struct = struct_get_from_hash(data.borbventure, variable_get_hash("packs"));
                __prop_names = struct_get_names(__struct);
                __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var item = variable_struct_get(global.borbventures.borbventure_packs, mkey);
                    if (is_undefined(item))
                    {
                        continue;
                    }
                    item.load_data(mitem);
                }
            }
            if (is_array(struct_get_from_hash(data.borbventure, variable_get_hash("inventory"))))
            {
                __array = struct_get_from_hash(data.borbventure, variable_get_hash("inventory"));
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var item = new Borbventure_Item(
                    {
                        rarity_key: struct_get_from_hash(mitem, variable_get_hash("rarity_key")),
                        type_key: struct_get_from_hash(mitem, variable_get_hash("type_key"))
                    });
                    item.load_data(mitem);
                    array_push(global.borbventures.items.inventory, item);
                    variable_struct_set(o_game.data.borbventure_types_seen, item.type.key, true);
                }
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("cards"))))
        {
            __struct = data.cards;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.cards, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("cards_packs"))))
        {
            __struct = data.cards_packs;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.cards_packs, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("converters"))))
        {
            __struct = data.converters;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.converters, mkey);
                if (is_undefined(mitem))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("enemies"))))
        {
            _map(data.enemies, function(arg0, arg1)
            {
                var item = variable_struct_get(global.enemies, arg1);
                if (is_undefined(item))
                {
                    exit;
                }
                item.load_data(arg0);
            }, false);
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("events"))))
        {
            __struct = data.events;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.events, mkey);
                if (is_undefined(item))
                {
                    exit;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("unique_leaves"))))
        {
            _map(data.unique_leaves, function(arg0, arg1)
            {
                var item = variable_struct_get(global.unique_leaves, arg1);
                if (is_undefined(item))
                {
                    exit;
                }
                item.load_data(arg0);
                if (item.data.unlocked && item.data.count == 0)
                {
                    item.data.count = 1;
                }
            }, false);
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("pets"))))
        {
            _map(data.pets, function(arg0, arg1)
            {
                var item = variable_struct_get(global.pets, arg1);
                if (is_undefined(item))
                {
                    exit;
                }
                apply_struct_to_struct(item.data, arg0);
                var shop_key = "pet_" + arg1;
                var shop_item = variable_struct_get(global.shops.pets, shop_key);
                if (is_undefined(shop_item))
                {
                    exit;
                }
                item.data.count = shop_item.data.count;
            }, false);
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("artifacts"))))
        {
            _map(data.artifacts, function(arg0, arg1)
            {
                var item = variable_struct_get(global.artifacts, arg1);
                if (is_undefined(item))
                {
                    exit;
                }
                item.load_data(arg0);
                item.init();
            }, false);
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("chests"))))
        {
            __struct = data.chests;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.chests, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("lore"))))
        {
            _map(wrapper_data.lore, function(arg0, arg1)
            {
                var item = variable_struct_get(global.lore, arg1);
                if (is_undefined(item))
                {
                    exit;
                }
                apply_struct_to_struct(item.data, arg0);
                item.init();
            }, false);
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("trades"))))
        {
            global.trades = [];
            __array = data.trades;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                if (mitem.finished)
                {
                    continue;
                }
                generate_trade(mitem);
            }
            generate_trades();
        }
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("community_leaves"))))
        {
            __struct = wrapper_data.community_leaves;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var comm_item = variable_struct_get(global.community_leaves, mkey);
                if (is_undefined(comm_item))
                {
                    continue;
                }
                comm_item.data = mitem;
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("equipment"))))
        {
            __struct = data.equipment;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var eq_item = variable_struct_get(global.equipment, mkey);
                if (is_undefined(eq_item))
                {
                    continue;
                }
                eq_item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("house_items"))))
        {
            __struct = wrapper_data.house_items;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var house_item = variable_struct_get(global.house_items, mkey);
                if (is_undefined(house_item))
                {
                    continue;
                }
                house_item.data = mitem;
            }
        }
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("challenges"))))
        {
            __struct = wrapper_data.challenges;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var challenge = variable_struct_get(global.challenges, mkey);
                if (is_undefined(challenge))
                {
                    continue;
                }
                apply_struct_to_struct(challenge.data, mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("crafted_backpack"))))
        {
            global.craft_leaves_backpack = [];
            __array = data.crafted_backpack;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var leaf_type = variable_struct_get(global.craft_leaf_types, mitem.type_key);
                if (is_undefined(leaf_type))
                {
                    continue;
                }
                var leaf = craft_leaf_type(leaf_type, undefined, global.craft_leaves_backpack);
                leaf.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("crafted_leaves"))))
        {
            global.craft_leaves_inventory = [];
            __array = data.crafted_leaves;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var leaf_type = variable_struct_get(global.craft_leaf_types, mitem.type_key);
                if (is_undefined(leaf_type))
                {
                    continue;
                }
                var leaf = craft_leaf_type(leaf_type, undefined, global.craft_leaves_inventory);
                leaf.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("scrolls"))))
        {
            __struct = data.scrolls;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.scrolls, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("materials"))))
        {
            __struct = data.materials;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var material = variable_struct_get(global.materials, mkey);
                if (is_undefined(material))
                {
                    continue;
                }
                material.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("milestones"))))
        {
            __struct = data.milestones;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                if (!is_struct(mitem))
                {
                    continue;
                }
                var milestone_section = variable_struct_get(global.milestones, mkey);
                if (is_undefined(milestone_section))
                {
                    continue;
                }
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    var item = variable_struct_get(milestone_section.milestones, mkey2);
                    if (is_undefined(item))
                    {
                        continue;
                    }
                    item.load_data(mitem2);
                }
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("quests"))))
        {
            global.active_quests = [];
            global.quests.daily = {};
            if (!in_challenge())
            {
                global.profiles.def.quests.daily = {};
            }
            __struct = data.quests;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.quests, mkey);
                if (mkey == "daily" && get_struct_length(mitem) > 0)
                {
                    var __struct2 = mitem;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        var quest_type = variable_struct_get(global.quest_types, mitem2.type_key);
                        if (!is_struct(quest_type))
                        {
                            continue;
                        }
                        var quest = generate_daily_quest(quest_type);
                        quest.load_data(mitem2);
                        quest.index = quest.data.index;
                        variable_struct_set(global.quests.daily, mkey2, quest);
                    }
                }
                else if (is_undefined(item))
                {
                }
                else
                {
                    var __struct2 = mitem;
                    var __prop_names2 = struct_get_names(__struct2);
                    var __prop_len2 = array_length(__prop_names2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mkey2 = __prop_names2[__i2];
                        var mitem2 = variable_struct_get(__struct2, mkey2);
                        var item2 = variable_struct_get(item, mkey2);
                        if (is_undefined(item2))
                        {
                            continue;
                        }
                        item2.load_data(mitem2);
                    }
                }
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("recipes"))))
        {
            __struct = data.recipes;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.recipes, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("relics"))))
        {
            __struct = data.relics;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.relics, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("master_relics"))))
        {
            __struct = data.master_relics;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.master_relics, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("leafscenders"))))
        {
            __struct = data.leafscenders;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var __struct2 = mitem;
                var __prop_names2 = struct_get_names(__struct2);
                var __prop_len2 = array_length(__prop_names2);
                for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                {
                    var mkey2 = __prop_names2[__i2];
                    var mitem2 = variable_struct_get(__struct2, mkey2);
                    var item = variable_struct_get(variable_struct_get(global.leafscenders, mkey), mkey2);
                    if (is_undefined(item))
                    {
                        continue;
                    }
                    item.load_data(mitem2);
                }
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("dice"))))
        {
            __array = data.dice;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var d = new Dice(
                {
                    rarity: variable_struct_get(global.dice_rarity, mitem.rarity_key),
                    type: variable_struct_get(global.dice_types, mitem.type_key)
                });
                d.load_data(mitem);
                array_push(global.dice_inventory, d);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("dice_backpack"))))
        {
            __array = data.dice_backpack;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var d = new Dice(
                {
                    rarity: variable_struct_get(global.dice_rarity, mitem.rarity_key),
                    type: variable_struct_get(global.dice_types, mitem.type_key)
                });
                d.load_data(mitem);
                d.bag = "backpack";
                array_push(global.dice_backpack, d);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("dice_enemies"))))
        {
            __struct = data.dice_enemies;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.dice_enemies_struct_flat, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (is_struct(struct_get_from_hash(data, variable_get_hash("harbor"))))
        {
            if (is_struct(struct_get_from_hash(data.harbor, variable_get_hash("container"))))
            {
                global.harbor.container.load_data(data.harbor.container);
            }
            if (is_struct(struct_get_from_hash(data.harbor, variable_get_hash("inventory"))))
            {
                global.harbor_inventory.load_data(data.harbor.inventory);
            }
            if (is_array(struct_get_from_hash(data.harbor, variable_get_hash("jobs"))))
            {
                global.harbor.jobs = [];
                __array = data.harbor.jobs;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var job = add_harbor_job(undefined, mitem);
                }
            }
            if (is_array(struct_get_from_hash(data.harbor, variable_get_hash("ships"))))
            {
                global.harbor.ships = [];
                global.harbor_ships_delivery = {};
                __array = data.harbor.ships;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    add_harbor_ship(mitem);
                }
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("mines"))))
        {
            __array = data.mines;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var item = new Mine();
                item.load_data(mitem);
                array_push(global.mines, item);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("mine_inventory"))))
        {
            __array = data.mine_inventory;
            __prop_len = array_length(__array);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mitem = __array[__i];
                var item = new Mine_Item(
                {
                    rarity_key: mitem.rarity_key,
                    type_key: mitem.type_key
                });
                item.load_data(mitem);
                array_push(global.mine_inventory, item);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("transmuters"))))
        {
            __struct = data.transmuters;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.transmuters, mkey);
                if (is_undefined(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (!is_undefined(struct_get_from_hash(data, variable_get_hash("shadow"))))
        {
            if (!is_undefined(struct_get_from_hash(data.shadow, variable_get_hash("crystal"))))
            {
                global.shadow_crystal.load_data(data.shadow.crystal);
            }
            if (!is_undefined(struct_get_from_hash(data.shadow, variable_get_hash("player"))))
            {
                global.shadow_player.load_data(data.shadow.player);
            }
            if (!is_undefined(struct_get_from_hash(data.shadow, variable_get_hash("tree"))))
            {
                global.shadow_tree.load_data(data.shadow.tree);
            }
            if (!is_undefined(struct_get_from_hash(data.shadow, variable_get_hash("pit"))))
            {
                __struct = data.shadow.pit;
                __prop_names = struct_get_names(__struct);
                __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var item = variable_struct_get(global.shadow_pit, mkey);
                    if (!is_struct(item))
                    {
                        continue;
                    }
                    item.load_data(mitem);
                }
            }
        }
        if (is_struct(struct_get_from_hash(data, variable_get_hash("booster"))))
        {
            __struct = data.booster;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                var item = variable_struct_get(global.booster, mkey);
                if (!is_struct(item))
                {
                    continue;
                }
                item.load_data(mitem);
            }
        }
        if (is_struct(struct_get_from_hash(data, variable_get_hash("booster_game"))))
        {
            if (is_struct(struct_get_from_hash(data.booster_game, variable_get_hash("upgrades"))))
            {
                global.booster_game_upgrades.load_data(data.booster_game.upgrades);
            }
        }
        if (is_struct(struct_get_from_hash(data, variable_get_hash("fishing"))))
        {
            if (is_struct(struct_get_from_hash(data.fishing, variable_get_hash("fish"))))
            {
                __struct = data.fishing.fish;
                __prop_names = struct_get_names(__struct);
                __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var item = variable_struct_get(global.fish, mkey);
                    if (!is_struct(item))
                    {
                        continue;
                    }
                    item.load_data(mitem);
                }
            }
            if (is_struct(struct_get_from_hash(data.fishing, variable_get_hash("baits"))))
            {
                __struct = data.fishing.baits;
                __prop_names = struct_get_names(__struct);
                __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var item = variable_struct_get(global.fishing_baits, mkey);
                    if (!is_struct(item))
                    {
                        continue;
                    }
                    item.load_data(mitem);
                }
            }
            if (is_array(struct_get_from_hash(data.fishing, variable_get_hash("baits_farm"))))
            {
                global.fishing_baits_farm = [];
                __array = data.fishing.baits_farm;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var item = new Fishing_Bait_Farm();
                    item.load_data(mitem);
                    array_push(global.fishing_baits_farm, item);
                }
            }
            if (is_array(struct_get_from_hash(data.fishing, variable_get_hash("rods"))))
            {
                global.fishing_rods = [];
                global.fishing_rods_map = {};
                __array = data.fishing.rods;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var rod = add_fishing_rod(mitem.rarity_key, mitem.type_key, mitem.quality, mitem);
                    rod.load_data(mitem);
                    rod.data.spot_id = 0;
                    variable_struct_set(global.fishing_rods_map, rod.data.id, rod);
                }
            }
            if (is_array(struct_get_from_hash(data.fishing, variable_get_hash("spots"))))
            {
                global.fishing_spots = [];
                global.fishing_spots_map = {};
                __array = data.fishing.spots;
                __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var spot_data_clone = struct_clone(mitem);
                    var spot = add_fishing_spot(mitem.rarity_key, mitem.type_key, mitem.quality, 
                    {
                        id: mitem.id
                    });
                    spot.load_data(mitem);
                    variable_struct_set(global.fishing_spots_map, spot.data.id, spot);
                    spot.set_rods(spot_data_clone.rods);
                }
            }
            if (is_struct(struct_get_from_hash(data.fishing, variable_get_hash("tournaments"))))
            {
                __struct = data.fishing.tournaments;
                __prop_names = struct_get_names(__struct);
                __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    var item = variable_struct_get(global.fishing_tournaments, mkey);
                    if (!is_struct(item))
                    {
                        continue;
                    }
                    item.load_data(mitem);
                    if (item.is_started())
                    {
                        global.active_fishing_tournament = item;
                    }
                }
            }
            if (is_struct(struct_get_from_hash(data.fishing, variable_get_hash("tournament_rod"))))
            {
                global.fishing_tournament_rod.load_data(data.fishing.tournament_rod);
            }
        }
        init_quarks_late();
        if (o_game.data.stats.pub_lore_text_riddle_solved)
        {
            variable_struct_set(o_game.data.stats.riddles, "1", 1);
        }
        if (get_default_struct_value(o_game.data.stats.prestige_run, "prestige", -1) == -1)
        {
            o_game.data.stats.prestige_run.prestige = o_game.data.stats.prestige;
            o_game.data.stats.prestige_run.blc = o_game.data.stats.prestige_crunch;
            o_game.data.stats.prestige_run.mlc = o_game.data.stats.prestige_mlc;
            o_game.data.stats.prestige_run.ulc = get_default_struct_value(o_game.data.stats, "prestige_ulc", 0);
        }
        if (get_default_struct_value(o_game.data.stats.prestige_resources_highest_history, "prestige", -1) == -1)
        {
            o_game.data.stats.prestige_resources_highest_history.prestige = get_default_struct_value(o_game.data.stats.prestige_resources_highest, "coins", 0);
            o_game.data.stats.prestige_resources_highest_history.blc = get_default_struct_value(o_game.data.stats.prestige_resources_highest, "blc", 0);
            o_game.data.stats.prestige_resources_highest_history.mlc = get_default_struct_value(o_game.data.stats.prestige_resources_highest, "mlc", 0);
            o_game.data.stats.prestige_resources_highest_history.ulc = get_default_struct_value(o_game.data.stats.prestige_resources_highest, "ulc", 0);
        }
        if (in_challenge())
        {
            load_options();
        }
        apply_challenge();
        with (o_options)
        {
            init();
        }
        with (o_shop)
        {
            init();
        }
        if (get_upgrade_count(global.shops.benitoite.unlock_borbs) > 0)
        {
            global.resources.borbs.data.unlocked = true;
        }
    }
    if (global.cloud_data.is_season && instance_exists(o_season_helper))
    {
        global.cloud_data.season_data = o_season_helper.season_data;
        if (!is_empty(o_season_helper.player_id))
        {
            o_game.data.player_id = o_season_helper.player_id;
        }
        if (!is_empty(o_season_helper.challenge_seed))
        {
            global.globalstats.challenge_seed = o_season_helper.challenge_seed;
        }
        apply_struct_to_struct(global.areas, o_season_helper.area_settings);
        apply_struct_to_struct(global.cloud_data.guild_settings, o_season_helper.guild_settings);
        apply_struct_to_struct(global.cloud_data.player_challenge_data, o_season_helper.player_challenge_data);
        global.cloud_data.season = o_season_helper.challenge_data;
        apply_struct_to_struct(global.game_settings, o_season_helper.game_settings);
        apply_struct_to_struct(global.shops, o_season_helper.season_shop_item_settings);
        if (o_game.data.mp_current_run_finished)
        {
            global.cloud_data.saved_after_challenge_completion = true;
        }
        o_game.data.season_id = global.cloud_data.season_selected.id;
        apply_season_challenge();
        with (o_shop)
        {
            init();
        }
    }
    var area_start_key = o_game.data.current_area_key;
    if (fresh_start && !is_undefined(global.game_settings.start_area))
    {
        area_start_key = global.game_settings.start_area;
    }
    if (is_undefined(variable_struct_get(global.areas, area_start_key)) || get_hp_drain_area(variable_struct_get(global.areas, area_start_key)) > 0 || !variable_struct_get(global.areas, area_start_key).type.spawn_after_load)
    {
        area_start_key = global.areas.garden.key;
    }
    if (area_start_key != global.areas.garden.key && !is_unlocked_areas() && !in_challenge())
    {
        area_start_key = global.game_settings.start_area;
    }
    change_area(variable_struct_get(global.areas, area_start_key));
    var time_elapsed_seconds, time_elapsed_seconds_real;
    if (!is_undefined(data) && !is_undefined(struct_get_from_hash(data, variable_get_hash("time"))))
    {
        var max_offline_time = 86400;
        if (get_upgrade_count(global.shops.gems.offline_max_time) == 1)
        {
            max_offline_time = 604800;
        }
        var time_saved = date_create_datetime(data.time.year, data.time.month, data.time.day, data.time.hour, data.time.minute, data.time.second);
        time_elapsed_seconds = floor(date_second_span(time_saved, date_current_datetime()));
        time_elapsed_seconds_real = time_elapsed_seconds;
        time_elapsed_seconds = min(max_offline_time, time_elapsed_seconds);
    }
    if (!is_undefined(data) && !is_undefined(struct_get_from_hash(data, variable_get_hash("scrolls"))))
    {
        __struct = data.scrolls;
        __prop_names = struct_get_names(__struct);
        __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var item = variable_struct_get(global.scrolls, mkey);
            if (is_undefined(item))
            {
                continue;
            }
            item.forward_time(sec(time_elapsed_seconds));
        }
    }
    init_game_vars(true);
    var __array = global.craft_leaves_backpack;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.refresh_info_text();
    }
    __array = global.craft_leaves_inventory;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.refresh_info_text();
    }
    refresh_crafted_leaves_cost();
    var __struct = global.shops;
    var __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        var __struct2 = mitem;
        var __prop_names2 = struct_get_names(__struct2);
        var __prop_len2 = array_length(__prop_names2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mkey2 = __prop_names2[__i2];
            var mitem2 = variable_struct_get(__struct2, mkey2);
            var max_count = get_shop_item_max_count(mitem2);
            if (max_count > 0 && get_upgrade_count(mitem2) > max_count)
            {
                mitem2.data.count = min(max_count, mitem2.data.count);
            }
            mitem2.data.count = apply_max_number(mitem2.data.count);
        }
    }
    if (!is_undefined(wrapper_data))
    {
        if (global.game_settings.offline_rewards_enabled)
        {
            if (!is_undefined(struct_get_from_hash(data, variable_get_hash("time"))))
            {
                add_game_log(__s("Game loaded, offline for %s seconds.", time_elapsed_seconds_real));
                var offline_text = __s("Welcome back! You've been away for %s. While you were away, your progress continued, and here's what you've earned in that time.", format_time(time_elapsed_seconds_real)) + "\n" + "\n";
                if (time_elapsed_seconds >= 10)
                {
                    add_offline_rewards(time_elapsed_seconds, offline_text, false, false, false);
                }
            }
        }
        if (get_upgrade_count(global.shops.gems.boss_offline_time_reduction) > 0)
        {
            __struct = global.areas;
            __prop_names = struct_get_names(__struct);
            __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                mitem.reduce_boss_delay(sec(time_elapsed_seconds));
            }
        }
        global.borbventures.offline(time_elapsed_seconds_real);
        fishing_offline_progress(time_elapsed_seconds);
        o_game.data.stats.game_started++;
        add_to_struct_value(o_game.data.os, 0, 1);
        add_to_struct_value(o_game.data.os_devices, os_device, 1);
    }
    if (!is_undefined(wrapper_data))
    {
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("time_stats"))))
        {
            global.game_time_stats = wrapper_data.time_stats;
        }
        if (wrapper_data.version_int < 2229.07)
        {
            if (file_exists("save.dat"))
            {
                file_copy("save.dat", sprintf("old_saves/save-v%s.dat", wrapper_data.version_int));
            }
        }
        if (!is_undefined(struct_get_from_hash(wrapper_data, variable_get_hash("autobuy_priorities"))))
        {
            global.autobuy_priorities = wrapper_data.autobuy_priorities;
        }
    }
    global.options.resource_draw_selection.reset();
    if (instance_exists(o_season_helper) && o_season_helper.msg != "")
    {
        notify(o_season_helper.msg, "important");
    }
    instance_destroy(o_season_helper);
    check_milestones();
    reset_upgrade_cache();
    init_game_vars(true);
    after_load_game();
    log("=== GAME LOADED ===");
}
