function init_boostergame()
{
    global.booster_game_actions = 
    {
        asteroid_miner: 
        {
            name: __("Asteroid Miner"),
            
            text: function()
            {
                return __s("Receive [turn_actions], lose [hp_pct%]");
            },
            
            input: 
            {
                hp_pct: 0.5
            },
            output: 
            {
                turn_actions: 
                {
                    metal: 1
                },
                turn_durations: 
                {
                    metal: 5
                }
            },
            single_action: true
        },
        avoid_asteroids: 
        {
            name: __("Avoid Asteriods"),
            
            text: function()
            {
                return __("[chance] chance to travel [max_distance], lose [hp_pct%].");
            },
            
            input: 
            {
                hp_pct: 0.5
            },
            output: 
            {
                max_distance: 4
            },
            output_chance: 0.5
        },
        boost: 
        {
            name: __("Boost"),
            func: boostergame_boost,
            can_generate: __return_false,
            
            text: function()
            {
                return __s("Travel %s-%s km.", number_format(boostergame_get_travel_distance_min()), number_format(boostergame_get_travel_distance_max()), 1);
            }
        },
        fortify: 
        {
            name: __("Fortify"),
            
            text: function()
            {
                return __s("Regenerate [hp_pct%], lose [metal].");
            },
            
            input: 
            {
                metal: 5
            },
            output: 
            {
                hp_pct: 0.5
            }
        },
        fuel_depot: 
        {
            name: __("Fuel Depot"),
            
            text: function()
            {
                return __s("Spend [metal] to refill [fuel].");
            },
            
            input: 
            {
                metal: 5
            },
            output: 
            {
                fuel: 3
            }
        },
        fuel_injection: 
        {
            name: __s("Fuel Injection"),
            
            text: function()
            {
                return __("Receive [upgrade] for this run.");
            },
            
            output: 
            {
                upgrade: 
                {
                    boostergame_fuel: 5
                }
            },
            single_action: true,
            min_distance: 5
        },
        harvest: 
        {
            name: __("Harvest"),
            
            text: function()
            {
                return __s("Harvest a nearby meteorid for [metal].");
            },
            
            output: 
            {
                metal: 3
            }
        },
        hijack: 
        {
            name: __("Hijack"),
            
            text: function()
            {
                return __s("Hijack a pirate ship for [milk], lose [hp_pct%].");
            },
            
            min_distance: 5,
            input: 
            {
                hp_pct: 0.75
            },
            output: 
            {
                milk: 2
            }
        },
        idle: 
        {
            name: __("Idle"),
            
            text: function()
            {
                return __s("Idle around for [hp].");
            },
            
            output: 
            {
                hp: 2
            }
        },
        milk_trader: 
        {
            name: __("Milk Trader"),
            
            text: function()
            {
                return __s("Receive [milk] for [metal].");
            },
            
            min_distance: 5,
            input: 
            {
                metal: 5
            },
            output: 
            {
                milk: 2
            }
        },
        mine: 
        {
            name: __("Mine"),
            
            text: function()
            {
                return __s("Mine a planet for [metal], lose [hp].");
            },
            
            input: 
            {
                hp: 2
            },
            output: 
            {
                metal: 3
            }
        },
        overclock_engine: 
        {
            name: __s("Overclock Engine"),
            
            text: function()
            {
                return __("Receive [upgrade] for this run.");
            },
            
            output: 
            {
                upgrade: 
                {
                    boostergame_boost_distance: 1
                }
            },
            single_action: true,
            min_distance: 5
        },
        refuel: 
        {
            name: __("Refuel"),
            
            text: function()
            {
                return __s("Receive [fuel] for free. What a day.");
            },
            
            output: 
            {
                fuel: 3
            }
        },
        regeneration_drones: 
        {
            name: __("Regeneration Drone"),
            
            text: function()
            {
                return __s("Receive [turn_actions], lose [metal].");
            },
            
            input: 
            {
                metal: 5
            },
            output: 
            {
                turn_actions: 
                {
                    boostergame_hp_regeneration: 1
                },
                turn_durations: 
                {
                    boostergame_hp_regeneration: 5
                }
            },
            single_action: true
        },
        reinforce_hull: 
        {
            name: __s("Reinforce Hull"),
            
            text: function()
            {
                return __("Receive [upgrade] for this run.");
            },
            
            output: 
            {
                upgrade: 
                {
                    boostergame_hp: 5
                }
            },
            single_action: true,
            min_distance: 5
        },
        repair: 
        {
            name: __("Repair"),
            
            text: function()
            {
                return __s("Restore your rocket's health by [hp], lose [metal].");
            },
            
            input: 
            {
                metal: 1
            },
            output: 
            {
                hp: 3
            }
        },
        salvage: 
        {
            name: __("Salvage"),
            func: boostergame_salvage,
            
            text: function()
            {
                return __s("Salvage your rocket for %s but your current run ends.", format_result_text(boostergame_get_salvage_reward(), ""));
            },
            
            min_distance: 5
        },
        satellite: 
        {
            name: __("Satellite"),
            
            text: function()
            {
                return __("Travel [max_distance] but lose [hp].");
            },
            
            input: 
            {
                hp: 4
            },
            output: 
            {
                max_distance: 2
            }
        },
        scrap: 
        {
            name: __("Scrap"),
            
            text: function()
            {
                return __("Gain [metal], lose [hp].");
            },
            
            input: 
            {
                hp: 3
            },
            output: 
            {
                metal: 3
            }
        },
        search: 
        {
            name: __("Search"),
            
            text: function()
            {
                return __s("Search a mine with a [chance] chance to gain [metal], lose [hp].");
            },
            
            input: 
            {
                hp: 2
            },
            output: 
            {
                metal: 5
            },
            output_chance: 0.5
        },
        signal: 
        {
            name: __("Signal"),
            func: boostergame_signal,
            
            text: function()
            {
                return __s("Call for help with a %s chance of receiving %s HP, %s metal or %s milk but pirates may attack you for %s HP.", number_format_percent(0.5), 5, 3, 1, 5);
            },
            
            min_distance: 5
        },
        siphon: 
        {
            name: __("Siphon"),
            
            text: function()
            {
                return __s("Convert [hp] into [fuel].");
            },
            
            input: 
            {
                hp: 2
            },
            output: 
            {
                fuel: 2
            }
        },
        slingshot: 
        {
            name: __("Slingshot"),
            
            text: function()
            {
                return __s("Travel [max_distance] and regenerate [hp].");
            },
            
            output: 
            {
                hp: 3,
                max_distance: 1
            }
        },
        survey: 
        {
            name: __("Survey"),
            
            text: function()
            {
                return __s("Gain [milk], lose [fuel].");
            },
            
            input: 
            {
                fuel: 10
            },
            output: 
            {
                milk: 1
            },
            min_distance: 6
        },
        wormhole: 
        {
            name: __("Wormhole"),
            
            text: function()
            {
                return __s("Travel [wormhole_distance], lose [hp_pct%].");
            },
            
            min_distance: 5,
            input: 
            {
                hp_pct: 0.8
            },
            output: 
            {
                wormhole_distance: 1
            }
        }
    };
    add_keys_to_struct(global.booster_game_actions);
    global.booster_game_actions_generate_array = struct_to_array(global.booster_game_actions);
    global.booster_game_upgrades = new Game_Object(
    {
        upgrades: 
        {
            unlock_booster: new Object_Upgrade(
            {
                index: 1,
                name: __("Unlock Booster"),
                description: __("Boosters enhance your blowing damage. BY A LOT."),
                sprite: spr_icon_rocket,
                cost_material: global.materials.milk,
                max_level: 1,
                base_cost: 500,
                add_upgrade_description: false
            }),
            boostergame_auto_play: new Object_Upgrade(
            {
                index: 2,
                name: __("Auto Play"),
                description: __("Enables auto play"),
                sprite: spr_icon_rocket,
                cost_material: global.materials.milk,
                max_level: 1,
                base_cost: 100,
                add_upgrade_description: false
            }),
            boostergame_hp: new Object_Upgrade(
            {
                index: 10,
                name: __("Armor"),
                sprite: spr_icon_heart,
                cost_material: global.materials.milk,
                max_level: 10,
                base_cost: 5,
                value: 2
            }),
            boostergame_boost_distance: new Object_Upgrade(
            {
                index: 20,
                name: __("Engines"),
                sprite: spr_icon_rocket,
                cost_material: global.materials.milk,
                max_level: 5,
                base_cost: 15,
                cost_exp: 2,
                value: 1
            }),
            boostergame_fuel: new Object_Upgrade(
            {
                index: 30,
                name: __("Fuel Tank"),
                sprite: spr_icon_rocket_fuel,
                cost_material: global.materials.milk,
                max_level: 10,
                base_cost: 10,
                value: 1
            }),
            boostergame_milk_reward: new Object_Upgrade(
            {
                index: 40,
                name: __("Milk Magnet"),
                sprite: spr_material_milk,
                cost_material: global.materials.milk,
                max_level: 5,
                base_cost: 15,
                cost_exp: 2,
                value: 0.5
            })
        }
    });
}

