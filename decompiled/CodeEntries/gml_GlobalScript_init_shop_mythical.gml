function init_shop_mythical()
{
    global.shops_prestige_levels.mythical = global.prestige_levels.blc;
    var shop_resource = global.resources.mythical;
    global.shops.mythical = 
    {
        unlock_lava_leaves: 
        {
            index: -20,
            name: __s("Unlock %s", global.resources.lava.name_plural),
            description: __s("These leaves are around %s degrees Celsius hot.", "800-1200"),
            sprite: spr_leaf_lava,
            cost: 
            {
                mythical: 10000000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.lava.data.unlocked = true;
            }
        },
        fertilizer: build_shop_item("fertilizer", shop_resource, 1, 
        {
            base_cost: 100,
            max_count: 50
        }),
        leaf_marketing: 
        {
            index: 2,
            name: __s("%s Marketing", global.resources.mythical.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                mythical: 3000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    mythical: 1
                }
            },
            max_count: 50
        },
        nuclear_fuel: 
        {
            index: 3,
            name: __("Nuclear Fuel"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_nuclear,
            cost: 
            {
                mythical: 1000
            },
            upgrade_attributes: 
            {
                nuclear_fuel: 1
            },
            max_count: 300
        },
        auto_leaf_blower_damage: 
        {
            index: 23,
            name: __("ALB Blowing Power"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_autoblower,
            cost: 
            {
                mythical: 20000
            },
            cost_exp: 1.5,
            max_count: 50,
            upgrade_attributes: 
            {
                alb_blowing_power: 20
            },
            
            func: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            }
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
                mythical: 500000
            },
            cost_exp: 2.5,
            upgrade_attributes: 
            {
                blc_value_adder: 500
            },
            max_count: 50
        },
        player_hp: 
        {
            index: 200,
            name: __("Player HP"),
            sprite: spr_icon_heart,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                mythical: 50000000
            },
            cost_exp: 2.5,
            upgrade_attributes: 
            {
                player_hp: 1
            },
            max_count: 50
        },
        player_hp_fruit: 
        {
            index: 201,
            name: __("Healthy Fruits"),
            sprite: spr_fruit,
            description: __s("Fruits regenerate your HP by %s per level.", 1),
            cost: 
            {
                mythical: 20000000000
            },
            upgrade_attributes: 
            {
                player_hp: 1
            },
            max_count: 20
        },
        enemy_offline_rewards: 
        {
            index: 300,
            name: __("Offline Enemies"),
            sprite: spr_enemy_bee,
            description: __s("Enemy rewards will be added to offline earnings by %s per level. Poor enemies.", number_format_percent(0.001)),
            cost: 
            {
                mythical: 100000000
            },
            cost_exp: 3,
            max_count: 30
        },
        printer_printer: build_shop_item("printer_printer", global.resources.mythical, 350, 
        {
            value: 1
        }),
        mythical_apples: 
        {
            index: 400,
            name: __s("Unlock %s", __("Mythical Apples")),
            description: __s("Eat some %s to get %s instantly.", __("Mythical Apples"), global.resources.mythical.name_plural),
            sprite: spr_fruit,
            sprite_image_index: 8,
            cost: 
            {
                mythical: 1000
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    mythical: true
                }
            }
        }
    };
}
