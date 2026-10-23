function init_shop_ice()
{
    global.shops_prestige_levels.ice = global.prestige_levels.blc;
    var shop_resource = global.resources.ice;
    global.shops.ice = 
    {
        unlock_obsidian_leaves: 
        {
            index: -20,
            name: __s("Unlock %s", global.resources.obsidian.name_plural),
            description: __("Obsidian leaves only spawn when Lava and Ice leaves collide under high pressure."),
            sprite: spr_leaf_obsidian,
            cost: 
            {
                ice: 10000000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.obsidian.data.unlocked = true;
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
            name: __s("%s Marketing", global.resources.ice.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                ice: 3000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    ice: 1
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
                ice: 100
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
                ice: 1000
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
                ice: 500000
            },
            cost_exp: 2.5,
            upgrade_attributes: 
            {
                blc_value_adder: 1000
            },
            max_count: 50
        },
        celestials_multiplier: 
        {
            index: 150,
            name: __("More Celestial Leaves"),
            sprite: spr_leaf_celestial,
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            cost: 
            {
                ice: 2000
            },
            cost_exp: 2,
            max_count: 0,
            upgrade_attributes: 
            {
                resources_multiplier: 
                {
                    celestial: 500
                }
            }
        },
        fruit_value: 
        {
            index: 175,
            name: __("Mega Fruits"),
            sprite: spr_fruit,
            sprite_image_index: 0,
            description: __s("Fruits are mega fruity. Increases fruit rewards by %s.", number_format_percent(500)),
            cost: 
            {
                ice: 500
            },
            cost_exp: 2.5,
            upgrade_attributes: 
            {
                fruit_value: 500
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
                ice: 25000
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
                ice: 100000
            },
            cost_exp: 4,
            upgrade_attributes: 
            {
                player_hp_reg: 1
            },
            max_count: 50
        },
        printer_printer: build_shop_item("printer_printer", global.resources.ice, 350, 
        {
            value: 3
        }),
        ice_apples: 
        {
            index: 400,
            name: __s("Unlock %s", __("Ice Apples")),
            description: __s("Eat some %s to get %s instantly.", __("Ice Apples"), global.resources.ice.name_plural),
            sprite: spr_fruit,
            sprite_image_index: 10,
            cost: 
            {
                ice: 1000
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    ice: true
                }
            }
        }
    };
}
