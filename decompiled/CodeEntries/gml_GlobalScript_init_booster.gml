function init_booster()
{
    global.booster = 
    {
        gems: new Boost(
        {
            index: global.resources.gems.index,
            name: __("Gems"),
            cost: 
            {
                resources: 
                {
                    gems: 10000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 10
            }
        }),
        nature_gems: new Boost(
        {
            index: global.resources.nature_gems.index,
            name: __("Nature"),
            cost: 
            {
                resources: 
                {
                    nature_gems: 5000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 7.5
            },
            
            is_obfuscated: function()
            {
                return !is_event_active(global.events.nature_season);
            }
        }),
        beer: new Boost(
        {
            index: global.resources.beer.index,
            name: __("Beer"),
            cost: 
            {
                resources: 
                {
                    beer: 5000000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 1
            }
        }),
        cheese: new Boost(
        {
            index: global.resources.cheese.index,
            name: __("Cheese"),
            cost: 
            {
                resources: 
                {
                    cheese: 5000000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 1
            }
        }),
        magic_mulch: new Boost(
        {
            index: global.resources.magic_mulch.index,
            name: __("Magic Mulch"),
            cost: 
            {
                resources: 
                {
                    magic_mulch: 10000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 2
            }
        }),
        energy_electrical: new Boost(
        {
            index: global.resources.energy_electrical.index,
            name: __("Electrical"),
            cost: 
            {
                resources: 
                {
                    energy_electrical: 100000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 3
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_energy_electrical();
            }
        }),
        energy_quark: new Boost(
        {
            index: global.resources.energy_quark.index,
            name: __("Quark"),
            cost: 
            {
                resources: 
                {
                    energy_quark: 1000000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 5
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks();
            }
        }),
        soul_flask: new Boost(
        {
            index: global.resources.soul_flask.index,
            name: __("Soul"),
            cost: 
            {
                resources: 
                {
                    soul_flask: 1000000000000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 5
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_quarks();
            }
        }),
        borb_ascension_rune: new Boost(
        {
            index: global.resources.borb_ascension_rune.index,
            name: __("Borb"),
            cost: 
            {
                resources: 
                {
                    borb_ascension_rune: 100000000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 3
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_borbventure();
            }
        }),
        transcension_card_parts: new Boost(
        {
            index: global.resources.transcension_card_parts.index,
            name: __("Cards"),
            cost: 
            {
                resources: 
                {
                    transcension_card_parts: 100000000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 3
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_cards();
            }
        }),
        power_dice: new Boost(
        {
            index: global.resources.power_dice.index,
            name: __("Dice"),
            cost: 
            {
                resources: 
                {
                    power_dice: 1000000000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 3
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_dice();
            }
        }),
        coal_time_sphere: new Boost(
        {
            index: global.resources.coal_time_sphere.index,
            name: __("Mines"),
            cost: 
            {
                resources: 
                {
                    coal_time_sphere: 10000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 5
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_mines();
            }
        }),
        fish_credits: new Boost(
        {
            index: global.resources.fish_credits.index,
            name: __("Fish Credits"),
            cost: 
            {
                resources: 
                {
                    fish_credits: 5000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 4
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_fishing();
            }
        }),
        water_crystal: new Boost(
        {
            index: global.resources.water_crystal.index,
            name: __("Water Crystal"),
            cost: 
            {
                resources: 
                {
                    water_crystal: 1000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 5
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor();
            }
        }),
        party_tokens: new Boost(
        {
            index: global.resources.party_tokens.index,
            name: __("Party Tokens"),
            cost: 
            {
                resources: 
                {
                    party_tokens: 1000
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 3
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_harbor();
            }
        }),
        milk: new Boost(
        {
            index: 100000,
            name: __("Milk"),
            cost: 
            {
                materials: 
                {
                    milk: 500
                }
            },
            upgrade_attributes: 
            {
                blower_enemy_damage_multiplier_boost: 5
            },
            
            is_obfuscated: function()
            {
                return !is_unlocked_boosters();
            }
        })
    };
    init_game_object_struct(global.booster);
    global.booster_array = struct_to_sorted_array(global.booster);
}

function activate_all_boosters()
{
    call_array(global.booster_array, "activate");
}

function check_booster()
{
    if (is_unlocked_boosters())
    {
        call_array(global.booster_array, "check");
    }
    if (get_option(global.options.auto_play_boostergame) && global.booster_game_upgrades.get_upgrade_value("boostergame_auto_play") > 0 && boostergame_can_play())
    {
        if (o_game.data.booster_game.status == UnknownEnum.Value_0 || o_game.data.booster_game.status == UnknownEnum.Value_2)
        {
            boostergame_start_game();
        }
        else if (o_game.data.booster_game.status == UnknownEnum.Value_1)
        {
            var max_turns = 1;
            var n = 0;
            var turns = 0;
            while (o_game.data.booster_game.status == UnknownEnum.Value_1 && n < 200 && turns < max_turns)
            {
                n++;
                var action_key = array_random_item(o_game.data.booster_game.actions);
                var action = variable_struct_get(global.booster_game_actions, action_key);
                if (!boostergame_can_do_action(action))
                {
                    continue;
                }
                boostergame_action(action);
                turns++;
            }
        }
    }
}

function get_booster_damage_multiplier()
{
    var has_boost = false;
    var value = 1;
    var __array = global.booster_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.is_active())
        {
            continue;
        }
        has_boost = true;
        value *= (1 + mitem.upgrade_attributes.blower_enemy_damage_multiplier_boost);
    }
    if (!has_boost)
    {
        return 0;
    }
    return value - 1;
}

function get_booster_upgrade_attributes()
{
    var ua = {};
    var __array = global.booster_array;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (!mitem.is_active())
        {
            continue;
        }
        add_struct_to_struct(ua, mitem.upgrade_attributes);
    }
    return ua;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