function boostergame_start_game()
{
    o_game.data.booster_game.upgrades = {};
    o_game.data.booster_game.actions_map = {};
    o_game.data.booster_game.distance = 0;
    o_game.data.booster_game.fuel = boostergame_get_rocket_max_fuel();
    o_game.data.booster_game.hp = boostergame_get_rocket_max_hp();
    o_game.data.booster_game.log = [];
    o_game.data.booster_game.metal = 0;
    o_game.data.booster_game.plays++;
    add_to_log(o_game.data.booster_game.log, __s("ROCKET STARTED!"));
    boostergame_start_turn();
}

function boostergame_start_turn()
{
    random_set_seed(o_game.data.booster_game.turns_total);
    var tmp_actions = {};
    o_game.data.booster_game.actions = [];
    o_game.data.booster_game.risk_fields = {};
    array_push(o_game.data.booster_game.actions, "boost");
    var action_count = 3;
    var generated = array_length(o_game.data.booster_game.actions);
    var n = 0;
    while (generated < action_count && n < 300)
    {
        var action = array_random_item(global.booster_game_actions_generate_array);
        n++;
        if (!is_undefined(variable_struct_get(tmp_actions, action.key)))
        {
            continue;
        }
        var min_distance = get_default_struct_value(action, "min_distance", undefined);
        if (is_numeric(min_distance) && o_game.data.booster_game.distance < min_distance)
        {
            continue;
        }
        if (!get_default_struct_value_func(action, "can_generate", __return_true))
        {
            continue;
        }
        if (get_default_struct_value(action, "single_action", false) && get_default_struct_value(o_game.data.booster_game.actions_map, action.key, 0) > 0)
        {
            continue;
        }
        array_push(o_game.data.booster_game.actions, action.key);
        variable_struct_set(tmp_actions, action.key, true);
        add_to_struct_value(o_game.data.booster_game.actions_map, action.key, 1);
        generated++;
    }
    o_game.data.booster_game.status = UnknownEnum.Value_1;
    randomize();
}

