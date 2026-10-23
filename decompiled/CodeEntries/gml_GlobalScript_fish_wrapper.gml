function init_fish()
{
    global.fishing_rewards_last = [];
    global.fishing_rods_rarity = 
    {
        common: new Rarity(
        {
            level: 1,
            chance: 1,
            name: __("Common"),
            sprite: spr_rod_common
        }),
        uncommon: new Rarity(
        {
            level: 2,
            chance: 0.3,
            name: __("Uncommon"),
            sprite: spr_rod_uncommon
        }),
        rare: new Rarity(
        {
            level: 3,
            chance: 0.2,
            name: __("Rare"),
            sprite: spr_rod_rare
        }),
        epic: new Rarity(
        {
            level: 4,
            chance: 0.15,
            name: __("Epic"),
            sprite: spr_rod_epic
        }),
        mythical: new Rarity(
        {
            level: 5,
            chance: 0.1,
            name: __("Mythical"),
            sprite: spr_rod_mythical
        }),
        legendary: new Rarity(
        {
            level: 6,
            chance: 0.05,
            name: __("Legendary"),
            sprite: spr_rod_legendary
        })
    };
    global.fishing_rods_rarity_array = init_rarities(global.fishing_rods_rarity);
    global.fishing_rods = [];
    global.fishing_rods_map = {};
    global.fishing_rod_types = 
    {
        fast: new Fishing_Rod_Type(
        {
            name: __("Fast"),
            upgrade_attributes: 
            {
                fishing_wait_duration_reduction_multiplier: 0.03
            }
        }),
        glamorous: new Fishing_Rod_Type(
        {
            name: __("Glamorous"),
            upgrade_attributes: 
            {
                fishing_catch_credits_multiplier: 0.05
            }
        }),
        lucky: new Fishing_Rod_Type(
        {
            name: __("Lucky"),
            upgrade_attributes: 
            {
                fishing_catch_rarity_multiplier: 0.1
            }
        }),
        magic: new Fishing_Rod_Type(
        {
            name: __("Magic"),
            upgrade_attributes: 
            {
                fishing_catch_tide_crystal_chance: 0.005
            }
        }),
        regular: new Fishing_Rod_Type(
        {
            name: __("Regular"),
            is_special: false
        }),
        strong: new Fishing_Rod_Type(
        {
            name: __("Strong"),
            upgrade_attributes: 
            {
                fishing_min_fish_length_multiplier: 0.05
            }
        })
    };
    init_rarities(global.fishing_rod_types);
    global.fishing_rod_types_array = struct_to_sorted_array_by(global.fishing_rod_types, "key", true);
    global.fishing_rod_types_special = [];
    var __array = global.fishing_rod_types_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.key == "regular")
        {
            continue;
        }
        array_push(global.fishing_rod_types_special, mitem);
    }
    global.fish_rarity = 
    {
        common: new Rarity(
        {
            level: 1,
            chance: 1,
            name: __("Common")
        }),
        uncommon: new Rarity(
        {
            level: 2,
            chance: 0.3,
            name: __("Uncommon")
        }),
        rare: new Rarity(
        {
            level: 3,
            chance: 0.1,
            name: __("Rare")
        }),
        epic: new Rarity(
        {
            level: 4,
            min_level: 5,
            chance: 0.05,
            name: __("Epic")
        }),
        mythical: new Rarity(
        {
            level: 5,
            min_level: 7,
            chance: 0.01,
            name: __("Mythical")
        }),
        legendary: new Rarity(
        {
            level: 6,
            min_level: 9,
            chance: 0.005,
            name: __("Legendary")
        })
    };
    global.fish_rarity_array = init_rarities(global.fish_rarity);
    global.fish_rarity_array_desc = struct_to_sorted_array_by(global.fish_rarity, "level", false);
    global.fishing_spot_types = 
    {
        fast: new Fishing_Spot_Type(
        {
            name: __("Fast"),
            upgrade_attributes: 
            {
                fishing_wait_duration_reduction_multiplier: 0.02
            }
        }),
        glamorous: new Fishing_Spot_Type(
        {
            name: __("Glamorous"),
            upgrade_attributes: 
            {
                fishing_catch_credits_multiplier: 0.05
            }
        }),
        lucky: new Fishing_Spot_Type(
        {
            name: __("Lucky"),
            upgrade_attributes: 
            {
                fishing_catch_rarity_multiplier: 0.1
            }
        }),
        magic: new Fishing_Spot_Type(
        {
            name: __("Magic"),
            upgrade_attributes: 
            {
                fishing_catch_tide_crystal_chance: 0.001
            }
        }),
        regular: new Fishing_Spot_Type(
        {
            name: __("Regular"),
            is_special: false
        }),
        strong: new Fishing_Spot_Type(
        {
            name: __("Strong"),
            upgrade_attributes: 
            {
                fishing_min_fish_length_multiplier: 0.05
            }
        })
    };
    init_game_object_struct(global.fishing_spot_types);
    global.fishing_spot_types_array = struct_to_sorted_array_by(global.fishing_spot_types, "key", true);
    global.fishing_spot_types_special = [];
    __array = global.fishing_spot_types_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.key == "regular")
        {
            continue;
        }
        array_push(global.fishing_spot_types_special, mitem);
    }
    global.fishing_spots_rarity = 
    {
        common: new Fishing_Spot_Rarity(
        {
            level: 1,
            chance: 1,
            rod_count: 1,
            name: __("Common"),
            catch_rarities_keys: ["common", "uncommon"]
        }),
        uncommon: new Fishing_Spot_Rarity(
        {
            level: 2,
            chance: 0.3,
            rod_count: 1,
            name: __("Uncommon"),
            catch_rarities_keys: ["common", "uncommon", "rare"]
        }),
        rare: new Fishing_Spot_Rarity(
        {
            level: 3,
            chance: 0.1,
            rod_count: 2,
            name: __("Rare"),
            catch_rarities_keys: ["uncommon", "rare", "epic"]
        }),
        epic: new Fishing_Spot_Rarity(
        {
            level: 4,
            chance: 0.05,
            rod_count: 2,
            name: __("Epic"),
            catch_rarities_keys: ["rare", "epic", "mythical"]
        }),
        mythical: new Fishing_Spot_Rarity(
        {
            level: 5,
            chance: 0.01,
            rod_count: 2,
            name: __("Mythical"),
            catch_rarities_keys: ["epic", "mythical", "legendary"]
        }),
        legendary: new Fishing_Spot_Rarity(
        {
            level: 6,
            chance: 0.005,
            rod_count: 3,
            name: __("Legendary"),
            catch_rarities_keys: ["mythical", "legendary"]
        })
    };
    global.fishing_spots_rarity_array = init_rarities(global.fishing_spots_rarity);
    global.fishing_spots_rarity_array_desc = struct_to_sorted_array_by(global.fishing_spots_rarity, "level", false);
    global.fishing_spots = [];
    global.fishing_spots_map = {};
    var fish = [
    {
        __key: "aquazure",
        name: __("Aquazure"),
        sprite: spr_fish_aquazure,
        upgrade_attributes: 
        {
            material_max_count: 75
        }
    }, 
    {
        __key: "brinetail",
        name: __("Brinetail"),
        sprite: spr_fish_brinetail,
        min_rarity: global.fish_rarity.rare,
        upgrade_attributes: 
        {
            relics_base_damage_multiplier_fish: 0.05
        }
    }, 
    {
        __key: "chimfin",
        name: __("Chimfin"),
        sprite: spr_fish_chimfin,
        min_rarity: global.fish_rarity.uncommon,
        upgrade_attributes: 
        {
            mlc_value_multiplier_fish: 0.25
        }
    }, 
    {
        __key: "chloroflare",
        name: __("Chloroflare"),
        sprite: spr_fish_chloroflare,
        min_rarity: global.fish_rarity.rare,
        upgrade_attributes: 
        {
            relics_max_count: 0.2
        }
    }, 
    {
        __key: "coralyn",
        name: __("Coralyn"),
        sprite: spr_fish_coralyn,
        min_rarity: global.fish_rarity.mythical,
        upgrade_attributes: 
        {
            quarkstige_damage_multiplier: 0.01
        }
    }, 
    {
        __key: "doomglide",
        name: __("Doomglide"),
        sprite: spr_fish_doomglide,
        min_rarity: global.fish_rarity.epic,
        upgrade_attributes: 
        {
            dice_sides_multiplier: 0.01
        }
    }, 
    {
        __key: "dreadmaw",
        name: __("Dreadmaw"),
        sprite: spr_fish_dreadmaw,
        min_rarity: global.fish_rarity.epic,
        upgrade_attributes: 
        {
            mines_drill_progress_multiplier_fish: 0.005
        }
    }, 
    {
        __key: "frostail",
        name: __("Frostail"),
        sprite: spr_fish_frostail,
        upgrade_attributes: 
        {
            blower_enemy_damage_multiplier_fish: 0.02
        }
    }, 
    {
        __key: "glowshimmer",
        name: __("Glowshimmer"),
        sprite: spr_fish_glowshimmer,
        min_rarity: global.fish_rarity.epic,
        upgrade_attributes: 
        {
            mines_mine_power_multiplier_fish: 0.001
        }
    }, 
    {
        __key: "kelpstrider",
        name: __("Kelpstrider"),
        sprite: spr_fish_kelpstrider,
        min_rarity: global.fish_rarity.uncommon,
        upgrade_attributes: 
        {
            soul_forge_complete_count_multiplier_fish: 0.05
        }
    }, 
    {
        __key: "lumivine",
        name: __("Lumivine"),
        sprite: spr_fish_lumivine,
        min_rarity: global.fish_rarity.uncommon,
        upgrade_attributes: 
        {
            borbventure_increase_reward: 0.02
        }
    }, 
    {
        __key: "marisiel",
        name: __("Marisiel"),
        sprite: spr_fish_marisiel,
        min_rarity: global.fish_rarity.mythical,
        upgrade_attributes: 
        {
            quark_reactor_size_multiplier: 0.03
        }
    }, 
    {
        __key: "morgruttle",
        name: __("Morgruttle"),
        sprite: spr_fish_morgruttle,
        upgrade_attributes: 
        {
            max_resource_storage: 
            {
                energy_electrical: 50
            }
        }
    }, 
    {
        __key: "nocturneon",
        name: __("Nocturneon"),
        sprite: spr_fish_nocturneon,
        min_rarity: global.fish_rarity.legendary,
        upgrade_attributes: 
        {
            shadow_crystal_attack_damage_multiplier: 0.0075
        }
    }, 
    {
        __key: "quibble",
        name: __("Quibble"),
        sprite: spr_fish_quibble,
        min_rarity: global.fish_rarity.legendary,
        upgrade_attributes: 
        {
            ulc_value_multiplier_fish: 0.01
        }
    }, 
    {
        __key: "ripplefin",
        name: __("Ripplefin"),
        sprite: spr_fish_ripplefin,
        min_rarity: global.fish_rarity.uncommon,
        upgrade_attributes: 
        {
            slap_multiplier_fish: 0.01
        }
    }, 
    {
        __key: "rubyglint",
        name: __("Rubyglint"),
        sprite: spr_fish_rubyglint,
        min_rarity: global.fish_rarity.legendary,
        upgrade_attributes: 
        {
            slap_critical_multiplier: 0.005
        }
    }, 
    {
        __key: "seaphoon",
        name: __("Seaphoon"),
        sprite: spr_fish_seaphoon,
        upgrade_attributes: 
        {
            trade_resources_multiplier_fish: 0.2
        }
    }, 
    {
        __key: "sunspirelle",
        name: __("Sunspirelle"),
        sprite: spr_fish_sunspirelle,
        min_rarity: global.fish_rarity.uncommon,
        upgrade_attributes: 
        {
            borbventure_items_max_count: 0.15
        }
    }, 
    {
        __key: "swoople",
        name: __("Swoople"),
        sprite: spr_fish_swoople,
        upgrade_attributes: 
        {
            blc_value_multiplier_fish: 0.5
        }
    }, 
    {
        __key: "tidalora",
        name: __("Tidalora"),
        sprite: spr_fish_tidalora,
        upgrade_attributes: 
        {
            leaf_multiplier_fish: 0.01
        }
    }, 
    {
        __key: "tidewhisk",
        name: __("Tidewhisk"),
        sprite: spr_fish_tidewhisk,
        min_rarity: global.fish_rarity.epic,
        upgrade_attributes: 
        {
            dice_battlefield_damage_multiplier_fish: 0.01
        }
    }, 
    {
        __key: "turquessa",
        name: __("Turquessa"),
        sprite: spr_fish_turquessa,
        upgrade_attributes: 
        {
            material_collect_count: 0.15
        }
    }, 
    {
        __key: "wavemyst",
        name: __("Wavemyst"),
        sprite: spr_fish_wavemyst,
        min_rarity: global.fish_rarity.rare,
        upgrade_attributes: 
        {
            fishing_tourney_rod_value_multiplier: 0.03
        }
    }];
    global.fish = {};
    global.fish_array = [];
    global.fish_array_rarity = {};
    __array = global.fish_rarity_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        variable_struct_set(global.fish_array_rarity, mitem.key, []);
        var __array2 = fish;
        var __prop_len2 = array_length(__array2);
        for (var __i2 = 0; __i2 < __prop_len2; __i2++)
        {
            var mitem2 = __array2[__i2];
            var data = struct_clone(mitem2);
            data.index = (mitem.level * 100000) + __i2;
            data.type_index = (__i2 * 100000) + mitem.level;
            data.key = sprintf("%s_%s", mitem.key, mitem2.__key);
            data.rarity = mitem;
            var fish_item = new Fish(data);
            variable_struct_set(global.fish, data.key, fish_item);
            array_push(variable_struct_get(global.fish_array_rarity, mitem.key), fish_item);
            array_push(global.fish_array, fish_item);
        }
    }
    init_game_object_struct(global.fish);
    global.fish_array_sorted_type = struct_to_sorted_array_by(global.fish, "type_index");
    global.fishing_tournament_types = 
    {
        novice: 
        {
            name: __("Novice"),
            difficulty: 1,
            cost: 
            {
                resources: 
                {
                    fish_credits: 50
                }
            },
            reward: 
            {
                resources: 
                {
                    fish_credits: 300
                }
            }
        },
        intermediate: 
        {
            name: __("Intermediate"),
            difficulty: 2,
            cost: 
            {
                resources: 
                {
                    fish_credits: 250
                }
            },
            reward: 
            {
                materials: 
                {
                    tide_crystal: 2
                },
                resources: 
                {
                    fish_credits: 750
                }
            }
        },
        expert: 
        {
            name: __("Expert"),
            difficulty: 4,
            cost: 
            {
                resources: 
                {
                    fish_credits: 1000
                }
            },
            reward: 
            {
                materials: 
                {
                    tide_crystal: 5
                },
                resources: 
                {
                    fish_credits: 3000
                }
            }
        },
        legend: 
        {
            name: __("Legend"),
            difficulty: 6,
            cost: 
            {
                resources: 
                {
                    fish_credits: 3000
                }
            },
            reward: 
            {
                materials: 
                {
                    tide_crystal: 10
                },
                resources: 
                {
                    fish_credits: 9000
                }
            }
        }
    };
    init_game_object_struct(global.fishing_tournament_types);
    global.fishing_tournament_types_array = struct_to_sorted_array_by(global.fishing_tournament_types, "difficulty");
    global.fishing_tournaments = {};
    __array = global.fishing_tournament_types_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var tournament = new Fishing_Tournament(
        {
            key: mitem.key,
            type: mitem,
            index: mitem.difficulty
        });
        variable_struct_set(global.fishing_tournaments, mitem.key, tournament);
    }
    global.fishing_tournaments_array = struct_to_sorted_array(global.fishing_tournaments);
    __array = global.fishing_tournaments_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (__i == 0)
        {
            continue;
        }
        mitem.previous_tournament = global.fishing_tournaments_array[__i - 1];
    }
    global.fishing_tournament_rod = new Fishing_Tournament_Rod();
    global.fishing_tournament_rod.init();
    global.fishing_baits_rarity = 
    {
        common: new Rarity(
        {
            name: __("Common"),
            sprite: spr_bait_common,
            level: 1,
            chance: 1,
            catch_chance: 
            {
                uncommon: 0.2
            }
        }),
        uncommon: new Rarity(
        {
            name: __("Uncommon"),
            sprite: spr_bait_uncommon,
            level: 2,
            chance: 0.5,
            catch_chance: 
            {
                uncommon: 0.3,
                rare: 0.05
            }
        }),
        rare: new Rarity(
        {
            name: __("Rare"),
            sprite: spr_bait_rare,
            level: 3,
            chance: 0.2,
            catch_chance: 
            {
                uncommon: 0.5,
                rare: 0.15
            }
        }),
        epic: new Rarity(
        {
            name: __("Epic"),
            sprite: spr_bait_epic,
            level: 4,
            chance: 0.1,
            catch_chance: 
            {
                uncommon: 1,
                rare: 0.25,
                epic: 0.05
            }
        }),
        mythical: new Rarity(
        {
            name: __("Mythical"),
            sprite: spr_bait_mythical,
            chance: 0.05,
            level: 5,
            catch_chance: 
            {
                uncommon: 1,
                rare: 0.5,
                epic: 0.1,
                mythical: 0.05
            }
        }),
        legendary: new Rarity(
        {
            name: __("Legendary"),
            sprite: spr_bait_legendary,
            chance: 0.01,
            level: 6,
            catch_chance: 
            {
                uncommon: 1,
                rare: 0.75,
                epic: 0.5,
                mythical: 0.25,
                legendary: 0.1
            }
        })
    };
    global.fishing_baits_rarity_array = init_rarities(global.fishing_baits_rarity);
    global.fishing_baits_rarity_array_desc = struct_to_sorted_array_by(global.fishing_baits_rarity, "chance");
    global.fishing_baits = {};
    __array = global.fishing_baits_rarity_array;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var bait = new Fishing_Bait();
        bait.index = __i;
        bait.rarity = mitem;
        bait.init();
        variable_struct_set(global.fishing_baits, mitem.key, bait);
    }
    init_game_object_struct(global.fishing_baits);
    global.fishing_baits_array = struct_to_sorted_array(global.fishing_baits);
    global.fishing_baits_farm = [];
    var first_spot = add_fishing_spot("common", "regular", 0.01);
    variable_struct_set(global.fishing_spots_map, first_spot.data.id, first_spot);
    var first_rod = add_fishing_rod("common", "regular", 0.01);
    variable_struct_set(global.fishing_rods_map, first_rod.data.id, first_rod);
    first_spot.set_index(1);
    first_spot.set_rod(first_rod, 0);
    global.fishing_spots_pity_steps = [
    {
        rarity: global.fishing_spots_rarity.legendary,
        count: 100
    }, 
    {
        rarity: global.fishing_spots_rarity.mythical,
        count: 50
    }, 
    {
        rarity: global.fishing_spots_rarity.epic,
        count: 25
    }, 
    {
        rarity: global.fishing_spots_rarity.rare,
        count: 10
    }, 
    {
        rarity: global.fishing_spots_rarity.uncommon,
        count: 5
    }];
}

