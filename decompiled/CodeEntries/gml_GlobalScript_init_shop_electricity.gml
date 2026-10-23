function init_shop_energy_electrical()
{
    var shop_resource = global.resources.energy_electrical;
    var shop_resource2 = global.resources.plasma;
    variable_struct_set(global.shops_prestige_levels, shop_resource.key, global.prestige_levels.mlc);
    variable_struct_set(global.shops, shop_resource.key, 
    {
        add_resource_storage_energy: build_shop_item("add_resource_storage", shop_resource, 0, 
        {
            base_cost: 1000,
            cost_exp: 1.5,
            max_count: 0,
            resource_key: global.resources.energy_electrical.key,
            
            is_obfuscated: function()
            {
                return !is_unlocked_energy_electrical();
            },
            
            value: 100
        }),
        energy_base_charge_value_single_electric: 
        {
            index: 100,
            name: __("Charging Port Quality++"),
            sprite: spr_resource_electrical_energy,
            description: __s("Increases charging value by %s.", 1),
            cost: build_resource_cost(shop_resource, 1000),
            cost_exp: 1.5,
            max_count: 0,
            upgrade_attributes: 
            {
                energy_base_charge_value_single: 
                {
                    energy_electrical: 1
                }
            }
        },
        relics_max_count: 
        {
            index: 1000,
            name: __("Max Relics"),
            sprite: spr_relic_uncommon,
            description: __s("Increases max relic count by %s.", 1),
            cost: build_resource_cost(shop_resource, 3000),
            cost_exp: 12,
            max_count: 20,
            upgrade_attributes: 
            {
                relics_max_count: 1
            }
        },
        relics_base_damage_multiplier_energy: 
        {
            index: 1010,
            name: __("Energelics"),
            sprite: spr_relic_uncommon,
            description: __s("Increases relic damage by %s for each %s of energy.", number_format_percent(0.01), number_format(1000)),
            cost: build_resource_cost(shop_resource, 500),
            cost_exp: 1.5,
            max_count: 0,
            upgrade_attributes: 
            {
                relics_base_damage_multiplier_energy: 0.01
            }
        },
        unlock_converter_plasma_electric: 
        {
            index: 5000,
            name: __("Unlock Plasma Electric Converter"),
            description: __s("Converts %s to %s.", global.resources.plasma.name_plural, global.resources.energy_electrical.name_plural),
            sprite: spr_icon_converters,
            cost: build_resource_cost(shop_resource2, 3000),
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !is_unlocked_resource(global.resources.plasma);
            },
            
            func: function()
            {
                global.converters.convert_plasma_electric.check_unlock();
            }
        },
        mirror_enable_materials: build_shop_item("mirror_enable_materials", shop_resource, 7000, 
        {
            name: __("Mirrorterials"),
            description: __("Enables the collection of materials for mirror images."),
            sprite: spr_artifact_mirror,
            base_cost: 30000,
            
            is_obfuscated: function()
            {
                return !is_unlocked_mirror();
            }
        }),
        mirror_efficiency: build_shop_item("mirror_efficiency", shop_resource, 7010, 
        {
            base_cost: 2500,
            cost_exp: 2,
            max_count: 5,
            value: 0.02
        }),
        mirror_drop_relic_fragments: build_shop_item("mirror_drop_relic_fragments", shop_resource, 7020, 
        {
            name: __("Relic Fragments"),
            description: __s("Mirrors can collect %s. These can be used to upgrade %s. Unlocks %s.", global.materials.relic_fragment.name_plural, __("Relics"), __("Master Relics")),
            sprite: spr_material_relic_fragment,
            base_cost: 100000,
            max_count: 1,
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.energy_electrical.mirror_enable_materials);
            },
            
            func: function()
            {
                refresh_ua_section("relics");
            }
        }),
        mirror_drop_relic_fragments_chance: build_shop_item("mirror_drop_relic_fragments_chance", shop_resource, 7030, 
        {
            name: __("Fragment Chance"),
            sprite: spr_material_relic_fragment,
            base_cost: 75000,
            cost_exp: 2,
            max_count: 5,
            upgrade_attributes: 
            {
                mirror_drop_relic_fragments_chance: 0.01
            },
            
            is_obfuscated: function()
            {
                return !has_bought_shop_item_safe(global.shops.energy_electrical.mirror_drop_relic_fragments);
            }
        }),
        trade_gems_max_value: build_shop_item("trade_gems_max_value", shop_resource, 6000, 
        {
            base_cost: 5000,
            max_count: 1,
            value: 1
        })
    });
}
