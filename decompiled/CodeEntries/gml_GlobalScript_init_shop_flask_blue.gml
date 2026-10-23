function init_shop_flask_blue()
{
    global.shops_prestige_levels.flask_blue = global.prestige_levels.none;
    global.shops.flask_blue = 
    {
        unlock_flask_magenta: 
        {
            index: -10,
            name: __s("Unlock %s", global.resources.flask_magenta.name),
            description: __s("%s can be used for science research.", global.resources.flask_magenta.name),
            sprite: spr_flask_magenta,
            cost: 
            {
                flask_blue: 1000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.flask_magenta.data.unlocked = true;
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
                flask_blue: 10
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
                flask_blue: 20
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
                flask_blue: 20
            },
            cost_exp: 1.2,
            max_count: 100,
            upgrade_attributes: 
            {
                converter_output_add: 
                {
                    flask_blue: 1
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
                flask_blue: 50
            },
            upgrade_attributes: 
            {
                leaf_multiplier: 0.2
            },
            max_count: 10
        },
        blc_science: build_shop_item("blc_science", global.resources.flask_blue, 20),
        player_hp: build_shop_item("player_hp", global.resources.flask_blue, 200),
        player_resistance: build_shop_item("player_resistance", global.resources.flask_blue, 300, 
        {
            value: 3
        })
    };
}