function boostergame_action(arg0)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    add_to_struct_value(o_game.data.booster_game.actions_history, arg0.key, 1);
    var reduce_fuel = boostergame_check_reduce_fuel(arg0);
    var text = [];
    var input_text = boostergame_add_result(struct_get_from_hash(arg0, variable_get_hash("input")), -1);
    if (!is_empty(input_text))
    {
        input_text = textr(input_text, struct_get_from_hash(arg0, variable_get_hash("input")));
        array_push(text, input_text);
    }
    var output_text = "";
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("output_chance"))))
    {
        if (percent_chance(arg0.output_chance * 100))
        {
            output_text = boostergame_add_result(struct_get_from_hash(arg0, variable_get_hash("output")));
        }
        else
        {
            output_text = __("Failed");
        }
        output_text = textr(output_text, 
        {
            chance: number_format_percent(arg0.output_chance)
        });
    }
    else if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("output"))))
    {
        output_text = boostergame_add_result(struct_get_from_hash(arg0, variable_get_hash("output")));
    }
    if (is_struct(struct_get_from_hash(o_game.data.booster_game.upgrades, variable_get_hash("turn_actions"))))
    {
        var text_array = [];
        var __struct = o_game.data.booster_game.upgrades.turn_actions;
        var __prop_names = struct_get_names(__struct);
        var __prop_len = array_length(__prop_names);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mkey = __prop_names[__i];
            var mitem = variable_struct_get(__struct, mkey);
            var duration = get_default_struct_value(struct_get_from_hash(o_game.data.booster_game.upgrades, variable_get_hash("turn_durations")), mkey, undefined);
            if (is_numeric(duration))
            {
                if (duration <= 0)
                {
                    continue;
                }
                variable_struct_set_post(o_game.data.booster_game.upgrades.turn_durations, mkey, variable_struct_get(o_game.data.booster_game.upgrades.turn_durations, mkey) - 1);
            }
            array_push(text_array, boostergame_add_result(build_struct(mkey, mitem)));
        }
        if (!is_empty(output_text))
        {
            output_text += ", ";
        }
        output_text += implode(", ", text_array);
    }
    if (!is_empty(output_text))
    {
        output_text = textr(output_text, struct_get_from_hash(arg0, variable_get_hash("output")));
        array_push(text, output_text);
    }
    if (!is_undefined(struct_get_from_hash(arg0, variable_get_hash("func"))))
    {
        var func_result = arg0.func();
        if (!is_empty(func_result))
        {
            array_push(text, func_result);
        }
    }
    add_to_log(o_game.data.booster_game.log, sprintf("[%s] %s", arg0.name, implode(", ", text)));
    if (!get_default_struct_value(arg0, "reduce_fuel", true))
    {
        reduce_fuel = false;
    }
    if (reduce_fuel)
    {
        boostergame_add_fuel(-1);
    }
    o_game.data.booster_game.turns++;
    o_game.data.booster_game.turns_total++;
    if (o_game.data.booster_game.hp <= 0 || o_game.data.booster_game.fuel <= 0)
    {
        boostergame_end();
        exit;
    }
    boostergame_start_turn();
}

