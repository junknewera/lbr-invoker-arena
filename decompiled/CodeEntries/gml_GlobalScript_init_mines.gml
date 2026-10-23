function init_mines()
{
    global.mines = [];
    global.mine_inventory = [];
    global.mine_rarity = 
    {
        common: new Mine_Rarity(
        {
            level: 1,
            chance: 1,
            name: __("Common")
        }),
        uncommon: new Mine_Rarity(
        {
            level: 2,
            chance: 0.3,
            name: __("Uncommon"),
            color: global.rarity_colors.uncommon
        }),
        rare: new Mine_Rarity(
        {
            level: 3,
            chance: 0.1,
            name: __("Rare"),
            color: global.rarity_colors.rare
        }),
        epic: new Mine_Rarity(
        {
            level: 4,
            min_level: 5,
            chance: 0.05,
            name: __("Epic"),
            color: global.rarity_colors.epic
        }),
        mythical: new Mine_Rarity(
        {
            level: 5,
            min_level: 7,
            chance: 0.01,
            name: __("Mythical"),
            color: global.rarity_colors.mythical
        }),
        legendary: new Mine_Rarity(
        {
            level: 6,
            min_level: 9,
            chance: 0.005,
            name: __("Legendary"),
            color: global.rarity_colors.legendary
        })
    };
    global.mine_rarity_sorted = init_rarities(global.mine_rarity);
    global.mine_rarity_sorted_desc = struct_to_sorted_array_by(global.mine_rarity, "level", false);
    global.mine_vein_rarity = 
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
            chance: 0.33,
            name: __("Uncommon"),
            color: global.rarity_colors.uncommon
        }),
        rare: new Rarity(
        {
            level: 3,
            chance: 0.1,
            name: __("Rare"),
            color: global.rarity_colors.rare
        }),
        epic: new Rarity(
        {
            level: 4,
            min_level: 10,
            chance: 0.05,
            name: __("Epic"),
            color: global.rarity_colors.epic
        }),
        mythical: new Rarity(
        {
            level: 5,
            min_level: 20,
            chance: 0.01,
            name: __("Mythical"),
            color: global.rarity_colors.mythical
        }),
        legendary: new Rarity(
        {
            level: 6,
            min_level: 30,
            chance: 0.005,
            name: __("Legendary"),
            color: global.rarity_colors.legendary
        })
    };
    init_game_object_struct(global.mine_vein_rarity);
    global.mine_vein_rarity_sorted = struct_to_sorted_array_by(global.mine_vein_rarity, "level");
    global.mine_vein_rarity_sorted_desc = struct_to_sorted_array_by(global.mine_vein_rarity, "level", false);
    init_rarities(global.mine_vein_rarity_sorted);
    global.mine_cave_types = 
    {
        bar_coal: new Mine_Type(
        {
            name: global.materials.bar_coal.name,
            chance: 1,
            sprite: spr_material_coal_bar,
            min_level: 1,
            
            get_result: function(arg0, arg1, arg2)
            {
                var material = global.materials.bar_coal;
                var value = 30 * arg2;
                value = max(1, rround(value));
                var result = 
                {
                    materials: build_resource_cost(material, value)
                };
                return result;
            },
            
            tags: ["mines"]
        }),
        diamond_coal: new Mine_Type(
        {
            name: global.resources.diamond_coal.name,
            chance: 0.15,
            sprite: spr_resource_coal_diamond,
            min_level: 1,
            
            get_result: function(arg0, arg1, arg2)
            {
                var material = global.resources.diamond_coal;
                var value = arg2;
                value = max(1, rround(value));
                var result = 
                {
                    resources: build_resource_cost(material, value)
                };
                return result;
            },
            
            tags: ["mines"]
        }),
        diamond_shiny: new Mine_Type(
        {
            name: global.resources.diamond_shiny.name,
            chance: 0.05,
            sprite: spr_resource_diamond,
            min_level: 4,
            
            get_result: function(arg0, arg1, arg2)
            {
                var material = global.resources.diamond_shiny;
                var value = arg2;
                value = max(1, rround(value / 30));
                var result = 
                {
                    resources: build_resource_cost(material, value)
                };
                return result;
            },
            
            tags: ["mines"]
        }),
        coal_time_sphere: new Mine_Type(
        {
            name: global.resources.coal_time_sphere.name,
            chance: 0.01,
            sprite: global.resources.coal_time_sphere.sprite,
            
            get_result: function(arg0, arg1, arg2)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.coal_time_sphere, floor(1 + (arg1.level / 10) + (arg1.rarity.level / 2)))
                };
                return res;
            },
            
            tags: ["mines"]
        }),
        fuel: new Mine_Type(
        {
            name: global.resources.fuel.name,
            chance: 0.1,
            sprite: global.resources.fuel.sprite,
            
            get_result: function(arg0, arg1, arg2)
            {
                var value = 50 * arg2;
                value = max(1, rround(value));
                var res = 
                {
                    resources: build_resource_cost(global.resources.fuel, value)
                };
                return res;
            },
            
            tags: ["mines"],
            
            can_generate: function()
            {
                return has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill);
            }
        }),
        item: new Mine_Type(
        {
            name: __("Item"),
            chance: 0.1,
            sprite: spr_icon_question,
            min_level: 1,
            
            get_result: function(arg0, arg1, arg2)
            {
                var chance_multiplier = (arg2 - 1) / 15;
                chance_multiplier = max(0, chance_multiplier);
                var count = 1;
                var type = struct_random_chance_level(global.mine_items, undefined, arg1.level);
                var rarity = array_random_chance_level(global.mine_rarity_sorted_desc, undefined, arg1.level, undefined, undefined, undefined, 
                {
                    chance_multiplier: chance_multiplier,
                    shuffle: false
                });
                var result = 
                {
                    mine_item_rarity_type: {}
                };
                variable_struct_set(result.mine_item_rarity_type, rarity.key, {});
                variable_struct_set(variable_struct_get(result.mine_item_rarity_type, rarity.key), type.key, count);
                arg0.btn_bg_color = rarity.color;
                arg0.sprite = type.key;
                return result;
            },
            
            tags: ["mines"]
        }),
        curse: new Mine_Type(
        {
            name: __("Curse"),
            chance: 0.1,
            sprite: spr_icon_cursed_cheese,
            min_level: 1,
            
            get_result: function(arg0, arg1, arg2)
            {
                var value = get_autocollect_curses() * arg2;
                value = max(1, rround(value));
                return 
                {
                    stats: 
                    {
                        cursed_count: value
                    }
                };
            },
            
            tags: ["other"]
        }),
        borb_juice: new Mine_Type(
        {
            chance: 0.05,
            sprite: spr_flask_borb,
            
            get_result: function(arg0, arg1, arg2)
            {
                var min_value = arg2 * 200;
                var max_value = arg2 * 300;
                var value = max(1, irandom_range(min_value, max_value));
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_juice, value)
                };
            },
            
            tags: ["borbventure"]
        }),
        borb_ascension_juice: new Mine_Type(
        {
            chance: 0.02,
            sprite: spr_flask_borb_ascension_juice,
            min_level: 2,
            
            get_result: function(arg0, arg1, arg2)
            {
                var min_value = arg2 * 5;
                var max_value = arg2 * 10;
                var value = max(1, irandom_range(min_value, max_value));
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_ascension_juice, value)
                };
            },
            
            tags: ["borbventure"]
        }),
        borb_rune: new Mine_Type(
        {
            chance: 0.05,
            sprite: spr_resource_borb_rune,
            
            get_result: function(arg0, arg1, arg2)
            {
                var min_value = arg2 * 25;
                var max_value = arg2 * 50;
                var value = max(1, irandom_range(min_value, max_value));
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_rune, value)
                };
            },
            
            tags: ["borbventure"]
        }),
        borb_ascension_rune: new Mine_Type(
        {
            chance: 0.02,
            sprite: spr_resource_borb_ascension_rune,
            min_level: global.mine_rarity.epic,
            
            get_result: function(arg0, arg1, arg2)
            {
                var min_value = arg2 * 3;
                var max_value = arg2 * 6;
                var value = max(1, irandom_range(min_value, max_value));
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_ascension_rune, value)
                };
            },
            
            tags: ["borbventure"]
        }),
        borb_token: new Mine_Type(
        {
            chance: 0.05,
            sprite: spr_resource_borb_token,
            
            get_result: function(arg0, arg1, arg2)
            {
                var min_value = 100 + (arg2 * 200);
                var max_value = 100 + (arg2 * 400);
                var value = max(1, irandom_range(min_value, max_value));
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.borb_token, value)
                };
            },
            
            tags: ["borbventure"]
        }),
        dice: new Mine_Type(
        {
            chance: 0.1,
            sprite: spr_icon_die,
            multiplier_scale: 0.2,
            
            get_result: function(arg0, arg1, arg2)
            {
                var drop_value = get_dice_drop_value_min();
                var min_value = drop_value * arg2 * 0.05;
                var max_value = drop_value * arg2 * 0.08;
                var value = max(1, irandom_range(min_value, max_value));
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.dice, value)
                };
            },
            
            can_generate: function()
            {
                return is_unlocked_dice();
            },
            
            tags: ["dice"]
        }),
        power_dice: new Mine_Type(
        {
            chance: 0.05,
            sprite: spr_icon_power_die,
            
            get_result: function(arg0, arg1, arg2)
            {
                var drop_value = get_dice_drop_value_min();
                var min_value = drop_value * arg2 * 0.005;
                var max_value = drop_value * arg2 * 0.01;
                var value = max(1, irandom_range(min_value, max_value));
                value = max(1, round(value));
                return 
                {
                    resources: build_resource_cost(global.resources.power_dice, value)
                };
            },
            
            can_generate: function()
            {
                return is_unlocked_dice();
            },
            
            tags: ["dice"]
        }),
        nature_gems: new Mine_Type(
        {
            name: global.resources.nature_gems.name,
            chance: 0.02,
            min_level: 5,
            sprite: global.resources.nature_gems.sprite,
            tags: ["event"],
            
            get_result: function(arg0, arg1, arg2)
            {
                var value = min(5, rround(arg2 / 10));
                var res = 
                {
                    resources: build_resource_cost(global.resources.nature_gems, value)
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            }
        }),
        nature_time_sphere: new Mine_Type(
        {
            name: global.resources.nature_time_sphere.name,
            chance: 0.01,
            min_level: 5,
            sprite: global.resources.nature_time_sphere.sprite,
            tags: ["event"],
            
            get_result: function(arg0, arg1, arg2)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.nature_time_sphere, 1)
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            }
        }),
        magic_mulch: new Mine_Type(
        {
            name: global.resources.magic_mulch.name,
            chance: 0.05,
            min_level: 2,
            sprite: global.resources.magic_mulch.sprite,
            tags: ["event"],
            
            get_result: function(arg0, arg1, arg2)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.magic_mulch, round(10 + (arg2 * 5)))
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            }
        }),
        clover_basic3: new Mine_Type(
        {
            name: global.resources.clover_basic3.name,
            chance: 0.05,
            min_level: 2,
            sprite: global.resources.clover_basic3.sprite,
            tags: ["event"],
            
            get_result: function(arg0, arg1, arg2)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.clover_basic3, round(1 + (arg2 * 0.5)))
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            }
        }),
        clover_basic4: new Mine_Type(
        {
            name: global.resources.clover_basic4.name,
            chance: 0.02,
            min_level: 4,
            sprite: global.resources.clover_basic4.sprite,
            tags: ["event"],
            
            get_result: function(arg0, arg1, arg2)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.clover_basic4, round(1 + (arg2 * 0.1)))
                };
                return res;
            },
            
            can_generate: function()
            {
                if (!is_event_active(global.events.nature_season))
                {
                    return false;
                }
                return true;
            }
        }),
        quark_blob: new Mine_Type(
        {
            chance: 0.03,
            min_level: 1,
            sprite: global.resources.quark_blob.sprite,
            tags: ["quarks"],
            
            get_result: function(arg0, arg1, arg2)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.quark_blob, round(1 + (arg2 * 0.2)))
                };
                return res;
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks() && has_bought_shop_item_safe(global.shops.quark_structure.quark_resources_enabled_in_mines);
            }
        }),
        quark_structure: new Mine_Type(
        {
            chance: 0.02,
            min_level: 1,
            sprite: global.resources.quark_structure.sprite,
            tags: ["quarks"],
            
            get_result: function(arg0, arg1, arg2)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.quark_structure, round(1 + (arg2 * 5)))
                };
                return res;
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks() && has_bought_shop_item_safe(global.shops.quark_structure.quark_resources_enabled_in_mines);
            }
        }),
        quantum_blob: new Mine_Type(
        {
            chance: 0.01,
            min_level: 1,
            sprite: global.resources.quantum_blob.sprite,
            tags: ["quarks"],
            
            get_result: function(arg0, arg1, arg2)
            {
                var res = 
                {
                    resources: build_resource_cost(global.resources.quantum_blob, round(1 + (arg2 * 0.1)))
                };
                return res;
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks() && has_bought_shop_item_safe(global.shops.quark_structure.quark_resources_enabled_in_mines);
            }
        })
    };
    add_keys_to_struct(global.mine_cave_types);
    global.mine_cave_types_sorted = struct_to_sorted_array_key(global.mine_cave_types);
    global.mine_cave_types_length = array_length(global.mine_cave_types_sorted);
    global.mine_items = 
    {
        battle_die: new Mine_Item_Type(
        {
            name: __("Battle Die"),
            sprite: spr_icon_die_red,
            upgrade_attributes: 
            {
                dice_battlefield_damage_multiplier_mine: 0.01
            }
        }),
        blc_coin: new Mine_Item_Type(
        {
            name: __("BLC Coin"),
            sprite: spr_blc,
            upgrade_attributes: 
            {
                blc_value_multiplier_mine: 0.05
            }
        }),
        blossom: new Mine_Item_Type(
        {
            name: __("Blossom"),
            sprite: spr_plant_primula,
            upgrade_attributes: 
            {
                nature_global_upgrade_bonus_value: 0.0075
            },
            
            can_generate: function()
            {
                return is_event_active(global.events.nature_season);
            }
        }),
        blower: new Mine_Item_Type(
        {
            name: __("Leaf Blower"),
            sprite: spr_weapon_leaf_blower,
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_mine: 0.05
            }
        }),
        capacitor: new Mine_Item_Type(
        {
            name: __("Capacitor"),
            sprite: spr_resource_electrical_energy,
            upgrade_attributes: 
            {
                max_energy_storage: 50
            },
            
            can_generate: function()
            {
                return is_unlocked_energy_electrical();
            }
        }),
        cauldron: new Mine_Item_Type(
        {
            name: __("Cauldron"),
            sprite: spr_icon_alchemy,
            upgrade_attributes: 
            {
                alchemy_brew_crit_chance: 0.01
            },
            
            can_generate: function()
            {
                return is_unlocked_alchemy();
            }
        }),
        cursed_cheese: new Mine_Item_Type(
        {
            name: __("Cursed Cheese"),
            sprite: spr_icon_cursed_cheese,
            upgrade_attributes: 
            {
                cursed_autocollect: 0.3,
                cursed_autocollect_multiplier: 0.005
            }
        }),
        death_book: new Mine_Item_Type(
        {
            name: __("Death Book"),
            sprite: spr_borbventure_item_death_book,
            upgrade_attributes: 
            {
                offline_boss_kills_multiplier_mine: 0.001
            },
            can_generate: is_unlocked_death_book
        }),
        drill: new Mine_Item_Type(
        {
            name: __("Drill"),
            sprite: spr_icon_drill,
            upgrade_attributes: 
            {
                mines_drill_depth_progress_multiplier: 0.02
            }
        }),
        leaf_counter: new Mine_Item_Type(
        {
            name: __("Leaf Counter"),
            sprite: spr_icon_leaf_counter,
            upgrade_attributes: 
            {
                leaf_pub_counter_autocount: 0.1
            }
        }),
        magic_leaf: new Mine_Item_Type(
        {
            name: __("Magic Leaf"),
            sprite: spr_borbventure_item_magic_leaf,
            upgrade_attributes: 
            {
                leaf_multiplier_mine: 0.01
            }
        }),
        mlc_coin: new Mine_Item_Type(
        {
            name: __("MLC Coin"),
            sprite: spr_mlc,
            upgrade_attributes: 
            {
                mlc_value_multiplier_mine: 0.05
            }
        }),
        pickaxe: new Mine_Item_Type(
        {
            name: __("Pickaxe"),
            sprite: spr_icon_mine,
            upgrade_attributes: 
            {
                mines_mine_power_multiplier_mine: 0.02
            }
        }),
        printer: new Mine_Item_Type(
        {
            name: __("Printer"),
            sprite: spr_icon_printer,
            upgrade_attributes: 
            {
                printer_multiplier_mine: 0.01,
                printer_printer_multiplier_mine: 0.02
            }
        }),
        quark: new Mine_Item_Type(
        {
            name: __("Quark"),
            sprite: spr_icon_quark,
            upgrade_attributes: 
            {
                quark_damage_multiplier: 0.005,
                quark_reactor_add_chance_multiplier: 0.003
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks();
            }
        }),
        quark_reactor: new Mine_Item_Type(
        {
            name: __("Quark Reactor"),
            sprite: spr_icon_quark_reactor,
            upgrade_attributes: 
            {
                quark_reactor_inc_count_multiplier_mine: 0.003
            },
            
            can_generate: function()
            {
                return is_unlocked_quarks();
            }
        }),
        relic: new Mine_Item_Type(
        {
            name: __("Relic"),
            sprite: spr_relic_uncommon,
            upgrade_attributes: 
            {
                relics_base_damage_multiplier_mine: 0.05
            },
            
            can_generate: function()
            {
                return is_unlocked_relics();
            }
        }),
        seed: new Mine_Item_Type(
        {
            name: __("Seed"),
            sprite: spr_seed_leaf,
            upgrade_attributes: 
            {
                seed_value_add_global: 0.001
            }
        }),
        shard: new Mine_Item_Type(
        {
            name: __("Shard"),
            sprite: spr_resource_shards,
            upgrade_attributes: 
            {
                enemy_shards_drop_multiplier_mine: 0.005
            },
            
            can_generate: function()
            {
                return is_unlocked_shards();
            }
        }),
        soul: new Mine_Item_Type(
        {
            name: __("Soul"),
            sprite: spr_resource_soul_entity,
            upgrade_attributes: 
            {
                soul_forge_complete_count_multiplier_mine: 0.005
            },
            
            can_generate: function()
            {
                return is_unlocked_soul_crypt();
            }
        }),
        suitcase: new Mine_Item_Type(
        {
            name: __("Suitcase"),
            sprite: spr_icon_trading,
            upgrade_attributes: 
            {
                trade_resources_multiplier_mine: 0.005
            }
        }),
        trout: new Mine_Item_Type(
        {
            name: __("Trout"),
            sprite: spr_weapon_trout,
            upgrade_attributes: 
            {
                slap_multiplier_mine: 0.005
            }
        }),
        warehouse: new Mine_Item_Type(
        {
            name: __("Warehouse"),
            sprite: spr_icon_warehouse,
            upgrade_attributes: 
            {
                material_max_count: 250
            },
            
            can_generate: function()
            {
                return is_unlocked_materials();
            }
        }),
        witch: new Mine_Item_Type(
        {
            name: __("Witch"),
            sprite: spr_boss_witch,
            upgrade_attributes: 
            {
                witch_cursed_count: 0.05,
                witch_essence_count_multiplier: 0.001
            },
            
            can_generate: function()
            {
                return global.enemies.boss_witch.data.defeated > 0;
            }
        })
    };
    add_keys_to_struct(global.mine_items);
    global.mine_items_array = struct_to_sorted_array_key(global.mine_items);
    global.mine_vein_types = 
    {
        bar_coal: 
        {
            name: global.materials.bar_coal.name,
            chance: 1,
            sprite: spr_material_coal_bar,
            min_level: 1,
            
            get_result: function(arg0 = 1)
            {
                var item = global.materials.bar_coal;
                var value = 5 * arg0;
                value = max(1, rround(value));
                var result = 
                {
                    materials: build_resource_cost(item, value)
                };
                return result;
            }
        },
        diamond_coal: 
        {
            name: global.resources.diamond_coal.name,
            chance: 0.05,
            sprite: spr_resource_coal_diamond,
            min_level: 10,
            
            get_result: function(arg0)
            {
                var item = global.resources.diamond_coal;
                var value = 0.5 * arg0;
                value = max(1, rround(value));
                var result = 
                {
                    resources: build_resource_cost(item, value)
                };
                return result;
            }
        },
        diamond_shiny: 
        {
            name: global.resources.diamond_shiny.name,
            chance: 0.01,
            sprite: spr_resource_diamond,
            min_level: 15,
            
            get_result: function(arg0)
            {
                var item = global.resources.diamond_shiny;
                var value = 0.05 * arg0;
                value = max(1, rround(value));
                var result = 
                {
                    resources: build_resource_cost(item, value)
                };
                return result;
            }
        },
        fuel: 
        {
            name: global.resources.fuel.name,
            chance: 0.025,
            sprite: global.resources.fuel.sprite,
            min_level: 5,
            
            get_result: function(arg0)
            {
                var value = 2 * arg0;
                value = max(1, rround(value));
                var res = 
                {
                    resources: build_resource_cost(global.resources.fuel, value)
                };
                return res;
            },
            
            can_generate: function()
            {
                return has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill);
            }
        }
    };
    add_keys_to_struct(global.mine_vein_types);
    global.mine_vein_types_array = struct_to_array(global.mine_vein_types);
}

