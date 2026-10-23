function init_shop_malachite()
{
    global.shops_prestige_levels.malachite = global.prestige_levels.mlc;
    var shop_resource = global.resources.malachite;
    global.shops.malachite = 
    {
        unlock_resource_hematite: build_shop_item("unlock_resource", shop_resource, -300, 
        {
            base_cost: 100000,
            value: global.resources.hematite
        }),
        fertilizer: build_shop_item("fertilizer", shop_resource, 0),
        leaf_marketing: build_shop_item("leaf_marketing", shop_resource, 10, 
        {
            cost_exp: 1.25,
            max_count: 0
        }),
        unlock_shardify_artifacts: 
        {
            index: 50,
            name: __("Unlock Shardify Artifacts"),
            description: __("Convert redundant Artifacts into Shards."),
            sprite: spr_resource_shards,
            cost: build_resource_cost(shop_resource, 100000),
            max_count: 1
        },
        shardify_increase_output: build_shop_item("shardify_increase_output", shop_resource, 51, 
        {
            base_cost: 100000,
            max_count: 5
        }),
        weapon_damage_upgrade: 
        {
            index: 100,
            name: __("Focused Tools"),
            description: sprintf(__("Increases upgraded tools blowing damage by %s."), number_format_percent(0.01)),
            sprite: spr_weapon_leaf_blower,
            cost_exp: 1.05,
            cost: build_resource_cost(shop_resource, 10000),
            max_count: 0,
            upgrade_attributes: 
            {
                weapon_damage_upgrade: 0.01
            },
            upgrade_attributes_apply_early: true
        },
        equipment_damage_upgrade: 
        {
            index: 200,
            name: __("Focused Equipment"),
            description: sprintf(__("Increases upgraded equipment blowing damage by %s."), number_format_percent(0.01)),
            sprite: spr_equip_armor,
            cost_exp: 1.05,
            cost: build_resource_cost(shop_resource, 10000),
            max_count: 0,
            upgrade_attributes: 
            {
                equipment_damage_upgrade: 0.01
            },
            upgrade_attributes_apply_early: true
        },
        pet_damage_upgrade: 
        {
            index: 300,
            name: __("Focused Pets"),
            description: sprintf(__("Increases upgraded pet blowing damage by %s."), number_format_percent(0.01)),
            sprite: spr_pet_dog,
            cost_exp: 1.05,
            cost: build_resource_cost(shop_resource, 10000),
            max_count: 0,
            upgrade_attributes: 
            {
                pet_damage_upgrade: 0.01
            },
            upgrade_attributes_apply_early: true
        },
        unique_damage_upgrade: 
        {
            index: 400,
            name: __("Focused Uniques"),
            description: sprintf(__("Increases upgraded Unique Leaves blowing damage by %s."), number_format_percent(0.01)),
            sprite: spr_leaf_unique_rainbow,
            cost_exp: 1.05,
            cost: build_resource_cost(shop_resource, 10000),
            max_count: 0,
            upgrade_attributes: 
            {
                unique_damage_upgrade: 0.01
            },
            upgrade_attributes_apply_early: true
        },
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 450, 
        {
            base_cost: 10000000000,
            max_count: 5
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
    };
}
