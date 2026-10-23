function init_shop_gold()
{
    global.shops_prestige_levels.gold = global.prestige_levels.none;
    global.shops_resources.gold = global.resources.gold;
    var shop_resource = global.resources.gold;
    global.shops.gold = 
    {
        platinum_leaves: 
        {
            index: -11,
            name: __("Platinum Leaves"),
            description: __("Trees can drop platinum leaves in certain areas which you have to unlock first."),
            sprite: spr_leaf_platinum,
            cost: 
            {
                gold: 10000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.platinum.data.unlocked = true;
            }
        },
        unlock_prestige: 
        {
            index: -10,
            name: __("Unlock Leaf Portal"),
            description: __("Unlocks the Leaf Portal where you can restart your leaf blowing adventure to gain coins."),
            sprite: spr_icon_portal,
            cost: 
            {
                gold: 300
            },
            max_count: 1
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
                gold: 10
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
            name: __("Golden Marketing"),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                gold: 500
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    gold: 1
                }
            },
            max_count: 5
        },
        auto_leaf_blower: 
        {
            index: 2,
            name: __("Auto Leaf Blower"),
            description: __("An automatic leaf blower also known as ALB."),
            sprite: spr_autoblower,
            cost: 
            {
                gold: 200
            },
            cost_exp: 6,
            max_count: 3,
            
            func: function()
            {
                create_autoblower();
            }
        },
        nuclear_fuel: 
        {
            index: 3,
            name: __("Nuclear Fuel"),
            description: __("Add nuclear fuel into your tools for more blowing power."),
            sprite: spr_icon_nuclear,
            cost: 
            {
                gold: 100
            },
            upgrade_attributes: 
            {
                nuclear_fuel: 1
            },
            max_count: 30
        },
        combo: 
        {
            index: 30,
            name: __("Leaf Combo"),
            description: __("Blow leaves away quickly to get more leaf rewards!"),
            sprite: spr_icon_combo,
            cost: 
            {
                gold: 500
            },
            max_count: 1,
            tag: global.shop_item_tags.combo
        },
        combo_max: 
        {
            index: 31,
            name: __("Max Combo"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_combo,
            cost: 
            {
                gold: 500
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                combo_max: 10
            },
            max_count: 100,
            tag: global.shop_item_tags.combo,
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.gold.combo);
            }
        },
        combo_rewards: 
        {
            index: 32,
            name: __("Combo Multiplier"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_combo,
            cost: 
            {
                gold: 1000
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                combo_rewards: 0.5
            },
            max_count: 0,
            tag: global.shop_item_tags.combo,
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.gold.combo);
            }
        },
        combo_duration: 
        {
            index: 33,
            name: __("Combo Duration"),
            description: __("Increases combo duration."),
            sprite: spr_icon_combo,
            cost: 
            {
                gold: 100
            },
            cost_exp: 2,
            max_count: 20,
            tag: global.shop_item_tags.combo,
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.gold.combo);
            }
        },
        gold_apples: 
        {
            index: 50,
            name: __("Unlock Gold Apples"),
            description: __("Eat some Gold Apples to get Gold Leaves instantly."),
            sprite: spr_fruit,
            sprite_image_index: 1,
            cost: 
            {
                gold: 50
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    gold: true
                }
            }
        }
    };
}
