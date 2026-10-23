function init_shop_soul_forge()
{
    var shop_resource = global.resources.soul_flask;
    global.shops_prestige_levels.soul_forge = global.prestige_levels.mlc;
    global.shops.soul_forge = 
    {
        auto_collect_soul_empty: 
        {
            index: 1000,
            name: __s("%s Generator", global.resources.soul_empty.name),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul_empty,
            cost: build_resource_cost(shop_resource, 15),
            cost_exp: 1.3,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_auto_collect: 
                {
                    soul_empty: 0.02
                }
            }
        },
        auto_collect_soul_empty_multiplier: 
        {
            index: 1001,
            name: __s("%s Multiplier", global.resources.soul_empty.name),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul_empty,
            cost: build_resource_cost(shop_resource, 8),
            cost_exp: 1.2,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_forge_count_multiplier: 0.05
            }
        },
        soul_forge_complete_count: 
        {
            index: 1010,
            name: __s("Completion Reward"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul,
            cost: build_resource_cost(shop_resource, 35),
            cost_exp: 1.5,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_forge_complete_count: 0.1
            }
        },
        soul_forge_complete_count_multiplier: 
        {
            index: 1011,
            name: __s("Completion Reward Multiplier"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul,
            cost: build_resource_cost(shop_resource, 30),
            cost_exp: 1.4,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_forge_complete_count_multiplier: 0.05
            }
        },
        soul_forge_counter_decrease: 
        {
            index: 1100,
            name: __s("Soul Forge Compressor"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul_half,
            cost: build_resource_cost(shop_resource, 40),
            cost_exp: 1.3,
            max_count: 20,
            upgrade_attributes: 
            {
                soul_forge_counter_decrease: 1
            }
        },
        auto_collect_soul_empty_advanced: 
        {
            index: 2000,
            name: __s("Advanced %s Generator", global.resources.soul_empty.name),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul_empty,
            cost: build_resource_cost(global.resources.soul, 15),
            cost_exp: 1.4,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_auto_collect: 
                {
                    soul_empty: 0.2
                }
            }
        },
        auto_collect_soul_empty_advanced_multiplier: 
        {
            index: 2010,
            name: __s("Advanced %s Multiplier", global.resources.soul_empty.name),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul_empty,
            cost: build_resource_cost(global.resources.soul, 8),
            cost_exp: 1.3,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_forge_count_multiplier: 0.15
            }
        },
        soul_forge_complete_count_advanced: 
        {
            index: 2100,
            name: __s("Advanced Completion Reward"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul,
            cost: build_resource_cost(global.resources.soul, 35),
            cost_exp: 1.6,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_forge_complete_count: 0.5
            }
        },
        soul_forge_complete_count_multiplier_advanced: 
        {
            index: 2101,
            name: __s("Advanced Completion Reward Multiplier"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul,
            cost: build_resource_cost(global.resources.soul, 25),
            cost_exp: 1.5,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_forge_complete_count_multiplier: 0.25
            }
        },
        soul_forge_counter_decrease_advanced: 
        {
            index: 2200,
            name: __s("Advanced Soul Forge Compressor"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf_soul_half,
            cost: build_resource_cost(global.resources.soul, 20),
            cost_exp: 1.3,
            max_count: 20,
            upgrade_attributes: 
            {
                soul_forge_counter_decrease: 1
            }
        },
        soul_crypt_floors: 
        {
            index: 3000,
            name: __s("Soul Crypt Floors"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_soul_crypt,
            cost: build_resource_cost(global.resources.soul, 100),
            cost_exp: 1.05,
            max_count: 80,
            upgrade_attributes: 
            {
                soul_crypt_floors: 1
            }
        },
        blower_enemy_damage_multiplier: build_shop_item("blower_hit_damage_multiplier", global.resources.soul, 4000, 
        {
            base_cost: 150,
            cost_exp: 1.15,
            max_count: 150,
            value: 1000,
            upgrade_key: "blower_enemy_damage_multiplier_soul"
        }),
        craft_level: build_shop_item("craft_level", global.resources.soul, 7000, 
        {
            base_cost: 5000,
            max_count: 1,
            value: 1
        }),
        craft_min_chance: build_shop_item("craft_min_chance", global.resources.soul, 7010, 
        {
            base_cost: 25000,
            cost_exp: 3,
            max_count: 10,
            value: 1
        })
    };
}