function add_mine_inventory_item(arg0, arg1, arg2 = 1)
{
    var type = arg0;
    if (is_string(type))
    {
        type = variable_struct_get(global.mine_items, arg0);
    }
    if (!is_struct(type))
    {
        return log("Invalid type", arg0);
    }
    var rarity = arg1;
    if (is_string(rarity))
    {
        rarity = variable_struct_get(global.mine_rarity, arg1);
    }
    if (!is_struct(rarity))
    {
        return log("Invalid rarity", arg1);
    }
    var item = get_mine_inventory_item(type.key, rarity.key);
    variable_struct_set(o_game.data.mines.types_seen, type.key, true);
    if (!is_struct(item))
    {
        var inventory_size = get_mines_inventory_size();
        item = new Mine_Item(
        {
            rarity_key: rarity.key,
            type_key: type.key
        });
        item.data.count = arg2;
        item.set_id();
        item.update_upgrade_attributes();
        if (array_length(global.mine_inventory) >= inventory_size && !global.disable_inventory_check)
        {
            item.scrap(item.data.count);
            exit;
        }
        array_push(global.mine_inventory, item);
    }
    else
    {
        item.add(arg2);
    }
    return item;
}

function add_mine_random_inventory_item(arg0 = 1, arg1 = undefined, arg2 = undefined)
{
    var type = arg1;
    if (is_string(type))
    {
        type = variable_struct_get(global.mine_items, arg1);
    }
    if (!is_struct(type))
    {
        type = struct_random_chance_level(global.mine_items);
    }
    var rarity = arg2;
    if (is_string(rarity))
    {
        rarity = variable_struct_get(global.mine_rarity, arg2);
    }
    if (!is_struct(rarity))
    {
        struct_random_chance_level(global.mine_rarity);
    }
    return add_mine_inventory_item(type, rarity, arg0);
}