function boostergame_add_result(arg0, arg1 = 1)
{
    if (!is_struct(arg0))
    {
        exit;
    }
    var text_array = [];
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("boostergame_hp_regeneration"))))
    {
        var hp_value = arg0.boostergame_hp_regeneration * arg1;
        boostergame_add_hp(arg0.boostergame_hp_regeneration);
        array_push(text_array, sprintf("%s %s (%s)", number_format(hp_value, undefined, true), __("HP"), __("regenerated")));
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("distance"))))
    {
        var distance = boostergame_get_travel_distance(arg0.distance) * arg1;
        boostergame_add_travel(distance);
        array_push(text_array, sprintf("%s %s", number_format(distance, undefined, true), __("km")));
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("fuel"))))
    {
        boostergame_add_fuel(arg0.fuel * arg1);
        array_push(text_array, sprintf("%s %s", number_format(arg0.fuel * arg1, undefined, true), __("Fuel")));
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("hp"))))
    {
        boostergame_add_hp(arg0.hp * arg1);
        array_push(text_array, sprintf("%s %s", number_format(arg0.hp * arg1, undefined, true), __("HP")));
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("hp_pct"))))
    {
        var hp_value = round(arg0.hp_pct * boostergame_get_rocket_max_hp()) * arg1;
        boostergame_add_hp(hp_value);
        array_push(text_array, sprintf("%s %s", number_format(hp_value, undefined, true), __("HP")));
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("max_distance"))))
    {
        var distance = boostergame_get_travel_distance_max() * arg1;
        boostergame_add_travel(distance);
        array_push(text_array, sprintf("%s %s", number_format(distance, undefined, true), __("km")));
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("metal"))))
    {
        var metal_value = arg0.metal * arg1;
        o_game.data.booster_game.metal += metal_value;
        array_push(text_array, sprintf("%s %s", number_format(metal_value, undefined, true), __("Metal")));
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("milk"))))
    {
        var milk_value = arg0.milk * arg1;
        add_result_lite(
        {
            materials: 
            {
                milk: milk_value
            }
        });
        array_push(text_array, sprintf("%s %s", number_format(milk_value, undefined, true), __("Milk")));
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("turn_actions"))))
    {
        if (!is_struct(struct_get_from_hash(o_game.data.booster_game.upgrades, variable_get_hash("turn_actions"))))
        {
            o_game.data.booster_game.upgrades.turn_actions = {};
        }
        add_struct_to_struct(o_game.data.booster_game.upgrades.turn_actions, arg0.turn_actions);
        array_push(text_array, format_upgrade_text(arg0.turn_actions));
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("turn_durations"))))
    {
        if (!is_struct(struct_get_from_hash(o_game.data.booster_game.upgrades, variable_get_hash("turn_durations"))))
        {
            o_game.data.booster_game.upgrades.turn_durations = {};
        }
        add_struct_to_struct(o_game.data.booster_game.upgrades.turn_durations, arg0.turn_durations);
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("upgrade"))))
    {
        add_struct_to_struct(o_game.data.booster_game.upgrades, arg0.upgrade);
        array_push(text_array, format_upgrade_text(arg0.upgrade));
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("wormhole_distance"))))
    {
        var distance = boostergame_get_wormhole_distance() * arg1;
        boostergame_add_travel(distance);
        array_push(text_array, sprintf("%s %s", number_format(distance, undefined, true), __("km")));
    }
    return implode(", ", text_array);
}

