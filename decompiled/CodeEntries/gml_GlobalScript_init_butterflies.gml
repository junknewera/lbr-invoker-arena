function init_butterflies()
{
    var base_xp = 5;
    var base_xp_multiplier = 0.1;
    var grow_duration = 1800;
    var synergy_base_bonus = 0.05;
    var items = [
    {
        key: "meadowdance",
        name: __("Meadowdance"),
        sprite: spr_butterfly_meadowdance,
        upgrade_attributes: 
        {
            nature_enhance_timeout_multiplier: 0.02
        },
        synergy: [
        {
            plant_index: 2,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 4,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 7,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 9,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 13,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "prismwing",
        name: __("Prismwing"),
        sprite: spr_butterfly_prismwing,
        upgrade_attributes: 
        {
            leaf_pub_counter_autocount: 1
        },
        synergy: [
        {
            plant_index: 4,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 5,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 9,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 11,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 15,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "starlance",
        name: __("Starlance"),
        sprite: spr_butterfly_starlance,
        upgrade_attributes: 
        {
            leaf_multiplier_plants: 0.4
        },
        synergy: [
        {
            plant_index: 0,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 1,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 5,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 6,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 8,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "sunspark",
        name: __("Sunspark"),
        sprite: spr_butterfly_sunspark,
        upgrade_attributes: 
        {
            trade_resources_multiplier_plants: 0.1
        },
        synergy: [
        {
            plant_index: 0,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 7,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 9,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 10,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 14,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "radiantwing",
        name: __("Radiantwing"),
        sprite: spr_butterfly_radiantwing,
        upgrade_attributes: 
        {
            borbventure_increase_reward: 0.05
        },
        synergy: [
        {
            plant_index: 3,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 6,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 8,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 10,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 13,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "oceaniclash",
        name: __("Oceaniclash"),
        sprite: spr_butterfly_oceaniclash,
        upgrade_attributes: 
        {
            nature_time_skip_value_multiplier: 0.1
        },
        synergy: [
        {
            plant_index: 2,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 3,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 9,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 14,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 15,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "auroraflit",
        name: __("Auroraflit"),
        sprite: spr_butterfly_auroraflit,
        upgrade_attributes: 
        {
            slap_multiplier_plants: 0.15
        },
        synergy: [
        {
            plant_index: 5,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 7,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 8,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 10,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 13,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "soulwing",
        name: __("Soulwing"),
        sprite: spr_butterfly_soulwing,
        upgrade_attributes: 
        {
            alchemy_brew_crit_chance: 0.05
        },
        synergy: [
        {
            plant_index: 0,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 6,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 10,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 12,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 14,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "moonbloom",
        name: __("Moonbloom"),
        sprite: spr_butterfly_moonbloom,
        upgrade_attributes: 
        {
            offline_boss_kills_multiplier: 0.025
        },
        synergy: [
        {
            plant_index: 4,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 6,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 11,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 14,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 15,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "blossomhaze",
        name: __("Blossomhaze"),
        sprite: spr_butterfly_blossomhaze,
        upgrade_attributes: 
        {
            nature_vial_max_charges: 3
        },
        synergy: [
        {
            plant_index: 1,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 2,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 3,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 7,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 11,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "serenewisp",
        name: __("Serenewisp"),
        sprite: spr_butterfly_serenewisp,
        upgrade_attributes: 
        {
            material_max_count: 5000
        },
        synergy: [
        {
            plant_index: 0,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 6,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 8,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 11,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 12,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "emberglide",
        name: __("Emberglide"),
        sprite: spr_butterfly_emberglide,
        upgrade_attributes: 
        {
            leafscender_decrease_input_cost_multiplier: 0.02
        },
        synergy: [
        {
            plant_index: 0,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 1,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 2,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 5,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 8,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "twilightglow",
        name: __("Twilightglow"),
        sprite: spr_butterfly_twilightglow,
        upgrade_attributes: 
        {
            nature_vial_rarity_seed_spawn_chance: 0.05
        },
        synergy: [
        {
            plant_index: 2,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 4,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 11,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 14,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 15,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "duskmoth",
        name: __("Duskmoth"),
        sprite: spr_butterfly_duskmoth,
        upgrade_attributes: 
        {
            soul_forge_count_multiplier: 0.2
        },
        synergy: [
        {
            plant_index: 1,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 4,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 5,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 9,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 12,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "crystalvale",
        name: __("Crystalvale"),
        sprite: spr_butterfly_crystalvale,
        upgrade_attributes: 
        {
            soul_crypt_bonus_reward_multiplier: 0.15
        },
        synergy: [
        {
            plant_index: 1,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 3,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 10,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 12,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 13,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "citrineshine",
        name: __("Citrineshine"),
        sprite: spr_butterfly_citrineshine,
        upgrade_attributes: 
        {
            db_souls_count_multiplier: 0.1
        },
        synergy: [
        {
            plant_index: 3,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 7,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 12,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 13,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 15,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }];
    global.butterfly_index_map = {};
    var __array = items;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var key = sprintf("butterfly_%s", mitem.key);
        var index_calc = __i + 1;
        variable_struct_set(global.resources, key, 
        {
            index: 31110 + __i,
            sprite: mitem.sprite,
            name: mitem.name,
            name_single: mitem.name,
            name_plural: mitem.name,
            discountable: false,
            persist_prestige_level: global.prestige_levels.inf.level,
            nav_type: global.resource_types.event,
            type: global.resource_types.butterfly,
            data: 
            {
                unlocked: true
            },
            can_drop: __return_true,
            
            get_tooltip: function()
            {
                return (self.data.collected_total > 0) ? self.name : "?";
            },
            
            res_type: "butterfly",
            
            get_tooltip: function()
            {
                return self.name;
            },
            
            grow_duration: grow_duration * index_calc * 1.5,
            plant_index: __i,
            plant_index_calc: index_calc,
            salvage_value: index_calc,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.nature_season) && is_unlocked_areas() && self.data.collected_total > 0;
            },
            
            spawn_chance: 1 / power(index_calc, 2),
            synergy: get_default_struct_value(mitem, "synergy", []),
            synergy_bonus_cache: {},
            upgrade_attributes: get_default_struct_value(mitem, "upgrade_attributes"),
            upgrade_attributes_cache: {},
            water_drain_multiplier: index_calc * 2,
            xp_multiplier: base_xp_multiplier + (0.05 * index_calc),
            xp_value: base_xp * index_calc,
            
            get_synergy_bonus: function(arg0)
            {
                var has_plant_synergy = get_upgrade_count(global.shops.event_nature.nature_plant_synergy) >= 1;
                var has_bfly_synergy = get_upgrade_count(global.shops.event_nature.nature_bfly_synergy) >= 1;
                var field = get_plant_field(arg0);
                var value = 0;
                if (arg0 > 0 && arg0 != 5)
                {
                    var left_field = get_plant_field(arg0 - 1);
                    if (left_field.has_butterfly && left_field.prop.bfly_progress >= 1)
                    {
                        if (left_field.butterfly.plant_index == self.plant_index)
                        {
                            value -= global.game_settings.nature_synergy_same_plant_penalty;
                        }
                    }
                }
                if (arg0 < global.season_pass.nature.get_max_fields() && arg0 != 4)
                {
                    var right_field = get_plant_field(arg0 + 1);
                    if (right_field.has_butterfly && right_field.prop.bfly_progress >= 1)
                    {
                        if (right_field.butterfly.plant_index == self.plant_index)
                        {
                            value -= global.game_settings.nature_synergy_same_plant_penalty;
                        }
                    }
                }
                if (field.prop.bfly_progress >= 1)
                {
                    value += (field.prop.quality * get_upgrade_attribute_value(global.upgrade_attributes.nature_enhance_bonus_multiplier));
                    value += get_upgrade_attribute_value(global.upgrade_attributes.nature_global_upgrade_bonus_value);
                }
                return value;
            },
            
            get_upgrade_attributes: function(arg0)
            {
                var synergy_bonus = 1 + get_default_struct_value(self.synergy_bonus_cache, arg0, 0);
                var ua = multiply_struct_values(self.upgrade_attributes, synergy_bonus);
                return ua;
            }
        });
        variable_struct_set(global.butterfly_index_map, __i, variable_struct_get(global.resources, key));
    }
}