function get_mine_inventory_item(arg0, arg1)
{
    var __array = global.mine_inventory;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (mitem.data.type_key == arg0 && mitem.data.rarity_key == arg1)
        {
            return mitem;
        }
    }
    return undefined;
}

function check_mines()
{
    var __array = global.mines;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.check();
    }
    var has_auto_vein_pack = has_bought_shop_item_safe(global.shops.gems.mines_auto_vein);
    if (has_auto_vein_pack)
    {
        var auto_mine = get_option(global.options.mines_auto_mine_vein);
        var auto_enhance = get_option(global.options.mines_auto_enhance_vein);
        if (auto_mine || auto_enhance)
        {
            __array = o_game.data.mines.veins;
            __prop_len = array_length(__array);
            var __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                if (auto_enhance && can_enhance_vein(mitem))
                {
                    enhance_vein(mitem);
                }
                if (auto_mine && can_mine_vein(mitem))
                {
                    mine_vein(mitem);
                }
                __i--;
            }
        }
        if (get_option(global.options.mines_auto_remove_vein))
        {
            var max_vein_mine_count = get_mine_vein_max_mine_count();
            __array = o_game.data.mines.veins;
            __prop_len = array_length(__array);
            var __i = __prop_len - 1;
            while (__i >= 0)
            {
                var mitem = __array[__i];
                var __ireal = __prop_len - 1 - __i;
                if (mitem.mine_count >= max_vein_mine_count)
                {
                    remove_vein(mitem);
                }
                __i--;
            }
        }
        if (get_option(global.options.mines_auto_search_vein) && can_search_vein())
        {
            search_vein();
        }
    }
    var auto_start_drill = get_option(global.options.mines_auto_start_drill);
    var auto_search_mine = get_option(global.options.mines_auto_search_mine);
    var max_mines = get_max_mines();
    var has_auto_cave_pack = has_bought_shop_item_safe(global.shops.gems.mines_auto_cave);
    var has_auto_mine = get_option(global.options.mines_auto_mine_cave);
    var has_auto_claim = get_option(global.options.mines_auto_claim_cave);
    var has_auto_remove = get_option(global.options.mines_auto_remove_cave);
    if (has_auto_cave_pack)
    {
        __array = global.mines;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            var removed = false;
            if (has_auto_mine && mitem.can_mine_all())
            {
                mitem.mine_all_caves();
            }
            if (has_auto_claim && mitem.get_claimable_caves_count() > 0)
            {
                mitem.claim_all_caves();
            }
            var auto_remove_count_check = array_length(global.mines) >= max_mines && can_search_mine(false) && auto_search_mine && (!mitem.is_drilling() || (mitem.is_drilling() && gdsv(mitem.data, "depleted", false)));
            if (has_auto_remove && auto_remove_count_check && mitem.data.caves_mined >= mitem.caves_count && !get_default_struct_value_data(mitem, "locked", false))
            {
                mitem.remove();
                __prop_len = array_length(__array);
            }
            else if (has_auto_cave_pack && auto_start_drill && !mitem.is_drilling())
            {
                mitem.start_drill();
            }
        }
    }
    if (has_auto_cave_pack && auto_search_mine && can_search_mine())
    {
        search_mine();
    }
    if (has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill))
    {
        mines_drill_depth_step();
        __array = global.mine_inventory;
        __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            mitem.update_upgrade_attributes();
        }
    }
    check_transmuters("mines");
}