function add_fishing_bait_farm()
{
    array_push(global.fishing_baits_farm, new Fishing_Bait_Farm());
}

function add_fishing_rod(arg0 = "common", arg1 = "regular", arg2 = 0.01, arg3 = undefined)
{
    var rod = new Fishing_Rod(arg3);
    rod.set_quality(arg2);
    rod.set_rarity(arg0);
    rod.set_type(arg1);
    rod.init();
    array_push(global.fishing_rods, rod);
    return rod;
}

function add_fishing_spot(arg0 = "common", arg1 = "regular", arg2 = 0.01, arg3 = undefined)
{
    var spot = new Fishing_Spot(arg3);
    spot.set_quality(arg2);
    spot.set_rarity(arg0);
    spot.set_type(arg1);
    spot.init();
    array_push(global.fishing_spots, spot);
    return spot;
}

function add_random_fishing_spot()
{
    o_game.data.stats.fishing_spots++;
    random_set_seed(o_game.data.stats.random_num + o_game.data.stats.fishing_spots);
    var is_special = percent_chance(10);
    var type = global.fishing_spot_types.regular;
    if (is_special)
    {
        type = array_random_item(global.fishing_spot_types_special);
    }
    var rarity = array_random_chance_level(global.fishing_spots_rarity_array, undefined, undefined, undefined, undefined, undefined, undefined, undefined, global.upgrade_attributes.fishing_spots_rarity_multiplier);
    if (o_game.data.stats.fishing_spots > 0 && has_bought_shop_item_safe(global.shops.fish.fishing_spots_pity_counter))
    {
        var last_rarity = rarity;
        var __array = global.fishing_spots_pity_steps;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if ((o_game.data.stats.fishing_spots % mitem.count) == 0 && rarity.level < mitem.rarity.level)
            {
                rarity = mitem.rarity;
            }
        }
    }
    var spot = add_fishing_spot(rarity, type);
    refresh_fishing_spot_indexes();
    variable_struct_set(global.fishing_spots_map, spot.data.id, spot);
    randomize();
    return spot;
}

