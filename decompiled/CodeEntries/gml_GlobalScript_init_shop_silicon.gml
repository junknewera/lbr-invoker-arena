function init_shop_silicon()
{
    global.shops_prestige_levels.silicon = global.prestige_levels.blc;
    var shop_resource = global.resources.silicon;
    global.shops.silicon = 
    {
        unlock_benitoite_leaves: 
        {
            index: -20,
            name: __s("Unlock %s", global.resources.benitoite.name_plural),
            description: __("Rare blue barium titanium cyclosilicate leaves. Formed by merging 5 Ice and 10 Silicon leaves."),
            sprite: spr_leaf_benitoite,
            cost: 
            {
                silicon: 10000000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.benitoite.data.unlocked = true;
            }
        },
        fertilizer: build_shop_item("fertilizer", shop_resource, 1, 
        {
            base_cost: 10,
            max_count: 50
        }),
        leaf_marketing: 
        {
            index: 2,
            name: __s("%s Marketing", global.resources.silicon.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                silicon: 5000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    silicon: 1
                }
            },
            max_count: 5
        },
        blower_hit_damage: build_shop_item("blower_hit_damage", global.resources.silicon, 15, 
        {
            value: 30
        }),
        blc_value_adder_real: build_shop_item("blc_value_adder_real", global.resources.silicon, 100, 
        {
            value: 3000
        }),
        critical_converters_crit_chance: build_shop_item("critical_converters_crit_chance", global.resources.silicon, 200, 
        {
            value: 0.005
        }),
        critical_converters_crit_value: build_shop_item("critical_converters_crit_value", global.resources.silicon, 201, 
        {
            value: 0.01
        }),
        printer_printer: build_shop_item("printer_printer", global.resources.silicon, 300, 
        {
            value: 5
        }),
        leaf_merge_range_inc: build_shop_item("leaf_merge_range_inc", global.resources.silicon, 350, 
        {
            value: 2
        }),
        autobuy_accelerator: build_shop_item("autobuy_accelerator", global.resources.silicon, 400),
        trade_refresh_decrease_timer: build_shop_item("trade_refresh_decrease_timer", global.resources.silicon, 500)
    };
}