function enhance_vein(arg0)
{
    arg0.quality = _clamp(arg0.quality + 0.2, 0.01, 1);
    dec_result(get_mine_vein_enhance_cost(arg0));
    refresh_mine_vein(arg0);
}

function generate_mine(arg0 = 1, arg1 = undefined, arg2 = false)
{
    var mine = new Mine(
    {
        level: arg0,
        rarity: arg1
    });
    if (arg2)
    {
        array_push(global.mines, mine);
    }
    return mine;
}

function get_cave_type(arg0)
{
    return variable_struct_get(global.mine_cave_types, arg0);
}

function get_max_active_caves()
{
    var value = get_bm_value(1, "mines_max_active_caves");
    return value;
}

function get_max_mines()
{
    var value = get_bm_value(2, "mines_max_mines");
    return value;
}

function get_mine_power()
{
    var value = get_bm_value(1, "mines_mine_power", "mines_mine_power_multiplier", undefined, true);
    return value;
}

function get_mines_inventory_size()
{
    var value = get_bm_value(5, "mines_inventory_size");
    return value;
}

function get_mines_min_level()
{
    var value = get_bm_value(1, "mines_min_level");
    var max_level = get_mines_max_level();
    if (max_level < value)
    {
        return max_level;
    }
    if (!get_option(global.options.mines_scale_min_level))
    {
        value = 1;
    }
    return value;
}

