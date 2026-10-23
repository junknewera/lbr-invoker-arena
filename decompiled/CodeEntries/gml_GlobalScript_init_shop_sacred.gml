function init_shop_sacred()
{
    var shop_resource = global.resources.sacred;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.mlc);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        unlock_relics: build_shop_item("unlock_relics", shop_resource, 0, 
        {
            index: 100,
            name: __s("Unlock %s", __("Relics")),
            sprite: spr_relic_uncommon,
            description: __("Leaf Relics are almost as old as the universe. Relics boost your blowing damage by an overwhelming amount, but they require Leafscended Leaves to be effective."),
            cost: build_resource_cost(shop_resource, 2500),
            max_count: 1,
            refresh_section: "relics"
        }),
        relic_spawn_chance: build_shop_item("relic_spawn_chance", shop_resource, 105),
        fertilizer: build_shop_item("fertilizer", shop_resource, 200),
        leaf_marketing: build_shop_item("leaf_marketing", shop_resource, 300, 
        {
            cost_exp: 16
        }),
        crafting_backpack_size: build_shop_item("crafting_backpack_size", shop_resource, 400, 
        {
            base_cost: 150000,
            max_count: 5
        }),
        alchemy_brew_crit_chance: build_shop_item("alchemy_brew_crit_chance", shop_resource, 800, 
        {
            base_cost: 375000,
            value: 0.005
        }),
        alchemy_brew_time_reduction: build_shop_item("alchemy_brew_time_reduction", shop_resource, 810, 
        {
            base_cost: 250000,
            value: 0.01
        }),
        leafscender_autouse: 
        {
            index: 900,
            name: __("Leafscension Bot"),
            sprite: spr_icon_leafscension,
            description: __("This bot enables automatic leafscension. Good bot!"),
            cost: build_resource_cost(shop_resource, 1000),
            max_count: 1
        },
        leafscender_decrease_input_cost: build_shop_item("leafscender_decrease_input_cost", shop_resource, 910, 
        {
            base_cost: 750000,
            cost_exp: 64,
            max_count: 3,
            value: 1
        }),
        cards_enemy_drop_chance: build_shop_item("cards_enemy_drop_chance", shop_resource, 950, 
        {
            base_cost: 500000,
            cost_exp: 8,
            max_count: 5,
            value: 0.0002
        }),
        card_parts_drop_chance: build_shop_item("card_parts_drop_chance", shop_resource, 960, 
        {
            base_cost: 125000,
            cost_exp: 4,
            max_count: 5,
            value: 0.0005
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 965, 
        {
            base_cost: 1000000,
            cost_exp: 3,
            max_count: 10,
            value: 1
        }),
        trade_gems_max_value: build_shop_item("trade_gems_max_value", shop_resource, 970, 
        {
            base_cost: 10000000,
            max_count: 1,
            value: 1
        }),
        unlock_seed_ancient: build_shop_item("unlock_seed", shop_resource, 1050, 
        {
            base_cost: 100000000,
            resource: global.resources.ancient
        }),
        unlock_seed_amber: build_shop_item("unlock_seed", shop_resource, 1150, 
        {
            base_cost: 100000000,
            resource: global.resources.amber
        }),
        unlock_seed_amethyst: build_shop_item("unlock_seed", shop_resource, 1250, 
        {
            base_cost: 100000000,
            resource: global.resources.amethyst
        }),
        unlock_seed_emerald: build_shop_item("unlock_seed", shop_resource, 1350, 
        {
            base_cost: 100000000,
            resource: global.resources.emerald
        }),
        unlock_seed_kyanite: build_shop_item("unlock_seed", shop_resource, 1450, 
        {
            base_cost: 100000000,
            resource: global.resources.kyanite
        }),
        unlock_seed_rhodonite: build_shop_item("unlock_seed", shop_resource, 1550, 
        {
            base_cost: 100000000,
            resource: global.resources.rhodonite
        }),
        unlock_seed_ruby: build_shop_item("unlock_seed", shop_resource, 1650, 
        {
            base_cost: 100000000,
            resource: global.resources.ruby
        }),
        unlock_seed_tektite: build_shop_item("unlock_seed", shop_resource, 1750, 
        {
            base_cost: 100000000,
            resource: global.resources.tektite
        }),
        unlock_seed_mulch: build_shop_item("unlock_seed", shop_resource, 1850, 
        {
            base_cost: 100000000,
            name: __s("Unlock %s", __("Meeds")),
            resource: global.resources.mulch
        })
    });
}
