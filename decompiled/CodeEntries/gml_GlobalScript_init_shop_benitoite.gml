function init_shop_benitoite()
{
    global.shops_prestige_levels.benitoite = global.prestige_levels.blc;
    var shop_resource = global.resources.benitoite;
    global.shops.benitoite = 
    {
        unlock_resource_moonstone: build_shop_item("unlock_resource", shop_resource, -20, 
        {
            base_cost: 750000000,
            description: __("The Moonstone Leaves can only be formed on The Moon."),
            value: global.resources.moonstone,
            
            is_obfuscated: function()
            {
                return get_upgrade_count(global.areas.moon) == 0;
            }
        }),
        unlock_borbs: 
        {
            index: -10,
            name: __s("Unlock %s", __("Borbs")),
            description: "Borb borb borb, borb borb. Borb!",
            sprite: spr_borb,
            cost: 
            {
                benitoite: 1
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.borbs.data.unlocked = true;
            }
        },
        leaf_marketing: 
        {
            index: 1,
            name: __s("%s Marketing", global.resources.benitoite.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                benitoite: 5000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    benitoite: 1
                }
            },
            max_count: 5
        },
        nuclear_fuel: 
        {
            index: 3,
            name: __("Nuclear Fuel"),
            
            description: function()
            {
                return format_upgrade_text(self.upgrade_attributes);
            },
            
            sprite: spr_icon_nuclear,
            cost: 
            {
                benitoite: 1000
            },
            upgrade_attributes: 
            {
                nuclear_fuel: 1
            },
            max_count: 50
        },
        blower_hit_damage: build_shop_item("blower_hit_damage", global.resources.benitoite, 15, 
        {
            value: 50
        }),
        blc_value_adder_real: build_shop_item("blc_value_adder_real", global.resources.benitoite, 100, 
        {
            value: 4000
        }),
        critical_converters_crit_chance: build_shop_item("critical_converters_crit_chance", global.resources.benitoite, 200, 
        {
            value: 0.005
        }),
        critical_converters_crit_value: build_shop_item("critical_converters_crit_value", global.resources.benitoite, 201, 
        {
            value: 0.01
        }),
        printer_printer: build_shop_item("printer_printer", global.resources.benitoite, 300, 
        {
            value: 6
        }),
        leaf_merge_range_inc: build_shop_item("leaf_merge_range_inc", global.resources.benitoite, 350, 
        {
            value: 2
        }),
        autobuy_accelerator: build_shop_item("autobuy_accelerator", global.resources.benitoite, 400),
        trade_refresh_decrease_timer: build_shop_item("trade_refresh_decrease_timer", global.resources.benitoite, 500)
    };
}
