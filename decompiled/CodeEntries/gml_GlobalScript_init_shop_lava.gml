function init_shop_lava()
{
    global.shops_prestige_levels.lava = global.prestige_levels.blc;
    var shop_resource = global.resources.lava;
    global.shops.lava = 
    {
        unlock_ice_leaves: 
        {
            index: -20,
            name: __s("Unlock %s", global.resources.ice.name_plural),
            description: __("Frozen Leaves CAN hurt, you know."),
            sprite: spr_leaf_ice,
            cost: 
            {
                lava: 10000000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.ice.data.unlocked = true;
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
            name: __s("%s Marketing", global.resources.lava.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                lava: 3000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    lava: 1
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
                lava: 100
            },
            upgrade_attributes: 
            {
                nuclear_fuel: 1
            },
            max_count: 50
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
                lava: 1000
            },
            cost_exp: 1.5,
            max_count: 50,
            upgrade_attributes: 
            {
                alb_blowing_power: 40
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
                lava: 500000
            },
            cost_exp: 2.5,
            upgrade_attributes: 
            {
                blc_value_adder: 600
            },
            max_count: 50
        },
        celestials_multiplier: 
        {
            index: 150,
            name: __s("More %s", global.resources.celestial.name_plural),
            sprite: spr_leaf_celestial,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                lava: 2000
            },
            cost_exp: 2,
            max_count: 50,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    celestial: 100
                }
            }
        },
        fruit_value: 
        {
            index: 175,
            name: __("Mega Fruits"),
            sprite: spr_fruit,
            sprite_image_index: 0,
            description: __s("Fruits are mega fruity. Increases fruit rewards by %s.", number_format_percent(100)),
            cost: 
            {
                lava: 500
            },
            cost_exp: 2.5,
            upgrade_attributes: 
            {
                fruit_value: 100
            },
            max_count: 30
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
                lava: 25000
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                player_hp: 5
            },
            max_count: 50
        },
        player_hp_reg: 
        {
            index: 201,
            name: __("Player HP Regeneration"),
            sprite: spr_icon_heart,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                lava: 100000
            },
            cost_exp: 4,
            upgrade_attributes: 
            {
                player_hp_reg: 1
            },
            max_count: 50
        },
        fruit_offline_rewards: 
        {
            index: 300,
            name: __("Offline Fruits"),
            sprite: spr_fruit,
            description: __s("Fruit rewards will be added to offline earnings by %s per level. Hello, Fruit Gang!", number_format_percent(0.001)),
            cost: 
            {
                lava: 100000000
            },
            cost_exp: 3,
            max_count: 30
        },
        printer_printer: build_shop_item("printer_printer", global.resources.lava, 350, 
        {
            value: 2
        }),
        lava_apples: 
        {
            index: 400,
            name: __s("Unlock %s", __("Lava Apples")),
            description: __s("Eat some %s to get %s instantly.", __("Lava Apples"), global.resources.lava.name_plural),
            sprite: spr_fruit,
            sprite_image_index: 9,
            cost: 
            {
                lava: 1000
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    lava: true
                }
            }
        }
    };
}
