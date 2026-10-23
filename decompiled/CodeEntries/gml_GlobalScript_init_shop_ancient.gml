function init_shop_ancient()
{
    global.shops_prestige_levels.ancient = global.prestige_levels.mlc;
    var shop_resource = global.resources.ancient;
    global.shops.ancient = 
    {
        autobrew: 
        {
            index: 0,
            name: __("Advanced Cauldron"),
            sprite: spr_icon_alchemy,
            description: __("Enables automatic brewing of recipes."),
            cost: 
            {
                ancient: 250000
            },
            max_count: 1
        },
        unlock_shards: 
        {
            index: 10,
            name: __s("Unlock %s", __("Shards")),
            sprite: spr_resource_shards,
            description: __("Unlocks Shards. Shards can be added to crafted leaves to further improve their stats."),
            cost: 
            {
                ancient: 5000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.shards.data.unlocked = true;
            }
        },
        shards_reduce_selection_cost: build_shop_item("shards_reduce_selection_cost", shop_resource, 11, 
        {
            max_count: 3,
            base_cost: 10000000,
            value: 1
        }),
        more_pyramid_floors: build_shop_item("more_pyramid_floors", shop_resource, 100, 
        {
            max_count: 0,
            value: 10
        }),
        area_enemies_decrease_pyramid: build_shop_item("area_enemies_decrease", shop_resource, 110, 
        {
            base_cost: 1000000,
            cost_exp: 8192,
            max_count: 5,
            value: 1,
            area_key: global.areas.inner_pyramid.key
        }),
        crafting_backpack_size: build_shop_item("crafting_backpack_size", shop_resource, 500, 
        {
            base_cost: 10000,
            cost_exp: 3,
            max_count: 5
        }),
        item_drop_count: build_shop_item("item_drop_count", shop_resource, 1000, 
        {
            base_cost: 750000,
            cost_exp: 8,
            max_count: 5,
            value: 1
        }),
        material_finder: build_shop_item("material_finder", shop_resource, 2000, 
        {
            base_cost: 5000,
            cost_exp: 4,
            max_count: 10,
            value: 0.05
        }),
        material_spawn_count: build_shop_item("material_spawn_count", shop_resource, 2100, 
        {
            base_cost: 1000000,
            cost_exp: 8,
            max_count: 5,
            value: 1
        }),
        claw_materials_multiplier: build_shop_item("claw_materials_multiplier", shop_resource, 2110, 
        {
            name: __("Material Pub"),
            sprite: spr_material_copper_bar,
            base_cost: 15000,
            cost_exp: 3,
            max_count: 5,
            upgrade_attributes: 
            {
                claw_materials_multiplier: 0.25
            }
        }),
        witch_cursed_count: build_shop_item("witch_cursed_count", shop_resource, 3000, 
        {
            base_cost: 11111,
            cost_exp: 2,
            value: 11
        }),
        witch_essence_count: build_shop_item("witch_essence_count", shop_resource, 3100, 
        {
            base_cost: 300000,
            cost_exp: 3,
            value: 1
        }),
        witch_spawn_delay: build_shop_item("witch_spawn_delay", shop_resource, 3200, 
        {
            base_cost: 50000,
            cost_exp: 2,
            value: 0.01
        }),
        auto_restart_pyramid: 
        {
            index: 4000,
            name: __("Borb Pyramid Taxi"),
            description: __s("Automatically transports you back to %s when you get blown away or cleared a floor at the cost of %s.", global.areas.inner_pyramid.name, format_result_text(global.costs.borb_taxi_pyramid)),
            sprite: spr_borb,
            cost: build_resource_cost(shop_resource, 1000),
            max_count: 1,
            is_toggle: true
        },
        artifact_autouse_timer_delay_reduction_multiplier: build_shop_item("artifact_autouse_timer_delay_reduction_multiplier", shop_resource, 4500, 
        {
            base_cost: 500000,
            cost_exp: 64,
            max_count: 5,
            value: 0.05
        }),
        trade_gems_max_value: build_shop_item("trade_gems_max_value", shop_resource, 5000, 
        {
            base_cost: 2000000,
            max_count: 1,
            value: 1
        })
    };
}
