function init_shop_hematite()
{
    var shop_resource = global.resources.hematite;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.mlc);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        unlock_resource_energy_electrical: build_shop_item("unlock_resource", shop_resource, -200, 
        {
            base_cost: 5000000,
            value: global.resources.energy_electrical
        }),
        add_resource_storage_energy: build_shop_item("add_resource_storage", shop_resource, -190, 
        {
            base_cost: 100000,
            cost_exp: 2,
            max_count: 20,
            resource_key: global.resources.energy_electrical.key,
            
            is_obfuscated: function()
            {
                return !is_unlocked_energy_electrical();
            },
            
            value: 20
        }),
        unlock_ascension_shards: 
        {
            index: -110,
            name: __s("Unlock %s", __("Ascension Shards")),
            description: __s("Ascension Shards are used to ascend Sacred Crafted Leaves or better. Receive %s %s upon purchase.", 30, global.resources.ascension_shards.name_plural),
            sprite: spr_resource_ascension_shards,
            cost: build_resource_cost(shop_resource, 50000000),
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_energy_electrical();
            },
            
            func: function()
            {
                add_resources(
                {
                    ascension_shards: 30
                });
            }
        },
        unlock_fusion_shards: 
        {
            index: -100,
            name: __s("Unlock %s", __("Fusion Shards")),
            description: __s("Fusion Shards are used to fuse Crafted Leaves into more powerful ones. Receive %s %s upon purchase.", 30, global.resources.fusion_shards.name_plural),
            sprite: spr_resource_fusion_shards,
            cost: build_resource_cost(shop_resource, 50000000),
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_energy_electrical();
            },
            
            func: function()
            {
                add_resources(
                {
                    fusion_shards: 30
                });
            }
        },
        unlock_transformation_shards: 
        {
            index: -90,
            name: __s("Unlock %s", __("Transformation Shards")),
            description: __s("Change properties of Crafted Leaves. Receive %s %s upon purchase.", 30, global.resources.transformation_shards.name_plural),
            sprite: spr_resource_transformation_shards,
            cost: build_resource_cost(shop_resource, 50000000),
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_energy_electrical();
            },
            
            func: function()
            {
                add_resources(
                {
                    transformation_shards: 30
                });
            }
        },
        shards_max_count: build_shop_item("shards_max_count", shop_resource, -50, 
        {
            base_cost: 100000,
            cost_exp: 80,
            max_count: 3
        }),
        fertilizer: build_shop_item("fertilizer", shop_resource, 0),
        leaf_marketing: build_shop_item("leaf_marketing", shop_resource, 10, 
        {
            cost_exp: 1.25,
            max_count: 0
        }),
        craft_level: build_shop_item("craft_level", shop_resource, 20, 
        {
            base_cost: 5000000,
            cost_exp: 24,
            max_count: 4,
            value: 1
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 25, 
        {
            base_cost: 10000000000,
            max_count: 5
        }),
        crafting_backpack_size: build_shop_item("crafting_backpack_size", shop_resource, 30, 
        {
            base_cost: 500000,
            cost_exp: 2,
            max_count: 10,
            value: 1
        }),
        cards_enemy_drop_chance: build_shop_item("cards_enemy_drop_chance", shop_resource, 500, 
        {
            base_cost: 1000000,
            cost_exp: 12,
            max_count: 5,
            value: 0.001
        }),
        cards_boss_drop_chance: build_shop_item("cards_boss_drop_chance", shop_resource, 510, 
        {
            base_cost: 1000000,
            cost_exp: 24,
            max_count: 5,
            value: 0.002
        }),
        trade_gems_max_value: build_shop_item("trade_gems_max_value", shop_resource, 600, 
        {
            base_cost: 10000000,
            max_count: 1,
            value: 1
        })
    });
}
