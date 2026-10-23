function init_shop_sand()
{
    global.shops_prestige_levels.sand = global.prestige_levels.mlc;
    var shop_resource = global.resources.sand;
    global.shops.sand = 
    {
        fertilizer: build_shop_item("fertilizer", shop_resource, 1),
        leaf_marketing: 
        {
            index: 2,
            name: __s("%s Marketing", global.resources.sand.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                sand: 750000000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    sand: 1
                }
            },
            max_count: 5
        },
        master_of_mlc: build_shop_item("master_of_mlc", shop_resource, 20, 
        {
            base_cost: 2500000000,
            max_count: 10,
            value: 0.075
        }),
        crafting_backpack_size: build_shop_item("crafting_backpack_size", shop_resource, 230, 
        {
            base_cost: 750000000000,
            max_count: 5
        }),
        scrolls_concurrent_max: build_shop_item("scrolls_concurrent_max", shop_resource, 300),
        scrolls_duration: build_shop_item("scrolls_duration", shop_resource, 310),
        scroll_drop_chance: build_shop_item("scroll_drop_chance", shop_resource, 320),
        autocraft_delay_reduction: build_shop_item("autocraft_delay_reduction", shop_resource, 400, 
        {
            base_cost: 10000000000,
            cost_exp: 2048,
            max_count: 5,
            value: 0.025
        }),
        artifact_autouse_timer_delay_reduction_multiplier: build_shop_item("artifact_autouse_timer_delay_reduction_multiplier", shop_resource, 500, 
        {
            base_cost: 10000000000,
            cost_exp: 2048,
            max_count: 5,
            value: 0.05
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
