function init_shop_bismuth()
{
    global.shops_prestige_levels.bismuth = global.prestige_levels.none;
    global.shops_resources.bismuth = global.resources.bismuth;
    var shop_resource = global.resources.bismuth;
    global.shops.bismuth = 
    {
        cosmic_leaves: 
        {
            index: -10,
            name: __("Cosmic Leaves"),
            description: __("Trees can drop cosmic leaves in certain areas."),
            sprite: spr_leaf_cosmic,
            cost: 
            {
                bismuth: 10000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.cosmic.data.unlocked = true;
            }
        },
        tree: 
        {
            index: -1,
            name: __("Tree"),
            description: global.texts.tree,
            sprite: spr_tree,
            upgrade_attributes: 
            {
                trees: 1
            },
            cost: 
            {
                bismuth: 10
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
            name: __("Bismuth Marketing"),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                bismuth: 500
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    bismuth: 1
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
                bismuth: 100
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
                bismuth: 200
            },
            cost_exp: 6,
            max_count: 3,
            
            func: function()
            {
                create_autoblower();
            }
        },
        auto_leaf_blower_can_hit_enemy: 
        {
            index: 21,
            name: __("ALB Enemy Bumper"),
            description: __("All ALBs can bump into enemies to damage them. Ouch."),
            sprite: spr_autoblower,
            cost: 
            {
                bismuth: 500
            },
            max_count: 1
        },
        auto_leaf_blower_hit_damage: 
        {
            index: 22,
            name: __("ALB Hit Damage"),
            description: __("Increases the hit damage when ALBs bump into enemies by +4. Double ouch!"),
            sprite: spr_autoblower,
            cost: 
            {
                bismuth: 75
            },
            upgrade_attributes: 
            {
                alb_enemy_damage: 4
            },
            cost_exp: 5,
            max_count: 80
        },
        auto_leaf_blower_damage: 
        {
            index: 23,
            name: __("ALB Blowing Power"),
            description: __("Increases the blowing power of all ALBs."),
            sprite: spr_autoblower,
            cost: 
            {
                bismuth: 100
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
        bismuth_apples: 
        {
            index: 50,
            name: __("Unlock Bismuth Apples"),
            description: __("Eat some Bismuth Apples to get bismuth leaves instantly."),
            sprite: spr_fruit,
            sprite_image_index: 3,
            cost: 
            {
                bismuth: 50
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    bismuth: true
                }
            }
        }
    };
}
