function init_shop_mines()
{
    var shop_resource = global.resources.diamond_coal;
    global.shops_prestige_levels.mines = global.prestige_levels.inf;
    global.shops.mines = 
    {
        mines_enhance: build_shop_item("mines_enhance", shop_resource, 1000, 
        {
            name: __s("Enhance"),
            description: __("Mine veins can be enhanced to improve their quality."),
            sprite: spr_icon_enhance,
            base_cost: 1,
            max_count: 1
        }),
        mines_max_veins: build_shop_item("mines_max_veins", shop_resource, 1005, 
        {
            name: __s("More Coal Veins"),
            sprite: spr_icon_mine_vein,
            base_cost: 5,
            cost_exp: 8,
            max_count: 4,
            upgrade_attributes: 
            {
                mines_max_veins: 1
            }
        }),
        mines_veins_search_reduction_multiplier: build_shop_item("mines_veins_search_reduction_multiplier", shop_resource, 1010, 
        {
            name: __s("Veins Discovery"),
            sprite: spr_icon_mine_vein,
            base_cost: 20,
            cost_exp: 1.75,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_veins_search_reduction_multiplier: 0.05
            }
        }),
        mines_max_veins_mine_count: build_shop_item("mines_max_veins_mine_count", shop_resource, 1020, 
        {
            name: __s("Veins Exploit"),
            sprite: spr_icon_mine_vein,
            base_cost: 15,
            cost_exp: 1.75,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_max_veins_mine_count: 1
            }
        }),
        mines_veins_rarity_multiplier: build_shop_item("mines_veins_rarity_multiplier", shop_resource, 1030, 
        {
            name: __s("%s Serendipity", __("Veins")),
            sprite: spr_icon_mine_vein,
            base_cost: 150,
            cost_exp: 2,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_veins_rarity_multiplier: 0.25
            }
        }),
        mines_drill_mines: build_shop_item("mines_drill_mines", shop_resource, 2000, 
        {
            name: __s("Drill Mines"),
            description: __("Mines can be drilled to get additional rewards."),
            sprite: spr_icon_drill,
            base_cost: 500,
            max_count: 1
        }),
        mines_drill_cd: build_shop_item("mines_drill_cd", shop_resource, 2001, 
        {
            name: __s("Worthwhile Drill"),
            description: __s("Mine Drill rewards %s.", global.resources.diamond_coal.name_plural),
            sprite: spr_icon_drill,
            base_cost: 2500,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_mines_drill();
            }
        }),
        mines_drill_sd: build_shop_item("mines_drill_sd", global.resources.diamond_shiny, 2002, 
        {
            name: __s("Super Worthwhile Drill"),
            description: __s("Mine Drill rewards %s.", global.resources.diamond_shiny.name_plural) + " " + __s("%s mines and above, level %s and higher.", __("Epic"), 10),
            sprite: spr_icon_drill,
            base_cost: 500,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_mines_drill();
            }
        }),
        mines_max_mines: build_shop_item("mines_max_mines", shop_resource, 2010, 
        {
            name: __s("Max Mines"),
            sprite: spr_icon_mine,
            base_cost: 300,
            cost_exp: 2.5,
            max_count: 3,
            upgrade_attributes: 
            {
                mines_max_mines: 1
            }
        }),
        mines_max_caves: build_shop_item("mines_max_caves", shop_resource, 2100, 
        {
            name: __s("Max Caves"),
            sprite: spr_icon_mine,
            base_cost: 150,
            cost_exp: 2,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_max_caves: 1
            }
        }),
        mines_mine_power_multiplier: build_shop_item("mines_mine_power_multiplier", shop_resource, 2200, 
        {
            name: __s("Better Pickaxe"),
            sprite: spr_icon_mine,
            base_cost: 75,
            cost_exp: 1.25,
            max_count: 50,
            upgrade_attributes: 
            {
                mines_mine_power_multiplier: 0.05
            }
        }),
        mines_search_duration_reduction_multiplier: build_shop_item("mines_search_duration_reduction_multiplier", shop_resource, 2300, 
        {
            name: __s("Mine Expert"),
            sprite: spr_icon_mine,
            base_cost: 75,
            cost_exp: 2.5,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_search_duration_reduction_multiplier: 0.025
            }
        }),
        mines_reward_multiplier: build_shop_item("mines_reward_multiplier", shop_resource, 2400, 
        {
            name: __s("Mine Scholar"),
            sprite: spr_icon_mine,
            base_cost: 150,
            cost_exp: 1.5,
            max_count: 20,
            upgrade_attributes: 
            {
                mines_reward_multiplier: 0.05
            }
        }),
        mines_min_level: build_shop_item("mines_min_level", shop_resource, 2500, 
        {
            name: __s("Mine Min Level"),
            sprite: spr_icon_mine,
            base_cost: 200,
            cost_exp: 3,
            max_count: 9,
            upgrade_attributes: 
            {
                mines_min_level: 1
            }
        }),
        mines_max_level: build_shop_item("mines_max_level", shop_resource, 2501, 
        {
            name: __s("Mine Max Level"),
            sprite: spr_icon_mine,
            base_cost: 200,
            cost_exp: 2,
            max_count: 17,
            upgrade_attributes: 
            {
                mines_max_level: 1
            }
        }),
        mines_max_active_caves: build_shop_item("mines_max_active_caves", shop_resource, 2600, 
        {
            name: __s("Multimining"),
            sprite: spr_icon_mine,
            base_cost: 150,
            cost_exp: 3,
            max_count: 5,
            upgrade_attributes: 
            {
                mines_max_active_caves: 1
            },
            after_apply: refresh_mines_cache
        }),
        mines_coal_time_sphere_efficiency: build_shop_item("mines_coal_time_sphere_efficiency", shop_resource, 2700, 
        {
            name: __s("Better Spheres"),
            sprite: spr_resource_coal_time_sphere,
            base_cost: 250,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_coal_time_sphere_efficiency: 0.04
            }
        }),
        mines_inventory_size: build_shop_item("mines_inventory_size", shop_resource, 2800, 
        {
            name: __s("Item Shelf"),
            sprite: spr_icon_backpack,
            base_cost: 35,
            cost_exp: 1.2,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_inventory_size: 3
            }
        }),
        mines_items_max_count: build_shop_item("mines_items_max_count", shop_resource, 2810, 
        {
            name: __s("Mine Backpack"),
            sprite: spr_icon_backpack,
            base_cost: 100,
            cost_exp: 1.5,
            max_count: 20,
            upgrade_attributes: 
            {
                mines_items_max_count: 2
            }
        }),
        mines_craft_from_codex: build_shop_item("mines_craft_from_codex", shop_resource, 2820, 
        {
            name: __("Codex Crafter"),
            description: __("Craft items through the codex."),
            sprite: spr_icon_codex,
            base_cost: 50,
            max_count: 1
        }),
        mines_rarity_multiplier: build_shop_item("mines_rarity_multiplier", shop_resource, 2900, 
        {
            name: __s("%s Serendipity", __("Caves")),
            sprite: spr_icon_mine,
            base_cost: 200,
            cost_exp: 2,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_rarity_multiplier: 0.25
            }
        }),
        unlock_depth_drill: build_shop_item("unlock_depth_drill", shop_resource, 3000, 
        {
            name: __s("Unlock %s", __("The Depth Drill")),
            description: __("Drill deep into the mines to find rare bonuses."),
            sprite: spr_icon_drill,
            base_cost: 750,
            max_count: 1
        }),
        mines_drill_depth_progress: build_shop_item("mines_drill_depth_progress", shop_resource, 3100, 
        {
            name: __s("Drill Engine"),
            sprite: spr_icon_drill,
            base_cost: 75,
            cost_exp: 1.75,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_drill_depth_progress: 0.01
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill);
            }
        }),
        mines_drill_depth_progress_multiplier: build_shop_item("mines_drill_depth_progress_multiplier", shop_resource, 3101, 
        {
            name: __s("Drill Optimization"),
            sprite: spr_icon_drill,
            base_cost: 100,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_drill_depth_progress_multiplier: 0.2
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill);
            }
        }),
        fuel_efficiency: build_shop_item("fuel_efficiency", shop_resource, 3200, 
        {
            name: __s("Fuel Efficiency"),
            sprite: spr_resource_fuel,
            base_cost: 75,
            cost_exp: 1.5,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_drill_depth_fuel_drain_reduction_multiplier: 0.05
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill);
            }
        }),
        mines_drill_free_refuel_multiplier: build_shop_item("mines_drill_free_refuel_multiplier", shop_resource, 3210, 
        {
            name: __s("Refuel Exploit"),
            sprite: spr_resource_fuel,
            base_cost: 125,
            cost_exp: 1.4,
            max_count: 10,
            upgrade_attributes: 
            {
                mines_drill_free_refuel_multiplier: 0.2
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.mines.unlock_depth_drill);
            }
        }),
        unlock_auto_transmute: build_shop_item("unlock_auto_transmute", shop_resource, 4000, 
        {
            name: __s("Unlock %s", __("Auto Transmute")),
            sprite: spr_icon_transmute,
            base_cost: 25000,
            max_count: 1
        })
    };
}
