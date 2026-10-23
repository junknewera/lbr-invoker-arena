function init_harbor()
{
    global.harbor_route_types = 
    {
        regular: new Harbor_Route_Type(
        {
            name: __("Regular")
        }),
        fast: new Harbor_Route_Type(
        {
            name: __("Fast"),
            chance: 0.3,
            fuel_multiplier: 2,
            upgrade_attributes: 
            {
                harbor_ship_delivery_speed: 0.5,
                harbor_ship_reward_multiplier: -0.4
            }
        }),
        holy: new Harbor_Route_Type(
        {
            name: __("Holy"),
            chance: 0.05,
            upgrade_attributes: 
            {
                harbor_ship_delivery_speed: 0.25,
                harbor_ship_reward_multiplier: 2
            }
        }),
        luxury: new Harbor_Route_Type(
        {
            name: __("Luxury"),
            chance: 0.3,
            fuel_multiplier: 2,
            xp_multiplier: 2,
            upgrade_attributes: 
            {
                harbor_ship_delivery_speed: -0.3,
                harbor_ship_reward_multiplier: 1
            }
        }),
        slow: new Harbor_Route_Type(
        {
            name: __("Slow"),
            chance: 0.3,
            fuel_multiplier: 0.5,
            upgrade_attributes: 
            {
                harbor_ship_delivery_speed: -0.5
            }
        }),
        stormy: new Harbor_Route_Type(
        {
            name: __("Stormy"),
            chance: 0.1,
            fuel_multiplier: 2,
            xp_multiplier: 5,
            upgrade_attributes: 
            {
                harbor_ship_delivery_speed: -0.3
            }
        })
    };
    init_game_object_struct(global.harbor_route_types);
    global.harbor_route_types_array = struct_to_array(global.harbor_route_types);
    global.harbor_route_types_special_array = array_filter(global.harbor_route_types_array, function(arg0, arg1)
    {
        return arg0.key != "regular";
    });
    global.harbor_route_types_array_sorted = [];
    global.harbor_route_types_special_array_sorted = [];
    array_copy(global.harbor_route_types_array_sorted, 0, global.harbor_route_types_array, 0, array_length(global.harbor_route_types_array));
    array_copy(global.harbor_route_types_special_array_sorted, 0, global.harbor_route_types_special_array, 0, array_length(global.harbor_route_types_special_array));
    sort_array_by(global.harbor_route_types_array_sorted, "chance");
    sort_array_by(global.harbor_route_types_special_array_sorted, "chance");
    global.harbor_item_rarity = 
    {
        common: new Rarity(
        {
            name: __("Common"),
            level: 1,
            chance: 1
        }),
        uncommon: new Rarity(
        {
            name: __("Uncommon"),
            level: 2,
            chance: 0.5
        }),
        rare: new Rarity(
        {
            name: __("Rare"),
            level: 3,
            chance: 0.25
        }),
        epic: new Rarity(
        {
            name: __("Epic"),
            level: 4,
            chance: 0.1
        }),
        mythical: new Rarity(
        {
            name: __("Mythical"),
            level: 5,
            chance: 0.05
        }),
        legendary: new Rarity(
        {
            name: __("Legendary"),
            level: 6,
            chance: 0.01
        })
    };
    global.harbor_item_rarity_sorted = init_rarities(global.harbor_item_rarity);
    global.harbor_item_types = 
    {
        battle_die: new Type_Object(
        {
            name: __("Battle Die"),
            sprite: spr_icon_die_red,
            upgrade_attributes: 
            {
                dice_battlefield_damage_multiplier_harbor: 0.4
            },
            
            can_generate: function()
            {
                return is_unlocked_dice();
            }
        }),
        blossom: new Type_Object(
        {
            name: __("Blossom"),
            sprite: spr_plant_primula,
            upgrade_attributes: 
            {
                nature_global_upgrade_bonus_value: 0.01
            }
        }),
        blower: new Type_Object(
        {
            name: __("Blower"),
            sprite: spr_weapon_leaf_blower,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_harbor: 0.6
            }
        }),
        borb: new Type_Object(
        {
            name: __("Borb"),
            sprite: spr_borb_cool,
            upgrade_attributes: 
            {
                borbventure_increase_reward: 0.04
            },
            
            can_generate: function()
            {
                return is_unlocked_borbventure();
            }
        }),
        candle: new Type_Object(
        {
            name: __("Candle"),
            sprite: spr_icon_candle2,
            upgrade_attributes: 
            {
                candle_attack_damage: 0.075
            }
        }),
        capacitor: new Type_Object(
        {
            name: __("Capacitor"),
            sprite: spr_resource_electrical_energy,
            upgrade_attributes: 
            {
                max_energy_storage: 1000
            },
            
            can_generate: function()
            {
                return is_unlocked_energy_electrical();
            }
        }),
        cauldron: new Type_Object(
        {
            name: __("Cauldron"),
            sprite: spr_icon_alchemy,
            upgrade_attributes: 
            {
                alchemy_brew_crit_chance: 0.02
            },
            
            can_generate: function()
            {
                return is_unlocked_alchemy();
            }
        }),
        cursed_die: new Type_Object(
        {
            name: __("Cursed Die"),
            sprite: spr_icon_cursed_die,
            upgrade_attributes: 
            {
                dice_cursed_critical_chance: 0.1,
                dice_cursed_critical_multiplier: 0.02
            },
            
            can_generate: function()
            {
                return is_unlocked_dice();
            }
        }),
        drill: new Type_Object(
        {
            name: __("Drill"),
            sprite: spr_icon_drill,
            upgrade_attributes: 
            {
                mines_drill_depth_progress_multiplier_harbor: 0.015
            },
            
            can_generate: function()
            {
                return is_unlocked_mines();
            }
        }),
        fishing_rod: new Type_Object(
        {
            name: __("Fishing Rod"),
            sprite: spr_rod_legendary,
            upgrade_attributes: 
            {
                fishing_catch_credits_multiplier_harbor: 0.05
            },
            
            can_generate: function()
            {
                return is_unlocked_fishing();
            }
        }),
        leaf_counter: new Type_Object(
        {
            name: __("Leaf Counter"),
            sprite: spr_icon_leaf_counter,
            upgrade_attributes: 
            {
                leaf_pub_counter_autocount: 0.2
            }
        }),
        magic_leaf: new Type_Object(
        {
            name: __("Magic Leaf"),
            sprite: spr_borbventure_item_magic_leaf,
            upgrade_attributes: 
            {
                leaf_multiplier_harbor: 0.2
            }
        }),
        pickaxe: new Type_Object(
        {
            name: __("Pickaxe"),
            sprite: spr_icon_mine,
            upgrade_attributes: 
            {
                mines_mine_power_multiplier_harbor: 0.1
            },
            
            can_generate: function()
            {
                return is_unlocked_mines();
            }
        }),
        printer: new Type_Object(
        {
            name: __("Printer"),
            sprite: spr_icon_printer,
            upgrade_attributes: 
            {
                printer_multiplier_harbor: 0.2,
                printer_printer_multiplier_harbor: 0.4
            }
        }),
        quark: new Type_Object(
        {
            name: __("Quark"),
            sprite: spr_icon_quark,
            upgrade_attributes: 
            {
                quark_damage_multiplier_harbor: 0.1,
                quark_reactor_add_chance_multiplier: 0.06
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks();
            }
        }),
        quark_reactor: new Type_Object(
        {
            name: __("Quark Reactor"),
            sprite: spr_icon_quark_reactor,
            upgrade_attributes: 
            {
                quark_reactor_inc_count_multiplier_harbor: 0.06
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks();
            }
        }),
        relic: new Type_Object(
        {
            name: __("Relic"),
            sprite: spr_relic_uncommon,
            upgrade_attributes: 
            {
                relics_base_damage_multiplier_harbor: 1
            },
            
            can_generate: function()
            {
                return is_unlocked_relics();
            }
        }),
        shadow_health: new Type_Object(
        {
            name: __("Shadow Health"),
            sprite: spr_icon_heart_purple,
            upgrade_attributes: 
            {
                shadow_crystal_player_hp: 2,
                shadow_crystal_player_hp_multiplier_shadow: 0.02,
                shadow_crystal_player_rest_hp_value_multiplier: 0.02
            },
            
            can_generate: function()
            {
                return is_unlocked_shadow_crystal();
            }
        }),
        shadow_strength: new Type_Object(
        {
            name: __("Shadow Strength"),
            sprite: spr_icon_strength_shadow,
            upgrade_attributes: 
            {
                shadow_crystal_attack_damage: 2,
                shadow_crystal_attack_damage_multiplier: 0.01
            },
            
            can_generate: function()
            {
                return is_unlocked_shadow_crystal();
            }
        }),
        soul: new Type_Object(
        {
            name: __("Soul"),
            sprite: spr_resource_soul_entity,
            upgrade_attributes: 
            {
                soul_forge_complete_count_multiplier_harbor: 0.1
            },
            
            can_generate: function()
            {
                return is_unlocked_soul_crypt();
            }
        }),
        trout: new Type_Object(
        {
            name: __("Trout"),
            sprite: spr_weapon_trout,
            upgrade_attributes: 
            {
                slap_multiplier_harbor: 0.5
            }
        }),
        witch: new Type_Object(
        {
            name: __("Witch"),
            sprite: spr_boss_witch,
            upgrade_attributes: 
            {
                witch_cursed_count: 3,
                witch_essence_count_multiplier: 0.2
            },
            
            can_generate: function()
            {
                return global.enemies.boss_witch.data.defeated > 0;
            }
        }),
        ulc: new Type_Object(
        {
            name: __("ULC Coin"),
            sprite: spr_ulc,
            upgrade_attributes: 
            {
                ulc_value_multiplier_harbor: 0.02
            },
            
            can_generate: function()
            {
                return is_unlocked_ulc();
            }
        }),
        warehouse: new Type_Object(
        {
            name: __("Warehouse"),
            sprite: spr_material_copper_bar,
            upgrade_attributes: 
            {
                material_max_count: 500
            },
            
            can_generate: function()
            {
                return is_unlocked_materials();
            }
        }),
        diver: new Type_Object(
        {
            name: __("Diver"),
            sprite: spr_icon_diver,
            upgrade_attributes: 
            {
                harbor_diver_find_water_crystal_chance: 0.001
            },
            
            can_generate: function()
            {
                return is_unlocked_harbor_diver();
            }
        }),
        engineer: new Type_Object(
        {
            name: __("Engineer"),
            sprite: spr_icon_engineer,
            upgrade_attributes: 
            {
                harbor_jobs_reward_multiplier: 0.015
            }
        }),
        logistician: new Type_Object(
        {
            name: __("Logistician"),
            sprite: spr_icon_logistician,
            upgrade_attributes: 
            {
                harbor_container_leaf_adder: 0.01
            }
        }),
        pusher: new Type_Object(
        {
            name: __("Pusher"),
            sprite: spr_icon_pusher,
            upgrade_attributes: 
            {
                harbor_container_auto_add_count: 0.015
            }
        })
    };
    add_keys_to_struct(global.harbor_item_types);
    global.harbor_item_types_sorted = struct_to_sorted_array_key(global.harbor_item_types);
    var __struct = global.harbor_item_types;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.cache_upgrades_array = global.harbor_item_rarity_sorted;
    }
    global.harbor_inventory = new Inventory(
    {
        game_data_key: "harbor",
        has_backpack: true,
        backpack_size: 12,
        inventory_size: 12,
        item_types: global.harbor_item_types,
        rarity_types: global.harbor_item_rarity,
        ua_id: "harbor_inventory",
        ua_section: "harbor"
    });
    var __array = global.harbor_item_rarity_sorted;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.upgrade_multiplier = max(1, power(1.6, mitem.level - 1));
    }
    global.harbor_job_types = 
    {
        water_crystal: new Harbor_Job_Type(
        {
            chance: 1,
            input_count: 20,
            output: 
            {
                resources: 
                {
                    water_crystal: 1
                }
            }
        }),
        ship_fuel: new Harbor_Job_Type(
        {
            chance: 1,
            input_count: 300,
            output: 
            {
                resources: 
                {
                    ship_fuel: 1
                }
            },
            can_generate: is_unlocked_harbor_ships
        }),
        common_item: new Harbor_Job_Type(
        {
            chance: 1,
            input_count: 500,
            output: 
            {
                harbor_items_rarity: 
                {
                    common: 1
                }
            },
            can_generate: is_unlocked_harbor_ships
        }),
        uncommon_item: new Harbor_Job_Type(
        {
            chance: 0.4,
            input_count: 1000,
            output: 
            {
                harbor_items_rarity: 
                {
                    uncommon: 1
                }
            },
            can_generate: is_unlocked_harbor_ships
        }),
        rare_item: new Harbor_Job_Type(
        {
            chance: 0.2,
            input_count: 2500,
            output: 
            {
                harbor_items_rarity: 
                {
                    rare: 1
                }
            },
            can_generate: is_unlocked_harbor_ships
        }),
        epic_item: new Harbor_Job_Type(
        {
            chance: 0.1,
            input_count: 5000,
            output: 
            {
                harbor_items_rarity: 
                {
                    epic: 1
                }
            },
            can_generate: is_unlocked_harbor_ships
        }),
        mythical_item: new Harbor_Job_Type(
        {
            chance: 0.05,
            input_count: 10000,
            output: 
            {
                harbor_items_rarity: 
                {
                    mythical: 1
                }
            },
            can_generate: is_unlocked_harbor_ships
        }),
        legendary_item: new Harbor_Job_Type(
        {
            chance: 0.01,
            input_count: 20000,
            output: 
            {
                harbor_items_rarity: 
                {
                    legendary: 1
                }
            },
            can_generate: is_unlocked_harbor_ships
        })
    };
    add_keys_to_struct(global.harbor_job_types);
    global.harbor_job_types_array = struct_to_array(global.harbor_job_types);
    global.harbor_job_types_array_sorted = struct_to_sorted_array_by(global.harbor_job_types, "chance");
    var generators = 
    {
        ship_fuel: new Harbor_Generator({})
    };
    global.harbor = 
    {
        container: new Harbor_Container(),
        generators: generators,
        jobs: [],
        ships: []
    };
    global.harbor_ships_delivery = {};
}

