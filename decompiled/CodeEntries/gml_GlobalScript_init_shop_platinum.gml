function init_shop_platinum()
{
    var shop_resource = global.resources.platinum;
    global.shops_prestige_levels.platinum = global.prestige_levels.none;
    global.shops_resources.platinum = global.resources.platinum;
    global.shops.platinum = 
    {
        bismuth_leaves: 
        {
            index: -10,
            name: __("Bismuth Leaves"),
            description: __("Trees can drop bismuth leaves in certain areas."),
            sprite: spr_leaf_bismuth,
            cost: 
            {
                platinum: 10000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.bismuth.data.unlocked = true;
            }
        },
        tree: 
        {
            index: -1,
            name: __("Tree"),
            description: global.texts.tree,
            sprite: spr_tree,
            cost: 
            {
                platinum: 10
            },
            upgrade_attributes: 
            {
                trees: 1
            },
            max_count: 30,
            
            func: function()
            {
                with (o_trees)
                {
                    add_tree();
                }
            }
        },
        fertilizer: build_shop_item("fertilizer", shop_resource, 0, 
        {
            base_cost: 10,
            max_count: 50
        }),
        leaf_marketing: 
        {
            index: 1,
            name: __("Platinum Marketing"),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                platinum: 500
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    platinum: 1
                }
            },
            max_count: 5
        },
        nuclear_fuel: 
        {
            index: 3,
            name: __("Nuclear Fuel"),
            description: __("Add nuclear fuel into your tools for more blowing power."),
            sprite: spr_icon_nuclear,
            cost: 
            {
                platinum: 100
            },
            upgrade_attributes: 
            {
                nuclear_fuel: 1
            },
            max_count: 30
        },
        auto_leaf_blower: 
        {
            index: 20,
            name: __("Auto Leaf Blower"),
            description: __("An automatic leaf blower also known as ALB."),
            sprite: spr_autoblower,
            cost: 
            {
                platinum: 200
            },
            cost_exp: 6,
            max_count: 3,
            
            func: function()
            {
                create_autoblower();
            }
        },
        auto_leaf_blower_speed: 
        {
            index: 21,
            name: __("ALB Speed"),
            description: __("Increases the speed of all ALBs."),
            sprite: spr_autoblower,
            cost: 
            {
                platinum: 100
            },
            cost_exp: 1.5,
            max_count: 5,
            
            func: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            },
            
            upgrade_attributes: 
            {
                alb_speed: 0.5
            }
        },
        auto_leaf_blower_damage: 
        {
            index: 22,
            name: __("ALB Blowing Power"),
            description: __("Increases the blowing power of all ALBs."),
            sprite: spr_autoblower,
            cost: 
            {
                platinum: 100
            },
            cost_exp: 1.5,
            max_count: 20,
            upgrade_attributes: 
            {
                alb_blowing_power: 2
            },
            
            func: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            }
        },
        auto_leaf_blower_battery_capacity: 
        {
            index: 23,
            name: __("ALB Battery Capacity"),
            description: __("Increases the battery capacity of all ALBs."),
            sprite: spr_autoblower,
            cost: 
            {
                platinum: 100
            },
            cost_exp: 1.5,
            max_count: 10,
            
            func: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            },
            
            upgrade_attributes: 
            {
                alb_battery_capacity: 0.5
            }
        },
        auto_leaf_blower_battery_charge_rate: 
        {
            index: 24,
            name: __("ALB Battery Charge Rate"),
            description: __("Increases the battery charging rate of all ALBs."),
            sprite: spr_autoblower,
            cost: 
            {
                platinum: 100
            },
            cost_exp: 1.5,
            max_count: 10,
            
            func: function()
            {
                with (o_autoblower)
                {
                    init();
                }
            },
            
            upgrade_attributes: 
            {
                alb_battery_charge_rate: 0.5
            }
        },
        platinum_apples: 
        {
            index: 50,
            name: __("Unlock Platinum Apples"),
            description: __("Eat some Platinum Apples to get platinum leaves instantly."),
            sprite: spr_fruit,
            sprite_image_index: 2,
            cost: 
            {
                platinum: 50
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    platinum: true
                }
            }
        },
        slap_multiplier: build_shop_item("slap_multiplier", shop_resource, 100)
    };
}
