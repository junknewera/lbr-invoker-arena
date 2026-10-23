function init_plants()
{
    var plant_base_xp = 2;
    var plant_exponent = 1.5;
    var plant_grow_duration = 300;
    var synergy_base_bonus = 0.05;
    var plants = [
    {
        key: "hyacinth",
        name: __("Hyacinth"),
        sprite: spr_plant_hyacinth,
        upgrade_attributes: 
        {
            leaf_multiplier_plants: 0.2
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
            plant_index: 10,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 13,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "pansy",
        name: __("Pansy"),
        sprite: spr_plant_pansy,
        upgrade_attributes: 
        {
            blc_value_multiplier_plants: 0.3
        },
        synergy: [
        {
            plant_index: 0,
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
        key: "hibiscus",
        name: __("Hibiscus"),
        sprite: spr_plant_hibiscus,
        upgrade_attributes: 
        {
            mlc_value_multiplier_plants: 0.3
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
            plant_index: 7,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 11,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 14,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "rose",
        name: __("Rose"),
        sprite: spr_plant_rose,
        upgrade_attributes: 
        {
            trade_resources_multiplier_plants: 0.05
        },
        synergy: [
        {
            plant_index: 0,
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
            plant_index: 12,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 14,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "poppy",
        name: __("Poppy"),
        sprite: spr_plant_poppy,
        upgrade_attributes: 
        {
            borbventure_increase_reward: 0.025
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
        key: "primula",
        name: __("Primula"),
        sprite: spr_plant_primula,
        upgrade_attributes: 
        {
            alchemy_brew_crit_chance: 0.025
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
            plant_index: 9,
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
        key: "forgetmenot",
        name: __("Forget-Me-Not"),
        sprite: spr_plant_forgetmenot,
        upgrade_attributes: 
        {
            slap_multiplier_plants: 0.025
        },
        synergy: [
        {
            plant_index: 3,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 8,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 9,
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
        key: "tulip",
        name: __("Tulip"),
        sprite: spr_plant_tulip,
        upgrade_attributes: 
        {
            blower_enemy_damage_multiplier_plants: 0.025
        },
        synergy: [
        {
            plant_index: 3,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 5,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 6,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 10,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 12,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "camomile",
        name: __("Camomile"),
        sprite: spr_plant_camomile,
        upgrade_attributes: 
        {
            nature_enhance_timeout_multiplier: 0.01
        },
        synergy: [
        {
            plant_index: 2,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 6,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 7,
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
    }, 
    {
        key: "dandelion",
        name: __("Dandelion"),
        sprite: spr_plant_dandelion,
        upgrade_attributes: 
        {
            nature_plant_grow_duration: 0.005
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
            plant_index: 7,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 12,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 15,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "aster",
        name: __("Aster"),
        sprite: spr_plant_aster,
        upgrade_attributes: 
        {
            nature_plant_xp_multiplier_global: 0.025
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
            plant_index: 4,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 5,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 6,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "daffodil",
        name: __("Daffodil"),
        sprite: spr_plant_daffodil,
        upgrade_attributes: 
        {
            leaf_pub_counter_autocount: 0.5
        },
        synergy: [
        {
            plant_index: 1,
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
            plant_index: 15,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "cornflower",
        name: __("Cornflower"),
        sprite: spr_plant_cornflower,
        upgrade_attributes: 
        {
            cursed_autocollect_multiplier: 0.25
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
            plant_index: 3,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 9,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "lily",
        name: __("Lily of the Valley"),
        sprite: spr_plant_lily_of_the_valley,
        upgrade_attributes: 
        {
            db_souls_count_multiplier: 0.05
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
            plant_index: 10,
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
        key: "dame",
        name: __("Dame's Rocket"),
        sprite: spr_plant_dames_rocket,
        upgrade_attributes: 
        {
            soul_crypt_bonus_reward_multiplier: 0.1
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
            plant_index: 8,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 9,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 10,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }, 
    {
        key: "marigold",
        name: __("Marigold"),
        sprite: spr_plant_marigold,
        upgrade_attributes: 
        {
            soul_forge_count_multiplier: 0.1
        },
        synergy: [
        {
            plant_index: 0,
            synergy_bonus: synergy_base_bonus * 1
        }, 
        {
            plant_index: 8,
            synergy_bonus: synergy_base_bonus * 2
        }, 
        {
            plant_index: 11,
            synergy_bonus: synergy_base_bonus * 3
        }, 
        {
            plant_index: 13,
            synergy_bonus: synergy_base_bonus * 4
        }, 
        {
            plant_index: 14,
            synergy_bonus: synergy_base_bonus * 5
        }]
    }];
    global.plants_index_map = {};
    var __array = plants;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        var key = sprintf("plant_%s", mitem.key);
        var index_calc = __i + 1;
        variable_struct_set(global.resources, key, 
        {
            index: 30110 + __i,
            sprite: mitem.sprite,
            name: mitem.name,
            name_single: mitem.name,
            name_plural: mitem.name,
            discountable: false,
            persist_prestige_level: global.prestige_levels.inf.level,
            nav_type: global.resource_types.event,
            type: global.resource_types.plant,
            data: 
            {
                unlocked: true
            },
            can_drop: __return_true,
            
            get_tooltip: function()
            {
                return (self.data.collected_total > 0) ? self.name : "?";
            },
            
            is_plant: true,
            grow_duration: plant_grow_duration * index_calc * 1.5,
            plant_index: __i,
            plant_index_calc: index_calc,
            salvage_value: index_calc,
            
            show_in_nav_check: function()
            {
                return is_event_active(global.events.nature_season) && is_unlocked_areas() && self.data.collected_total > 0;
            },
            
            spawn_chance: 1 / power(index_calc, 2),
            synergy: get_default_struct_value(mitem, "synergy", []),
            upgrade_attributes: get_default_struct_value(mitem, "upgrade_attributes"),
            upgrade_attributes_cache: {},
            water_drain_multiplier: index_calc * 0.5,
            xp_value: round(plant_base_xp * power(index_calc, plant_exponent)),
            synergy_bonus_cache: {},
            
            get_synergy_bonus: function(arg0)
            {
                var has_plant_synergy = get_upgrade_count(global.shops.event_nature.nature_plant_synergy) >= 1;
                var has_bfly_synergy = get_upgrade_count(global.shops.event_nature.nature_bfly_synergy) >= 1;
                var field = get_plant_field(arg0);
                var value = 0;
                if (arg0 > 0 && arg0 != 5)
                {
                    var left_field = get_plant_field(arg0 - 1);
                    if (left_field.has_plant && left_field.prop.progress >= 1)
                    {
                        if (left_field.item.plant_index == self.plant_index)
                        {
                            value -= global.game_settings.nature_synergy_same_plant_penalty;
                        }
                        if (has_plant_synergy)
                        {
                            var __array = left_field.item.synergy;
                            var __prop_len = array_length(__array);
                            for (var __i = 0; __i < __prop_len; __i++)
                            {
                                var mitem = __array[__i];
                                if (mitem.plant_index != self.plant_index)
                                {
                                    continue;
                                }
                                value += mitem.synergy_bonus;
                            }
                        }
                    }
                }
                if (arg0 < global.season_pass.nature.get_max_fields() && arg0 != 4)
                {
                    var right_field = get_plant_field(arg0 + 1);
                    if (right_field.has_plant && right_field.prop.progress >= 1)
                    {
                        if (right_field.item.plant_index == self.plant_index)
                        {
                            value -= global.game_settings.nature_synergy_same_plant_penalty;
                        }
                        if (has_plant_synergy)
                        {
                            var __array = right_field.item.synergy;
                            var __prop_len = array_length(__array);
                            for (var __i = 0; __i < __prop_len; __i++)
                            {
                                var mitem = __array[__i];
                                if (mitem.plant_index != self.plant_index)
                                {
                                    continue;
                                }
                                value += mitem.synergy_bonus;
                            }
                        }
                    }
                }
                if (has_plant_synergy && has_bfly_synergy && field.has_plant && field.prop.progress >= 1 && field.has_butterfly && field.prop.bfly_progress >= 1)
                {
                    var __array = field.butterfly.synergy;
                    var __prop_len = array_length(__array);
                    for (var __i = 0; __i < __prop_len; __i++)
                    {
                        var mitem = __array[__i];
                        if (mitem.plant_index != self.plant_index)
                        {
                            continue;
                        }
                        value += mitem.synergy_bonus;
                    }
                }
                if (field.prop.progress >= 1)
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
        variable_struct_set(global.plants_index_map, __i, variable_struct_get(global.resources, key));
    }
}
