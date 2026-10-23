function init_shadow_crystal()
{
    global.shadow_crystal = new Shadow_Enemy(
    {
        key: "shadow_crystal"
    });
    global.shadow_player = new Shadow_Player(
    {
        key: "shadow_crystal_player"
    });
    var filename = "shadow_tree.json";
    var skill_tree_data = get_hashed_content(filename);
    if (!is_struct(skill_tree_data))
    {
        log("invalid data");
    }
    global.shadow_tree = new Skill_Tree(skill_tree_data);
    global.shadow_pit = 
    {
        dusk: new Invest_Object(
        {
            input: 
            {
                resources: 
                {
                    dusk: 1000000
                }
            },
            multiplier: 1
        }),
        essence_shadow: new Invest_Object(
        {
            input: 
            {
                materials: 
                {
                    essence_shadow: 100
                }
            },
            multiplier: 10
        }),
        shadow_crystal: new Invest_Object(
        {
            input: 
            {
                materials: 
                {
                    shadow_crystal: 25
                }
            },
            multiplier: 1000
        })
    };
    init_game_object_struct(global.shadow_pit);
}

function check_shadow_crystal()
{
    if (!is_unlocked_shadow_crystal())
    {
        exit;
    }
    if (get_option(global.options.sc_auto_revive) && global.shadow_player.can_revive())
    {
        global.shadow_player.revive();
    }
    if (get_option(global.options.sc_auto_attack) && global.shadow_crystal.can_attack())
    {
        global.shadow_crystal.attack();
    }
    if (get_option(global.options.sc_auto_rest) && global.shadow_player.can_rest())
    {
        if (get_option(global.options.sc_auto_attack_safe) && !global.shadow_crystal.can_attack())
        {
            global.shadow_player.auto_rest();
        }
        else if (global.shadow_player.data.stamina < 1)
        {
            global.shadow_player.auto_rest();
        }
    }
    if (get_option(global.options.sp_auto_throw_dusk) && global.shadow_pit.dusk.can_invest())
    {
        global.shadow_pit.dusk.invest();
    }
    if (get_option(global.options.sp_auto_throw_se) && global.shadow_pit.essence_shadow.can_invest())
    {
        global.shadow_pit.essence_shadow.invest();
    }
    if (get_option(global.options.sp_auto_throw_sc) && global.shadow_pit.shadow_crystal.can_invest())
    {
        global.shadow_pit.shadow_crystal.invest();
    }
    check_transmuters("shadow");
}

function check_shadow_crystal_auto_advance()
{
    var auto_advance = get_option(global.options.sc_auto_advance);
    var safe_advance = get_option(global.options.sc_auto_advance_safe);
    if (!auto_advance && !safe_advance)
    {
        exit;
    }
    if (safe_advance)
    {
        if (global.shadow_player.data.dead && global.shadow_crystal.data.level > 1)
        {
            global.shadow_crystal.data.target_level = global.shadow_crystal.data.level - 1;
        }
        else if (global.shadow_crystal.data.dead && global.shadow_crystal.data.highest_defeat_level > global.shadow_crystal.data.level)
        {
            if (global.shadow_crystal.data.safe_climbing)
            {
                global.shadow_crystal.data.target_level = global.shadow_crystal.data.level + 1;
            }
            else if (global.shadow_crystal.data.safe_level != 0)
            {
                global.shadow_crystal.data.target_level = global.shadow_crystal.data.safe_level;
            }
        }
    }
    else if (global.shadow_crystal.data.highest_defeat_level >= global.shadow_crystal.data.level && global.shadow_crystal.data.level < global.shadow_crystal.get_max_level())
    {
        global.shadow_crystal.data.target_level = global.shadow_crystal.data.highest_defeat_level + 1;
    }
    if (global.shadow_crystal.data.target_level != 0 && global.shadow_crystal.data.level != global.shadow_crystal.data.target_level)
    {
        global.shadow_crystal.set_level(global.shadow_crystal.data.target_level);
    }
}

function get_shadow_crystal_blower_damage_multiplier()
{
    var value = sqrt(global.upgrade_attributes.shadow_crystal_blower_enemy_damage_multiplier_level * global.shadow_crystal.data.highest_defeat_level * 100);
    return value;
}