function get_mines_max_level()
{
    var value = get_bm_value(3, "mines_max_level");
    return value;
}

function can_search_mine(arg0 = true)
{
    if (arg0 && array_length(global.mines) >= get_max_mines())
    {
        return false;
    }
    if (!has_enough(get_search_mines_cost()))
    {
        return false;
    }
    if (has_timeout_data("mines_search_mine"))
    {
        return false;
    }
    return true;
}

function get_search_mines_cost()
{
    return 
    {
        materials: 
        {
            bar_coal: 200
        }
    };
}

function get_search_mines_timeout_duration()
{
    var value = get_bm_value(global.game_settings.mines_search_duration, "mines_search_duration_reduction", "mines_search_duration_reduction_multiplier", undefined, true, -1);
    value = sec(value);
    return value;
}

function refresh_mines_cache()
{
    var __array = global.mines;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        mitem.refresh_cache();
    }
}

function remove_mine(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var selected = struct_get_from_hash(global.selected_inventory_item, variable_get_hash("mine_remove"));
    if (is_struct(selected) && selected.data.id == arg0.data.id)
    {
        global.selected_inventory_item.mine = undefined;
        global.selected_inventory_item.mine_cave = undefined;
    }
    arg0.remove();
}

function search_mine()
{
    var level = irandom_range(get_mines_min_level(), get_mines_max_level());
    var mine = generate_mine(level, undefined, true);
    dec_result(get_search_mines_cost());
    var duration = get_search_mines_timeout_duration();
    set_timeout_data("mines_search_mine", duration);
}

