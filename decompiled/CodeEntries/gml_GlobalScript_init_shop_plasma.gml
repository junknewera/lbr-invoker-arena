function init_shop_plasma()
{
    var shop_resource = global.resources.plasma;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.mlc);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        unlock_industrial_harbor: build_shop_item("unlock_industrial_harbor", shop_resource, -10, 
        {
            name: __s("Unlock %s", __("Industrial Harbor")),
            sprite: spr_icon_ship,
            base_cost: 1000,
            max_count: 1
        }),
        fertilizer: build_shop_item("fertilizer", shop_resource, 0),
        leaf_marketing: build_shop_item("leaf_marketing", shop_resource, 10, 
        {
            cost_exp: 1.25,
            max_count: 0
        }),
        min_blow_speed_reduction: 
        {
            index: 20,
            name: __("Blow Off!"),
            sprite: spr_weapon_leaf_blower,
            description: __s("Reduces the minimum blow off speed of %s by %s.", shop_resource.name_plural, number_format_percent(0.1)),
            cost: build_resource_cost(shop_resource, 20),
            cost_exp: 6,
            max_count: 5,
            upgrade_attributes: 
            {
                min_blow_speed_reduction: 
                {
                    plasma: 0.1
                }
            }
        },
        add_resource_storage_energy: build_shop_item("add_resource_storage", shop_resource, 100, 
        {
            base_cost: 1000,
            cost_exp: 2,
            max_count: 20,
            resource_key: global.resources.energy_electrical.key,
            
            is_obfuscated: function()
            {
                return !is_unlocked_energy_electrical();
            },
            
            value: 100
        }),
        shards_max_count: build_shop_item("shards_max_count", shop_resource, 200, 
        {
            base_cost: 10000,
            cost_exp: 80,
            max_count: 3
        }),
        leafscender_decrease_convert_time: build_shop_item("leafscender_decrease_convert_time", shop_resource, 300, 
        {
            base_cost: 10000,
            cost_exp: 4,
            max_count: 5,
            value: 0.05
        }),
        damage_type_increase_damage: 
        {
            index: 1000,
            name: __("More Type Damage"),
            sprite: spr_icon_types,
            description: __s("Increases type damage by %s.", number_format_percent(0.075)),
            cost: build_resource_cost(shop_resource, 500),
            cost_exp: 1.5,
            max_count: 50,
            upgrade_attributes: 
            {
                damage_type_damage_pct: 0.075
            }
        },
        transformation_cost_reduction_leaves: 
        {
            index: 2000,
            name: __("Cheaper Transformation"),
            sprite: shop_resource.sprite,
            description: __s("Decreases transformation cost of %s by %s. Does not affect shards.", shop_resource.name_plural, number_format_percent(0.1)),
            cost: build_resource_cost(shop_resource, 2500),
            cost_exp: 1.75,
            max_count: 9,
            upgrade_attributes: 
            {
                transformation_cost_reduction_leaves: 
                {
                    plasma: 0.1
                }
            },
            after_apply: refresh_crafted_leaves_cost
        },
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 3000, 
        {
            base_cost: 10000000,
            max_count: 5
        }),
        craft_backpack_size: build_shop_item("crafting_backpack_size", shop_resource, 3010, 
        {
            base_cost: 1000,
            cost_exp: 3,
            max_count: 8
        }),
        craft_sets_size: build_shop_item("craft_sets_size", shop_resource, 3020, 
        {
            base_cost: 25000,
            cost_exp: 3,
            max_count: 4
        }),
        trade_gems_max_value: build_shop_item("trade_gems_max_value", shop_resource, 4000, 
        {
            base_cost: 10000000,
            max_count: 1,
            value: 1
        })
    });
}
