function roll_dice(arg0 = 1, arg1 = 6, arg2 = 1)
{
    var value = 0;
    repeat (arg2)
    {
        repeat (arg0)
        {
            value += irandom_range(1, arg1);
        }
    }
    return value;
}

function roll_dice_battlefield(arg0 = true, arg1 = false)
{
    var damage = get_dice_battlefield_damage();
    var enemy = get_current_dice_battlefield_enemy();
    if (!is_struct(enemy))
    {
        return 0;
    }
    enemy.hit(damage, arg0);
    o_game.data.dice.battlefield_last_roll = damage;
    var roll_delay = get_dice_battlefield_roll_delay();
    o_game.data.dice.battlefield_roll_delay = o_game.data.stats.time_elapsed + roll_delay;
    var last_roll_kill = enemy.last_roll_kill;
    if (global.options.dice_battlefield_auto_progress.data.value && last_roll_kill && has_bought_shop_item_safe(global.shops.gems.dice_battlefield_auto_progress))
    {
        enemy.last_roll_kill = false;
        var progress_type = get_option(global.options.dice_battlefield_auto_progress_type);
        if (progress_type == "level" && is_struct(enemy.next_enemy_level) && enemy.next_enemy_level.is_unlocked("level"))
        {
            o_game.data.dice.battlefield_level = enemy.next_enemy_level.loop_level;
            if (!enemy.next_enemy_level.is_unlocked("rarity"))
            {
                o_game.data.dice.battlefield_rarity = "normal";
            }
        }
        if (progress_type == "max_level" && is_struct(enemy.next_enemy_level) && enemy.data.defeated >= enemy.upgrade_multiplier_max)
        {
            o_game.data.dice.battlefield_level = enemy.next_enemy_level.loop_level;
            if (!enemy.next_enemy_level.is_unlocked("rarity"))
            {
                o_game.data.dice.battlefield_rarity = "normal";
            }
        }
        else if (progress_type == "rarity" && is_struct(enemy.next_enemy_rarity) && enemy.next_enemy_rarity.is_unlocked("rarity"))
        {
            o_game.data.dice.battlefield_rarity = enemy.next_enemy_rarity.rarity.key;
        }
        var next_enemy = get_current_dice_battlefield_enemy();
        if (is_struct(next_enemy))
        {
            next_enemy.data.seen = true;
        }
    }
    if (arg1)
    {
        return last_roll_kill;
    }
    return damage;
}

function check_dice()
{
    if (!is_unlocked_dice())
    {
        exit;
    }
    check_dice_battlefield();
    check_dice_cursed();
    if (o_game.data.dice.auto_roll_timer <= o_game.data.stats.time_elapsed)
    {
        var refresh_auto_timer = false;
        if (get_option(global.options.auto_roll))
        {
            roll_all_dice();
            refresh_auto_timer = true;
        }
        if (get_option(global.options.auto_power_roll))
        {
            power_roll_all_dice();
            refresh_auto_timer = true;
        }
        if (refresh_auto_timer)
        {
            o_game.data.dice.auto_roll_timer = o_game.data.stats.time_elapsed + sec(60);
        }
    }
}

function check_dice_battlefield()
{
    if (get_option(global.options.dice_battlefield_auto_roll) && has_bought_shop_item_safe(global.shops.gems.dice_battlefield_auto_roll) && can_roll_dice_battlefield())
    {
        roll_dice_battlefield();
    }
}

function check_dice_cursed()
{
    if (get_option(global.options.dice_cursed_auto_roll) && has_bought_shop_item_safe(global.shops.gems.dice_cursed_auto_roll) && can_roll_dice_cursed())
    {
        if (get_option(global.options.dice_cursed_auto_save) && has_bought_shop_item_safe(global.shops.gems.dice_cursed_auto_save))
        {
            var can_auto_save_value = false;
            var auto_save_value_option = get_option(global.options.dice_cursed_auto_save_value);
            if (auto_save_value_option == 0)
            {
                auto_save_value_option = o_game.data.dice.cursed_count_max_saved;
            }
            if (is_numeric(auto_save_value_option) && o_game.data.dice.cursed_count_current >= auto_save_value_option)
            {
                can_auto_save_value = true;
            }
            if (can_save_cursed_dice())
            {
                if (can_auto_save_value)
                {
                    save_dice_cursed();
                }
                else
                {
                    roll_dice_cursed();
                }
            }
            else if (o_game.data.dice.cursed_count_current <= auto_save_value_option)
            {
                roll_dice_cursed();
            }
        }
        else if (o_game.data.dice.cursed_count_current <= o_game.data.dice.cursed_count_max_saved)
        {
            roll_dice_cursed();
        }
    }
}

