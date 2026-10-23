function init_shop_exotic()
{
    global.shops_prestige_levels.exotic = global.prestige_levels.none;
    global.shops_resources.exotic = global.resources.exotic;
    var shop_resource = global.resources.exotic;
    global.shops.exotic = 
    {
        unlock_celestial_leaves: 
        {
            index: -20,
            name: __("Unlock Celestial Leaves"),
            description: __("Celestial Leaves can't be blown away, they have to be earned."),
            sprite: spr_leaf_celestial,
            cost: 
            {
                exotic: 100000000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.celestial.data.unlocked = true;
            }
        },
        unlock_farming: 
        {
            index: -10,
            name: __("Buy Farming Certificate"),
            description: __("With this certificate, you're an official farmer now."),
            sprite: spr_icon_farming,
            cost: 
            {
                exotic: 10000
            },
            max_count: 1,
            tag: global.shop_item_tags.farming
        },
        fertilizer: build_shop_item("fertilizer", shop_resource, 0, 
        {
            base_cost: 10,
            max_count: 50
        }),
        leaf_marketing: 
        {
            index: 1,
            name: __("Exotic Marketing"),
            description: __("Receive more rewarded leaves by using exotic marketing techniques."),
            sprite: spr_icon_marketing,
            cost: 
            {
                exotic: 500
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    exotic: 1
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
                exotic: 100
            },
            upgrade_attributes: 
            {
                nuclear_fuel: 1
            },
            max_count: 30
        },
        blc_value_adder: 
        {
            index: 100,
            name: __("BLC++"),
            sprite: spr_blc,
            description: __("+200% BLC Coins rewards per level. THANKS, EXOTIC LEAVES."),
            cost: 
            {
                exotic: 10000
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                blc_value_multiplier: 2
            },
            max_count: 10
        },
        blc_value_adder_real: 
        {
            index: 101,
            name: __("Moar BLC"),
            sprite: spr_blc,
            description: __("Increases BLC Coins rewards by +100 per level. Nice."),
            cost: 
            {
                exotic: 100000
            },
            cost_exp: 2,
            upgrade_attributes: 
            {
                blc_value_adder: 100
            },
            max_count: 50
        },
        exotic_apples: 
        {
            index: 200,
            name: __("Unlock Exotic Apples"),
            description: __("Eat some Exotic Apples to get Exotic Leaves instantly."),
            sprite: spr_fruit,
            sprite_image_index: 6,
            cost: 
            {
                exotic: 50
            },
            max_count: 1,
            upgrade_attributes: 
            {
                fruit_unlocked: 
                {
                    exotic: true
                }
            }
        }
    };
}
