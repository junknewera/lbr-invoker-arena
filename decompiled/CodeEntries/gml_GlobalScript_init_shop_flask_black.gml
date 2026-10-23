function init_shop_flask_black()
{
    global.shops_prestige_levels.flask_black = global.prestige_levels.none;
    global.shops.flask_black = 
    {
        unlock_big_crunch: 
        {
            index: -1000,
            name: __s("Unlock %s", __("Big Leaf Crunch")),
            description: __s("Unlocks %s, a new prestige layer.", __("Big Leaf Crunch")),
            sprite: spr_icon_portal_leaf_crunch,
            cost: 
            {
                flask_black: 1000
            },
            max_count: 1
        },
        unlock_flask_strange: 
        {
            index: -10,
            name: __s("Unlock %s", global.resources.flask_strange.name),
            sprite: spr_flask_strange,
            description: __s("Unlocks %s. It's not recommended to drink these.", global.resources.flask_strange.name),
            cost: 
            {
                flask_black: 10000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.flask_strange.data.unlocked = true;
            }
        },
        converter_reduce_resources: 
        {
            index: 0,
            name: __("Reduce Converter Resources"),
            description: __s("Reduces input resources for all converters by %s.", number_format_percent(0.01)),
            sprite: spr_icon_converters,
            cost: 
            {
                flask_black: 10
            },
            cost_exp: 2,
            max_count: 10,
            upgrade_attributes: 
            {
                converter_reduce_input_recources: 1
            }
        },
        converter_increase_batch_count: 
        {
            index: 1,
            name: __("Increase Converter Count"),
            description: __("Doubles the resource input/output count for all converters."),
            sprite: spr_icon_converters,
            cost: 
            {
                flask_black: 20
            },
            cost_exp: 2.5,
            max_count: 10,
            upgrade_attributes: 
            {
                converter_batch_count: 1
            }
        },
        converter_increase_output_count: 
        {
            index: 2,
            name: __("Increase Converter Output"),
            description: global.texts.converter_increase_output_count,
            sprite: spr_icon_converters,
            cost: 
            {
                flask_black: 20
            },
            cost_exp: 1.35,
            max_count: 100,
            upgrade_attributes: 
            {
                converter_output_add: 
                {
                    flask_black: 1
                }
            }
        },
        leaf_multiplier_all: 
        {
            index: 10,
            name: __("All Leaves++"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_leaf,
            cost: 
            {
                flask_black: 50
            },
            upgrade_attributes: 
            {
                leaf_multiplier: 0.2
            },
            max_count: 10
        },
        blc_science: build_shop_item("blc_science", global.resources.flask_black, 20),
        player_hp: build_shop_item("player_hp", global.resources.flask_black, 200),
        player_resistance: build_shop_item("player_resistance", global.resources.flask_black, 300, 
        {
            value: 6
        })
    };
}
