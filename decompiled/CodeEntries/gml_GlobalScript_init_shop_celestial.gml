function init_shop_celestial()
{
    global.shops_prestige_levels.celestial = global.prestige_levels.blc;
    global.shops.celestial = 
    {
        unlock_mythical_leaves: 
        {
            index: -20,
            name: __s("Unlock %s", global.resources.mythical.name_plural),
            description: __("Shhh, don't talk about them."),
            sprite: spr_leaf_mythical,
            cost: 
            {
                celestial: 1000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.mythical.data.unlocked = true;
            }
        },
        alb_pickup_seeds: 
        {
            index: 0,
            name: __("ALBs Love Seeds"),
            sprite: spr_seed_leaf,
            description: __("Your ALBs can pick up seeds now. Make sure to maintain them, they've been so good to you."),
            cost: 
            {
                celestial: 5
            },
            max_count: 1,
            tag: global.shop_item_tags.farming
        },
        leaf_marketing: 
        {
            index: 1,
            name: __s("%s Marketing", global.resources.celestial.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                celestial: 200
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    celestial: 1
                }
            },
            max_count: 50
        },
        seed_marketing: 
        {
            index: 2,
            name: __s("%s Marketing", __("Celestial Seed")),
            description: __s("Increases %s spawn rate by %s per level.", __("Celestial Seed"), number_format_percent(0.01)),
            description_locked: __s("Unlocks after unlocking %s.", __s("%s Seeds", global.resources.celestial.name)),
            sprite: spr_icon_marketing,
            cost: 
            {
                celestial: 5000000000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                seed_spawn_chance_leaf: 
                {
                    celestial: 0.01
                }
            },
            max_count: 50,
            tag: global.shop_item_tags.farming,
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item(global.shops.farming.farming_celestial);
            }
        },
        enemy_drop_multiplier: build_shop_item("enemy_drop_multiplier", global.resources.celestial, 3, 
        {
            index: 3,
            name: __("Worthy Enemies"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_enemy_bee,
            cost: 
            {
                celestial: 100
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                enemy_drop_multiplier: 0.25
            },
            max_count: 0
        }),
        auto_leaf_blower_hit_damage: 
        {
            index: 20,
            name: __("ALB Hit Damage"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_autoblower,
            cost: 
            {
                celestial: 500
            },
            upgrade_attributes: 
            {
                alb_enemy_damage: 20
            },
            cost_exp: 4.5,
            max_count: 20
        },
        enemy_spawn_chance: 
        {
            index: 30,
            name: __("More Enemies, Please"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_marketing,
            cost: 
            {
                celestial: 5
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                enemy_spawn_chance: 1
            },
            max_count: 95
        },
        blc_value_adder_real: 
        {
            index: 101,
            name: __("Moar BLC"),
            sprite: spr_blc,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                celestial: 100000
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                blc_value_adder: 200
            },
            max_count: 50
        },
        combo_affects_celestial: 
        {
            index: 300,
            name: __("Celestial Combo"),
            description: __s("Combo affects %s rewards.", global.resources.celestial.name),
            sprite: spr_icon_combo,
            cost: 
            {
                celestial: 20000
            },
            upgrade_attributes: 
            {
                resources_leaf_special_upgrades: 
                {
                    celestial: 1
                }
            },
            max_count: 1,
            tag: global.shop_item_tags.combo
        },
        combo_max: 
        {
            index: 301,
            name: __("Max Combo"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_combo,
            cost: 
            {
                celestial: 500
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                combo_max: 5
            },
            max_count: 100,
            tag: global.shop_item_tags.combo
        },
        combo_rewards: 
        {
            index: 302,
            name: __("Combo Multiplier"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_combo,
            cost: 
            {
                celestial: 3000
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                combo_rewards: 0.5
            },
            max_count: 0,
            tag: global.shop_item_tags.combo
        },
        celestial_apples: 
        {
            index: 400,
            name: __s("Unlock %s", __("Celestial Apples")),
            description: __s("Eat some %s to get %s instantly.", __("Celestial Apples"), global.resources.celestial.name),
            sprite: spr_fruit,
            sprite_image_index: 7,
            cost: 
            {
                celestial: 100
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    celestial: true
                }
            }
        },
        celestial_offline: 
        {
            index: 500,
            name: __("Offline Celestials"),
            description: __s("%s can be earned offline. You also need to buy the %s upgrade in the %s to get %s offline. Time to sleep!", global.resources.celestial.name, __("Offline Enemies"), __("Mythical Shop"), global.resources.celestial.name),
            sprite: spr_leaf_celestial,
            cost: 
            {
                celestial: 50000
            },
            max_count: 1
        }
    };
}
