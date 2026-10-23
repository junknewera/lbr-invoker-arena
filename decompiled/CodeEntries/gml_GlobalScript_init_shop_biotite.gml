function init_shop_biotite()
{
    global.shops_prestige_levels.biotite = global.prestige_levels.mlc;
    var shop_resource = global.resources.biotite;
    global.shops.biotite = 
    {
        unlock_resource_malachite: build_shop_item("unlock_resource", shop_resource, 0, 
        {
            base_cost: 10000000000,
            value: global.resources.malachite
        }),
        fertilizer: build_shop_item("fertilizer", shop_resource, 10),
        leaf_marketing: build_shop_item("leaf_marketing", shop_resource, 20, 
        {
            cost_exp: 1.25,
            max_count: 0
        }),
        material_storage_inc: build_shop_item("material_storage_inc", shop_resource, 30, 
        {
            base_cost: 500,
            cost_exp: 1.5,
            max_count: 50,
            value: 50,
            upgrade_attribute_key: "material_spawn_chance_multiplier_gems"
        }),
        tower_floor: build_shop_item("more_tower_floors", shop_resource, 40, 
        {
            base_cost: 500,
            cost_exp: 1.5,
            max_count: 0,
            value: 50
        }),
        more_tower_floors_pct: build_shop_item("more_tower_floors_pct", shop_resource, 41, 
        {
            base_cost: 2500,
            cost_exp: 2,
            max_count: 50,
            value: 0.01
        }),
        weapon_max_upgrade_level: build_shop_item("weapon_max_upgrade_level", shop_resource, 100, 
        {
            base_cost: 10000,
            cost_exp: 1.5,
            max_count: 50
        }),
        equipment_max_upgrade_level: build_shop_item("equipment_max_upgrade_level", shop_resource, 200, 
        {
            base_cost: 10000,
            cost_exp: 1.5,
            max_count: 50
        }),
        pet_max_upgrade_level: build_shop_item("pet_max_upgrade_level", shop_resource, 300, 
        {
            base_cost: 10000,
            cost_exp: 1.5,
            max_count: 50
        }),
        unique_max_upgrade_level: build_shop_item("unique_max_upgrade_level", shop_resource, 400, 
        {
            base_cost: 10000,
            cost_exp: 1.5,
            max_count: 50
        }),
        craft_min_chance: build_shop_item("craft_min_chance", shop_resource, 450, 
        {
            base_cost: 10000000000,
            max_count: 2
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