function add_mine_vein()
{
    var rarity = generate_mine_vein_rarity();
    var type = generate_mine_vein_type();
    var quality = round(random_range(0.01, 1) * 100) / 100;
    var multiplier = get_mine_vein_multiplier(rarity.key, quality);
    array_push(o_game.data.mines.veins, 
    {
        id: ++o_game.data.mines.veins_id_counter,
        mine_count: 0,
        quality: quality,
        result: type.get_result(multiplier),
        rarity_key: rarity.key,
        timeout: o_game.data.stats.time_elapsed + get_mine_vein_duration(),
        type_key: type.key
    });
}

function can_enhance_vein(arg0)
{
    return arg0.quality < 1 && arg0.mine_count < get_mine_vein_max_mine_count() && has_enough(get_mine_vein_enhance_cost(arg0));
}

function can_mine_vein(arg0)
{
    if (arg0.timeout > o_game.data.stats.time_elapsed)
    {
        return false;
    }
    if (arg0.mine_count >= get_mine_vein_max_mine_count())
    {
        return false;
    }
    return true;
}

function can_search_vein()
{
    return array_length(o_game.data.mines.veins) < get_max_veins() && !has_timeout_data("mines_search_vein");
}

function generate_mine_vein_rarity()
{
    var item = array_random_chance_level(global.mine_vein_rarity_sorted_desc, undefined, o_game.data.mines.veins_level + 1, undefined, undefined, undefined, 
    {
        chance_multiplier: global.upgrade_attributes.mines_veins_rarity_multiplier,
        shuffle: false
    });
    return item;
}

