function init_shop_gem_leaves()
{
    global.shops_prestige_levels.gem_leaves = global.prestige_levels.mlc;
    global.shops.gem_leaves = 
    {
        combo_multiplier_multiplier: build_shop_item("combo_multiplier_multiplier", global.resources.amber, 100, 
        {
            base_cost: 25,
            value: 5,
            section: global.dialog_sections.gem_leaves_shop.amber
        }),
        leaf_marketing_amber: build_shop_item("leaf_marketing", global.resources.amber, 105, 
        {
            base_cost: 20,
            max_count: 0,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.amber
        }),
        leaf_combo_amber: build_shop_item("leaf_affect_combo", global.resources.amber, 106, 
        {
            base_cost: 500,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.amber
        }),
        blc_science_amber: build_shop_item("blc_science", global.resources.amber, 110, 
        {
            base_cost: 25,
            max_count: 0,
            value: 0.25,
            section: global.dialog_sections.gem_leaves_shop.amber
        }),
        master_of_mlc_amber: build_shop_item("master_of_mlc", global.resources.amber, 120, 
        {
            base_cost: 20,
            value: 0.01,
            max_count: 0,
            section: global.dialog_sections.gem_leaves_shop.amber
        }),
        craft_min_chance_amber: build_shop_item("craft_min_chance", global.resources.amber, 130, 
        {
            base_cost: 1500,
            max_count: 3,
            section: global.dialog_sections.gem_leaves_shop.amber
        }),
        material_storage_inc_amber: build_shop_item("material_storage_inc", global.resources.amber, 140, 
        {
            section: global.dialog_sections.gem_leaves_shop.amber
        }),
        critical_converters_crit_value: build_shop_item("critical_converters_crit_value", global.resources.amethyst, 200, 
        {
            base_cost: 15,
            value: 10,
            section: global.dialog_sections.gem_leaves_shop.amethyst
        }),
        leaf_marketing_amethyst: build_shop_item("leaf_marketing", global.resources.amethyst, 205, 
        {
            base_cost: 20,
            max_count: 0,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.amethyst
        }),
        leaf_combo_amethyst: build_shop_item("leaf_affect_combo", global.resources.amethyst, 206, 
        {
            base_cost: 500,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.amethyst
        }),
        blc_science_amethyst: build_shop_item("blc_science", global.resources.amethyst, 210, 
        {
            base_cost: 25,
            max_count: 0,
            value: 0.25,
            section: global.dialog_sections.gem_leaves_shop.amethyst
        }),
        master_of_mlc_amethyst: build_shop_item("master_of_mlc", global.resources.amethyst, 220, 
        {
            base_cost: 20,
            value: 0.01,
            max_count: 0,
            section: global.dialog_sections.gem_leaves_shop.amethyst
        }),
        craft_min_chance_amethyst: build_shop_item("craft_min_chance", global.resources.amethyst, 230, 
        {
            base_cost: 1500,
            max_count: 3,
            section: global.dialog_sections.gem_leaves_shop.amethyst
        }),
        material_storage_inc_amethyst: build_shop_item("material_storage_inc", global.resources.amethyst, 240, 
        {
            section: global.dialog_sections.gem_leaves_shop.amethyst
        }),
        offline_seeds: build_shop_item("offline_seeds", global.resources.emerald, 300, 
        {
            base_cost: 50,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.emerald
        }),
        leaf_marketing_emerald: build_shop_item("leaf_marketing", global.resources.emerald, 305, 
        {
            base_cost: 20,
            max_count: 0,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.emerald
        }),
        leaf_combo_emerald: build_shop_item("leaf_affect_combo", global.resources.emerald, 306, 
        {
            base_cost: 500,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.emerald
        }),
        blc_science_emerald: build_shop_item("blc_science", global.resources.emerald, 310, 
        {
            base_cost: 25,
            max_count: 0,
            value: 0.25,
            section: global.dialog_sections.gem_leaves_shop.emerald
        }),
        master_of_mlc_emerald: build_shop_item("master_of_mlc", global.resources.emerald, 320, 
        {
            base_cost: 20,
            value: 0.01,
            max_count: 0,
            section: global.dialog_sections.gem_leaves_shop.emerald
        }),
        craft_min_chance_emerald: build_shop_item("craft_min_chance", global.resources.emerald, 330, 
        {
            base_cost: 1500,
            max_count: 3,
            section: global.dialog_sections.gem_leaves_shop.emerald
        }),
        material_storage_inc_emerald: build_shop_item("material_storage_inc", global.resources.emerald, 340, 
        {
            section: global.dialog_sections.gem_leaves_shop.emerald
        }),
        blower_hit_damage_multiplier: build_shop_item("blower_hit_damage_multiplier", global.resources.kyanite, 400, 
        {
            base_cost: 35,
            value: 2,
            section: global.dialog_sections.gem_leaves_shop.kyanite,
            upgrade_key: "blower_enemy_damage_multiplier_gem_leaves"
        }),
        leaf_marketing_kyanite: build_shop_item("leaf_marketing", global.resources.kyanite, 405, 
        {
            base_cost: 20,
            max_count: 0,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.kyanite
        }),
        leaf_combo_kyanite: build_shop_item("leaf_affect_combo", global.resources.kyanite, 406, 
        {
            base_cost: 500,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.kyanite
        }),
        blc_science_kyanite: build_shop_item("blc_science", global.resources.kyanite, 410, 
        {
            base_cost: 25,
            max_count: 0,
            value: 0.25,
            section: global.dialog_sections.gem_leaves_shop.kyanite
        }),
        master_of_mlc_kyanite: build_shop_item("master_of_mlc", global.resources.kyanite, 420, 
        {
            base_cost: 20,
            value: 0.01,
            max_count: 0,
            section: global.dialog_sections.gem_leaves_shop.kyanite
        }),
        craft_min_chance_kyanite: build_shop_item("craft_min_chance", global.resources.kyanite, 430, 
        {
            base_cost: 1500,
            max_count: 3,
            section: global.dialog_sections.gem_leaves_shop.kyanite
        }),
        material_storage_inc_kyanite: build_shop_item("material_storage_inc", global.resources.kyanite, 440, 
        {
            section: global.dialog_sections.gem_leaves_shop.kyanite
        }),
        enemy_drop_multiplier: build_shop_item("enemy_drop_multiplier", global.resources.rhodonite, 500, 
        {
            base_cost: 20,
            value: 5,
            section: global.dialog_sections.gem_leaves_shop.rhodonite
        }),
        leaf_marketing_rhodonite: build_shop_item("leaf_marketing", global.resources.rhodonite, 505, 
        {
            base_cost: 20,
            max_count: 0,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.rhodonite
        }),
        leaf_combo_rhodonite: build_shop_item("leaf_affect_combo", global.resources.rhodonite, 506, 
        {
            base_cost: 500,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.rhodonite
        }),
        blc_science_rhodonite: build_shop_item("blc_science", global.resources.rhodonite, 510, 
        {
            base_cost: 25,
            max_count: 0,
            value: 0.25,
            section: global.dialog_sections.gem_leaves_shop.rhodonite
        }),
        master_of_mlc_rhodonite: build_shop_item("master_of_mlc", global.resources.rhodonite, 520, 
        {
            base_cost: 20,
            value: 0.01,
            max_count: 0,
            section: global.dialog_sections.gem_leaves_shop.rhodonite
        }),
        craft_min_chance_rhodonite: build_shop_item("craft_min_chance", global.resources.rhodonite, 530, 
        {
            base_cost: 1500,
            max_count: 3,
            section: global.dialog_sections.gem_leaves_shop.rhodonite
        }),
        material_storage_inc_rhodonite: build_shop_item("material_storage_inc", global.resources.rhodonite, 540, 
        {
            section: global.dialog_sections.gem_leaves_shop.rhodonite
        }),
        player_hp_multiplier: build_shop_item("player_hp_multiplier", global.resources.ruby, 600, 
        {
            base_cost: 40,
            max_count: 0,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.ruby
        }),
        leaf_marketing_ruby: build_shop_item("leaf_marketing", global.resources.ruby, 605, 
        {
            base_cost: 20,
            max_count: 0,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.ruby
        }),
        leaf_combo_ruby: build_shop_item("leaf_affect_combo", global.resources.ruby, 606, 
        {
            base_cost: 500,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.ruby
        }),
        blc_science_ruby: build_shop_item("blc_science", global.resources.ruby, 610, 
        {
            base_cost: 25,
            max_count: 0,
            value: 0.25,
            section: global.dialog_sections.gem_leaves_shop.ruby
        }),
        master_of_mlc_ruby: build_shop_item("master_of_mlc", global.resources.ruby, 620, 
        {
            base_cost: 20,
            value: 0.01,
            max_count: 0,
            section: global.dialog_sections.gem_leaves_shop.ruby
        }),
        craft_min_chance_ruby: build_shop_item("craft_min_chance", global.resources.ruby, 630, 
        {
            base_cost: 1500,
            max_count: 3,
            section: global.dialog_sections.gem_leaves_shop.ruby
        }),
        material_storage_inc_ruby: build_shop_item("material_storage_inc", global.resources.ruby, 640, 
        {
            section: global.dialog_sections.gem_leaves_shop.ruby
        }),
        seed_spawn_count: build_shop_item("seed_spawn_count", global.resources.tektite, 700, 
        {
            base_cost: 250,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.tektite
        }),
        leaf_marketing_tektite: build_shop_item("leaf_marketing", global.resources.tektite, 705, 
        {
            base_cost: 20,
            max_count: 0,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.tektite
        }),
        leaf_combo_tektite: build_shop_item("leaf_affect_combo", global.resources.tektite, 706, 
        {
            base_cost: 500,
            value: 1,
            section: global.dialog_sections.gem_leaves_shop.tektite
        }),
        blc_science_tektite: build_shop_item("blc_science", global.resources.tektite, 710, 
        {
            base_cost: 25,
            max_count: 0,
            value: 0.25,
            section: global.dialog_sections.gem_leaves_shop.tektite
        }),
        master_of_mlc_tektite: build_shop_item("master_of_mlc", global.resources.tektite, 720, 
        {
            base_cost: 20,
            value: 0.01,
            max_count: 0,
            section: global.dialog_sections.gem_leaves_shop.tektite
        }),
        craft_min_chance_tektite: build_shop_item("craft_min_chance", global.resources.tektite, 730, 
        {
            base_cost: 1500,
            max_count: 3,
            section: global.dialog_sections.gem_leaves_shop.tektite
        }),
        material_storage_inc_tektite: build_shop_item("material_storage_inc", global.resources.tektite, 740, 
        {
            section: global.dialog_sections.gem_leaves_shop.tektite
        })
    };
}