function init_harbor_late()
{
    if (array_length(global.harbor.jobs) == 0)
    {
        refresh_harbor_jobs();
    }
    if (array_length(global.harbor.ships) == 0)
    {
        array_push(global.harbor.ships, new Harbor_Ship());
    }
    call_struct(global.harbor_item_types, "_init");
}

function add_harbor_container()
{
    var container = new Harbor_Container();
    container.index = array_length(global.harbor.containers);
    array_push(global.harbor.containers, container);
    return container;
}

function add_harbor_generator()
{
    var item = new Harbor_Generator();
    item.index = array_length(global.harbor.generators);
    array_push(global.harbor.generators, item);
    return item;
}

function add_harbor_packer()
{
    var packer = new Harbor_Packer();
    packer.index = array_length(global.harbor.packer);
    array_push(global.harbor.packer, packer);
    return packer;
}

function add_harbor_ship(arg0 = undefined)
{
    var ship = new Harbor_Ship();
    if (is_struct(arg0))
    {
        ship.load_data(arg0);
    }
    ship.index = array_length(global.harbor.ships);
    array_push(global.harbor.ships, ship);
    return ship;
}

function check_harbor()
{
    if (!is_unlocked_harbor())
    {
        exit;
    }
    global.harbor.container.check();
    var has_auto_add_job_leaves = has_bought_shop_item_safe(global.shops.harbor.harbor_container_auto_add_job_leaves) && get_option(global.options.harbor_container_auto_add_job_leaves);
    var has_auto_start_job = has_bought_shop_item_safe(global.shops.harbor.harbor_jobs_auto_start) && get_option(global.options.harbor_jobs_auto_start);
    var has_auto_claim_job = has_bought_shop_item_safe(global.shops.harbor.harbor_jobs_auto_claim) && get_option(global.options.harbor_jobs_auto_claim);
    if (has_auto_add_job_leaves || has_auto_start_job || has_auto_claim_job)
    {
        var __array = global.harbor.jobs;
        var __prop_len = array_length(__array);
        var __i = __prop_len - 1;
        while (__i >= 0)
        {
            var mitem = __array[__i];
            var __ireal = __prop_len - 1 - __i;
            if (has_auto_add_job_leaves)
            {
                mitem.check_auto_add();
            }
            if (has_auto_start_job)
            {
                mitem.check_auto_start();
            }
            if (has_auto_claim_job && mitem.can_claim())
            {
                mitem.claim();
            }
            __i--;
        }
    }
    if (has_bought_shop_item_safe(global.shops.harbor.harbor_jobs_auto_refresh) && get_option(global.options.harbor_jobs_auto_refresh))
    {
        if (array_length(global.harbor.jobs) == 0 && can_refresh_harbor_jobs())
        {
            refresh_harbor_jobs();
        }
    }
    if (o_game.data.stats.time_elapsed >= o_game.data.harbor.job_refresh_time_end)
    {
        if (o_game.data.harbor.job_refresh_count < get_max_harbor_refresh_count())
        {
            o_game.data.harbor.job_refresh_count++;
        }
        set_harbor_jobs_timeout();
    }
    call_struct(global.harbor_ships_delivery, "check");
    var has_auto_embark = has_bought_shop_item_safe(global.shops.harbor.harbor_ships_auto_embark) && get_option(global.options.harbor_ships_auto_embark);
    var has_auto_claim = has_bought_shop_item_safe(global.shops.harbor.harbor_ships_auto_claim) && get_option(global.options.harbor_ships_auto_claim);
    if (has_auto_embark || has_auto_claim)
    {
        var __array = global.harbor.ships;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (has_auto_embark)
            {
                var selected_route_index = mitem.data.route_index;
                if (mitem.data.route_index > -1 && mitem.can_embark())
                {
                    mitem.embark();
                }
                else
                {
                    var embarked = false;
                    var __array2 = mitem.data.routes;
                    var __prop_len2 = array_length(__array2);
                    for (var __i2 = 0; __i2 < __prop_len2; __i2++)
                    {
                        var mitem2 = __array2[__i2];
                        mitem.select_route(__i2);
                        if (mitem.can_embark())
                        {
                            mitem.embark();
                            embarked = true;
                            break;
                        }
                    }
                    if (!embarked)
                    {
                        mitem.select_route(selected_route_index);
                    }
                }
            }
            if (has_auto_claim && mitem.can_claim())
            {
                mitem.claim();
            }
        }
    }
    if (is_unlocked_harbor_diver())
    {
        var mine_chance = get_diver_find_water_crystal_chance();
        if (percent_chance(mine_chance * 100))
        {
            var add_count = get_diver_find_water_crystal_count();
            var diver_result = 
            {
                resources: 
                {
                    water_crystal: add_count
                }
            };
            add_struct_to_struct(o_game.data.harbor.diver_result, diver_result);
        }
    }
}