function is_dice_backpack_full()
{
    var inventory_size = get_dice_backpack_size();
    if (array_length(global.dice_backpack) >= inventory_size)
    {
        return true;
    }
    return false;
}

function is_dice_inventory_full()
{
    var inventory_size = get_dice_inventory_size();
    if (array_length(global.dice_inventory) >= inventory_size)
    {
        return true;
    }
    return false;
}

function die_exists_by_id(arg0)
{
    return is_struct(get_die_in_inventory_by_id(arg0));
}

function die_exists_in_inventory(arg0, arg1)
{
    return is_struct(get_die_in_inventory(arg0, arg1));
}

function get_die_in_inventory(arg0, arg1, arg2 = undefined)
{
    var __array = global.dice_inventory;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (arg0.key == mitem.data.rarity_key && arg1.key == mitem.data.type_key)
        {
            return mitem;
        }
    }
    __array = global.dice_backpack;
    __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (arg0.key == mitem.data.rarity_key && arg1.key == mitem.data.type_key)
        {
            return mitem;
        }
    }
    return undefined;
}

function get_die_in_inventory_by_id(arg0, arg1 = "both")
{
    if (arg1 == "both" || arg1 == "inventory")
    {
        var dice_inv = get_array_item_by_id(global.dice_inventory, arg0);
        if (is_struct(dice_inv))
        {
            return dice_inv;
        }
    }
    if (arg1 == "both" || arg1 == "backpack")
    {
        var dice_bp = get_array_item_by_id(global.dice_backpack, arg0);
        if (is_struct(dice_bp))
        {
            return dice_bp;
        }
    }
    return undefined;
}

function can_roll_dice_battlefield()
{
    var enemy = get_current_dice_battlefield_enemy();
    if (!is_struct(enemy))
    {
        return false;
    }
    var can_roll = o_game.data.stats.time_elapsed >= o_game.data.dice.battlefield_roll_delay;
    return can_roll;
}

function create_die(arg0 = undefined, arg1 = undefined, arg2 = false)
{
    var die = new Dice(
    {
        type: arg0,
        rarity: arg1
    });
    if (arg2)
    {
        variable_struct_set(o_game.data.dice.types_seen, die.type.key, true);
        var target_array = global.dice_inventory;
        var target_bag = "inventory";
        if (is_dice_inventory_full())
        {
            target_array = global.dice_backpack;
            target_bag = "backpack";
        }
        die.bag = target_bag;
        array_push(target_array, die);
    }
    return die;
}

function create_battlefield_die(arg0, arg1 = false)
{
    var rarity = get_battlefield_die_rarity(arg0);
    var type = get_random_dice_type();
    var die_existing = get_die_in_inventory(rarity, type);
    if (!is_struct(rarity) || !is_struct(type))
    {
        return undefined;
    }
    else if (is_struct(die_existing))
    {
        die_existing.collect();
        return die_existing;
    }
    else if (is_dice_inventory_full() && is_dice_backpack_full())
    {
        var can_auto_salvage = false;
        if (!can_auto_salvage)
        {
            return __s("No space in %s.", __("Dice bag"));
        }
        var compensation = rarity.get_salvage_resources();
        var res_text = add_result(compensation, undefined, undefined, true, true, undefined, undefined, undefined, undefined, "");
        return __s("%s was salvaged for %s", __("Battlefield die"), res_text);
    }
    var d = create_die(type, rarity, true);
    return d;
}

function get_battlefield_die_rarity(arg0)
{
    var rarity = global.dice_rarity.common;
    var __array = global.dice_rarity_sorted;
    var __prop_len = array_length(__array);
    var __i = __prop_len - 1;
    while (__i >= 0)
    {
        var mitem = __array[__i];
        var __ireal = __prop_len - 1 - __i;
        if (arg0 < mitem.min_level)
        {
        }
        else
        {
            var chance = mitem.spawn_chance * (1 + (arg0 * 0.5));
            if (percent_chance(chance))
            {
                rarity = mitem;
                break;
            }
        }
        __i--;
    }
    return rarity;
}

function get_battlefield_die_drop_chance()
{
    var value = get_bm_value(0.01, "dice_battlefield_die_drop_chance");
    return value;
}

function get_current_dice_battlefield_enemy()
{
    var enemy = undefined;
    var level = clamp(o_game.data.dice.battlefield_level, 1, global.dice_enemies_length);
    if (level >= 1 && level <= global.dice_enemies_length)
    {
        enemy = @@array_get@@(variable_struct_get(global.dice_enemies_struct, o_game.data.dice.battlefield_rarity), level - 1);
    }
    return enemy;
}

