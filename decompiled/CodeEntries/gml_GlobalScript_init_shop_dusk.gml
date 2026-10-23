function init_shop_dusk()
{
    var shop_resource = global.resources.dusk;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.ulc);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        fertilizer: build_shop_item("fertilizer", shop_resource, 0, 
        {
            base_cost: 500000
        }),
        leaf_marketing: build_shop_item("leaf_marketing", shop_resource, 10, 
        {
            cost_exp: 1.25,
            max_count: 0,
            base_cost: 100000
        }),
        shadow_crystal_attack_damage: build_shop_item("shadow_crystal_attack_damage", shop_resource, 2001, 
        {
            name: __("Shadow Strength"),
            sprite: spr_icon_strength_shadow,
            value: 1,
            base_cost: 50000,
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                shadow_crystal_attack_damage: 1
            }
        }),
        shadow_crystal_attack_damage_multiplier_shadow: build_shop_item("shadow_crystal_attack_damage_multiplier_shadow", shop_resource, 2002, 
        {
            name: __("Shadow Strength") + "%",
            sprite: spr_icon_strength_shadow,
            value: 0.1,
            base_cost: 100000,
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                shadow_crystal_attack_damage_multiplier_shadow: 0.1
            }
        }),
        shadow_crystal_player_hp: build_shop_item("shadow_crystal_player_hp", shop_resource, 2010, 
        {
            name: __("Shadow HP"),
            sprite: spr_icon_heart_purple,
            value: 5,
            base_cost: 30000,
            cost_exp: 3,
            max_count: 10,
            upgrade_attributes: 
            {
                shadow_crystal_player_hp: 5
            }
        }),
        shadow_crystal_player_hp_multiplier_shadow: build_shop_item("shadow_crystal_player_hp_multiplier_shadow", shop_resource, 2011, 
        {
            name: __("Shadow HP") + "%",
            sprite: spr_icon_heart_purple,
            value: 0.01,
            base_cost: 200000,
            cost_exp: 3,
            max_count: 10,
            upgrade_attributes: 
            {
                shadow_crystal_player_hp_multiplier_shadow: 0.05
            }
        }),
        shadow_crystal_player_rest_hp_value: build_shop_item("shadow_crystal_player_rest_hp_value", shop_resource, 2020, 
        {
            name: __("Campfire"),
            sprite: spr_icon_heart_purple_uparrow,
            value: 2,
            base_cost: 100000,
            cost_exp: 3,
            max_count: 10,
            upgrade_attributes: 
            {
                shadow_crystal_player_rest_hp_value: 2
            }
        }),
        shadow_crystal_player_rest_hp_value_multiplier: build_shop_item("shadow_crystal_player_rest_hp_value_multiplier", shop_resource, 2021, 
        {
            name: __("Campfire") + "%",
            sprite: spr_icon_heart_purple_uparrow,
            value: 0.05,
            base_cost: 150000,
            cost_exp: 3,
            max_count: 10,
            upgrade_attributes: 
            {
                shadow_crystal_player_rest_hp_value_multiplier: 0.05
            }
        }),
        shadow_crystal_hp_decrease_multiplier_shadow: build_shop_item("shadow_crystal_hp_decrease_multiplier_shadow", shop_resource, 2100, 
        {
            name: __("Shadow Lighter"),
            sprite: spr_icon_heart_purple_downarrow,
            value: 0.01,
            base_cost: 50000,
            cost_exp: 4,
            max_count: 25,
            upgrade_attributes: 
            {
                shadow_crystal_hp_decrease_multiplier_shadow: 0.01
            }
        }),
        shadow_crystal_player_resistance: build_shop_item("shadow_crystal_player_resistance", shop_resource, 2200, 
        {
            name: __("Shadow Resistance"),
            sprite: spr_icon_resistance_up,
            value: 1,
            base_cost: 100000,
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                shadow_crystal_player_resistance: 1
            }
        }),
        shadow_crystal_decrease_resistance: build_shop_item("shadow_crystal_decrease_resistance", shop_resource, 2201, 
        {
            name: __("Anti Resistance"),
            sprite: spr_icon_resistance_down,
            value: 1,
            base_cost: 1000000,
            cost_exp: 4,
            max_count: 10,
            upgrade_attributes: 
            {
                shadow_crystal_decrease_resistance: 1
            }
        }),
        shadow_crystal_player_speed: build_shop_item("shadow_crystal_player_speed", shop_resource, 2300, 
        {
            name: __("Shadow Speed"),
            sprite: spr_icon_speed,
            value: 1,
            base_cost: 100000,
            cost_exp: 4,
            max_count: 20,
            upgrade_attributes: 
            {
                shadow_crystal_player_speed: 1
            }
        }),
        craft_level: build_shop_item("craft_level", shop_resource, 5000, 
        {
            base_cost: 10000000,
            max_count: 1,
            value: 1
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 5010, 
        {
            base_cost: 1000000,
            cost_exp: 3,
            max_count: 10,
            value: 1
        })
    });
}
