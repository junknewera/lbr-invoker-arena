function init_shop_soul()
{
    var shop_resource = global.resources.soul_entities;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.mlc);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        unlock_banks: build_shop_item("unlock_banks", shop_resource, 0, 
        {
            name: __("Banks"),
            description: __s("Deposit resources into banks to get boss cards."),
            sprite: spr_icon_bank,
            cost: build_resource_cost(shop_resource, 50),
            max_count: 1
        }),
        auto_restart_crypt: 
        {
            index: 20,
            name: __("Borb Crypt Taxi"),
            description: __s("Automatically transports you back to %s when you get blown away or cleared a floor at the cost of %s.", global.areas.soul_crypt.name, format_result_text(global.costs.borb_taxi_soul_crypt)),
            sprite: spr_borb,
            cost: build_resource_cost(shop_resource, 10),
            max_count: 1,
            is_toggle: true
        },
        soul_keys_crypt_base: 
        {
            index: 2000,
            name: __s("Key Finder"),
            description: __s("Where did I put my keys again? Increases %s count by %s in %s.", global.resources.soul_keys.name, 1, global.areas.soul_crypt.name),
            sprite: spr_material_key,
            cost: build_resource_cost(shop_resource, 30),
            cost_exp: 1.3,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_keys_crypt_base: 1
            }
        },
        soul_keys_crypt_multiplier: 
        {
            index: 2010,
            name: __s("Key Multiplier"),
            description: __s("Increases %s count by %s in %s.", global.resources.soul_keys.name, number_format_percent(0.01), global.areas.soul_crypt.name),
            sprite: spr_material_key,
            cost: build_resource_cost(shop_resource, 20),
            cost_exp: 1.3,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_keys_crypt_multiplier: 0.01
            }
        },
        soul_particles_crypt_base: 
        {
            index: 3000,
            name: __s("Particles Finder"),
            description: __s("Where the heck are my particles again? Increases %s count by %s in %s.", global.resources.soul_particles.name, 1, global.areas.soul_crypt.name),
            sprite: spr_resource_soul_particle,
            cost: build_resource_cost(shop_resource, 30),
            cost_exp: 1.35,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_particles_crypt_base: 1
            }
        },
        soul_particles_crypt_multiplier: 
        {
            index: 3010,
            name: __s("Particles Multiplier"),
            description: __s("Increases %s count by %s in %s.", global.resources.soul_particles.name, number_format_percent(0.01), global.areas.soul_crypt.name),
            sprite: spr_resource_soul_particle,
            cost: build_resource_cost(shop_resource, 25),
            cost_exp: 1.25,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_particles_crypt_multiplier: 0.01
            }
        },
        soul_crypt_bonus_reward_chance: 
        {
            index: 4000,
            name: __s("Bonus Reward Finder"),
            description: __s("Where the leaf is my reward for all the hard work? Increases bonus reward chance by %s in %s.", number_format_percent(0.01), global.areas.soul_crypt.name),
            sprite: spr_resource_soul_entity,
            cost: build_resource_cost(shop_resource, 70),
            cost_exp: 1.5,
            max_count: 25,
            upgrade_attributes: 
            {
                soul_crypt_bonus_reward_chance: 1
            }
        },
        soul_crypt_bonus_reward_multiplier: 
        {
            index: 4010,
            name: __s("Bonus Reward Multiplier"),
            description: __s("Increases bonus reward by %s in %s.", number_format_percent(0.05), global.areas.soul_crypt.name),
            sprite: spr_resource_soul_entity,
            cost: build_resource_cost(shop_resource, 50),
            cost_exp: 1.3,
            max_count: 0,
            upgrade_attributes: 
            {
                soul_crypt_bonus_reward_multiplier: 0.05
            }
        },
        blower_enemy_damage_multiplier_soul_stones: build_shop_item("blower_hit_damage_multiplier", global.resources.soul_stones, 5000, 
        {
            base_cost: 80,
            cost_exp: 1.5,
            max_count: 10,
            value: 20,
            upgrade_key: "blower_enemy_damage_multiplier_soul"
        }),
        blower_enemy_damage_multiplier_soul_particles: build_shop_item("blower_hit_damage_multiplier", global.resources.soul_particles, 5010, 
        {
            base_cost: 85,
            cost_exp: 1.4,
            max_count: 10,
            value: 20,
            upgrade_key: "blower_enemy_damage_multiplier_soul"
        }),
        blower_enemy_damage_multiplier_soul_entities: build_shop_item("blower_hit_damage_multiplier", global.resources.soul_entities, 5020, 
        {
            base_cost: 90,
            cost_exp: 1.4,
            max_count: 10,
            value: 20,
            upgrade_key: "blower_enemy_damage_multiplier_soul"
        }),
        blower_enemy_damage_multiplier_soul_flask: build_shop_item("blower_hit_damage_multiplier", global.resources.soul_flask, 5030, 
        {
            base_cost: 25,
            cost_exp: 1.3,
            max_count: 30,
            value: 20,
            upgrade_key: "blower_enemy_damage_multiplier_soul"
        }),
        alchemy_brew_multiplier: 
        {
            index: 6000,
            name: __s("Brew Multiplier"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_alchemy,
            cost: build_resource_cost(global.resources.soul_stones, 10),
            cost_exp: 1.6,
            max_count: 10,
            upgrade_attributes: 
            {
                alchemy_brew_multiplier: 0.05
            }
        },
        alchemy_brew_multiplier_soul_particles: 
        {
            index: 6010,
            name: __s("Brew Multiplier"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_alchemy,
            cost: build_resource_cost(global.resources.soul_particles, 15),
            cost_exp: 1.6,
            max_count: 10,
            upgrade_attributes: 
            {
                alchemy_brew_multiplier: 0.1
            }
        },
        alchemy_brew_multiplier_soul_entities: 
        {
            index: 6020,
            name: __s("Brew Multiplier"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_alchemy,
            cost: build_resource_cost(global.resources.soul_entities, 20),
            cost_exp: 1.6,
            max_count: 10,
            upgrade_attributes: 
            {
                alchemy_brew_multiplier: 0.15
            }
        },
        alchemy_brew_multiplier_soul_flask: 
        {
            index: 6030,
            name: __s("Brew Multiplier"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_alchemy,
            cost: build_resource_cost(global.resources.soul_flask, 15),
            cost_exp: 1.6,
            max_count: 30,
            upgrade_attributes: 
            {
                alchemy_brew_multiplier: 0.2
            }
        },
        craft_min_chance: build_shop_item("craft_min_chance", global.resources.soul_flask, 7000, 
        {
            base_cost: 200,
            cost_exp: 3,
            max_count: 10,
            value: 1
        })
    });
}