function get_dice()
{
    var value = get_bm_value(1, "dice_dice", "dice_dice_multiplier");
    return value;
}

function get_dice_sides()
{
    var value = get_bm_value(6, "dice_sides", "dice_sides_multiplier");
    return value;
}

function get_dice_battlefield_damage()
{
    var dice = get_dice();
    var sides = get_dice_sides();
    var damage_base = roll_dice(dice, sides);
    var damage = get_bm_value(damage_base, "dice_battlefield_damage", "dice_battlefield_damage_multiplier", undefined, true);
    damage = round(damage);
    damage = max(1, damage);
    return damage;
}

function get_dice_battlefield_min_damage()
{
    var damage_base = get_dice();
    var damage = get_bm_value(damage_base, "dice_battlefield_damage", "dice_battlefield_damage_multiplier", undefined, true);
    damage = round(damage);
    damage = max(1, damage);
    return damage;
}

function get_dice_battlefield_max_damage()
{
    var dice = get_dice();
    var sides = get_dice_sides();
    var damage_base = dice * sides;
    var damage = get_bm_value(damage_base, "dice_battlefield_damage", "dice_battlefield_damage_multiplier", undefined, true);
    damage = round(damage);
    damage = max(1, damage);
    return damage;
}

function get_dice_battlefield_roll_delay()
{
    var value = global.game_settings.dice_battlefield_roll_delay - get_bm_value(0, "dice_battlefield_roll_timeout_reduction");
    var final_value = max(1, value);
    return sec(final_value);
}

function get_dice_drop_charges()
{
    return get_bm_value(5, "dice_drop_charges");
}

function get_dice_drop_delay()
{
    var value = 60 - get_bm_value(0, "dice_drop_delay_reduction");
    var final_value = max(1, value);
    return sec(final_value);
}

function get_dice_drop_value(arg0 = false)
{
    var dice = get_dice();
    var sides = get_dice_sides();
    var min_value = get_roll_dice_min_value(dice, sides);
    var max_value = get_roll_dice_max_value(dice, sides);
    var drop_multiplier = get_bm_value(1, undefined, "dice_drop_value_multiplier");
    var base_value;
    if (arg0)
    {
        base_value = (min_value + max_value) / 2;
    }
    else
    {
        base_value = irandom_range(min_value, max_value);
    }
    var value = (base_value + get_upgrade_attribute_value(global.upgrade_attributes.dice_drop_value)) * drop_multiplier;
    return value;
}

function get_dice_drop_value_min()
{
    var dice = get_dice();
    var sides = get_dice_sides();
    var min_value = get_roll_dice_min_value(dice, sides);
    var drop_multiplier = get_bm_value(1, undefined, "dice_drop_value_multiplier");
    var value = (min_value + get_upgrade_attribute_value(global.upgrade_attributes.dice_drop_value)) * drop_multiplier;
    return value;
}

function get_dice_backpack_size()
{
    var value = global.game_settings.dice_backpack_size + get_upgrade_attribute_value(global.upgrade_attributes.dice_backpack_size);
    return value;
}

function get_dice_inventory_size()
{
    var value = global.game_settings.dice_inventory_size + get_upgrade_attribute_value(global.upgrade_attributes.dice_inventory_size);
    return value;
}

function get_random_dice_type()
{
    return array_random_item_check_custom_func(global.dice_types_shuffled, function(arg0)
    {
        return arg0.can_generate();
    });
}

function get_roll_dice_min_value(arg0 = 1, arg1 = 6, arg2 = 1)
{
    var value = 0;
    repeat (arg2)
    {
        for (var i = 0; i < arg0; i++)
        {
            var roll_value = 1;
            value += roll_value;
        }
    }
    return value;
}

function get_roll_dice_max_value(arg0 = 1, arg1 = 6, arg2 = 1)
{
    var value = 0;
    repeat (arg2)
    {
        for (var i = 0; i < arg0; i++)
        {
            var roll_value = arg1;
            value += roll_value;
        }
    }
    return value;
}

function move_die_from_backpack(arg0, arg1 = true)
{
    if (arg1 && is_dice_inventory_full())
    {
        exit;
    }
    move_array_item(arg0, global.dice_backpack, global.dice_inventory);
    arg0.bag = "inventory";
    refresh_ua_section("dice");
}

function move_die_from_inventory(arg0, arg1 = true)
{
    if (arg1 && is_dice_backpack_full())
    {
        exit;
    }
    move_array_item(arg0, global.dice_inventory, global.dice_backpack);
    arg0.bag = "backpack";
    refresh_ua_section("dice");
}

