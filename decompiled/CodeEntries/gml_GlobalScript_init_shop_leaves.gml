function init_shop_leaves()
{
    global.shops_prestige_levels.environment = global.prestige_levels.none;
    global.shops_resources.environment = global.resources.leaves;
    global.shops.environment = 
    {
        gold_leaves: 
        {
            index: -1,
            name: __("Gold Leaves"),
            description: __("Trees can drop gold leaves."),
            sprite: spr_leaf_gold,
            cost: 
            {
                leaves: 10000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.gold.data.unlocked = true;
            }
        },
        tree: 
        {
            index: 0,
            name: __("Tree"),
            description: global.texts.tree,
            sprite: spr_tree,
            cost: 
            {
                leaves: 10
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
        fertilizer: 
        {
            index: 1,
            name: __("Fertilizer"),
            description: __("Leaves drop 1% faster per level."),
            sprite: spr_icon_fertilizer,
            cost: 
            {
                leaves: 10
            },
            max_count: 50
        },
        leaf_marketing: 
        {
            index: 2,
            name: __("Leaf Marketing"),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                leaves: 500
            },
            cost_exp: 5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    leaves: 1
                }
            },
            max_count: 0
        },
        auto_leaf_blower: 
        {
            index: 3,
            name: __("Auto Leaf Blower"),
            description: __("An automatic leaf blower also known as ALB."),
            sprite: spr_autoblower,
            cost: 
            {
                leaves: 200
            },
            cost_exp: 8,
            max_count: 3,
            
            func: function()
            {
                create_autoblower();
            }
        },
        nuclear_fuel: 
        {
            index: 4,
            name: __("Nuclear Fuel"),
            description: __("Add nuclear fuel into your tools for more blowing power."),
            sprite: spr_icon_nuclear,
            cost: 
            {
                leaves: 100
            },
            upgrade_attributes: 
            {
                nuclear_fuel: 1
            },
            max_count: 30
        }
    };
}