function check_fish()
{
    var max_charges = get_max_fishing_spot_search_charges();
    var search_key = "fishing_search_pond";
    if (o_game.data.fishing.search_charges < max_charges && !has_timeout_data(search_key))
    {
        o_game.data.fishing.search_charges++;
        o_game.data.fishing.search_charges = min(o_game.data.fishing.search_charges, max_charges);
        set_timeout_data(search_key, global.game_settings.fishing_search_spot_duration);
    }
    var check_auto = false;
    var has_auto_fishing = has_bought_shop_item_safe(global.shops.fish.auto_fishing) && get_option(global.options.auto_fishing);
    if (has_auto_fishing)
    {
        var timeout_key = "check_fish";
        var timeout_duration = get_bm_value(30, "fishing_auto_duration_reduction", undefined, undefined, undefined, -1);
        timeout_duration = max(1, timeout_duration);
        if (!has_timeout_data(timeout_key))
        {
            check_auto = true;
            set_timeout_data(timeout_key, sec(timeout_duration));
        }
    }
    var __array = global.fishing_spots;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.check();
        if (check_auto)
        {
            mitem.check_auto();
        }
    }
    check_auto = false;
    var has_auto_collect = has_bought_shop_item_safe(global.shops.fish.auto_collect_baits);
    if (has_auto_collect)
    {
        var timeout_key = "check_bait_farm";
        var timeout_duration = get_bm_value(120, "fishing_bait_farm_auto_duration_reduction", undefined, undefined, undefined, -1);
        timeout_duration = max(1, timeout_duration);
        if (!has_timeout_data(timeout_key))
        {
            check_auto = true;
            set_timeout_data(timeout_key, sec(timeout_duration));
        }
    }
    if (has_bought_shop_item_safe(global.shops.fish.bait_farm))
    {
        __array = global.fishing_baits_farm;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.check();
            if (check_auto)
            {
                mitem.check_auto();
            }
        }
    }
    if (has_bought_shop_item_safe(global.shops.fish.unlock_fishing_tournaments))
    {
        __array = global.fishing_tournaments_array;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.check();
        }
    }
    check_transmuters("fishing");
}

