function init_shop_flask_strange()
{
    global.shops_prestige_levels.flask_strange = global.prestige_levels.none;
    global.shops.flask_strange = 
    {
        unlock_exotic_leaves: 
        {
            index: -10,
            name: __("Exotic Leaves"),
            description: __("Trees can drop exotic leaves in certain areas."),
            sprite: spr_leaf_exotic,
            cost: 
            {
                flask_strange: 100000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.exotic.data.unlocked = true;
            }
        },
        converter_reduce_resources: 
        {
            index: 0,
            name: __("Reduce Converter Resources"),
            description: __("Reduces input resources for all converters by 1%."),
            sprite: spr_icon_converters,
            cost: 
            {
                flask_strange: 10
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
                flask_strange: 20
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
                flask_strange: 20
            },
            cost_exp: 1.35,
            max_count: 100,
            upgrade_attributes: 
            {
                converter_output_add: 
                {
                    flask_strange: 1
                }
            }
        },
        leaf_multiplier_all: 
        {
            index: 10,
            name: __("All Leaves++"),
            description: __("Increase your leaf reward by +20% per level for all leaves."),
            sprite: spr_leaf,
            cost: 
            {
                flask_strange: 50
            },
            upgrade_attributes: 
            {
                leaf_multiplier: 0.2
            },
            max_count: 100
        },
        converter_increase_output_global: 
        {
            index: 10,
            name: __("C++"),
            description: __("Increases all converter output by 10 per level."),
            sprite: spr_icon_converters,
            cost: 
            {
                flask_strange: 10
            },
            cost_exp: 2,
            max_count: 0,
            upgrade_attributes: 
            {
                converter_output_add_global: 10
            }
        },
        blc_value_adder: 
        {
            index: 100,
            name: __("BLC++"),
            sprite: spr_blc,
            description: __("+300% BLC Coins rewards per level. THANKS, SCIENCE."),
            cost: 
            {
                flask_strange: 10000
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                blc_value_multiplier: 3
            },
            max_count: 0
        },
        blc_science: build_shop_item("blc_science", global.resources.flask_strange, 20),
        player_hp: build_shop_item("player_hp", global.resources.flask_strange, 200),
        player_resistance: build_shop_item("player_resistance", global.resources.flask_strange, 300, 
        {
            value: 20
        })
    };
}
