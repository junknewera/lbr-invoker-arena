function init_shop_dice()
{
    var shop_resource = global.resources.dice;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.inf);
    global.shops.dice = 
    {
        unlock_azurite_leaves: 
        {
            index: 0,
            name: __s("Unlock %s", global.resources.azurite.name_plural),
            description: __(""),
            sprite: spr_leaf_azurite,
            cost: 
            {
                dice: 1000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.azurite.data.unlocked = true;
            }
        },
        unlock_niobium_leaves: 
        {
            index: 1,
            name: __s("Unlock %s", global.resources.niobium.name_plural),
            description: __(""),
            sprite: spr_leaf_niobium,
            cost: 
            {
                dice: 25000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.niobium.data.unlocked = true;
            }
        },
        dice_count: build_shop_item("dice_count", shop_resource, 5, 
        {
            base_cost: 75,
            cost_exp: 4,
            max_count: 10,
            value: 1
        }),
        dice_sides: build_shop_item("dice_sides", shop_resource, 6, 
        {
            base_cost: 25,
            cost_exp: 3,
            max_count: 10,
            value: 1
        }),
        dice_inventory_size: build_shop_item("dice_inventory_size", shop_resource, 10, 
        {
            base_cost: 150,
            cost_exp: 4,
            max_count: 5,
            value: 1
        }),
        dice_backpack_size: build_shop_item("dice_backpack_size", shop_resource, 11, 
        {
            base_cost: 75,
            cost_exp: 2,
            max_count: 5,
            value: 1
        }),
        dice_timeout_reduction: build_shop_item("dice_timeout_reduction", shop_resource, 13, 
        {
            base_cost: 50,
            cost_exp: 3,
            max_count: 10,
            value: 0.5
        }),
        dice_battlefield_roll_timeout_reduction: build_shop_item("dice_battlefield_roll_timeout_reduction", shop_resource, 14, 
        {
            base_cost: 50,
            cost_exp: 3,
            max_count: 10,
            value: 0.5
        }),
        unlock_converter_azurite_dice: build_shop_item("unlock_converter", global.resources.azurite, 98, 
        {
            base_cost: 25000,
            value: global.converters.convert_azurite_dice.key
        }),
        unlock_converter_azurite_power_dice: build_shop_item("unlock_converter", global.resources.azurite, 99, 
        {
            base_cost: 1000000,
            value: global.converters.convert_azurite_power_dice.key
        }),
        dice_count_azurite: build_shop_item("dice_count", global.resources.azurite, 100, 
        {
            base_cost: 5000,
            cost_exp: 4,
            max_count: 5,
            value: 1
        }),
        dice_sides_azurite: build_shop_item("dice_sides", global.resources.azurite, 101, 
        {
            base_cost: 2500,
            cost_exp: 3,
            max_count: 5,
            value: 1
        }),
        dice_inventory_size_azurite: build_shop_item("dice_inventory_size", global.resources.azurite, 102, 
        {
            base_cost: 5000,
            cost_exp: 4,
            max_count: 5,
            value: 1
        }),
        dice_timeout_reduction_azurite: build_shop_item("dice_timeout_reduction", global.resources.azurite, 103, 
        {
            base_cost: 500,
            cost_exp: 3,
            max_count: 10,
            value: 0.5
        }),
        dice_battlefield_roll_timeout_reduction_azurite: build_shop_item("dice_battlefield_roll_timeout_reduction", global.resources.azurite, 104, 
        {
            base_cost: 500,
            cost_exp: 3,
            max_count: 10,
            value: 0.5
        }),
        mirror_efficiency_azurite: build_shop_item("mirror_efficiency", global.resources.azurite, 110, 
        {
            base_cost: 50000,
            max_count: 1,
            value: 0.1
        }),
        unlock_converter_niobium_dice: build_shop_item("unlock_converter", global.resources.niobium, 198, 
        {
            base_cost: 25000,
            value: global.converters.convert_niobium_dice.key
        }),
        unlock_converter_niobium_power_dice: build_shop_item("unlock_converter", global.resources.niobium, 199, 
        {
            base_cost: 1000000,
            value: global.converters.convert_niobium_power_dice.key
        }),
        dice_count_niobium: build_shop_item("dice_count", global.resources.niobium, 200, 
        {
            base_cost: 5000,
            cost_exp: 4,
            max_count: 5,
            value: 1
        }),
        dice_sides_niobium: build_shop_item("dice_sides", global.resources.niobium, 201, 
        {
            base_cost: 2500,
            cost_exp: 3,
            max_count: 5,
            value: 1
        }),
        dice_inventory_size_niobium: build_shop_item("dice_inventory_size", global.resources.niobium, 202, 
        {
            base_cost: 5000,
            cost_exp: 4,
            max_count: 5,
            value: 1
        }),
        dice_timeout_reduction_niobium: build_shop_item("dice_timeout_reduction", global.resources.niobium, 203, 
        {
            base_cost: 500,
            cost_exp: 3,
            max_count: 10,
            value: 0.5
        }),
        dice_battlefield_roll_timeout_reduction_niobium: build_shop_item("dice_battlefield_roll_timeout_reduction", global.resources.niobium, 204, 
        {
            base_cost: 500,
            cost_exp: 3,
            max_count: 10,
            value: 0.5
        }),
        mirror_efficiency_niobium: build_shop_item("mirror_efficiency", global.resources.niobium, 210, 
        {
            base_cost: 50000,
            max_count: 1,
            value: 0.1
        }),
        trade_gems_max_value: build_shop_item("trade_gems_max_value", shop_resource, 4000, 
        {
            base_cost: 50000,
            max_count: 1,
            value: 1
        })
    };
}