function fishing_offline_progress(arg0)
{
    var add_charge_count = floor(divide_safe(sec(arg0), global.game_settings.fishing_search_spot_duration));
    o_game.data.fishing.search_charges += add_charge_count;
    o_game.data.fishing.search_charges = min(o_game.data.fishing.search_charges, get_max_fishing_spot_search_charges());
    var seconds_after_add = sec(arg0) - (add_charge_count * global.game_settings.fishing_search_spot_duration);
    seconds_after_add = max(0, seconds_after_add);
    dec_timeout_data("fishing_search_pond", seconds_after_add);
    var __array = global.fishing_tournaments_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.data.time_end = max(0, mitem.data.time_end - sec(arg0));
    }
}

function get_bait_farm_container_size()
{
    return global.game_settings.fishing_bait_farm_container_size + global.upgrade_attributes.fishing_bait_farm_container_size;
}

function get_fishing_rods_max_level()
{
    return get_bm_value(global.game_settings.fishing_rods_max_level, "fishing_rods_max_level");
}

function get_fishing_upgrade_attributes()
{
    var ua = 
    {
        upgrade_attributes: {}
    };
    var __array = global.fish_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.max_length == 0)
        {
            continue;
        }
        add_struct_to_struct(ua.upgrade_attributes, mitem.get_upgrade_attributes());
    }
    var __struct = global.fishing_tournaments;
    var __prop_names = struct_get_names(__struct);
    __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        add_struct_to_struct(ua.upgrade_attributes, mitem.get_upgrade_attributes());
    }
    return ua;
}