function boostergame_can_do_action(arg0)
{
    if (!is_struct(arg0))
    {
        return false;
    }
    if (o_game.data.booster_game.status != UnknownEnum.Value_1)
    {
        return false;
    }
    var input = get_default_struct_value(arg0, "input", undefined);
    if (!is_struct(input))
    {
        return true;
    }
    return boostergame_has_enough(input);
}

function boostergame_can_play()
{
    if (has_timeout_data("boostergame"))
    {
        return false;
    }
    return true;
}

function boostergame_check_reduce_fuel(arg0)
{
    var reduce_fuel = true;
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("output"))) && is_numeric(struct_get_from_hash(arg0.output, variable_get_hash("fuel"))))
    {
        reduce_fuel = false;
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("input"))) && is_numeric(struct_get_from_hash(arg0.input, variable_get_hash("fuel"))))
    {
        reduce_fuel = false;
    }
    return reduce_fuel;
}

function boostergame_end()
{
    var reward = boostergame_get_reward();
    var reward_text = add_result_lite(reward, undefined, "");
    if (is_empty(reward_text))
    {
        reward_text = __("nothing");
    }
    var end_text = (o_game.data.booster_game.hp <= 0) ? __("Wrecked") : __("No fuel");
    o_game.data.booster_game.distance_last = o_game.data.booster_game.distance;
    o_game.data.booster_game.status = UnknownEnum.Value_2;
    o_game.data.booster_game.turns = 0;
    o_game.data.booster_game.fuel = max(0, o_game.data.booster_game.fuel);
    o_game.data.booster_game.hp = max(0, o_game.data.booster_game.hp);
    var timeout_duration = global.debug ? sec(1) : sec(60);
    set_timeout_data("boostergame", timeout_duration);
    add_to_log(o_game.data.booster_game.log, sprintf("[%s] ", end_text) + __s("You've travelled %s km and gained %s.", number_format(o_game.data.booster_game.distance), reward_text));
}

function boostergame_get_action_text(arg0)
{
    var text = get_value_ext(arg0, struct_get_from_hash(arg0, variable_get_hash("text")));
    var suffixes = 
    {
        distance: __("km"),
        fuel: __("fuel"),
        hp: __("HP"),
        hp_pct: __("max HP"),
        max_distance: __("km"),
        metal: __("Metal"),
        milk: global.materials.milk.name,
        turns: __("turns"),
        wormhole_distance: __("km")
    };
    var funcs = 
    {
        max_distance: boostergame_get_travel_distance_max,
        wormhole_distance: boostergame_get_wormhole_distance
    };
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("input"))))
    {
        text = textr(text, arg0.input, undefined, suffixes, funcs);
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("output_chance"))))
    {
        text = textr(text, 
        {
            chance: number_format_percent(arg0.output_chance)
        });
    }
    if (is_struct(struct_get_from_hash(arg0, variable_get_hash("output"))))
    {
        if (is_struct(struct_get_from_hash(arg0.output, variable_get_hash("turn_actions"))))
        {
            var text_array_row = [];
            var __struct = arg0.output.turn_actions;
            var __prop_names = struct_get_names(__struct);
            var __prop_len = array_length(__prop_names);
            for (var __i = 0; __i < __prop_len; __i++)
            {
                var mkey = __prop_names[__i];
                var mitem = variable_struct_get(__struct, mkey);
                text_row = format_upgrade_text(build_struct(mkey, mitem));
                if (is_struct(struct_get_from_hash(arg0.output, variable_get_hash("turn_durations"))))
                {
                    var duration = get_default_struct_value(arg0.output.turn_durations, mkey, undefined);
                    if (is_numeric(duration))
                    {
                        text_row += sprintf(" (%s %s)", number_format(duration, 0), __("turns"));
                    }
                }
                array_push(text_array_row, text_row);
            }
            var text_row = implode(", ", text_array_row);
            text = string_replace(text, "[turn_actions]", text_row);
        }
        text = string_replace(text, "[upgrade]", format_upgrade_text(struct_get_from_hash(arg0.output, variable_get_hash("upgrade"))));
        text = textr(text, arg0.output, undefined, suffixes, funcs);
    }
    if (get_default_struct_value(arg0, "single_action", false))
    {
        text += ("\n" + sprintf("[%s]", __("Single use")));
    }
    return text;
}