function roll_all_dice()
{
    if (get_option(global.options.auto_roll_inventory))
    {
        var __array = global.dice_inventory;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.can_roll())
            {
                mitem.roll();
            }
        }
    }
    if (get_option(global.options.auto_roll_backpack))
    {
        var __array = global.dice_backpack;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.can_roll())
            {
                mitem.roll();
            }
        }
    }
}

function power_roll_all_dice()
{
    if (get_option(global.options.auto_roll_inventory))
    {
        var __array = global.dice_inventory;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.can_power_roll())
            {
                mitem.power_roll();
            }
        }
    }
    if (get_option(global.options.auto_roll_backpack))
    {
        var __array = global.dice_backpack;
        var __prop_len = array_length(__array);
        for (var __i = 0; __i < __prop_len; __i++)
        {
            var mitem = __array[__i];
            if (mitem.can_power_roll())
            {
                mitem.power_roll();
            }
        }
    }
}

function roll_dice_cursed(arg0 = false)
{
    if (o_game.data.dice.cursed_count_current == 0)
    {
        o_game.data.dice.cursed_last_rolls = [];
    }
    random_set_seed(o_game.data.random_num + o_game.data.dice.cursed_rolls_total);
    var value = roll_dice();
    var raw_value = value;
    var crit = false;
    var crit_chance = get_dice_cursed_critical_chance();
    var crit_value = 0;
    if (percent_chance(crit_chance))
    {
        crit = true;
        var crit_multiplier = get_dice_cursed_critical_multiplier();
        crit_value = round((value * crit_multiplier) - value);
        value += crit_value;
    }
    value = max(1, value);
    o_game.data.dice.cursed_crit = crit;
    o_game.data.dice.cursed_count_total += value;
    if (is_dice_cursed_value(value))
    {
        global.dice_log.cursed_last_run = sprintf("%s -> %s (%s)", o_game.data.dice.cursed_count_current, 0, __("cursed"));
        o_game.data.dice.cursed_count_current = 0;
        o_game.data.dice.cursed_curses_total++;
        o_game.data.dice.cursed_roll_timeout = o_game.data.stats.time_elapsed + get_dice_cursed_timeout();
    }
    else
    {
        o_game.data.dice.cursed_count_current += value;
    }
    o_game.data.dice.cursed_count_max = max(o_game.data.dice.cursed_count_current, o_game.data.dice.cursed_count_max);
    o_game.data.dice.cursed_last_roll = value;
    o_game.data.dice.cursed_last_roll_raw = raw_value;
    o_game.data.dice.cursed_last_crit_value = crit_value;
    o_game.data.dice.cursed_rolls_total++;
    array_push(o_game.data.dice.cursed_last_rolls, value);
    limit_log(o_game.data.dice.cursed_last_rolls, 100);
    if (!arg0)
    {
        o_game.data.dice.cursed_reward = get_dice_cursed_save_reward();
    }
    randomize();
    return value;
}

function is_dice_cursed_value(arg0)
{
    return arg0 == 6 || arg0 == 66 || arg0 == 666 || arg0 == 6666;
}

function save_dice_cursed(arg0 = false)
{
    if (o_game.data.dice.cursed_count_current == 0)
    {
        exit;
    }
    var reward = get_dice_cursed_save_reward();
    o_game.data.dice.cursed_count_max_saved = max(o_game.data.dice.cursed_count_current, o_game.data.dice.cursed_count_max_saved);
    o_game.data.dice.cursed_last_saved = o_game.data.dice.cursed_count_current;
    global.dice_log.cursed_last_run = sprintf("%s (%s)", o_game.data.dice.cursed_last_saved, __("saved"));
    o_game.data.dice.cursed_count_total_saved += o_game.data.dice.cursed_count_current;
    o_game.data.dice.cursed_count_current = 0;
    o_game.data.dice.cursed_last_roll = 0;
    add_result(reward, undefined, undefined, true, true);
    o_game.data.dice.cursed_reward_next_save_time = get_dice_cursed_save_timeout();
    if (!arg0)
    {
        o_game.data.dice.cursed_reward = get_dice_cursed_save_reward();
        refresh_ua_section("dice");
    }
}

function can_roll_dice_cursed()
{
    return o_game.data.stats.time_elapsed >= o_game.data.dice.cursed_roll_timeout;
}

function can_save_cursed_dice()
{
    return o_game.data.dice.cursed_count_current > 0 && o_game.data.stats.time_elapsed >= o_game.data.dice.cursed_reward_next_save_time;
}

function get_dice_cursed_critical_chance()
{
    var value = get_bm_value(1, "dice_cursed_critical_chance");
    value = min(value, 90);
    return value;
}

