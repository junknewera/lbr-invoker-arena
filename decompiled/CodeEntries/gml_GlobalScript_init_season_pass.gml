function init_season_pass()
{
    global.season_pass = 
    {
        nature: new Season_Pass_Nature(
        {
            name: __("Nature Season"),
            max_fields: 10,
            max_level: 100,
            data_key: "nature_season",
            shop_key: "event_nature"
        })
    };
    init_season_pass_nature();
    var __struct = global.season_pass;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.init();
    }
}

function init_season_pass_nature()
{
    var max_plants_level = 0;
    var __array = global.resources_plants_rarity;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        var level = max(1, __ireal * 5);
        var item_f2p = 
        {
            level: level,
            sprite: mitem.sprite,
            result: 
            {
                resources: build_resource_cost(mitem, 3)
            }
        };
        var item_premium = 
        {
            level: level,
            sprite: mitem.sprite,
            result: 
            {
                resources: build_resource_cost(mitem, 15)
            }
        };
        max_plants_level = level;
        array_push(global.season_pass.nature.items_f2p, item_f2p);
        array_push(global.season_pass.nature.items_premium, item_premium);
        __i--;
    }
    __array = global.resources_sorted_types_rarity.butterfly;
    __prop_len = array_length(__array);
    __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        var level = max_plants_level + ((__ireal + 1) * 5);
        if (level >= 100)
        {
            break;
        }
        var item_f2p = 
        {
            level: level,
            sprite: mitem.sprite,
            result: 
            {
                resources: build_resource_cost(mitem, 2)
            }
        };
        var item_premium = 
        {
            level: level,
            sprite: mitem.sprite,
            result: 
            {
                resources: build_resource_cost(mitem, 10)
            }
        };
        array_push(global.season_pass.nature.items_f2p, item_f2p);
        array_push(global.season_pass.nature.items_premium, item_premium);
        __i--;
    }
    for (var level = 1; level <= 20; level++)
    {
        var mulch_f2p = 
        {
            level: (level * 5) - 1,
            sprite: global.resources.magic_mulch.sprite,
            result: 
            {
                resources: build_resource_cost(global.resources.magic_mulch, 10 + (15 * level))
            }
        };
        var mulch_premium = 
        {
            level: (level * 5) - 1,
            sprite: global.resources.magic_mulch.sprite,
            result: 
            {
                resources: build_resource_cost(global.resources.magic_mulch, 40 + (20 * level))
            }
        };
        if ((level % 2) != 0)
        {
            array_push(global.season_pass.nature.items_f2p, mulch_f2p);
        }
        array_push(global.season_pass.nature.items_premium, mulch_premium);
        var gems_f2p = 
        {
            level: (level * 5) - 3,
            sprite: global.resources.nature_gems.sprite,
            result: 
            {
                resources: build_resource_cost(global.resources.nature_gems, 5 + (5 * level))
            }
        };
        var gems_premium = 
        {
            level: (level * 5) - 3,
            sprite: global.resources.nature_gems.sprite,
            result: 
            {
                resources: build_resource_cost(global.resources.nature_gems, 25 + (25 * level))
            }
        };
        if ((level % 2) != 0)
        {
            array_push(global.season_pass.nature.items_f2p, gems_f2p);
        }
        array_push(global.season_pass.nature.items_premium, gems_premium);
        var ts_f2p = 
        {
            level: (level * 5) + 1,
            sprite: global.resources.nature_time_sphere.sprite,
            result: 
            {
                resources: build_resource_cost(global.resources.nature_time_sphere, 1 + level)
            }
        };
        var ts_premium = 
        {
            level: (level * 5) + 1,
            sprite: global.resources.nature_time_sphere.sprite,
            result: 
            {
                resources: build_resource_cost(global.resources.nature_time_sphere, 5 + level)
            }
        };
        if ((level % 2) != 0)
        {
            array_push(global.season_pass.nature.items_f2p, ts_f2p);
        }
        if ((level % 2) != 0)
        {
            array_push(global.season_pass.nature.items_premium, ts_premium);
        }
        ts_premium = 
        {
            level: (level * 5) + 1,
            sprite: spr_plant_primula,
            upgrade_attributes: 
            {
                nature_plant_xp_multiplier_global: 0.05
            }
        };
        if ((level % 2) == 0 && level > 0)
        {
            array_push(global.season_pass.nature.items_premium, ts_premium);
        }
        gems_f2p = 
        {
            level: (level * 5) + 3,
            sprite: global.resources.gems.sprite,
            result: 
            {
                resources: build_resource_cost(global.resources.gems, round(10 + (5 * level)))
            }
        };
        gems_premium = 
        {
            level: (level * 5) + 3,
            sprite: global.resources.gems.sprite,
            result: 
            {
                resources: build_resource_cost(global.resources.gems, round(50 + (30 * level)))
            }
        };
        if ((level % 2) != 0)
        {
            array_push(global.season_pass.nature.items_f2p, gems_f2p);
        }
        if ((level % 2) != 0)
        {
            array_push(global.season_pass.nature.items_premium, gems_premium);
        }
    }
    for (var i = 0; i < 10; i++)
    {
        if ((i % 2) == 0)
        {
            array_push(global.season_pass.nature.items_f2p, 
            {
                level: 9 + (10 * i),
                sprite: spr_plant_primula,
                upgrade_attributes: 
                {
                    nature_plant_xp_multiplier_global: 0.02
                }
            });
        }
        else
        {
            array_push(global.season_pass.nature.items_f2p, 
            {
                level: 9 + (10 * i),
                sprite: spr_plant_primula,
                upgrade_attributes: 
                {
                    nature_plant_grow_duration: 0.01
                }
            });
        }
    }
    var items_arr = global.season_pass.nature.items_f2p;
    array_push(items_arr, 
    {
        level: 3,
        sprite: spr_blc,
        upgrade_attributes: 
        {
            blc_value_multiplier_plants: 0.25
        }
    });
    array_push(items_arr, 
    {
        level: 11,
        sprite: spr_icon_soil3,
        upgrade_attributes: 
        {
            nature_max_fields: 1
        }
    });
    array_push(items_arr, 
    {
        level: 13,
        sprite: spr_mlc,
        upgrade_attributes: 
        {
            mlc_value_multiplier_plants: 0.25
        }
    });
    array_push(items_arr, 
    {
        level: 21,
        sprite: spr_icon_soil3,
        upgrade_attributes: 
        {
            nature_max_fields: 1
        }
    });
    array_push(items_arr, 
    {
        level: 23,
        sprite: spr_icon_trading,
        upgrade_attributes: 
        {
            trade_resources_multiplier_plants: 0.1
        }
    });
    array_push(items_arr, 
    {
        level: 31,
        sprite: spr_icon_soil3,
        upgrade_attributes: 
        {
            nature_max_fields: 1
        }
    });
    array_push(items_arr, 
    {
        level: 33,
        sprite: spr_resource_clover3,
        upgrade_attributes: 
        {
            nature_vial_clover3_spawn_chance: 0.05
        }
    });
    array_push(items_arr, 
    {
        level: 43,
        sprite: spr_icon_cursed_cheese,
        upgrade_attributes: 
        {
            cursed_autocollect_multiplier: 0.05
        }
    });
    array_push(items_arr, 
    {
        level: 53,
        sprite: spr_borb_jones,
        upgrade_attributes: 
        {
            borbventure_increase_reward: 0.05
        }
    });
    array_push(items_arr, 
    {
        level: 63,
        sprite: spr_icon_alchemy,
        upgrade_attributes: 
        {
            alchemy_brew_crit_chance: 0.01
        }
    });
    array_push(items_arr, 
    {
        level: 73,
        sprite: spr_resource_soul_stone,
        upgrade_attributes: 
        {
            db_souls_count_multiplier: 0.02
        }
    });
    array_push(items_arr, 
    {
        level: 83,
        sprite: spr_weapon_leaf_blower,
        upgrade_attributes: 
        {
            blower_enemy_damage_multiplier_plants: 0.05
        }
    });
    array_push(items_arr, 
    {
        level: 93,
        sprite: spr_weapon_trout,
        upgrade_attributes: 
        {
            slap_multiplier_plants: 0.05
        }
    });
    array_push(items_arr, 
    {
        level: 100,
        sprite: spr_icon_trophy_silver,
        result: 
        {
            resources: 
            {
                gems: 750
            }
        },
        upgrade_attributes: 
        {
            scrolls_active_max: 1,
            max_pets: 1
        }
    });
    items_arr = global.season_pass.nature.items_premium;
    array_push(items_arr, 
    {
        level: 3,
        sprite: spr_blc,
        upgrade_attributes: 
        {
            blc_value_multiplier_plants: 0.75
        }
    });
    array_push(items_arr, 
    {
        level: 13,
        sprite: spr_mlc,
        upgrade_attributes: 
        {
            mlc_value_multiplier_plants: 0.75
        }
    });
    array_push(items_arr, 
    {
        level: 23,
        sprite: spr_icon_trading,
        upgrade_attributes: 
        {
            trade_resources_multiplier_plants: 0.3
        }
    });
    array_push(items_arr, 
    {
        level: 33,
        sprite: spr_resource_clover4,
        upgrade_attributes: 
        {
            nature_vial_clover3_spawn_chance: 0.1
        }
    });
    array_push(items_arr, 
    {
        level: 43,
        sprite: spr_icon_cursed_cheese,
        upgrade_attributes: 
        {
            cursed_autocollect_multiplier: 0.15
        }
    });
    array_push(items_arr, 
    {
        level: 53,
        sprite: spr_borb_jones,
        upgrade_attributes: 
        {
            borbventure_increase_reward: 0.25
        }
    });
    array_push(items_arr, 
    {
        level: 63,
        sprite: spr_icon_alchemy,
        upgrade_attributes: 
        {
            alchemy_brew_crit_chance: 0.05
        }
    });
    array_push(items_arr, 
    {
        level: 73,
        sprite: spr_resource_soul_stone,
        upgrade_attributes: 
        {
            db_souls_count_multiplier: 0.1
        }
    });
    array_push(items_arr, 
    {
        level: 83,
        sprite: spr_weapon_leaf_blower,
        upgrade_attributes: 
        {
            blower_enemy_damage_multiplier_plants: 0.2
        }
    });
    array_push(items_arr, 
    {
        level: 93,
        sprite: spr_weapon_trout,
        upgrade_attributes: 
        {
            slap_multiplier_plants: 0.2
        }
    });
    array_push(items_arr, 
    {
        level: 100,
        sprite: spr_icon_trophy,
        result: 
        {
            resources: 
            {
                gems: 5000
            }
        },
        upgrade_attributes: 
        {
            nature_global_upgrade_bonus_value: 0.25
        }
    });
}