function generate_mine_vein_type()
{
    var item = struct_random_chance_level(global.mine_vein_types, undefined, o_game.data.mines.veins_level + 1);
    return item;
}

function get_max_veins()
{
    return global.game_settings.mines_max_veins + global.upgrade_attributes.mines_max_veins;
}

function get_mine_vein_enhance_cost(arg0)
{
    var rarity = variable_struct_get(global.mine_vein_rarity, arg0.rarity_key);
    return 
    {
        materials: 
        {
            bar_coal: round(3 * get_mine_vein_multiplier(rarity.key, 1))
        }
    };
}

function get_mine_vein_duration()
{
    var value = get_bm_value(sec(10), undefined, "mines_veins_duration_reduction_multiplier", undefined, true, -1);
    return value;
}

function get_mine_vein_max_mine_count()
{
    var value = get_bm_value(global.game_settings.mines_max_veins_mine_count, "mines_max_veins_mine_count");
    return value;
}

function get_mine_vein_multiplier(arg0, arg1)
{
    var rarity = variable_struct_get(global.mine_vein_rarity, arg0);
    var base_value = (o_game.data.mines.veins_level + 1) * 0.75 * arg1;
    base_value *= (1 + power(rarity.level, 1.5));
    var value = get_bm_value(base_value, undefined, "mines_veins_reward_multiplier", undefined, true);
    return value;
}

function get_mine_vein_upgrade_cost()
{
    var cost;
    if (between(o_game.data.mines.veins_level, 0, 9))
    {
        cost = 
        {
            materials: 
            {
                bar_coal: rround(100 * power(o_game.data.mines.veins_level + 1, 2))
            }
        };
    }
    else if (between(o_game.data.mines.veins_level, 10, 29))
    {
        cost = 
        {
            resources: 
            {
                diamond_coal: rround(75 * power(o_game.data.mines.veins_level - 9, 2))
            }
        };
    }
    else
    {
        cost = 
        {
            resources: 
            {
                diamond_shiny: rround(50 * power(o_game.data.mines.veins_level - 29, 1.15))
            }
        };
    }
    return cost;
}

function get_mine_vein_search_duration()
{
    var value = get_bm_value(sec(60), undefined, "mines_veins_search_reduction_multiplier", undefined, true, -1);
    return value;
}

function mine_vein(arg0)
{
    arg0.mine_count++;
    arg0.timeout = o_game.data.stats.time_elapsed + get_mine_vein_duration();
    o_game.data.mines.veins_mined++;
    add_result_lite(arg0.result);
}

function refresh_mine_vein(arg0)
{
    var multiplier = get_mine_vein_multiplier(arg0.rarity_key, arg0.quality);
    var type = variable_struct_get(global.mine_vein_types, arg0.type_key);
    arg0.result = type.get_result(multiplier);
}

function remove_vein(arg0)
{
    remove_item_from_array_by_id(o_game.data.mines.veins, arg0.id);
}

function search_vein()
{
    o_game.data.mines.veins_searched++;
    set_timeout_data("mines_search_vein", get_mine_vein_search_duration());
    add_mine_vein();
}

function upgrade_mine_veins(arg0 = 1)
{
    dec_result(get_mine_vein_upgrade_cost());
    o_game.data.mines.veins_level += arg0;
    var __array = o_game.data.mines.veins;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        refresh_mine_vein(mitem);
    }
}

function is_depth_drilling()
{
    return is_unlocked_mines() && get_option(global.options.mines_depth_drill_active) && global.resources.fuel.data.count >= get_depth_drill_fuel_drain();
}

function get_depth_drill_fuel_drain(arg0 = 1)
{
    return get_bm_value(global.game_settings.mines_drill_fuel_drain, undefined, "mines_drill_depth_fuel_drain_reduction_multiplier", undefined, undefined, -1) * arg0;
}

function get_depth_drill_fuel_drain_result(arg0 = 1)
{
    return 
    {
        resources: 
        {
            fuel: get_depth_drill_fuel_drain(arg0)
        }
    };
}

function get_power_drill_cost(arg0 = 1)
{
    return 
    {
        resources: 
        {
            coal_time_sphere: arg0
        }
    };
}

function mines_drill_depth_step(arg0 = 1)
{
    if (!get_option(global.options.mines_depth_drill_active))
    {
        exit;
    }
    var fuel_drain = get_depth_drill_fuel_drain(arg0);
    if (global.resources.fuel.data.count < fuel_drain)
    {
        exit;
    }
    var inc_value = get_mines_drill_depth_inc_value();
    o_game.data.mines.drill_depth += inc_value * arg0;
    global.resources.fuel.data.count -= fuel_drain;
}