function get_dice_cursed_critical_multiplier()
{
    var value = 2 + get_upgrade_attribute_value(global.upgrade_attributes.dice_cursed_critical_multiplier);
    return value;
}

function get_dice_cursed_save_reward()
{
    var value = get_bm_value(o_game.data.dice.cursed_count_current / 5, "dice_cursed_reward", "dice_cursed_reward_multiplier", undefined, true);
    var reward = 
    {
        resources: 
        {
            dice: max(1, round(value))
        }
    };
    if (o_game.data.dice.cursed_count_current == 0)
    {
        reward = multiply_struct_values(reward, 0);
    }
    return reward;
}

function get_dice_cursed_save_timeout()
{
    var value = o_game.data.stats.time_elapsed + get_dice_cursed_save_timeout_duration();
    return value;
}

function get_dice_cursed_save_timeout_duration()
{
    var value = sec(60);
    return value;
}

function get_dice_cursed_timeout()
{
    var value = global.game_settings.dice_cursed_timeout_duration - get_upgrade_attribute_value(global.upgrade_attributes.dice_cursed_timeout_reduction);
    value *= (1 - get_upgrade_attribute_value(global.upgrade_attributes.dice_cursed_timeout_reduction_multiplier));
    value = max(1, value);
    value = sec(value);
    return value;
}

function get_dice_cursed_upgrade_attributes()
{
    var total = o_game.data.dice.cursed_count_total_saved;
    var max_saved_value = o_game.data.dice.cursed_count_max_saved;
    var multiplier = max_saved_value / 2;
    var upgrade_attributes = 
    {
        upgrade_attributes: 
        {
            dice_drop_value: max(1, floor(max_saved_value / 10))
        }
    };
    var ua = upgrade_attributes.upgrade_attributes;
    var __array = global.cursed_dice_ua_stages;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (total < mitem.stage)
        {
            continue;
        }
        var loop_multiplier = multiplier;
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
    global.cache.cursed_dice_upgrades_text = format_upgrade_text(ua_final.upgrade_attributes, undefined, undefined, undefined, "\n", undefined, undefined, true);
    return ua_final;
}

function get_dice_cursed_ua_current_stage()
{
    var __array = global.cursed_dice_ua_stages;
    var __prop_len = array_length(__array);
    for (var __i = 0; __i < __prop_len; __i++)
    {
        var mitem = __array[__i];
        if (o_game.data.dice.cursed_count_total_saved < mitem.stage)
        {
            return __i;
        }
    }
    return array_length(global.cursed_dice_ua_stages);
}

function get_dice_cursed_ua_stages()
{
    var stages = 
    {
        dice_cursed_reward_multiplier_dice: 
        {
            stage: 50,
            value: 0.02
        },
        leaf_multiplier_dice: 
        {
            stage: 100,
            value: 0.01
        },
        blc_value_multiplier_dice: 
        {
            stage: 250,
            value: 0.05
        },
        dice_battlefield_damage_multiplier: 
        {
            stage: 500,
            value: 0.05
        },
        cursed_autocollect_multiplier_dice: 
        {
            stage: 666,
            value: 0.03
        },
        leaf_pub_counter_autocount: 
        {
            stage: 750,
            value: 0.02
        },
        mlc_value_multiplier_dice: 
        {
            stage: 777,
            value: 0.05
        },
        seed_value_add_global: 
        {
            stage: 1000,
            value: 0.001
        },
        blower_enemy_damage_multiplier_dice: 
        {
            stage: 1250,
            value: 0.03
        },
        slap_multiplier_dice: 
        {
            stage: 1500,
            value: 0.01
        },
        dice_battlefield_die_drop_chance: 
        {
            stage: 1500,
            value: 0.0001,
            max: 0.02
        },
        trade_max_gems_trades_per_day: 
        {
            stage: 3000,
            value: 5,
            max: 500
        },
        soul_forge_complete_count_multiplier_dice: 
        {
            stage: 4000,
            value: 0.005
        },
        quark_damage_multiplier_dice: 
        {
            stage: 5000,
            value: 0.004
        },
        max_pets: 
        {
            stage: 6666,
            value: 1,
            fixed: true
        },
        quark_reactor_inc_count_multiplier_dice: 
        {
            stage: 7000,
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
            stage: 10000,
            value: 0.001,
            max: 0.1
        },
        max_mirrors: 
        {
            stage: 12000,
            value: 1,
            fixed: true
        }
    };
    add_keys_to_struct(stages);
    var stages_array = struct_to_sorted_array_by(stages, "stage", true);
    return stages_array;
}
