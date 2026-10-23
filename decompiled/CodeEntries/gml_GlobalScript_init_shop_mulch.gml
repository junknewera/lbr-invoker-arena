function init_shop_mulch()
{
    global.shops_prestige_levels.mulch = global.prestige_levels.mlc;
    var shop_resource = global.resources.mulch;
    global.shops.mulch = 
    {
        leaf_marketing: build_shop_item("leaf_marketing", shop_resource, 1, 
        {
            description: sprintf(__("Receive +%s mulch per level by using advanced marketing techniques."), 1),
            max_count: 100
        }),
        max_seed_count: 
        {
            index: 100,
            name: __("Mulched Composter"),
            description: sprintf(__("Increases seed max count by %s per level."), 1),
            sprite: spr_seed_leaf,
            cost: 
            {
                mulch: 150000
            },
            cost_exp: 1.25,
            upgrade_attributes: 
            {
                seed_max_count: 1
            },
            max_count: 100
        },
        upgrade_seeds: 
        {
            index: 200,
            name: __("Mulched Seeds"),
            description: sprintf(__("Increases seed rewards by %s% per level. You have to maximize all seeds to level %s (up until Sand Seeds) before being able to purchase this upgrade. Your seed count will be reset each time you purchase this upgrade."), number_format(10), 100),
            sprite: spr_seed_leaf,
            cost: 
            {
                mulch: 500000
            },
            cost_exp: 1.5,
            upgrade_attributes: 
            {
                seed_value_add_global: 0.1
            },
            max_count: 50,
            
            can_buy: function()
            {
                var check_seed_types = [global.resources.leaves, global.resources.gold, global.resources.platinum, global.resources.bismuth, global.resources.cosmic, global.resources.void, global.resources.exotic, global.resources.celestial, global.resources.mythical, global.resources.lava, global.resources.ice, global.resources.obsidian, global.resources.silicon, global.resources.benitoite, global.resources.moonstone, global.resources.sand];
                var __array = check_seed_types;
                var __prop_len = array_length(__array);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mitem = __array[__i];
                    var shop_key = "farming_" + mitem.key;
                    var shop_item = variable_struct_get(global.shops.farming, shop_key);
                    if (is_undefined(shop_item))
                    {
                        log("undefined farming shop item", shop_item);
                    }
                    if (get_upgrade_count(shop_item) < 100)
                    {
                        return false;
                    }
                }
                return true;
            },
            
            func: function()
            {
                var __struct = global.shops.farming;
                var __prop_names = struct_get_names(__struct);
                var __prop_len = array_length(__prop_names);
                for (var __i = 0; __i < __prop_len; __i++)
                {
                    var mkey = __prop_names[__i];
                    var mitem = variable_struct_get(__struct, mkey);
                    mitem.data.count = 0;
                }
            }
        },
        chest_spawn_chance: build_shop_item("chest_spawn_chance", shop_resource, 300, 
        {
            cost_exp: 1.5,
            max_count: 20,
            value: 0.005
        }),
        chest_rarity_increase: build_shop_item("chest_rarity_increase", shop_resource, 310, 
        {
            cost_exp: 1.5,
            max_count: 50,
            value: 1
        }),
        slots_pity_counter: 
        {
            index: 1000,
            name: __("Mulched Slots"),
            description: sprintf(__("Adds a pity counter to the slot machine. You are guaranteed to win after %s plays."), "(50 - upgrade level)"),
            sprite: spr_icon_clover,
            cost: 
            {
                mulch: 50000
            },
            cost_exp: 1.75,
            upgrade_attributes: 
            {
                slots_pity_counter: 1
            },
            max_count: 20,
            
            is_obfuscated: function()
            {
                return !global.areas.cheese_pub.check();
            }
        },
        slots_offline_play: 
        {
            index: 1010,
            name: __("Passive Slots"),
            description: __s("Passively plays %s every %s.", __("Slots"), format_time(60)) + " " + __("Toggled off by default."),
            sprite: spr_icon_clover,
            cost: 
            {
                mulch: 500000
            },
            cost_exp: 2,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !global.areas.cheese_pub.check();
            }
        },
        claw_items_minmax: 
        {
            index: 1100,
            name: __("Insert More Mulch"),
            description: sprintf(__("Increases the minimum and maximum number of bonus items in the Borb Claw Machine by %s per level."), 1),
            sprite: spr_icon_hook,
            cost: 
            {
                mulch: 250000
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                claw_items_min: 1,
                claw_items_max: 1
            },
            max_count: 5,
            
            is_obfuscated: function()
            {
                return !global.areas.cheese_pub.check();
            }
        },
        claw_pickup_size: 
        {
            index: 1101,
            name: __("Mulched Claw"),
            description: sprintf(__("Increases the claw pickup range by %s pixels per level."), 1),
            sprite: spr_icon_hook,
            cost: 
            {
                mulch: 15000
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                claw_pickup_size: 1
            },
            max_count: 25,
            
            is_obfuscated: function()
            {
                return !global.areas.cheese_pub.check();
            }
        },
        claw_curse: build_shop_item("claw_curses", shop_resource, 1102, 
        {
            base_cost: 15000,
            cost_exp: 2.25,
            max_count: 50,
            value: 2
        }),
        claw_materials: build_shop_item("claw_materials", shop_resource, 1103, 
        {
            name: __("Material Pub"),
            sprite: spr_material_copper_bar,
            base_cost: 50000,
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                claw_materials: 1
            },
            
            is_obfuscated: function()
            {
                return !global.areas.cheese_pub.check();
            }
        }),
        claw_offline_play: 
        {
            index: 1104,
            name: __("Passive Claw"),
            description: __s("Passively plays %s every %s.", __("Borb Claw Machine"), format_time(60)) + " " + __("Toggled off by default."),
            sprite: spr_icon_hook,
            cost: 
            {
                mulch: 500000
            },
            cost_exp: 2,
            upgrade_attributes: {},
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !global.areas.cheese_pub.check();
            }
        },
        trade_cap_increase: 
        {
            index: 2000,
            name: __("Mulched Trade Caps"),
            description: sprintf(__("Increases the trade reward cap for some resources by the power of %s per level."), 10),
            sprite: spr_icon_trading,
            cost: 
            {
                mulch: 1000
            },
            cost_exp: 1.25,
            upgrade_attributes: 
            {
                trade_cap_increase: 1
            },
            max_count: 295,
            
            is_obfuscated: function()
            {
                return !is_unlocked_trading();
            }
        },
        trade_decrease_input_count: build_shop_item("trade_decrease_input_count", shop_resource, 2005, 
        {
            base_cost: 25000,
            cost_exp: 32,
            max_count: 50,
            value: 1
        }),
        max_trades: build_shop_item("max_trades", shop_resource, 2010, 
        {
            base_cost: 75000,
            cost_exp: 16,
            max_count: 5,
            value: 1
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 3000, 
        {
            base_cost: 25000,
            cost_exp: 2,
            max_count: 10
        }),
        crafting_backpack_size: build_shop_item("crafting_backpack_size", shop_resource, 3010, 
        {
            base_cost: 75000,
            cost_exp: 2,
            max_count: 5
        }),
        pub_counter_autocount: 
        {
            index: 4000,
            name: __("Leaf Counter Macro"),
            description: sprintf(__("A macro automatically counts the Leaf Counter Machine in the Cheese Pub for you. Counts %sx per minute each level."), 1),
            sprite: spr_icon_leaf_counter,
            cost: 
            {
                mulch: 25000
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                leaf_pub_counter_autocount: 0.016666666666666666
            },
            max_count: 5,
            
            is_obfuscated: function()
            {
                return !global.areas.cheese_pub.check();
            }
        },
        cards_enemy_drop_chance: build_shop_item("cards_enemy_drop_chance", shop_resource, 5000, 
        {
            base_cost: 125000,
            cost_exp: 3,
            max_count: 5,
            value: 0.0002
        }),
        card_parts_drop_chance: build_shop_item("card_parts_drop_chance", shop_resource, 5010, 
        {
            base_cost: 50000,
            cost_exp: 2.5,
            max_count: 5,
            value: 0.0005
        })
    };
}