function boostergame_has_enough(arg0)
{
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("fuel"))) && o_game.data.booster_game.fuel < arg0.fuel)
    {
        return false;
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("metal"))) && o_game.data.booster_game.metal < arg0.metal)
    {
        return false;
    }
    if (is_numeric(struct_get_from_hash(arg0, variable_get_hash("milk"))) && global.materials.milk.data.count < arg0.milk)
    {
        return false;
    }
    return true;
}

function boostergame_get_rocket_max_fuel()
{
    return rround(10 + global.booster_game_upgrades.get_upgrade_value("boostergame_fuel") + get_default_struct_value(o_game.data.booster_game.upgrades, "boostergame_fuel", 0));
}

function boostergame_get_rocket_max_hp()
{
    return rround(5 + global.booster_game_upgrades.get_upgrade_value("boostergame_hp") + get_default_struct_value(o_game.data.booster_game.upgrades, "boostergame_hp", 0));
}

function boostergame_get_reward(arg0 = 1, arg1 = 0)
{
    var milk_value = power(o_game.data.booster_game.distance, 1.5) * 0.02 * arg0;
    milk_value *= (1 + global.booster_game_upgrades.get_upgrade_value("boostergame_milk_reward"));
    milk_value = floor(max(arg1, milk_value));
    return 
    {
        materials: 
        {
            milk: milk_value
        }
    };
}

function boostergame_get_salvage_reward()
{
    return boostergame_get_reward(4, 1);
}

function boostergame_get_travel_distance(arg0 = 1)
{
    return round(irandom_range(boostergame_get_travel_distance_min(), boostergame_get_travel_distance_max()) * arg0);
}

function boostergame_get_travel_distance_min()
{
    return rround(1 + global.booster_game_upgrades.get_upgrade_value("boostergame_boost_distance") + get_default_struct_value(o_game.data.booster_game.upgrades, "boostergame_boost_distance", 0));
}

function boostergame_get_travel_distance_max()
{
    return rround(boostergame_get_travel_distance_min() * 2);
}

function boostergame_get_wormhole_distance()
{
    return rround(boostergame_get_travel_distance_min() * 10);
}

function boostergame_add_fuel(arg0)
{
    o_game.data.booster_game.fuel += arg0;
    o_game.data.booster_game.fuel = min(round(o_game.data.booster_game.fuel), boostergame_get_rocket_max_fuel());
}

function boostergame_add_hp(arg0)
{
    o_game.data.booster_game.hp += arg0;
    o_game.data.booster_game.hp = min(round(o_game.data.booster_game.hp), boostergame_get_rocket_max_hp());
}

function boostergame_add_travel(arg0)
{
    o_game.data.booster_game.distance += arg0;
    o_game.data.booster_game.distance_high = max(o_game.data.booster_game.distance_high, o_game.data.booster_game.distance);
    o_game.data.booster_game.distance_total += arg0;
}

function boostergame_boost()
{
    var travel_distance = boostergame_get_travel_distance();
    boostergame_add_travel(travel_distance);
    var text = sprintf("+%s km", travel_distance);
    return text;
}

function boostergame_salvage()
{
    o_game.data.booster_game.hp = 0;
    var reward_text = add_result_lite(boostergame_get_salvage_reward(), undefined, "");
    var text = __s("You have salvaged your rocket for %s.", reward_text);
    return text;
}

function boostergame_signal()
{
    var text = "";
    if (percent_chance(50))
    {
        if (percent_chance(20))
        {
            var reward = 
            {
                materials: 
                {
                    milk: 1
                }
            };
            var reward_text = add_result_lite(reward, undefined, "");
        }
        else if (percent_chance(40))
        {
            var metal_value = 3;
            text = sprintf("+%s %s", metal_value, __("Metal"));
            o_game.data.booster_game.metal += metal_value;
        }
        else
        {
            var hp_value = 5;
            boostergame_add_hp(hp_value);
            text = sprintf("+%s %s", hp_value, __("HP"));
        }
    }
    else
    {
        var hp_value = -5;
        boostergame_add_hp(hp_value);
        text = sprintf("%s %s", hp_value, __("HP"));
    }
    return text;
}