function get_mines_drill_depth_inc_value()
{
    return get_bm_value(0.01, "mines_drill_depth_progress", "mines_drill_depth_progress_multiplier", undefined, true);
}

function get_mines_upgrade_attributes()
{
    var total = o_game.data.mines.drill_depth;
    var multiplier = sqrt(total) / 3;
    var upgrade_attributes = 
    {
        upgrade_attributes: {}
    };
    var ua = upgrade_attributes.upgrade_attributes;
    var __array = global.mines_drill_ua_stages;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (total < mitem.depth)
        {
            continue;
        }
        var loop_multiplier = multiplier;
        if (get_default_struct_value(mitem, "fixed", false))
        {
            loop_multiplier = 1;
        }
        var ua_value = mitem.value * loop_multiplier;
        var value_func = get_default_struct_value(mitem, "value_func", undefined);
        if (!is_undefined(value_func))
        {
            ua_value = value_func(ua_value);
        }
        var max_value = get_default_struct_value(mitem, "max", 0);
        if (max_value > 0)
        {
            ua_value = min(ua_value, max_value);
        }
        variable_struct_set(ua, mitem.key, ua_value);
    }
    var ua_final = upgrade_attributes;
    global.cache.mines_upgrades_text = format_upgrade_text(ua_final.upgrade_attributes, undefined, undefined, undefined, "\n", undefined, undefined, true);
    return ua_final;
}

function get_mines_drill_current_stage()
{
    var __array = global.mines_drill_ua_stages;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (o_game.data.mines.drill_depth < mitem.depth)
        {
            return __i;
        }
    }
    return array_length(global.mines_drill_ua_stages);
}

function get_mines_drill_ua_stages()
{
    var stages = 
    {
        mines_veins_reward_multiplier: 
        {
            depth: 1,
            value: 0.05,
            max: 3
        },
        mines_drill_depth_progress: 
        {
            depth: 10,
            value: 0.01,
            max: 1
        },
        mines_mine_power_multiplier: 
        {
            depth: 25,
            value: 0.005,
            max: 2
        },
        mines_drill_depth_progress_multiplier: 
        {
            depth: 50,
            value: 0.001,
            max: 1
        },
        leaf_multiplier_mine: 
        {
            depth: 100,
            value: 0.005
        },
        dice_battlefield_damage_multiplier: 
        {
            depth: 250,
            value: 0.0075,
            max: 1
        },
        blower_enemy_damage_multiplier_mine: 
        {
            depth: 500,
            value: 0.005
        },
        cursed_autocollect_multiplier_mine: 
        {
            depth: 666,
            value: 0.01
        },
        mines_items_max_count: 
        {
            depth: 750,
            value: 0.01,
            value_func: ceil,
            max: 10
        },
        slap_multiplier_mine: 
        {
            depth: 1000,
            value: 0.005
        },
        craft_backpack_size: 
        {
            depth: 1500,
            value: 8,
            fixed: true
        },
        dice_cursed_reward_multiplier_mine: 
        {
            depth: 2000,
            value: 0.003,
            max: 1
        },
        dice_backpack_size: 
        {
            depth: 2500,
            value: 4,
            fixed: true
        },
        dice_battlefield_die_drop_chance: 
        {
            depth: 3000,
            value: 0.00005,
            max: 0.02
        },
        dice_inventory_size: 
        {
            depth: 3500,
            value: 1,
            fixed: true
        },
        trade_max_gems_trades_per_day: 
        {
            depth: 4000,
            value: 5,
            max: 500
        },
        soul_forge_complete_count_multiplier_mine: 
        {
            depth: 5000,
            value: 0.002
        },
        shards_max_count: 
        {
            depth: 7500,
            value: 1,
            fixed: true
        },
        quark_damage_multiplier_mine: 
        {
            depth: 10000,
            value: 0.001
        },
        max_pets: 
        {
            depth: 25000,
            value: 1,
            fixed: true
        },
        quark_reactor_inc_count_multiplier_mine: 
        {
            depth: 50000,
            value: 0.001,
            max: 1
        },
        quark_reactor_size: 
        {
            depth: 100000,
            value: 0.01,
            value_func: ceil
        },
        dice_sides: 
        {
            depth: 250000,
            value: 10,
            fixed: true
        },
        dice_dice: 
        {
            depth: 500000,
            value: 3,
            fixed: true
        },
        pet_max_upgrade_level: 
        {
            depth: 750000,
            value: 10,
            fixed: true
        },
        offline_boss_kills_multiplier_milestone: 
        {
            depth: 1000000,
            value: 0.001,
            max: 1
        },
        leafscender_decrease_input_cost: 
        {
            depth: 1250000,
            value: 0.001,
            value_func: ceil,
            max: 5
        }
    };
    add_keys_to_struct(stages);
    var stages_array = struct_to_sorted_array_by(stages, "depth", true);
    return stages_array;
}

function get_mines_free_refuel_result()
{
    var time = get_bm_value(60, undefined, "mines_drill_free_refuel_multiplier", undefined, true);
    var cost = 
    {
        resources: 
        {
            fuel: global.game_settings.mines_drill_fuel_drain * time
        }
    };
    return cost;
}
