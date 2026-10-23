function init_shop_moonstone()
{
    global.shops_prestige_levels.moonstone = global.prestige_levels.mlc;
    var shop_resource = global.resources.moonstone;
    global.shops.moonstone = 
    {
        unlock_resource_sand: build_shop_item("unlock_resource", shop_resource, 0, 
        {
            base_cost: 75000000000,
            description: __("You can't build a sandcastle with Sand Leaves, unfortunately."),
            value: global.resources.sand
        }),
        fertilizer: build_shop_item("fertilizer", shop_resource, 1),
        leaf_marketing: 
        {
            index: 2,
            name: __s("%s Marketing", global.resources.moonstone.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                moonstone: 750000000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    moonstone: 1
                }
            },
            max_count: 5
        },
        master_of_mlc: build_shop_item("master_of_mlc", shop_resource, 20, 
        {
            base_cost: 500000000,
            max_count: 10,
            value: 0.05
        }),
        inventory_size: build_shop_item("inventory_size", shop_resource, 200, 
        {
            base_cost: 2500000000,
            max_count: 2,
            value: 1
        }),
        crafting_backpack_size: build_shop_item("crafting_backpack_size", shop_resource, 205, 
        {
            base_cost: 750000000000,
            max_count: 5
        }),
        craft_rng_quality: build_shop_item("craft_rng_quality", shop_resource, 210, 
        {
            base_cost: 50000000000,
            max_count: 25,
            value: 0.01
        }),
        craft_item_max_level: build_shop_item("craft_item_max_level", shop_resource, 220, 
        {
            base_cost: 100000000,
            max_count: 10,
            value: 1
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 225, 
        {
            base_cost: 25000000000,
            max_count: 10
        }),
        craft_salvage_reward: 
        {
            index: 230,
            name: __("Craft Cheese"),
            description: __s("More Cheese! More Cheese! More Cheese! Increases salvage rewards by %s Cheese per level.", number_format_percent(0.01)),
            sprite: spr_icon_crafting,
            cost_exp: 12,
            cost: build_resource_cost(shop_resource, 666666666666666),
            upgrade_attributes: 
            {
                craft_salvage_reward: 0.01
            },
            max_count: 20
        },
        craft_ub_speed_decrease_multiplier: 
        {
            index: 240,
            name: __("Craft Time"),
            description: __s("The craft bar slows down magically by %s% per level.", 5),
            sprite: spr_icon_crafting,
            cost: build_resource_cost(shop_resource, 500000000),
            cost_exp: 4,
            upgrade_attributes: 
            {
                craft_ub_speed_decrease_multiplier: 0.05
            },
            max_count: 10,
            
            func: function()
            {
                with (o_gui_instance_crafting)
                {
                    init();
                }
            }
        },
        autocraft_delay_reduction: build_shop_item("autocraft_delay_reduction", shop_resource, 250, 
        {
            base_cost: 10000000000,
            cost_exp: 2048,
            max_count: 5,
            value: 0.025
        }),
        leaf_counter_value: build_shop_item("leaf_counter_value", shop_resource, 1000, 
        {
            base_cost: 100000000,
            cost_exp: 2048,
            max_count: 0,
            value: 1
        })
    };
}