function boostergame_slingshot()
{
    var hp_value = 3;
    var travel_distance = boostergame_get_travel_distance_max();
    boostergame_add_hp(hp_value);
    boostergame_add_travel(travel_distance);
    var text = sprintf("+%s km", travel_distance);
    return text;
}

function boostergame_wormhole()
{
    var distance_value = boostergame_get_wormhole_distance();
    var hp_value = round(-boostergame_get_rocket_max_hp() * 0.8);
    o_game.data.booster_game.distance += distance_value;
    boostergame_add_hp(hp_value);
    var text = sprintf("%s km", number_format(distance_value));
    return text;
}

function get_boostergame_upgrade_attributes()
{
    var high = o_game.data.booster_game.distance_total;
    var upgrade_attributes = 
    {
        upgrade_attributes: {}
    };
    var ua = upgrade_attributes.upgrade_attributes;
    var __array = global.boostergame_ua_stages;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (high < mitem.stage)
        {
            continue;
        }
        var loop_multiplier = sqrt(o_game.data.booster_game.distance_total * 0.05);
        if (get_default_struct_value(mitem, "fixed", false))
        {
            loop_multiplier = 1;
        }
        var ua_value = mitem.value * loop_multiplier;
        var value_func = get_default_struct_value(mitem, "value_func", undefined);
        if (!is_undefined(value_func))
        {
            ua_value = value_func(ua_value);
        }
        var max_value = get_default_struct_value(mitem, "max", 0);
        if (max_value > 0)
        {
            ua_value = min(ua_value, max_value);
        }
        variable_struct_set(ua, mitem.key, ua_value);
    }
    var ua_final = upgrade_attributes;
    global.cache.boostergame_upgrades_text = format_upgrade_text(ua_final.upgrade_attributes, undefined, undefined, undefined, "\n", undefined, undefined, true);
    return ua_final;
}

function get_boostergame_ua_current_stage()
{
    var __array = global.boostergame_ua_stages;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (o_game.data.booster_game.distance_total < mitem.stage)
        {
            return __i;
        }
    }
    return array_length(global.boostergame_ua_stages);
}

function get_boostergame_ua_stages()
{
    var stages = 
    {
        leaf_multiplier_boost: 
        {
            stage: 20,
            value: 0.01
        },
        blc_value_multiplier_boost: 
        {
            stage: 50,
            value: 0.05
        },
        dice_battlefield_damage_multiplier: 
        {
            stage: 100,
            value: 0.05
        },
        cursed_autocollect_multiplier_boost: 
        {
            stage: 150,
            value: 0.03
        },
        leaf_pub_counter_autocount: 
        {
            stage: 250,
            value: 0.02
        },
        mlc_value_multiplier_boost: 
        {
            stage: 350,
            value: 0.05
        },
        seed_value_add_global: 
        {
            stage: 500,
            value: 0.001
        },
        blower_enemy_damage_multiplier_boost: 
        {
            stage: 750,
            value: 0.03
        },
        slap_multiplier_boost: 
        {
            stage: 1000,
            value: 0.01
        },
        dice_battlefield_die_drop_chance: 
        {
            stage: 1500,
            value: 0.0001,
            max: 0.02
        },
        soul_forge_complete_count_multiplier_boost: 
        {
            stage: 2000,
            value: 0.005
        },
        quark_damage_multiplier_boost: 
        {
            stage: 3000,
            value: 0.004
        },
        max_pets: 
        {
            stage: 4000,
            value: 1,
            fixed: true
        },
        quark_reactor_inc_count_multiplier_boost: 
        {
            stage: 6000,
            value: 0.003
        },
        quark_reactor_size: 
        {
            stage: 8000,
            value: 0.04,
            value_func: ceil
        },
        mirror_efficiency: 
        {
            stage: 15000,
            value: 0.001,
            max: 0.1
        },
        max_mirrors: 
        {
            stage: 30000,
            value: 1,
            fixed: true
        },
        ulc_value_multiplier_boost: 
        {
            stage: 50000,
            value: 0.001
        }
    };
    add_keys_to_struct(stages);
    var stages_array = struct_to_sorted_array_by(stages, "stage", true);
    return stages_array;
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2
}