function get_diver_find_water_crystal_chance()
{
    return global.game_settings.harbor_diver_find_water_crystal_chance + global.upgrade_attributes.harbor_diver_find_water_crystal_chance;
}

function get_diver_find_water_crystal_count()
{
    return global.game_settings.harbor_diver_find_water_crystal_count + global.upgrade_attributes.harbor_diver_find_water_crystal_count;
}

function get_harbor_container_max_storage()
{
    return get_cache("harbor_container_max_storage", global.game_settings.harbor_container_max_storage);
}

function get_harbor_roles_max_count()
{
    return get_cache("harbor_roles_max_count", global.game_settings.harbor_roles_max_count);
}

function get_harbor_ships_max_count()
{
    return get_cache("harbor_ships_max_count", global.game_settings.harbor_ships_max_count);
}

function get_harbor_upgrade_attributes(arg0 = true)
{
    var ua = 
    {
        upgrade_attributes: {}
    };
    if (is_unlocked_harbor_ships())
    {
        add_struct_to_struct(ua.upgrade_attributes, global.harbor_inventory.get_upgrade_attributes(arg0));
    }
    return ua;
}

function init_shop_harbor()
{
    var shop_resource = global.resources.water_crystal;
    global.shops_prestige_levels.harbor = global.prestige_levels.inf;
    global.shops.harbor = 
    {
        fertilizer: build_shop_item("fertilizer", shop_resource, -20, 
        {
            base_cost: 5,
            cost_exp: 1.5,
            disable_auto_upgrade: true,
            max_count: 10,
            resource: global.resources.water,
            value: 5
        }),
        harbor_albs: build_shop_item("harbor_albs", shop_resource, -10, 
        {
            name: __("Harborblowers"),
            description: __s("Autoblowers can spawn in %s.", __s("Industrial Harbor")),
            sprite: spr_autoblower,
            base_cost: 20,
            max_count: 1,
            
            after_apply_ua: function()
            {
                if (o_game.area.key == "industrial_harbor")
                {
                    create_autoblowers();
                }
            }
        }),
        harbor_container_leaf_adder: build_shop_item("harbor_container_leaf_adder", shop_resource, 0, 
        {
            name: __s("Container Density"),
            sprite: spr_icon_container,
            base_cost: 15,
            cost_exp: 3,
            max_count: 0,
            upgrade_attributes: 
            {
                harbor_container_leaf_adder: 1
            }
        }),
        harbor_container_leaf_multiplier: build_shop_item("harbor_container_leaf_multiplier", shop_resource, 1, 
        {
            name: __s("Container Efficiency"),
            sprite: spr_icon_container,
            base_cost: 15,
            cost_exp: 2,
            max_count: 0,
            upgrade_attributes: 
            {
                harbor_container_leaf_multiplier: 0.25
            }
        }),
        harbor_container_max_storage: build_shop_item("harbor_container_max_storage", shop_resource, 2, 
        {
            name: __s("Container Capacity"),
            sprite: spr_icon_container,
            base_cost: 15,
            cost_exp: 1.4,
            max_count: 50,
            refresh_ua: true,
            upgrade_attributes: 
            {
                harbor_container_max_storage: 100
            }
        }),
        harbor_container_max_count: build_shop_item("harbor_container_max_count", shop_resource, 3, 
        {
            name: __s("Extra Container"),
            sprite: spr_icon_container,
            base_cost: 100,
            cost_exp: 2.5,
            max_count: 4,
            upgrade_attributes: 
            {
                harbor_container_max_count: 1
            },
            
            func: function()
            {
                if (!instance_exists(o_harbor))
                {
                    exit;
                }
                init_game_vars(true);
                o_harbor.init();
            }
        }),
        harbor_container_auto_add_count: build_shop_item("harbor_container_auto_add_count", shop_resource, 10, 
        {
            name: __s("Hire Pusher"),
            description_locked: __s("Unlock through %s", global.journeys.harbor.name),
            sprite: spr_icon_pusher,
            base_cost: 75,
            cost_exp: 3.5,
            max_count: 10,
            refresh_ua: true,
            upgrade_attributes: 
            {
                harbor_container_auto_add_count: 0.2
            },
            
            is_obfuscated: function()
            {
                return global.journeys.harbor.data.finished <= 0 && global.journeys.harbor.data.level < 9;
            }
        }),
        harbor_jobs_max_count: build_shop_item("harbor_jobs_max_count", shop_resource, 100, 
        {
            name: __s("More Delivery Jobs"),
            sprite: spr_icon_truck,
            base_cost: 25,
            cost_exp: 3,
            max_count: 3,
            upgrade_attributes: 
            {
                harbor_jobs_max_count: 1
            }
        }),
        harbor_jobs_reward_multiplier: build_shop_item("harbor_jobs_reward_multiplier", shop_resource, 100, 
        {
            name: __s("Better Trucks"),
            sprite: spr_icon_truck,
            base_cost: 30,
            cost_exp: 1.5,
            max_count: 5,
            upgrade_attributes: 
            {
                harbor_jobs_reward_multiplier: 0.2
            }
        }),
        harbor_jobs_duration_multiplier: build_shop_item("harbor_jobs_duration_multiplier", shop_resource, 110, 
        {
            name: __s("Faster Trucks"),
            sprite: spr_icon_truck,
            base_cost: 15,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                harbor_jobs_duration_multiplier: 0.05
            }
        }),
        harbor_jobs_refresh_max_count: build_shop_item("harbor_jobs_refresh_max_count", shop_resource, 110, 
        {
            name: __s("Refresh Storage"),
            sprite: spr_icon_truck,
            base_cost: 15,
            cost_exp: 1.5,
            max_count: 9,
            upgrade_attributes: 
            {
                harbor_jobs_refresh_max_count: 1
            }
        }),
        harbor_container_auto_add_job_leaves: build_shop_item("harbor_container_auto_add_job_leaves", shop_resource, 120, 
        {
            name: __("Auto add job leaves"),
            description: __s("Automatically add leaves to harbor jobs from the container."),
            sprite: spr_icon_truck,
            base_cost: 150,
            max_count: 1
        }),
        harbor_jobs_auto_start: build_shop_item("harbor_jobs_auto_start", shop_resource, 121, 
        {
            name: __("Auto start delivery"),
            description: __s("Automatically start harbor delivery jobs when possible."),
            sprite: spr_icon_truck,
            base_cost: 300,
            max_count: 1
        }),
        harbor_jobs_auto_claim: build_shop_item("harbor_jobs_auto_claim", shop_resource, 122, 
        {
            name: __("Auto claim delivery"),
            description: __s("Automatically claim harbor delivery jobs when finished."),
            sprite: spr_icon_truck,
            base_cost: 100000,
            max_count: 1
        }),
        harbor_jobs_auto_refresh: build_shop_item("harbor_jobs_auto_refresh", shop_resource, 123, 
        {
            name: __("Auto refresh jobs"),
            description: __s("Automatically refresh harbor jobs if no jobs are available."),
            sprite: spr_icon_truck,
            base_cost: 75000,
            max_count: 1
        }),
        unlock_harbor_diver: build_shop_item("unlock_harbor_diver", shop_resource, 150, 
        {
            name: __s("Unlock Diver"),
            description: __s("The Diver collects %s while exploring underwater.", global.resources.water_crystal.name_plural),
            sprite: spr_icon_diver,
            base_cost: 200,
            max_count: 1
        }),
        harbor_diver_find_water_crystal_chance: build_shop_item("harbor_diver_find_water_crystal_chance", shop_resource, 151, 
        {
            name: __s("Diving Goggles"),
            sprite: spr_icon_diver,
            base_cost: 125,
            cost_exp: 1.75,
            max_count: 20,
            upgrade_attributes: 
            {
                harbor_diver_find_water_crystal_chance: 0.001
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_diver();
            }
        }),
        harbor_diver_find_water_crystal_count: build_shop_item("harbor_diver_find_water_crystal_count", shop_resource, 152, 
        {
            name: __s("Improved Lungs"),
            sprite: spr_icon_diver,
            base_cost: 175,
            cost_exp: 1.8,
            max_count: 50,
            upgrade_attributes: 
            {
                harbor_diver_find_water_crystal_count: 1
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_diver();
            }
        }),
        unlock_harbor_ships: build_shop_item("unlock_harbor_ships", shop_resource, 200, 
        {
            name: __s("Unlock Ships"),
            description: __s("Unlock ships to get %s and journey XP. You may also find valuable items.", global.resources.water_crystal.name_plural),
            sprite: spr_icon_ship,
            base_cost: 300,
            max_count: 1
        }),
        harbor_ship_delivery_speed: build_shop_item("harbor_ship_delivery_speed", shop_resource, 210, 
        {
            name: __s("Bigger Sails"),
            sprite: spr_icon_ship,
            base_cost: 60,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                harbor_ship_speed_multiplier: 0.1
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_ship_reward_multiplier: build_shop_item("harbor_ship_reward_multiplier", shop_resource, 220, 
        {
            name: __s("Ship Rewards"),
            sprite: spr_icon_ship,
            base_cost: 75,
            cost_exp: 1.9,
            max_count: 50,
            upgrade_attributes: 
            {
                harbor_ship_reward_multiplier: 0.2
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_ship_fuel_efficiency: build_shop_item("harbor_ship_fuel_efficiency", shop_resource, 230, 
        {
            name: __s("Fuel Efficiency"),
            sprite: spr_icon_ship,
            base_cost: 60,
            cost_exp: 1.7,
            max_count: 10,
            upgrade_attributes: 
            {
                harbor_ship_fuel_efficiency: 0.05
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            },
            
            func: function()
            {
                var __array = global.harbor.ships;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    mitem.refresh_route_fuel();
                }
            }
        }),
        harbor_special_route_chance: build_shop_item("harbor_special_route_chance", shop_resource, 240, 
        {
            name: __s("Special Routes"),
            sprite: spr_icon_ship,
            base_cost: 90,
            cost_exp: 1.8,
            max_count: 10,
            upgrade_attributes: 
            {
                harbor_special_route_chance: 0.1
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_ship_count: build_shop_item("harbor_ship_count", shop_resource, 250, 
        {
            name: __s("Extra Ship"),
            sprite: spr_icon_ship,
            base_cost: 150,
            cost_exp: 4,
            max_count: 4,
            upgrade_attributes: 
            {
                harbor_ship_count: 1
            },
            
            func: function(arg0 = undefined, arg1 = 1)
            {
                repeat (arg1)
                {
                    add_harbor_ship();
                }
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_ship_xp_multiplier: build_shop_item("harbor_ship_xp_multiplier", shop_resource, 260, 
        {
            name: __s("Ship Bearings"),
            sprite: spr_icon_ship,
            base_cost: 60,
            cost_exp: 1.7,
            max_count: 50,
            upgrade_attributes: 
            {
                harbor_ship_xp_multiplier: 0.2
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_inventory_inventory_size: build_shop_item("harbor_inventory_inventory_size", shop_resource, 300, 
        {
            name: __s("Inventory Size"),
            sprite: spr_icon_backpack,
            base_cost: 25,
            cost_exp: 1.2,
            max_count: 30,
            upgrade_attributes: 
            {
                harbor_inventory_inventory_size: 1
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_backpack_inventory_size: build_shop_item("harbor_backpack_inventory_size", shop_resource, 301, 
        {
            name: __s("Backpack Size"),
            sprite: spr_icon_backpack,
            base_cost: 10,
            cost_exp: 1.1,
            max_count: 150,
            upgrade_attributes: 
            {
                harbor_inventory_backpack_size: 1
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_ships_auto_embark: build_shop_item("harbor_ships_auto_embark", shop_resource, 302, 
        {
            name: __("Auto embark ship"),
            description: __s("Automatically embark ships when ready to sail."),
            sprite: spr_icon_ship,
            base_cost: 1000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        }),
        harbor_ships_auto_claim: build_shop_item("harbor_ships_auto_claim", shop_resource, 303, 
        {
            name: __("Auto claim ship"),
            description: __s("Automatically claim ship rewards when they return."),
            sprite: spr_icon_ship,
            base_cost: 50000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor_ships();
            }
        })
    };
}

function can_refresh_harbor_jobs()
{
    return o_game.data.harbor.job_refresh_count >= 1;
}

function get_max_harbor_jobs()
{
    return global.game_settings.harbor_jobs_max_count + global.upgrade_attributes.harbor_jobs_max_count;
}

function get_max_harbor_refresh_count()
{
    return global.game_settings.harbor_jobs_refresh_max_count + global.upgrade_attributes.harbor_jobs_refresh_max_count;
}

function add_harbor_job(arg0 = undefined, arg1 = undefined)
{
    var job = new Harbor_Job(arg0);
    job.load_data(arg1);
    array_push(global.harbor.jobs, job);
    return job;
}

function get_harbor_jobs_timeout_duration()
{
    var duration = global.game_settings.harbor_jobs_refresh_duration;
    return duration;
}

function refresh_harbor_jobs()
{
    var __array = global.harbor.jobs;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (mitem.data.started)
        {
        }
        else if (mitem.data.locked)
        {
        }
        else
        {
            global.harbor.container.add(mitem.data.count);
            array_delete(global.harbor.jobs, __i, 1);
        }
        __i--;
    }
    if (o_game.data.harbor.job_refresh_count >= get_max_harbor_refresh_count())
    {
        set_harbor_jobs_timeout();
    }
    o_game.data.harbor.job_refresh_count = max(0, o_game.data.harbor.job_refresh_count - 1);
    var max_jobs = get_max_harbor_jobs();
    var add_jobs_count = max(0, max_jobs - array_length(global.harbor.jobs));
    repeat (add_jobs_count)
    {
        add_harbor_job();
    }
}

function set_harbor_jobs_timeout()
{
    var duration = get_harbor_jobs_timeout_duration();
    o_game.data.harbor.job_refresh_time_end = o_game.data.stats.time_elapsed + duration;
}

function unlock_harbor()
{
    global.resources.water_crystal.data.unlocked = true;
    global.resources.ship_fuel.data.unlocked = true;
}
