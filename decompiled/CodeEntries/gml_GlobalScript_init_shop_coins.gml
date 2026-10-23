function init_shop_coins()
{
    global.shops_prestige_levels.coins = global.prestige_levels.prestige;
    global.shops_resources.coins = global.resources.coins;
    var shop_resource = global.resources.coins;
    global.shops.coins = 
    {
        unlock_areas: 
        {
            index: -500,
            name: __("Unlock Areas"),
            sprite: spr_flag,
            description: __("Travel to far away places and discover new leaves."),
            cost: 
            {
                coins: 20
            },
            max_count: 1,
            auto_upgrade_prio: 500
        },
        unlock_printers: 
        {
            index: -499,
            name: __("Unlock Printers"),
            description: __("Leaf print machines print and collect leaves automatically. Hide it from the tax authorities."),
            sprite: spr_icon_printer,
            cost: 
            {
                coins: 200
            },
            max_count: 1,
            auto_upgrade_prio: 499
        },
        unlock_converters: 
        {
            index: -498,
            name: __("Unlock Converters"),
            sprite: spr_icon_converters,
            description: __("It's not a ritual but a really fancy and useful machine."),
            cost: 
            {
                coins: 200
            },
            max_count: 1,
            auto_upgrade_prio: 498
        },
        auto_upgrade_leaf_trees: 
        {
            index: -400,
            name: __("Auto Upgrade Trees"),
            description: __("Trees upgrades will be purchased automatically."),
            cost: 
            {
                coins: 100
            },
            sprite: spr_tree,
            max_count: 1,
            is_toggle: true,
            auto_upgrade: "tree",
            auto_upgrade_prio: 10
        },
        auto_upgrade_leaf_fertilizer: 
        {
            index: -399,
            name: __("Auto Upgrade Leaf Fertilizer"),
            description: __("Fertilizer upgrades will be purchased automatically."),
            cost: 
            {
                coins: 100
            },
            sprite: spr_icon_fertilizer,
            max_count: 1,
            is_toggle: true,
            auto_upgrade: "fertilizer",
            auto_upgrade_prio: 9
        },
        auto_upgrade_leaf_marketing: 
        {
            index: -398,
            name: __("Auto Upgrade Leaf Marketing"),
            description: __("Leaf Marketing upgrades will be purchased automatically."),
            sprite: spr_icon_marketing,
            cost: 
            {
                coins: 100
            },
            max_count: 1,
            is_toggle: true,
            auto_upgrade: "leaf_marketing",
            auto_upgrade_prio: 11
        },
        auto_upgrade_nuclear_fuel: 
        {
            index: -397,
            name: __("Auto Upgrade Nuclear Fuel"),
            description: __("Nuclear Fuel upgrades will be purchased automatically."),
            sprite: spr_icon_nuclear,
            cost: 
            {
                coins: 100
            },
            max_count: 1,
            is_toggle: true,
            auto_upgrade: "nuclear_fuel",
            auto_upgrade_prio: 8
        },
        auto_buy_leaf_blower: 
        {
            index: -396,
            name: __("Auto Buy ALBs"),
            description: __("This upgrade will automatically buy ALBs for you."),
            sprite: spr_autoblower,
            cost: 
            {
                coins: 100
            },
            max_count: 1,
            is_toggle: true,
            auto_upgrade: "auto_leaf_blower",
            auto_upgrade_prio: 12
        },
        auto_unlock_leaves: 
        {
            index: -395,
            name: __("Auto Unlock Leaves"),
            description: __("This upgrade will automatically unlock leaves once they become available."),
            sprite: spr_leaf,
            cost: 
            {
                coins: 500
            },
            max_count: 1,
            is_toggle: true,
            auto_upgrade: ["gold_leaves", "platinum_leaves", "bismuth_leaves", "cosmic_leaves", "void_leaves", "unlock_exotic_leaves", "unlock_celestial_leaves", "unlock_mythical_leaves", "unlock_lava_leaves", "unlock_ice_leaves", "unlock_obsidian_leaves", "unlock_silicon_leaves", "unlock_benitoite_leaves"],
            auto_upgrade_prio: 1001
        },
        auto_unlock_flasks: 
        {
            index: -394,
            name: __("Auto Unlock Flasks"),
            description: __("This upgrade will automatically unlock flasks once they become available."),
            sprite: spr_flask_red,
            cost: 
            {
                coins: 5000
            },
            max_count: 1,
            is_toggle: true,
            auto_upgrade: ["unlock_red_flask", "unlock_flask_green", "unlock_flask_blue", "unlock_flask_magenta", "unlock_flask_orange", "unlock_flask_black", "unlock_flask_strange"],
            auto_upgrade_prio: 1000
        },
        printer_adder: 
        {
            index: -300,
            name: __("Printer Adder"),
            sprite: spr_icon_printer,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 10
            },
            cost_exp: 1.5,
            upgrade_attributes: 
            {
                printer_adder: 1
            },
            max_count: 0
        },
        printer_multiplier: 
        {
            index: -299,
            name: __("Printer Multiplier"),
            sprite: spr_icon_printer,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 40
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                printer_multiplier: 1
            },
            max_count: 0
        },
        converter_increase_batch_count: 
        {
            index: -99,
            name: __("Increase Converter Count"),
            description: __("Doubles the resource input/output count for all converters."),
            sprite: spr_icon_converters,
            cost: 
            {
                coins: 10
            },
            cost_exp: 2,
            max_count: 0,
            upgrade_attributes: 
            {
                converter_batch_count: 1
            }
        },
        converter_increase_output_count: 
        {
            index: -98,
            name: __("Increase Converter Output"),
            description: global.texts.converter_increase_output_count_all,
            sprite: spr_icon_converters,
            cost: 
            {
                coins: 20
            },
            cost_exp: 2.5,
            max_count: 0,
            upgrade_attributes: 
            {
                converter_output_add_global: 1
            }
        },
        prestige_value_multiplier: 
        {
            index: -5,
            name: __("Prestige++"),
            sprite: spr_gold,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 5
            },
            cost_exp: 2.5,
            upgrade_attributes: 
            {
                prestige_value_multiplier: 0.25
            },
            max_count: 0
        },
        reduce_upgrade_prices: 
        {
            index: -1,
            name: __("Upgrade Discount"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_percent,
            cost: 
            {
                coins: 5
            },
            cost_exp: 2.5,
            max_count: 50,
            upgrade_attributes: 
            {
                reduce_upgrade_prices: 0.01
            },
            
            func: function()
            {
                refresh_ua_values_cache();
            }
        },
        double_leaves: 
        {
            index: 0,
            name: __("More Leaves"),
            sprite: spr_leaf,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 2
            },
            cost_exp: 4,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    leaves: 1
                }
            },
            max_count: 0
        },
        double_gold: 
        {
            index: 1,
            name: __("More Gold Leaves"),
            sprite: spr_leaf_gold,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 2
            },
            cost_exp: 4,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    gold: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.resources.gold.data.collected_total == 0;
            }
        },
        double_platinum: 
        {
            index: 2,
            name: __("More Platinum Leaves"),
            sprite: spr_leaf_platinum,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 2
            },
            cost_exp: 4,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    platinum: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.resources.platinum.data.collected_total == 0;
            }
        },
        double_bismuth: 
        {
            index: 3,
            name: __("More Bismuth Leaves"),
            sprite: spr_leaf_bismuth,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 2
            },
            cost_exp: 4,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    bismuth: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.resources.bismuth.data.collected_total == 0;
            }
        },
        double_cosmic: 
        {
            index: 4,
            name: __("More Cosmic Leaves"),
            sprite: spr_leaf_cosmic,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 2
            },
            cost_exp: 4,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    cosmic: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.resources.cosmic.data.collected_total == 0;
            }
        },
        double_void: 
        {
            index: 5,
            name: __("More Void Leaves"),
            sprite: spr_leaf_void,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 2
            },
            cost_exp: 4,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    void: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.resources.void.data.collected_total == 0;
            }
        },
        double_exotic: 
        {
            index: 6,
            name: __("More Exotic Leaves"),
            sprite: spr_leaf_exotic,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 100
            },
            cost_exp: 4,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    exotic: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.resources.exotic.data.collected_total == 0;
            }
        },
        double_celestials: 
        {
            index: 7,
            name: __("More Celestial Leaves"),
            sprite: spr_leaf_celestial,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 200
            },
            cost_exp: 4,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    celestial: 1
                }
            },
            
            is_obfuscated: function()
            {
                return global.resources.celestial.data.collected_total == 0;
            }
        },
        fruit_spawn_chance: 
        {
            index: 10,
            name: __("Fruit Fertilizer"),
            sprite: spr_fruit,
            sprite_image_index: 0,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                coins: 1
            },
            upgrade_attributes: 
            {
                fruit_spawn_chance: 0.5
            },
            max_count: 50
        },
        fruit_value: 
        {
            index: 11,
            name: __("Fruity Fruits"),
            sprite: spr_fruit,
            sprite_image_index: 0,
            description: __s("Fruits contain more fruit. Increases fruit reward by %s.", number_format_percent(0.5)),
            cost: 
            {
                coins: 1
            },
            upgrade_attributes: 
            {
                fruit_value: 0.5
            },
            max_count: 50
        },
        fruit_spawn_chance_multi: 
        {
            index: 12,
            name: __("Fruit Trees"),
            sprite: spr_fruit,
            sprite_image_index: 0,
            description: __s("%s higher chance to spawn multiple fruits per level. After level %s, an additional fruit will spawn every %s levels.", number_format_percent(0.01), 100, 50),
            cost: 
            {
                coins: 5
            },
            cost_exp: 1.4,
            upgrade_attributes: 
            {
                fruit_spawn_chance_multi: 1
            },
            max_count: 0
        },
        alb_can_collect_fruits: 
        {
            index: 300,
            name: __("ALB <3 Fruits"),
            description: __("ALBs can collect fruits for you now. Should they also do your tax report?"),
            sprite: spr_autoblower,
            cost: 
            {
                coins: 30
            },
            max_count: 1
        },
        offline_prestige: build_shop_item("offline_prestige", shop_resource, 4000, 
        {
            name: __("Offline Prestige"),
            base_cost: 1500000,
            cost_exp: 96,
            max_count: 5,
            value: 1,
            value2: 0.001
        }),
        offline_prestige_pct: build_shop_item("offline_prestige_pct", shop_resource, 4001, 
        {
            name: __("Offline Prestige"),
            base_cost: 100000,
            cost_exp: 48,
            max_count: 50,
            value: 0.01
        })
    };
}
