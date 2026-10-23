function init_shop_obsidian()
{
    global.shops_prestige_levels.obsidian = global.prestige_levels.blc;
    global.shops.obsidian = 
    {
        unlock_silicon_leaves: 
        {
            index: -20,
            name: __s("Unlock %s", global.resources.silicon.name_plural),
            description: __("Silicon is used to make parts of computers and other electronic equipment."),
            sprite: spr_leaf_silicon,
            cost: 
            {
                obsidian: 10000000000
            },
            max_count: 1,
            
            func: function()
            {
                global.resources.silicon.data.unlocked = true;
            }
        },
        leaf_marketing: 
        {
            index: 1,
            name: __s("%s Marketing", global.resources.obsidian.name_single),
            description: global.texts.leaf_marketing,
            sprite: spr_icon_marketing,
            cost: 
            {
                obsidian: 5000
            },
            cost_exp: 3.5,
            upgrade_attributes: 
            {
                resources_leaf_add: 
                {
                    obsidian: 1
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
                obsidian: 1000
            },
            upgrade_attributes: 
            {
                nuclear_fuel: 1
            },
            max_count: 50
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
                obsidian: 5000
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                combo_max: 30
            },
            max_count: 100,
            tag: global.shop_item_tags.combo
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
                obsidian: 10000
            },
            cost_exp: 3,
            upgrade_attributes: 
            {
                combo_rewards: 1
            },
            max_count: 50,
            tag: global.shop_item_tags.combo
        },
        blower_hit_damage: build_shop_item("blower_hit_damage", global.resources.obsidian, 50, 
        {
            value: 20
        }),
        blc_value_adder_real: build_shop_item("blc_value_adder_real", global.resources.obsidian, 100, 
        {
            value: 2000
        }),
        artifact_fruits: build_shop_item("artifact_fruits", global.resources.obsidian, 200, 
        {
            value: 1
        }),
        longer_artifacts_duration: build_shop_item("longer_artifacts_duration", global.resources.obsidian, 210, 
        {
            value: 5
        }),
        printer_printer: build_shop_item("printer_printer", global.resources.obsidian, 300, 
        {
            value: 4
        })
    };
}