function can_player_beat_shadow_crystal(arg0 = global.shadow_crystal.data.level)
{
    var player_max_hp = global.shadow_player.get_max_hp();
    var player_min_damage = global.shadow_player.get_base_damage();
    var player_resistance = global.shadow_player.get_resistance();
    var crystal_max_hp = global.shadow_crystal.get_max_hp(arg0);
    var crystal_avg_damage = divide_safe((global.shadow_crystal.get_attack_damage_min(arg0) + global.shadow_crystal.get_attack_damage_max(arg0)) / 2, player_resistance);
    var crystal_resistance = global.shadow_crystal.get_resistance(arg0);
    var player_avg_damage = (player_min_damage * (1 + global.shadow_player.get_attack_max_multiplier())) / 2;
    var final_damage = max(1, round(divide_safe(player_avg_damage, crystal_resistance)));
    if (final_damage < 1)
    {
        return false;
    }
    var hits_needed = ceil(divide_safe(crystal_max_hp, final_damage));
    if (hits_needed > global.shadow_player.data.stamina)
    {
        return false;
    }
    var hits_crystal_needs = ceil(divide_safe(player_max_hp, crystal_avg_damage));
    if (hits_crystal_needs < hits_needed)
    {
        return false;
    }
    return true;
}

function get_shadow_pit_throw_cost(arg0)
{
    var cost = 
    {
        materials: {},
        resources: {}
    };
    switch (arg0)
    {
        case "dusk":
            cost.resources.dusk = 1000000;
            break;
        case "essence_shadow":
            cost.materials.essence_shadow = 100;
            break;
        case "shadow_crystal":
            cost.materials.shadow_crystal = 25;
            break;
    }
    return cost;
}

function get_shadow_pit_ua()
{
    var value = floor(get_shadow_pit_value());
    var ua = 
    {
        upgrade_attributes: 
        {
            blower_enemy_damage_multiplier_shadow: power(value, 2),
            shadow_crystal_attack_damage: floor(value),
            shadow_crystal_attack_damage_multiplier: sqrt(value / 500),
            shadow_crystal_player_hp: floor(value / 10),
            shadow_crystal_player_hp_multiplier: sqrt(value / 750),
            shadow_crystal_player_rest_hp_value: floor(value / 5),
            shadow_crystal_player_rest_hp_value_multiplier: sqrt(value / 250),
            shadow_crystal_player_speed: floor(sqrt(sqrt(value / 5))),
            shadow_crystal_player_speed_multiplier: sqrt(value / 750),
            shadow_crystal_player_stamina: floor(value / 300),
            shadow_crystal_player_stamina_multiplier: sqrt(value / 750)
        }
    };
    return ua;
}

function get_shadow_pit_value(arg0 = undefined)
{
    var value = o_game.data.shadow_pit.strength + get_shadow_pit_invest_value(arg0);
    return value;
}

function get_shadow_pit_invest_value(arg0 = undefined)
{
    var value = 0;
    var __struct = global.shadow_pit;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        value += mitem.get_value(get_default_struct_value(arg0, mkey, 0));
    }
    return value;
}

function get_shadow_pit_ascend_cost()
{
    var cost = 
    {
        materials: 
        {
            light_rod: 1 + o_game.data.shadow_pit.ascend_count
        }
    };
    return cost;
}

function get_shadow_pit_ascend_value()
{
    var value = rround(50 + (25 * power(o_game.data.shadow_pit.ascend_count, 1.2)));
    return value;
}

function shadow_pit_can_ascend()
{
    if (!has_enough(get_shadow_pit_ascend_cost()))
    {
        return false;
    }
    var min_strength = get_shadow_pit_ascend_value();
    if (get_shadow_pit_invest_value() < min_strength)
    {
        return false;
    }
    return true;
}

function shadow_pit_ascend()
{
    dec_result(get_shadow_pit_ascend_cost());
    o_game.data.shadow_pit.strength += get_shadow_pit_invest_value();
    o_game.data.shadow_pit.ascend_count += 1;
    var __struct = global.shadow_pit;
    var __prop_names = struct_get_names(__struct);
    var __prop_len = array_length(__prop_names);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mkey = __prop_names[__i];
        var mitem = variable_struct_get(__struct, mkey);
        mitem.data.invest_count = 0;
    }
}