function get_max_fishing_spot_search_charges()
{
    var value = get_bm_value(global.game_settings.fishing_spots_search_charges, "fishing_spots_search_charges");
    return value;
}

function get_max_fishing_rods()
{
    return get_bm_value(global.game_settings.fishing_rods_max_count, "fishing_rods_max_count");
}

function get_random_fish(arg0 = undefined, arg1 = undefined)
{
    if (is_string(arg0))
    {
        arg0 = variable_struct_get(global.fish_rarity, arg0);
    }
    if (is_struct(arg0))
    {
        return array_random_item_check_func(variable_struct_get(global.fish_array_rarity, arg0.key), "can_catch", arg1);
    }
    var rarity = array_random_chance_level(global.fish_rarity_array_desc);
    if (!is_struct(rarity))
    {
        rarity = global.fish_array_rarity.common;
    }
    return get_random_fish(rarity);
}

function init_shop_fish()
{
    global.shops_prestige_levels.fish = global.prestige_levels.inf;
    var shop_resource = global.resources.fish_credits;
    global.shops.fish = 
    {
        auto_fishing: build_shop_item("auto_fishing", shop_resource, 0, 
        {
            name: __("Auto Fishing"),
            description: __("Automatically casts and reels the rod."),
            sprite: spr_rod_common,
            base_cost: 25,
            max_count: 1
        }),
        auto_fishing_reel_threshold: build_shop_item("auto_fishing_reel_threshold", shop_resource, 2, 
        {
            name: __("Auto Fishing Threshold"),
            description: __("Change the auto-fishing probability threshold."),
            sprite: spr_rod_common,
            base_cost: 250,
            max_count: 1
        }),
        fishing_auto_duration_reduction: build_shop_item("fishing_auto_duration_reduction", shop_resource, 5, 
        {
            name: __("Faster Auto Fishing"),
            sprite: spr_rod_common,
            base_cost: 50,
            cost_exp: 1.2,
            max_count: 15,
            upgrade_attributes: 
            {
                fishing_auto_duration_reduction: 1
            }
        }),
        max_fishing_spots: build_shop_item("max_fishing_spots", shop_resource, 7, 
        {
            name: __("Fishing Spots"),
            description: __("Increases the number of fishing spots."),
            sprite: spr_rod_common,
            base_cost: 25,
            cost_exp: 5,
            max_count: 3,
            upgrade_attributes: 
            {
                fishing_spots_count: 1
            }
        }),
        fishing_spots_search_charges: build_shop_item("fishing_spots_search_charges", shop_resource, 8, 
        {
            name: __("Search Charges"),
            description: __("Increases the number of search charges."),
            sprite: spr_rod_common,
            base_cost: 500,
            cost_exp: 1.5,
            max_count: 4,
            upgrade_attributes: 
            {
                fishing_spots_search_charges: 1
            }
        }),
        fishing_spots_pity_counter: build_shop_item("fishing_spots_pity_counter", shop_resource, 8, 
        {
            name: __("Pity Counter"),
            description: __("Enables pity counter for searching fishing spots. You can see the pity counter in the odds menu."),
            sprite: spr_rod_common,
            base_cost: 2000,
            max_count: 1
        }),
        fishing_min_fish_length: build_shop_item("fishing_min_fish_length", shop_resource, 10, 
        {
            name: __("Stronger Line"),
            sprite: spr_fish_aquazure,
            base_cost: 50,
            cost_exp: 1.5,
            max_count: 20,
            upgrade_attributes: 
            {
                fishing_min_fish_length: 0.1
            }
        }),
        fishing_max_fish_length: build_shop_item("fishing_max_fish_length", shop_resource, 11, 
        {
            name: __("Enhanced Line"),
            sprite: spr_fish_aquazure,
            base_cost: 75,
            cost_exp: 1.5,
            max_count: 20,
            upgrade_attributes: 
            {
                fishing_max_fish_length: 0.1
            }
        }),
        fishing_wait_duration_reduction_multiplier: build_shop_item("fishing_wait_duration_reduction_multiplier", shop_resource, 20, 
        {
            name: __("Reel Accelerator"),
            sprite: spr_rod_common,
            base_cost: 25,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                fishing_wait_duration_reduction_multiplier: 0.025
            }
        }),
        fishing_catch_credits_multiplier: build_shop_item("fishing_catch_credits_multiplier", shop_resource, 21, 
        {
            name: __("Rod Polishing"),
            sprite: spr_rod_common,
            base_cost: 25,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                fishing_catch_credits_multiplier: 0.05
            }
        }),
        fishing_rods_max_count: build_shop_item("fishing_rods_max_count", shop_resource, 100, 
        {
            name: __("Rod Slot"),
            sprite: spr_rod_common,
            base_cost: 200,
            cost_exp: 4,
            max_count: 3,
            upgrade_attributes: 
            {
                fishing_rods_max_count: 1
            }
        }),
        fishing_catch_rarity_multiplier: build_shop_item("fishing_catch_rarity_multiplier", shop_resource, 110, 
        {
            name: __("Rod Efficiency"),
            sprite: spr_rod_common,
            base_cost: 150,
            cost_exp: 2,
            max_count: 10,
            upgrade_attributes: 
            {
                fishing_catch_rarity_multiplier: 0.05
            }
        }),
        fishing_spots_rarity_multiplier: build_shop_item("fishing_spots_rarity_multiplier", shop_resource, 111, 
        {
            name: __("Fishing Goggles"),
            sprite: spr_rod_common,
            base_cost: 150,
            cost_exp: 2,
            max_count: 5,
            upgrade_attributes: 
            {
                fishing_spots_rarity_multiplier: 0.2
            }
        }),
        fishing_catch_tide_crystal_chance: build_shop_item("fishing_catch_tide_crystal_chance", shop_resource, 200, 
        {
            name: __("Enchanted Bait"),
            sprite: spr_material_tide_crystal,
            base_cost: 500,
            cost_exp: 1.25,
            max_count: 10,
            upgrade_attributes: 
            {
                fishing_catch_tide_crystal_chance: 0.001
            }
        }),
        unlock_baits: build_shop_item("unlock_baits", shop_resource, 300, 
        {
            name: __("Fish Baits"),
            description: __s("Unlocks %s", __("Fish Baits")),
            sprite: spr_bait_common,
            base_cost: 750,
            max_count: 1
        }),
        bait_farm: build_shop_item("bait_farm", shop_resource, 310, 
        {
            name: __("Bait Farm"),
            description: __s("The Bait Farm periodically produces Baits."),
            sprite: spr_bait_common,
            base_cost: 5000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_fishing_baits();
            },
            
            func: function()
            {
                add_fishing_bait_farm();
            }
        }),
        fishing_bait_farm_progress_value: build_shop_item("fishing_bait_farm_progress_value", shop_resource, 311, 
        {
            name: __("Faster Baits"),
            sprite: spr_bait_common,
            base_cost: 500,
            cost_exp: 1.3,
            max_count: 10,
            upgrade_attributes: 
            {
                fishing_bait_farm_progress_value: 0.001
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_fishing_baits_farm();
            }
        }),
        fishing_bait_farm_container_size: build_shop_item("fishing_bait_farm_container_size", shop_resource, 312, 
        {
            name: __("Container Size"),
            description: __s("Increases the container size of all bait farms."),
            sprite: spr_icon_backpack,
            base_cost: 2500,
            cost_exp: 2,
            max_count: 3,
            upgrade_attributes: 
            {
                fishing_bait_farm_container_size: 1
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_fishing_baits_farm();
            }
        }),
        fishing_bait_farm_rarity_multiplier: build_shop_item("fishing_bait_farm_rarity_multiplier", shop_resource, 320, 
        {
            name: __("Bait Efficiency"),
            sprite: spr_bait_common,
            base_cost: 500,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                fishing_bait_farm_rarity_multiplier: 1
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_fishing_baits_farm();
            }
        }),
        auto_collect_baits: build_shop_item("auto_collect_baits", shop_resource, 330, 
        {
            name: __("Auto Collect"),
            description: __s("Automatically collects baits."),
            sprite: spr_icon_bot,
            base_cost: 7500,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_fishing_baits_farm();
            }
        }),
        unlock_fishing_tournaments: build_shop_item("unlock_fishing_tournaments", shop_resource, 400, 
        {
            name: __("Fishing Tournaments"),
            description: __s("Unlocks %s", __("Fishing Tournaments")),
            sprite: spr_icon_trophy,
            base_cost: 750,
            max_count: 1
        }),
        unlock_fishing_tournaments_auto_win: build_shop_item("unlock_fishing_tournaments_auto_win", shop_resource, 401, 
        {
            name: __("Auto Win"),
            description: __s("Unlocks auto win for %s. Auto win is available after %s wins. The more wins, the lower the delay.", __("Fishing Tournaments"), number_format(global.game_settings.fishing_tournaments_auto_wins)),
            sprite: spr_icon_trophy,
            base_cost: 5000,
            max_count: 1
        })
    };
}

function refresh_fishing_spot_indexes()
{
    var __array = global.fishing_spots;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.set_index(__i + 1);
    }
}

function remove_fishing_spot(arg0)
{
    arg0.remove();
    refresh_fishing_spot_indexes();
}

function salvage_fishing_rod(arg0)
{
    global.selected_inventory_item.fishing_rod = undefined;
    variable_struct_set(global.fishing_rods_map, arg0.data.id, undefined);
    arg0.salvage();
    arg0 = undefined;
}

function unlock_fishing()
{
    global.resources.fish_credits.data.unlocked = true;
    global.resources.fish_trash.data.unlocked = true;
}
